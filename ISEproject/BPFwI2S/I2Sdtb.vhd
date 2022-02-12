--------------------------------------------------------------------------------
-- Testbench for TopDriver
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY I2Sdtb IS
END I2Sdtb;
 
ARCHITECTURE behavior OF I2Sdtb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TopDriver
    PORT(
         Clk : IN  std_logic;
         Reset_N : IN  std_logic;
         ADC_MCLK : OUT  std_logic;
         ADC_LRCK : OUT  std_logic;
         ADC_SCLK : OUT  std_logic;
         ADC_SD : IN  std_logic;
         DAC_MCLK : OUT  std_logic;
         DAC_LRCK : OUT  std_logic;
         DAC_SCLK : OUT  std_logic;
         DAC_SD : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset_N : std_logic := '1';
   signal ADC_SD : std_logic := '0';

 	--Outputs
   signal ADC_MCLK : std_logic;
   signal ADC_LRCK : std_logic;
   signal ADC_SCLK : std_logic;
   signal DAC_MCLK : std_logic;
   signal DAC_LRCK : std_logic;
   signal DAC_SCLK : std_logic;
   signal DAC_SD : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 20 ns;
	
	-- TEST
	constant in1	: std_logic_vector(23 downto 0) := "011111111111111111111111";
	constant in2	: std_logic_vector(23 downto 0) := "000000100011011110100001";
	constant in3	: std_logic_vector(23 downto 0) := "001000111011101010001000";
	signal sdin		: std_logic_vector(23 downto 0) := (others => '0');
	signal count	: integer := 0;
	signal enin		: std_logic := '0';
	signal count2	: integer := 0;
	signal countin	: integer := 0;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TopDriver PORT MAP (
          Clk => Clk,
          Reset_N => Reset_N,
          ADC_MCLK => ADC_MCLK,
          ADC_LRCK => ADC_LRCK,
          ADC_SCLK => ADC_SCLK,
          ADC_SD => ADC_SD,
          DAC_MCLK => DAC_MCLK,
          DAC_LRCK => DAC_LRCK,
          DAC_SCLK => DAC_SCLK,
          DAC_SD => DAC_SD
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;

   ENINTEST :process
   begin
		wait for Clk_period/2;
			if count < 255 then
				count <= count + 1;
			else
				count <= 0;
			end if;
			if count = 6 then
				enin <= '1';
				count <= count + 1;
			end if;
		wait for Clk_period/2;
   end process;
	
	SDINTEST :process
   begin
		wait for Clk_period/2;
			if count < 6 then
				if countin = 0 then
					sdin <= in1(23 downto 0);
				elsif countin = 1 then
					sdin <= in1(23 downto 0);
				elsif countin = 2 then
					sdin <= in2(23 downto 0);
				elsif countin = 3 then
					sdin <= in2(23 downto 0);
				elsif countin = 4 then
					sdin <= in3(23 downto 0);
				elsif countin = 5 then
					sdin <= in3(23 downto 0);
				end if;
			elsif count = 6 then
				sdin <= sdin(22 downto 0) & '0';
				ADC_SD <= sdin(23);
				countin <= countin + 1;
			end if;
			if enin = '1' then
				if count2 < 7 then
					count2 <= count2 + 1;
				else
					count2 <= 0;
					sdin <= sdin(22 downto 0) & '0';
					ADC_SD <= sdin(23);
				end if;
			end if;
		wait for Clk_period/2;
   end process;

END;
