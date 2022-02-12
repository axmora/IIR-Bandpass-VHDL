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
-- Module Name:	TopDriver.vhd
-- 
-- Description:	Top driver for BPF and I2S Receiver/Transmitter.
-- Comment:			This module was written to join together BPF and I2S
--						(Receivier and Transmitter) modules with their
--						respective data format using Fixed2Float and
--						Float2Fixed modules.
-- 
-- Dependencies:	IEEE standard library for standard behaviour.
----------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TopDriver is
	generic(
		fixed_width			: integer := 24;  -- Two's complement format (signed)
		float_width			: integer := 32;  -- IEEE 754 single precision format
		CLK_BPF_ratio		: integer := 4   -- BPF clock divider
		);
	port(
		Clk				: in std_logic;   -- Clock
		Reset_N			: in std_logic;   -- Low logic asynchronous reset
		ADC_MCLK			: out std_logic;  -- ADC I2S Master Clock
		ADC_LRCK			: out std_logic;  -- ADC I2S Left/Right Clock
		ADC_SCLK			: out std_logic;  -- ADC I2S Signal Clock
		ADC_SD			: in std_logic;   -- ADC I2S Serial Data
		DAC_MCLK			: out std_logic;  -- DAC I2S Master Clock
		DAC_LRCK			: out std_logic;  -- DAC I2S Left/Right Clock
		DAC_SCLK			: out std_logic;  -- DAC I2S Signal Clock
		DAC_SD			: out std_logic   -- DAC I2S Serial Data
		);
end TopDriver;

architecture Logic of TopDriver is

	-- COMPONENT DECLARATIONS STARTS
	
	-- For further information about each component, please read each module
	-- with the same name of component.

	component I2Sreceiver is
		port(
			Reset_N	: in std_logic;
			MCLK		: in std_logic;
			LRCK		: out std_logic;
			SCLK		: out std_logic;
			SDRX		: in std_logic;
			L_DATA	: out std_logic_vector(fixed_width-1 downto 0);
			R_DATA	: out std_logic_vector(fixed_width-1 downto 0);
			Ldone		: out std_logic;
			Rdone		: out std_logic
			);
	end component;
	
	component I2Stransmitter is
		port(
			Reset_N	: in std_logic;
			MCLK		: in std_logic;
			LRCK		: out std_logic;
			SCLK		: out std_logic;
			SDTX		: out std_logic;
			L_DATA	: in std_logic_vector(fixed_width-1 downto 0);
			R_DATA	: in std_logic_vector(fixed_width-1 downto 0);
			Ldone		: out std_logic;
			Rdone		: out std_logic
			);
	end component;
	
	component Fixed2Float is
		port(
			FixedInput	: in std_logic_vector(fixed_width-1 downto 0);
			FloatOutput	: out std_logic_vector(float_width-1 downto 0)
			);
	end component;
	
	component Float2Fixed is
		port(
			FloatInput	: in std_logic_vector(float_width-1 downto 0);
			FixedOutput	: out std_logic_vector(fixed_width-1 downto 0)
			);
	end component;
	
	component BPF2channels is
		port(
			Clk		: in std_logic;
			Reset_N	: in std_logic;
			L_Start	: in std_logic;
			L_Rk		: in std_logic_vector(float_width-1 downto 0);
			L_Yk		: out std_logic_vector(float_width-1 downto 0);
			Ldone		: out std_logic;
			R_Start	: in std_logic;
			R_Rk		: in std_logic_vector(float_width-1 downto 0);
			R_Yk		: out std_logic_vector(float_width-1 downto 0);
			Rdone		: out std_logic
			);
	end component;
	
	-- COMPONENT DECLARATIONS END
	
	-- SIGNALS STARTS
	
	-- ADC I2S signals
	signal ADC_MCLK_int	: std_logic := '0';  -- Internal master clock
	signal ADC_L_DATA		: std_logic_vector(fixed_width-1 downto 0);  -- Obtained left data
	signal ADC_R_DATA		: std_logic_vector(fixed_width-1 downto 0);  -- Obtained right data
	signal ADC_Ldone		: std_logic;  -- Left data ready
	signal ADC_Rdone		: std_logic;  -- Right data ready
	-- DAC I2S signals
	signal DAC_MCLK_int	: std_logic := '0';  -- Internal master clock
	signal DAC_L_DATA		: std_logic_vector(fixed_width-1 downto 0) := (others => '0');  -- Calculated left data
	signal DAC_R_DATA		: std_logic_vector(fixed_width-1 downto 0) := (others => '0');  -- Calculated right data
	signal DAC_Ldone		: std_logic;  -- Left data sent
	signal DAC_Rdone		: std_logic;  -- Right data sent
	-- 2 channels Band-pass filter signals
	signal BPF_Clk			: std_logic := '0';  -- Band-pass filter clock
	signal BPF_Clk_cnt	: unsigned(0 downto 0) := (others => '0');  -- Counter for clk dividing
	signal BPF_L_Start	: std_logic := '0';  -- Left start signal
	signal BPF_L_S_aux	: std_logic := '0';  -- Auxiliar signal to extend left start signal
	signal BPF_R_Start	: std_logic := '0';  -- Right start signal
	signal BPF_R_S_aux	: std_logic := '0';  -- Auxiliar signal to extend right start signal
	signal BPF_Start_cnt	: unsigned(1 downto 0) := (others => '0');  -- Start clock counter
	  -- Left channel signals for BPF
	signal BPF_Lin			: std_logic_vector(float_width-1 downto 0);  -- Input to left BPF
	signal BPF_Lout		: std_logic_vector(float_width-1 downto 0);  -- Output from left BPF
	signal BPF_Ldone		: std_logic;  -- Notification of left channel ready
	  -- Right channel signals for BPF
	signal BPF_Rin			: std_logic_vector(float_width-1 downto 0);  -- Input to right BPF
	signal BPF_Rout		: std_logic_vector(float_width-1 downto 0);  -- Output from right BPF
	signal BPF_Rdone		: std_logic;  -- Notification of right channel ready
	-- TopDriver internal signal
	signal EN_I2S_DAC		: std_logic := '0';  -- Enable DAC (Start master clock)
	
	-- SIGNALS ENDS
	
	-- I2S ADC works up to 108 KHz for sampling audio. For designing decisions, it was left
	-- to about 98 KHz. The master clock frequency for I2S modules will be half of the driver
	-- frequency, signal clock will be 4 times the master clock, and left/right clock will be
	-- 64 times the signal clock.
	
	-- BPF clock should be at least around 70 [ns], as Mojo V3 clock frequency is 50 [MHz],
	-- or equals to 20 [ns], the clock frequency is divided by 4, so the BPF clock would be
	-- 12.5 [MHz] or 80 [ns]. This is why start signals should be extended.

begin

	process(Clk,Reset_N)  -- Sensitivity list for synchronous sequential logic
	begin
		if Reset_N = '0' then  -- Asynchronous low logic reset
			ADC_MCLK_int <= '0';  -- Clear internal Master Clock for ADC
			DAC_MCLK_int <= '0';  -- Clear internal Master Clock for DAC
			EN_I2S_DAC <= '0';    -- Clear I2S DAC enable signal
		elsif Clk'event and Clk = '1' then  -- Synchronous behaviour
			ADC_MCLK_int <= not ADC_MCLK_int;  -- Toggle ADC I2S Master clock (divide Clk by 2)
			if EN_I2S_DAC = '1' then  -- If DAC is enabled
				DAC_MCLK_int <= not DAC_MCLK_int;  -- Toggle DAC I2S Master clock
			end if;
			if (BPF_Ldone or BPF_Rdone) = '1' then  -- When BPF send first data to output
				EN_I2S_DAC <= '1'; -- Permanent enable I2S DAC
			end if;
			-- BPF Clock divider
			if BPF_Clk_cnt < (CLK_BPF_ratio/2 - 1) then  -- Less than half of CLK_BPF_ratio
				BPF_Clk_cnt <= BPF_Clk_cnt + 1;  -- Toggle clock for BPF
			else  -- Reached half of CLK_BPF_ratio
				BPF_Clk_cnt <= (others => '0');  -- Clear BPF clock
				BPF_Clk <= not BPF_Clk;  -- Toggle BPF clock
			end if;
			-- Left Start retention
			if ADC_Ldone = '1' then  -- When ADC send data to BPF
				BPF_L_S_aux <= '1';  -- Set auxiliar signal to high
			end if;
			if BPF_L_S_aux = '1' then  -- If auxiliar signal is high
				-- First -1 for binary interpretation
				-- Second -1 because of ADC Done signal
				if BPF_Start_cnt < (CLK_BPF_ratio - 2) then 
					BPF_Start_cnt <= BPF_Start_cnt + 1;  -- Count up start counter
				else
					BPF_Start_cnt <= (others => '0');  -- Clear start counter
					BPF_L_S_aux <= '0';  -- Set auxiliar signal to low
				end if;
			end if;
			-- Right Start retention
			if ADC_Rdone = '1' then  -- When ADC send data to BPF
				BPF_R_S_aux <= '1';  -- Set auxiliar signal to high
			end if;
			if BPF_R_S_aux = '1' then  -- If auxiliar signal is high
				-- First -1 for binary interpretation
				-- Second -1 because of ADC Done signal
				if BPF_Start_cnt < (CLK_BPF_ratio - 2) then
					BPF_Start_cnt <= BPF_Start_cnt + 1;  -- Count up start counter
				else
					BPF_Start_cnt <= (others => '0');  -- Clear start counter
					BPF_R_S_aux <= '0';  -- Set auxiliar signal to low
				end if;
			end if;
		end if;
	end process;
	
	-- PORT MAPPING STARTS
	
	I2SADC: I2Sreceiver
		port map(
			Reset_N => Reset_N,
			MCLK => ADC_MCLK_int,
			LRCK => ADC_LRCK,
			SCLK => ADC_SCLK,
			SDRX => ADC_SD,
			L_DATA => ADC_L_DATA,
			R_DATA => ADC_R_DATA,
			Ldone => ADC_Ldone,
			Rdone => ADC_Rdone
			);
	
	I2SDAC: I2Stransmitter
		port map(
			Reset_N => Reset_N,
			MCLK => DAC_MCLK_int,
			LRCK => DAC_LRCK,
			SCLK => DAC_SCLK,
			SDTX => DAC_SD,
			L_DATA => DAC_L_DATA,
			R_DATA => DAC_R_DATA,
			Ldone => DAC_Ldone,
			Rdone => DAC_Rdone
			);
	
	-- I2S Two's Complement conversion to Single Precision Floating Point
	-- Output from ADC will be BPF input
	-- Left Channel
	L_I2StoBPF:	Fixed2Float
		port map(
			FixedInput	=> ADC_L_DATA,
			FloatOutput	=> BPF_Lin
			);
	-- Right Channel
	R_I2StoBPF:	Fixed2Float
		port map(
			FixedInput	=> ADC_R_DATA,
			FloatOutput	=> BPF_Rin
			);
	
	-- 2 Channels Band-Pass Filter
	LRBPF: BPF2channels
		port map(
			Clk => BPF_Clk,
			Reset_N => Reset_N,
			L_Start => BPF_L_Start, -- Start after ADC_L_DATA load
			L_Rk => BPF_Lin,
			L_Yk => BPF_Lout,
			Ldone => BPF_Ldone, -- Notify left data is ready for output
			R_Start => BPF_R_Start, -- Start after ADC_R_DATA load
			R_Rk => BPF_Rin,
			R_Yk => BPF_Rout,
			Rdone => BPF_Rdone -- Notify right data is ready for output
			);
	
	-- Single Precision Floating Point conversion to I2S Two's Complement
	-- Output from BPF will be DAC input
	-- Left Channel
	L_BPFtoI2S: Float2Fixed
		port map(
			FloatInput => BPF_Lout,
			FixedOutput => DAC_L_DATA
			);
	-- Right Channel
	R_BPFtoI2S: Float2Fixed
		port map(
			FloatInput => BPF_Rout,
			FixedOutput => DAC_R_DATA
			);
	
	-- PORT MAPPING ENDS
	
	ADC_MCLK <= ADC_MCLK_int;  -- Assign ADC Master Clock
	DAC_MCLK <= DAC_MCLK_int;  -- Assign DAC Master Clock
	
	BPF_L_Start <= BPF_L_S_aux OR ADC_Ldone;  -- BPF extended left start signal
	BPF_R_Start <= BPF_R_S_aux OR ADC_Rdone;  -- BPF extended right start signal

end Logic;