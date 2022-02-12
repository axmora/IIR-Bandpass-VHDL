----------------------------------------------------------------------------------
-- Escuela Superior Politécnica del Litoral (ESPOL)
-- Facultad de Ingeniería en Electrónica y Computación (FIEC)
-- Final undergraduate project: VHDL Human Voice Filtering
-- 
-- Degree to obtain: Electronics and Automation Engineer
-- 
-- Made by: Ángel Román Velóz & Alexis Mora Roca
-- Contact: (+593) 98 817 2232 & (+593) 99 587 0443
-- 
-- Parent Module:	TopDriver.vhd
-- Module Name:	I2Sreceiver.vhd
-- 
-- Description:	Receive audio signal via serial with I2S protocol.
-- Comment:			Received signal will be in two's complement format.
-- 					This module was written to work with Cirrus CS5343
-- 					A/D I2S in slave mode, extra MCLK needed.
-- 					Further information about Cirrus CS5343 A/D:
-- 					https://statics.cirrus.com/pubs/proDatasheet/CS5343-44_F5.pdf
-- 
-- Dependencies:	IEEE standard library for standard behaviour.
----------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity I2Sreceiver is
	generic(
		MCLK_SCLK_ratio	: integer := 4;   -- MCLK clock times per SCLK clock
		SCLK_LRCK_ratio	: integer := 64;  -- SCLK clock times per LRCK clock
		data_width			: integer := 24   -- Data width (24 bits two's complement)
		);
	port(
		Reset_N	: in std_logic;  -- Low logic asynchronous reset
		MCLK		: in std_logic;  -- Master clock (I2S)
		LRCK		: out std_logic := '0';  -- Left/Right clock or Word clock (I2S)
		SCLK		: out std_logic := '0';  -- Signal clock (I2S)
		SDRX		: in std_logic;  -- Serial data input (I2S) (Output from I2S module)
		-- Left and right data with specified size with two's complement format
		L_DATA	: out std_logic_vector(data_width-1 downto 0) := (others => '0');
		R_DATA	: out std_logic_vector(data_width-1 downto 0) := (others => '0');
		Ldone		: out std_logic := '0';  -- Output notification for left data already loaded
		Rdone		: out std_logic := '0'  -- Output notification for right data already loaded
		);
end I2Sreceiver;

-- Port is written to fit I2S2 module pinout from Digilent.
-- Further information: https://digilent.com/reference/pmod/pmodi2s2/start

-- Even when 24 bits are being loaded, is a good practice to send 32 signal clocks per
-- left/right clock as the first will be omitted and after reading 24 bits the rest of
-- signal clock reading will be omitted as well.

architecture Logic of I2Sreceiver is

	-- Two internal signals to preserver LRCK and SCLK as outputs
	signal LRCK_int	: std_logic := '0';
	signal SCLK_int	: std_logic := '0';
	-- Internal data signal to catch serial information before being sent to output
	signal DATA_int	: std_logic_vector(data_width-1 downto 0) := (others => '0');
	-- Internat counters to divide master clock into signal and left/right clock
	-- Size: ceil(log2(SCLK_LRCK_ratio))
	signal LRCK_cnt	: unsigned(5 downto 0) := (others => '0');
	-- Size: ceil(log2(MCLK_SCLK_ratio/2))
	signal SCLK_cnt	: unsigned(0 downto 0) := (others => '0');

begin

	process(MCLK,Reset_N)  -- Sensitivity list for synchronous sequential logic
	begin
		if Reset_N = '0' then  -- Asynchronous low logic reset
			LRCK_int <= '0';  -- Clear internal LRCK
			SCLK_int <= '0';  -- Clear internal SCLK
			L_DATA <= (others => '0');  -- Clear left data output
			R_DATA <= (others => '0');  -- Clear right data output
			DATA_int <= (others => '0');  -- Clear internal data signal
			LRCK_cnt <= (others => '0');  -- Clear LRCK counter
			SCLK_cnt <= (others => '0');  -- Clear SCLK counter
			Ldone <= '0';  -- Clear left channel notification output
			Rdone <= '0';  -- Clear right channel notification output
		elsif MCLK'event and MCLK = '1' then  -- Synchronous behaviour
			Ldone <= '0';  -- Keep left output notification to low until data is ready
			Rdone <= '0';  -- Keep right output notification to low until data is ready
			-- when SCLK_cnt is less than a half of MCLK_SCLK_ratio
			if SCLK_cnt < ((MCLK_SCLK_ratio/2) - 1) then
				SCLK_cnt <= SCLK_cnt + 1;  -- Count-up SCLK_cnt
			else  -- If SCLK_cnt = less than a half of MCLK_SCLK_ratio
				SCLK_cnt <= (others => '0');  -- Clear SCLK_cnt
				SCLK_int <= not SCLK_int;     -- Toggle SCLK
				-- when LRCK_cnt is less than SCLK_LRCK_ratio
				-- It shouldn't be less than a half because this will be performed
				-- when SCLK rise or fall, so it's performed twice.
				if LRCK_cnt < (SCLK_LRCK_ratio - 1) then
					LRCK_cnt <= LRCK_cnt + 1;  -- Count-up LRCK_cnt
					-- SCLK = 0 means that previous signal clock was low, but now is high
					-- LRCK_cnt must be greater than 1 because first SCLK is ignored (I2S specification)
					if SCLK_int = '0' and LRCK_cnt > 1 and LRCK_cnt < ((data_width*2)+2) then
						-- Left shift internal data and append serial input
						DATA_int <= DATA_int(data_width-2 downto 0) & SDRX;
					-- If LRCK_cnt finished with last serial input
					elsif SCLK_int = '0' and LRCK_cnt = ((data_width*2)+2) then
						if LRCK_int = '1' then -- Right channel
						   -- Assign R_DATA value and notify output is ready
							R_DATA <= DATA_int;
							Rdone <= '1';
						else -- LRCK_int = '0' -- Left channel
						   -- Assign L_DATA value and notify output is ready
							L_DATA <= DATA_int;
							Ldone <= '1';
						end if;
						DATA_int <= (others => '0');  -- Clear internal data signal
					end if;
				else  -- If LRCK_cnt = less than SCLK_LRCK_ratio
					LRCK_cnt <= (others => '0');  -- Clear LRCK_cnt
					LRCK_int <= not LRCK_int;     -- Toggle LRCK
				end if;
			end if;
		end if;
	
	end process;
	
	LRCK <= LRCK_int;  -- Assign LRCK
	SCLK <= SCLK_int;  -- Assign SCLK

end Logic;
