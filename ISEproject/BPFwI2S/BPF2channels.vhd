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
-- Module Name:	BPF2channels.vhd
-- 
-- Description:	Calculate the band-pass filter output.
-- Comment:			Designed BPF is divided into second-order stages and made
--						with synchronous sequential logic.
--						BPF.vhd, as designed, will take 2+4*(filter_order/2) clock
--						times to perfom the system output after receiving 'Start'
--						signal. Be careful editting the script when trying to
-- 					enhance the filter with a higher order.
--						More states and coefficients should be added if increasing
--						band-pass filter order.
-- 
-- Dependencies:	IEEE standard library for standard behaviour.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BPF2channels is
	generic(
		float_width		: integer := 32  -- 32bits IEEE754 single precision format
		);
	port(
		Clk		: in std_logic;  -- Clock signal
		Reset_N	: in std_logic;  -- Low logic asynchronous reset
		-- Left Channel
		L_Start	: in std_logic;  -- Input to start left channel bandpass algorithm
		L_Rk		: in std_logic_vector(float_width-1 downto 0);  -- Left audio signal input
		L_Yk		: out std_logic_vector(float_width-1 downto 0) := (others => '0'); -- Left Output
		Ldone		: out std_logic := '0';  -- Output notification of ready left channel output
		-- Right Channel
		R_Start	: in std_logic;  -- Input to start left channel bandpass algorithm
		R_Rk		: in std_logic_vector(float_width-1 downto 0);  -- Rigth audio signal input
		R_Yk		: out std_logic_vector(float_width-1 downto 0) := (others => '0'); -- Right Output
		Rdone		: out std_logic := '0'  -- Output notification of ready right channel output
		);
end BPF2channels;

-- As this BPF module uses a Single Precision format for math operations, it's high resources
-- dependent. This uses a lots of logic cells, so Xilinx Ise software will ask for a minimum
-- clock time of about 70 [ns] for this module. If not provided as asked, this module won't
-- operate as intended.

architecture Logic of BPF2channels is

	-- SingleAddProduct performs the operation N1+(N2*N3)
	component SingleAddProduct is
		port(
			N1		: in std_logic_vector(float_width-1 downto 0);
			N2		: in std_logic_vector(float_width-1 downto 0);
			N3		: in std_logic_vector(float_width-1 downto 0);
			R		: out std_logic_vector(float_width-1 downto 0)
			);
	end component;
	-- Further information about this module's behavior in SingleAddProduct.vhd

	type state is (  -- Create state data type
		Ta,  -- Initial State
		TbL,Tc1L,Tc2L,Tc3L,Tc4L,Td1L,Td2L,Td3L,Td4L,Te1L,Te2L,Te3L,Te4L,
		Tf1L,Tf2L,Tf3L,Tf4L,Tg1L,Tg2L,Tg3L,Tg4L,Th1L,Th2L,Th3L,Th4L,
		Ti1L,Ti2L,Ti3L,Ti4L,Tj1L,Tj2L,Tj3L,Tj4L,TkL,  -- Left channel
		TbR,Tc1R,Tc2R,Tc3R,Tc4R,Td1R,Td2R,Td3R,Td4R,Te1R,Te2R,Te3R,Te4R,
		Tf1R,Tf2R,Tf3R,Tf4R,Tg1R,Tg2R,Tg3R,Tg4R,Th1R,Th2R,Th3R,Th4R,
		Ti1R,Ti2R,Ti3R,Ti4R,Tj1R,Tj2R,Tj3R,Tj4R,TkR  -- Right channel
		);
	signal T		: state := Ta;  -- Assing state type to an internal signal
	
	-- Internal signals for SingleAddProduct component
	signal N1,N2,N3,R	: std_logic_vector(float_width-1 downto 0);

	-- Internal signals to store delays
	-- LEFT CHANNEL
	signal L_rkd0,L_rkd1,L_rkd2	: std_logic_vector(float_width-1 downto 0) := (others => '0');
	signal L_wkd0,L_wkd1,L_wkd2	: std_logic_vector(float_width-1 downto 0) := (others => '0');
	signal L_pkd0,L_pkd1,L_pkd2	: std_logic_vector(float_width-1 downto 0) := (others => '0');
	signal L_qkd0,L_qkd1,L_qkd2	: std_logic_vector(float_width-1 downto 0) := (others => '0');
	signal L_skd0,L_skd1,L_skd2	: std_logic_vector(float_width-1 downto 0) := (others => '0');
	signal L_tkd0,L_tkd1,L_tkd2	: std_logic_vector(float_width-1 downto 0) := (others => '0');
	signal L_ukd0,L_ukd1,L_ukd2	: std_logic_vector(float_width-1 downto 0) := (others => '0');
	signal L_vkd0,L_vkd1,L_vkd2	: std_logic_vector(float_width-1 downto 0) := (others => '0');
	signal L_ykd0,L_ykd1,L_ykd2	: std_logic_vector(float_width-1 downto 0) := (others => '0');
	-- RIGHT CHANNEL
	signal R_rkd0,R_rkd1,R_rkd2	: std_logic_vector(float_width-1 downto 0) := (others => '0');
	signal R_wkd0,R_wkd1,R_wkd2	: std_logic_vector(float_width-1 downto 0) := (others => '0');
	signal R_pkd0,R_pkd1,R_pkd2	: std_logic_vector(float_width-1 downto 0) := (others => '0');
	signal R_qkd0,R_qkd1,R_qkd2	: std_logic_vector(float_width-1 downto 0) := (others => '0');
	signal R_skd0,R_skd1,R_skd2	: std_logic_vector(float_width-1 downto 0) := (others => '0');
	signal R_tkd0,R_tkd1,R_tkd2	: std_logic_vector(float_width-1 downto 0) := (others => '0');
	signal R_ukd0,R_ukd1,R_ukd2	: std_logic_vector(float_width-1 downto 0) := (others => '0');
	signal R_vkd0,R_vkd1,R_vkd2	: std_logic_vector(float_width-1 downto 0) := (others => '0');
	signal R_ykd0,R_ykd1,R_ykd2	: std_logic_vector(float_width-1 downto 0) := (others => '0');
	-- xkdi format stands for x[k-i] to represent delays
	-- As a 4th-order BPF has two stages, w[k] is added as the first stage output
	-- w[k] will be second stage input too.
	
	-- Each stage output follows the equation:
	-- q[k] = an_0*d[k] + an_1*d[k-1] + an_2*d[k-2] - bn_1*q[k-1] - bn_2*q[k-2]
	-- Where q: stage output, d: stage input, n: stage number.
	-- an correspond to numerator coefficients vector of q[k]/d[k] of nth-stage
	-- bn correspond to denominator coefficients vector of q[k]/d[k] of nth-stage
	-- bn_0 must be 1 as it is the output q[k] coefficient.
	
	-- Advise: To keep the SingleAddProduct module with no modifications, denominator
	-- coefficients bn_1 and bn_2 were negated in design so the output equation will
	-- now follow:
	-- q[k] = an_0*d[k] + an_1*d[k-1] + an_2*d[k-2] + (-bn_1*q[k-1]) + (-bn_2*q[k-2])
	
	-- THE FOLLOWING CONSTANT COEFFICIENTS MATCH FOR A 16TH ORDER BAND-PASS FILTER WITH
	-- LOW CUTOFF FREQUENCY OF 100 Hz AND HIGH CUTOFF FREQUENCY OF 3 KHz.
	-- DON'T FORGET TO REPLACES VALUES IF DIFFERENT CUTOFF FREQUENCIES ARE DESIRED.

	-- Coefficients are declared as constants as their values won't change.
	-- Stage 1
	constant a1_0	: std_logic_vector(float_width-1 downto 0) := "00111101101110110110110011010111";
	constant a1_2	: std_logic_vector(float_width-1 downto 0) := "10111101101110110110110011010111";
	constant b1_1	: std_logic_vector(float_width-1 downto 0) := "00111111111100101100010001100011";
	constant b1_2	: std_logic_vector(float_width-1 downto 0) := "10111111011011101010111000100001";
	-- Stage 2
	constant a2_0	: std_logic_vector(float_width-1 downto 0) := "00111101101110110110110011010111";
	constant a2_2	: std_logic_vector(float_width-1 downto 0) := "10111101101110110110110011010111";
	constant b2_1	: std_logic_vector(float_width-1 downto 0) := "00111111111111111011000101101101";
	constant b2_2	: std_logic_vector(float_width-1 downto 0) := "10111111011111110110010110010100";
	-- Stage 3
	constant a3_0	: std_logic_vector(float_width-1 downto 0) := "00111101101101011010011110111100";
	constant a3_2	: std_logic_vector(float_width-1 downto 0) := "10111101101101011010011110111100";
	constant b3_1	: std_logic_vector(float_width-1 downto 0) := "00111111111111110001101111111110";
	constant b3_2	: std_logic_vector(float_width-1 downto 0) := "10111111011111100011101011001011";
	-- Stage 4
	constant a4_0	: std_logic_vector(float_width-1 downto 0) := "00111101101101011010011110111100";
	constant a4_2	: std_logic_vector(float_width-1 downto 0) := "10111101101101011010011110111100";
	constant b4_1	: std_logic_vector(float_width-1 downto 0) := "00111111111001001010010001111111";
	constant b4_2	: std_logic_vector(float_width-1 downto 0) := "10111111010100011001110011001101";
	-- Stage 5
	constant a5_0	: std_logic_vector(float_width-1 downto 0) := "00111101101100011001010100000111";
	constant a5_2	: std_logic_vector(float_width-1 downto 0) := "10111101101100011001010100000111";
	constant b5_1	: std_logic_vector(float_width-1 downto 0) := "00111111111111101001100111111100";
	constant b5_2	: std_logic_vector(float_width-1 downto 0) := "10111111011111010011011011101100";
	-- Stage 6
	constant a6_0	: std_logic_vector(float_width-1 downto 0) := "00111101101100011001010100000111";
	constant a6_2	: std_logic_vector(float_width-1 downto 0) := "10111101101100011001010100000111";
	constant b6_1	: std_logic_vector(float_width-1 downto 0) := "00111111110110110000101101100101";
	constant b6_2	: std_logic_vector(float_width-1 downto 0) := "10111111001111011010010100010010";
	-- Stage 7
	constant a7_0	: std_logic_vector(float_width-1 downto 0) := "00111101101011110111110100101110";
	constant a7_2	: std_logic_vector(float_width-1 downto 0) := "10111101101011110111110100101110";
	constant b7_1	: std_logic_vector(float_width-1 downto 0) := "00111111111111100100100000011110";
	constant b7_2	: std_logic_vector(float_width-1 downto 0) := "10111111011111001001001101010011";
	-- Stage 8
	constant a8_0	: std_logic_vector(float_width-1 downto 0) := "00111101101011110111110100101110";
	constant a8_2	: std_logic_vector(float_width-1 downto 0) := "10111101101011110111110100101110";
	constant b8_1	: std_logic_vector(float_width-1 downto 0) := "00111111110101100100001010010001";
	constant b8_2	: std_logic_vector(float_width-1 downto 0) := "10111111001100111001011010011111";
	-- (*) Keep in mind denominator coefficients were previously negated and these
	--     negated values were the ones which were declared as constants.
	-- (*) an_1 was equal to zero in all stages so is not included
	-- (*) bn_1 must be equal to 1 as it corresponds to stage output.
	
begin

	process(Clk,Reset_N)  -- Sensitivity list for synchronous sequential logic
	begin
		if Reset_N = '0' then  -- Asynchronous low logic reset
			T <= Ta;                    -- Returns to first stage
			-- CLEAR LEFT CHANNEL
			L_Yk <= (others => '0');    -- Clear BPF output
			Ldone <= '0';               -- Clear notify output
			L_rkd0 <= (others => '0');  -- Clear internal r[k] signal
			L_rkd1 <= (others => '0');  -- Clear internal r[k-1] signal
			L_rkd2 <= (others => '0');  -- Clear internal r[k-2] signal
			L_wkd0 <= (others => '0');  -- Clear internal w[k] signal
			L_wkd1 <= (others => '0');  -- Clear internal w[k-1] signal
			L_wkd2 <= (others => '0');  -- Clear internal w[k-2] signal
			L_pkd0 <= (others => '0');  -- Clear internal p[k] signal
			L_pkd1 <= (others => '0');  -- Clear internal p[k-1] signal
			L_pkd2 <= (others => '0');  -- Clear internal p[k-2] signal
			L_qkd0 <= (others => '0');  -- Clear internal q[k] signal
			L_qkd1 <= (others => '0');  -- Clear internal q[k-1] signal
			L_qkd2 <= (others => '0');  -- Clear internal q[k-2] signal
			L_skd0 <= (others => '0');  -- Clear internal s[k] signal
			L_skd1 <= (others => '0');  -- Clear internal s[k-1] signal
			L_skd2 <= (others => '0');  -- Clear internal s[k-2] signal
			L_tkd0 <= (others => '0');  -- Clear internal t[k] signal
			L_tkd1 <= (others => '0');  -- Clear internal t[k-1] signal
			L_tkd2 <= (others => '0');  -- Clear internal t[k-2] signal
			L_ukd0 <= (others => '0');  -- Clear internal u[k] signal
			L_ukd1 <= (others => '0');  -- Clear internal u[k-1] signal
			L_ukd2 <= (others => '0');  -- Clear internal u[k-2] signal
			L_vkd0 <= (others => '0');  -- Clear internal v[k] signal
			L_vkd1 <= (others => '0');  -- Clear internal v[k-1] signal
			L_vkd2 <= (others => '0');  -- Clear internal v[k-2] signal
			L_ykd0 <= (others => '0');  -- Clear internal y[k] signal
			L_ykd1 <= (others => '0');  -- Clear internal y[k-1] signal
			L_ykd2 <= (others => '0');  -- Clear internal y[k-2] signal
			-- CLEAR RIGHT CHANNEL
			R_Yk <= (others => '0');    -- Clear BPF output
			Rdone <= '0';               -- Clear notify output
			R_rkd0 <= (others => '0');  -- Clear internal r[k] signal
			R_rkd1 <= (others => '0');  -- Clear internal r[k-1] signal
			R_rkd2 <= (others => '0');  -- Clear internal r[k-2] signal
			R_wkd0 <= (others => '0');  -- Clear internal w[k] signal
			R_wkd1 <= (others => '0');  -- Clear internal w[k-1] signal
			R_wkd2 <= (others => '0');  -- Clear internal w[k-2] signal
			R_pkd0 <= (others => '0');  -- Clear internal p[k] signal
			R_pkd1 <= (others => '0');  -- Clear internal p[k-1] signal
			R_pkd2 <= (others => '0');  -- Clear internal p[k-2] signal
			R_qkd0 <= (others => '0');  -- Clear internal q[k] signal
			R_qkd1 <= (others => '0');  -- Clear internal q[k-1] signal
			R_qkd2 <= (others => '0');  -- Clear internal q[k-2] signal
			R_skd0 <= (others => '0');  -- Clear internal s[k] signal
			R_skd1 <= (others => '0');  -- Clear internal s[k-1] signal
			R_skd2 <= (others => '0');  -- Clear internal s[k-2] signal
			R_tkd0 <= (others => '0');  -- Clear internal t[k] signal
			R_tkd1 <= (others => '0');  -- Clear internal t[k-1] signal
			R_tkd2 <= (others => '0');  -- Clear internal t[k-2] signal
			R_ukd0 <= (others => '0');  -- Clear internal u[k] signal
			R_ukd1 <= (others => '0');  -- Clear internal u[k-1] signal
			R_ukd2 <= (others => '0');  -- Clear internal u[k-2] signal
			R_vkd0 <= (others => '0');  -- Clear internal v[k] signal
			R_vkd1 <= (others => '0');  -- Clear internal v[k-1] signal
			R_vkd2 <= (others => '0');  -- Clear internal v[k-2] signal
			R_ykd0 <= (others => '0');  -- Clear internal y[k] signal
			R_ykd1 <= (others => '0');  -- Clear internal y[k-1] signal
			R_ykd2 <= (others => '0');  -- Clear internal y[k-2] signal
			-- Add or delete signals clearing if desired filter is different.
		elsif Clk'event and Clk = '1' then  -- Synchronous behaviour
			Ldone <= '0';  -- Keep notify output to low unless left output data is ready
			Rdone <= '0';  -- Keep notify output to low unless right output data is ready
			case T is      -- Synchronous sequential logic behaviour
				when Ta =>  -- Initial State
					if L_Start = '1' then
						T <= TbL;  -- To next state after receiving Start signal (Left channel)
					elsif R_Start = '1' then
						T <= TbR;  -- To next state after receiving Start signal (Right channel)
					else
						T <= Ta;   -- Keep on same state if not Start signal yet
					end if;
				-- LEFT CHANNEL BPF
				when TbL =>  -- Swaping Delay State
					T <= Tc1L;  -- To next state
					-- R[k] delay and input
					L_rkd2 <= L_rkd1;  -- r[k-2] <= r[k-1]
					L_rkd1 <= L_rkd0;  -- r[k-1] <= r[k]
					L_rkd0 <= L_Rk;    -- r[k] <= R[k] (Input)
					-- W[k] delay
					L_wkd2 <= L_wkd1;  -- w[k-2] <= w[k-1]
					L_wkd1 <= L_wkd0;  -- w[k-1] <= w[k]
					-- P[k] delay
					L_pkd2 <= L_pkd1;  -- p[k-2] <= p[k-1]
					L_pkd1 <= L_pkd0;  -- p[k-1] <= p[k]
					-- Q[k] delay
					L_qkd2 <= L_qkd1;  -- q[k-2] <= q[k-1]
					L_qkd1 <= L_qkd0;  -- q[k-1] <= q[k]
					-- S[k] delay
					L_skd2 <= L_skd1;  -- s[k-2] <= s[k-1]
					L_skd1 <= L_skd0;  -- s[k-1] <= s[k]
					-- T[k] delay
					L_tkd2 <= L_tkd1;  -- t[k-2] <= t[k-1]
					L_tkd1 <= L_tkd0;  -- t[k-1] <= t[k]
					-- U[k] delay
					L_ukd2 <= L_ukd1;  -- u[k-2] <= u[k-1]
					L_ukd1 <= L_ukd0;  -- u[k-1] <= u[k]
					-- V[k] delay
					L_vkd2 <= L_vkd1;  -- v[k-2] <= v[k-1]
					L_vkd1 <= L_vkd0;  -- v[k-1] <= v[k]
					-- Y[k] delay
					L_ykd2 <= L_ykd1;  -- y[k-2] <= y[k-1]
					L_ykd1 <= L_ykd0;  -- y[k-1] <= y[k]
				-- From here, all states will calculate R = N1 + (N2*N3) recursively
				-- Each stage takes 5 clock times including output saving
				-- Last clock of a stage is shared with first clock of next stage
				when Tc1L =>
					T <= Tc2L;  -- To next state
					-- Stage 1: Numerator
					N1 <= (others => '0');
					N2 <= a1_0;
					N3 <= L_rkd0;
					-- Performs R = a1_0 * r[k]
				when Tc2L =>
					T <= Tc3L;  -- To next state
					N1 <= R;
					N2 <= a1_2;
					N3 <= L_rkd2;
					-- Performs R = previous_R + a1_2 * r[k-2]
				when Tc3L =>
					T <= Tc4L;  -- To next state
					-- Stage 1: Denominator
					N1 <= R;
					N2 <= b1_1;
					N3 <= L_wkd1;
					-- Performs R = previous_R + (-b1_1) * w[k-1]
				when Tc4L =>
					T <= Td1L;  -- To next state
					N1 <= R;
					N2 <= b1_2;
					N3 <= L_wkd2;
					-- Performs R = previous_R + (-b1_2) * w[k-2]
				when Td1L =>
					T <= Td2L;  -- To next state
					-- Save previous_R to wkd0 as w[k] = previous_R
					-- When solving previous_R you'd get:
					-- w[k] = a1_0 * r[k] + a1_2 * r[k-2] + (-b1_1) * w[k-1] + (-b1_2) * w[k-2]
					L_wkd0 <= R;
					-- Stage 2: Numerator
					N1 <= (others => '0');
					N2 <= a2_0;
					N3 <= R;  -- same as w[k] or wkd0
					-- Performs R = a2_0 * w[k]
				when Td2L =>
					T <= Td3L;  -- To next state
					N1 <= R;
					N2 <= a2_2;
					N3 <= L_wkd2;
					-- Performs R = previous_R + a2_2 * w[k-2]
				when Td3L =>
					T <= Td4L;  -- To next state
					-- Stage 2: Denominator
					N1 <= R;
					N2 <= b2_1;
					N3 <= L_pkd1;
					-- Performs R = previous_R + (-b2_1) * p[k-1]
				when Td4L =>
					T <= Te1L;  -- To next state
					N1 <= R;
					N2 <= b2_2;
					N3 <= L_pkd2;
					-- Performs R = previous_R + (-b2_2) * p[k-2]
				when Te1L =>
					T <= Te2L;  -- To next state
					-- Save previous_R to pkd0 as p[k] = previous_R
					-- When solving previous_R you'd get:
					-- p[k] = a2_0 * w[k] + a2_2 * w[k-2] + (-b2_1) * p[k-1] + (-b2_2) * p[k-2]
					L_pkd0 <= R;
					-- Stage 3: Numerator
					N1 <= (others => '0');
					N2 <= a3_0;
					N3 <= R;  -- same as p[k] or pkd0
					-- Performs R = (a3_0) * p[k]
				when Te2L =>
					T <= Te3L;  -- To next state
					N1 <= R;
					N2 <= a3_2;
					N3 <= L_pkd2;
					-- Performs R = previous_R + a3_2 * p[k-2]
				when Te3L =>
					T <= Te4L;  -- To next state
					-- Stage 3: Denominator
					N1 <= R;
					N2 <= b3_1;
					N3 <= L_qkd1;
					-- Performs R = previous_R + (-b3_1) * q[k-1]
				when Te4L =>
					T <= Tf1L;  -- To next state
					N1 <= R;
					N2 <= b3_2;
					N3 <= L_qkd2;
					-- Performs R = previous_R + (-b3_2) * q[k-2]
				when Tf1L =>
					T <= Tf2L;  -- To next state
					-- Save previous_R to qkd0 as q[k] = previous_R
					-- When solving previous_R you'd get:
					-- q[k] = a3_0 * p[k] + a3_2 * p[k-2] + (-b3_1) * q[k-1] + (-b3_2) * q[k-2]
					L_qkd0 <= R;
					-- Stage 4: Numerator
					N1 <= (others => '0');
					N2 <= a4_0;
					N3 <= R;  -- same as q[k] or qkd0
					-- Performs R = (a4_0) * q[k]
				when Tf2L =>
					T <= Tf3L;  -- To next state
					N1 <= R;
					N2 <= a4_2;
					N3 <= L_qkd2;
					-- Performs R = previous_R + a4_2 * q[k-2]
				when Tf3L =>
					T <= Tf4L;  -- To next state
					-- Stage 4: Denominator
					N1 <= R;
					N2 <= b4_1;
					N3 <= L_skd1;
					-- Performs R = previous_R + (-b4_1) * s[k-1]
				when Tf4L =>
					T <= Tg1L;  -- To next state
					N1 <= R;
					N2 <= b4_2;
					N3 <= L_skd2;
					-- Performs R = previous_R + (-b4_2) * s[k-2]
				when Tg1L =>
					T <= Tg2L;  -- To next state
					-- Save previous_R to qkd0 as q[k] = previous_R
					-- When solving previous_R you'd get:
					-- s[k] = a4_0 * q[k] + a4_2 * q[k-2] + (-b4_1) * s[k-1] + (-b4_2) * s[k-2]
					L_skd0 <= R;
					-- Stage 5: Numerator
					N1 <= (others => '0');
					N2 <= a5_0;
					N3 <= R;  -- same as s[k] or skd0
					-- Performs R = (a5_0) * s[k]
				when Tg2L =>
					T <= Tg3L;  -- To next state
					N1 <= R;
					N2 <= a5_2;
					N3 <= L_skd2;
					-- Performs R = previous_R + a5_2 * s[k-2]
				when Tg3L =>
					T <= Tg4L;  -- To next state
					-- Stage 5: Denominator
					N1 <= R;
					N2 <= b5_1;
					N3 <= L_tkd1;
					-- Performs R = previous_R + (-b5_1) * t[k-1]
				when Tg4L =>
					T <= Th1L;  -- To next state
					N1 <= R;
					N2 <= b5_2;
					N3 <= L_tkd2;
					-- Performs R = previous_R + (-b5_2) * t[k-2]
				when Th1L =>
					T <= Th2L;  -- To next state
					-- Save previous_R to qkd0 as q[k] = previous_R
					-- When solving previous_R you'd get:
					-- t[k] = a5_0 * s[k] + a5_2 * s[k-2] + (-b5_1) * t[k-1] + (-b5_2) * t[k-2]
					L_tkd0 <= R;
					-- Stage 6: Numerator
					N1 <= (others => '0');
					N2 <= a6_0;
					N3 <= R;  -- same as t[k] or tkd0
					-- Performs R = (a6_0) * t[k]
				when Th2L =>
					T <= Th3L;  -- To next state
					N1 <= R;
					N2 <= a6_2;
					N3 <= L_tkd2;
					-- Performs R = previous_R + a6_2 * t[k-2]
				when Th3L =>
					T <= Th4L;  -- To next state
					-- Stage 6: Denominator
					N1 <= R;
					N2 <= b6_1;
					N3 <= L_ukd1;
					-- Performs R = previous_R + (-b6_1) * u[k-1]
				when Th4L =>
					T <= Ti1L;  -- To next state
					N1 <= R;
					N2 <= b6_2;
					N3 <= L_ukd2;
					-- Performs R = previous_R + (-b6_2) * u[k-2]
				when Ti1L =>
					T <= Ti2L;  -- To next state
					-- Save previous_R to qkd0 as q[k] = previous_R
					-- When solving previous_R you'd get:
					-- u[k] = a6_0 * t[k] + a6_2 * t[k-2] + (-b6_1) * u[k-1] + (-b6_2) * u[k-2]
					L_ukd0 <= R;
					-- Stage 7: Numerator
					N1 <= (others => '0');
					N2 <= a7_0;
					N3 <= R;  -- same as u[k] or ukd0
					-- Performs R = (a7_0) * u[k]
				when Ti2L =>
					T <= Ti3L;  -- To next state
					N1 <= R;
					N2 <= a7_2;
					N3 <= L_ukd2;
					-- Performs R = previous_R + a7_2 * u[k-2]
				when Ti3L =>
					T <= Ti4L;  -- To next state
					-- Stage 7: Denominator
					N1 <= R;
					N2 <= b7_1;
					N3 <= L_vkd1;
					-- Performs R = previous_R + (-b7_1) * v[k-1]
				when Ti4L =>
					T <= Tj1L;  -- To next state
					N1 <= R;
					N2 <= b7_2;
					N3 <= L_vkd2;
					-- Performs R = previous_R + (-b7_2) * v[k-2]
				when Tj1L =>
					T <= Tj2L;  -- To next state
					-- Save previous_R to qkd0 as q[k] = previous_R
					-- When solving previous_R you'd get:
					-- v[k] = a7_0 * u[k] + a7_2 * u[k-2] + (-b7_1) * v[k-1] + (-b7_2) * v[k-2]
					L_vkd0 <= R;
					-- Stage 8: Numerator
					N1 <= (others => '0');
					N2 <= a8_0;
					N3 <= R;  -- same as v[k] or vkd0
					-- Performs R = a8_0 * v[k]
				when Tj2L =>
					T <= Tj3L;  -- To next state
					N1 <= R;
					N2 <= a8_2;
					N3 <= L_vkd2;
					-- Performs R = previous_R + a8_2 * v[k-2]
				when Tj3L =>
					T <= Tj4L;  -- To next state
					-- Stage 8: Denominator
					N1 <= R;
					N2 <= b8_1;
					N3 <= L_ykd1;
					-- Performs R = previous_R + (-b8_1) * y[k-1]
				when Tj4L =>
					T <= TkL;  -- To next state
					N1 <= R;
					N2 <= b8_2;
					N3 <= L_ykd2;
					-- Performs R = previous_R + (-b8_2) * y[k-2]
				when TkL =>
					T <= Ta;  -- To initial state
					-- Save previous_R to ykd0 as y[k] = previous_R
					-- When solving previous_R you'd get:
					-- y[k] = a8_0 * v[k] + a8_2 * v[k-2] + (-b8_1) * y[k-1] + (-b8_2) * y[k-2]
					L_ykd0 <= R;
				-- If there is no more stages, BPF output is ready
					L_Yk <= R;		-- Send previous_R = y[k] to output Yk
					Ldone <= '1';  -- Notify Yk output is ready with 'done' signal
				-- RIGHT CHANNEL BPF
				when TbR =>  -- Swaping Delay State
					T <= Tc1R;  -- To next state
					-- R[k] delay and input
					R_rkd2 <= R_rkd1;  -- r[k-2] <= r[k-1]
					R_rkd1 <= R_rkd0;  -- r[k-1] <= r[k]
					R_rkd0 <= R_Rk;    -- r[k] <= R[k] (Input)
					-- W[k] delay
					R_wkd2 <= R_wkd1;  -- w[k-2] <= w[k-1]
					R_wkd1 <= R_wkd0;  -- w[k-1] <= w[k]
					-- P[k] delay
					R_pkd2 <= R_pkd1;  -- p[k-2] <= p[k-1]
					R_pkd1 <= R_pkd0;  -- p[k-1] <= p[k]
					-- Q[k] delay
					R_qkd2 <= R_qkd1;  -- q[k-2] <= q[k-1]
					R_qkd1 <= R_qkd0;  -- q[k-1] <= q[k]
					-- S[k] delay
					R_skd2 <= R_skd1;  -- s[k-2] <= s[k-1]
					R_skd1 <= R_skd0;  -- s[k-1] <= s[k]
					-- T[k] delay
					R_tkd2 <= R_tkd1;  -- t[k-2] <= t[k-1]
					R_tkd1 <= R_tkd0;  -- t[k-1] <= t[k]
					-- U[k] delay
					R_ukd2 <= R_ukd1;  -- u[k-2] <= u[k-1]
					R_ukd1 <= R_ukd0;  -- u[k-1] <= u[k]
					-- V[k] delay
					R_vkd2 <= R_vkd1;  -- v[k-2] <= v[k-1]
					R_vkd1 <= R_vkd0;  -- v[k-1] <= v[k]
					-- Y[k] delay
					R_ykd2 <= R_ykd1;  -- y[k-2] <= y[k-1]
					R_ykd1 <= R_ykd0;  -- y[k-1] <= y[k]
				-- From here, all states will calculate R = N1 + (N2*N3) recursively
				-- Each stage takes 5 clock times including output saving
				-- Last clock of a stage is shared with first clock of next stage
				when Tc1R =>
					T <= Tc2R;  -- To next state
					-- Stage 1: Numerator
					N1 <= (others => '0');
					N2 <= a1_0;
					N3 <= R_rkd0;
					-- Performs R = a1_0 * r[k]
				when Tc2R =>
					T <= Tc3R;  -- To next state
					N1 <= R;
					N2 <= a1_2;
					N3 <= R_rkd2;
					-- Performs R = previous_R + a1_2 * r[k-2]
				when Tc3R =>
					T <= Tc4R;  -- To next state
					-- Stage 1: Denominator
					N1 <= R;
					N2 <= b1_1;
					N3 <= R_wkd1;
					-- Performs R = previous_R + (-b1_1) * w[k-1]
				when Tc4R =>
					T <= Td1R;  -- To next state
					N1 <= R;
					N2 <= b1_2;
					N3 <= R_wkd2;
					-- Performs R = previous_R + (-b1_2) * w[k-2]
				when Td1R =>
					T <= Td2R;  -- To next state
					-- Save previous_R to wkd0 as w[k] = previous_R
					-- When solving previous_R you'd get:
					-- w[k] = a1_0 * r[k] + a1_2 * r[k-2] + (-b1_1) * w[k-1] + (-b1_2) * w[k-2]
					R_wkd0 <= R;
					-- Stage 2: Numerator
					N1 <= (others => '0');
					N2 <= a2_0;
					N3 <= R;  -- same as w[k] or wkd0
					-- Performs R = a2_0 * w[k]
				when Td2R =>
					T <= Td3R;  -- To next state
					N1 <= R;
					N2 <= a2_2;
					N3 <= R_wkd2;
					-- Performs R = previous_R + a2_2 * w[k-2]
				when Td3R =>
					T <= Td4R;  -- To next state
					-- Stage 2: Denominator
					N1 <= R;
					N2 <= b2_1;
					N3 <= R_pkd1;
					-- Performs R = previous_R + (-b2_1) * p[k-1]
				when Td4R =>
					T <= Te1R;  -- To next state
					N1 <= R;
					N2 <= b2_2;
					N3 <= R_pkd2;
					-- Performs R = previous_R + (-b2_2) * p[k-2]
				when Te1R =>
					T <= Te2R;  -- To next state
					-- Save previous_R to pkd0 as p[k] = previous_R
					-- When solving previous_R you'd get:
					-- p[k] = a2_0 * w[k] + a2_2 * w[k-2] + (-b2_1) * p[k-1] + (-b2_2) * p[k-2]
					R_pkd0 <= R;
					-- Stage 3: Numerator
					N1 <= (others => '0');
					N2 <= a3_0;
					N3 <= R;  -- same as p[k] or pkd0
					-- Performs R = (a3_0) * p[k]
				when Te2R =>
					T <= Te3R;  -- To next state
					N1 <= R;
					N2 <= a3_2;
					N3 <= R_pkd2;
					-- Performs R = previous_R + a3_2 * p[k-2]
				when Te3R =>
					T <= Te4R;  -- To next state
					-- Stage 3: Denominator
					N1 <= R;
					N2 <= b3_1;
					N3 <= R_qkd1;
					-- Performs R = previous_R + (-b3_1) * q[k-1]
				when Te4R =>
					T <= Tf1R;  -- To next state
					N1 <= R;
					N2 <= b3_2;
					N3 <= R_qkd2;
					-- Performs R = previous_R + (-b3_2) * q[k-2]
				when Tf1R =>
					T <= Tf2R;  -- To next state
					-- Save previous_R to qkd0 as q[k] = previous_R
					-- When solving previous_R you'd get:
					-- q[k] = a3_0 * p[k] + a3_2 * p[k-2] + (-b3_1) * q[k-1] + (-b3_2) * q[k-2]
					R_qkd0 <= R;
					-- Stage 4: Numerator
					N1 <= (others => '0');
					N2 <= a4_0;
					N3 <= R;  -- same as q[k] or qkd0
					-- Performs R = (a4_0) * q[k]
				when Tf2R =>
					T <= Tf3R;  -- To next state
					N1 <= R;
					N2 <= a4_2;
					N3 <= R_qkd2;
					-- Performs R = previous_R + a4_2 * q[k-2]
				when Tf3R =>
					T <= Tf4R;  -- To next state
					-- Stage 4: Denominator
					N1 <= R;
					N2 <= b4_1;
					N3 <= R_skd1;
					-- Performs R = previous_R + (-b4_1) * s[k-1]
				when Tf4R =>
					T <= Tg1R;  -- To next state
					N1 <= R;
					N2 <= b4_2;
					N3 <= R_skd2;
					-- Performs R = previous_R + (-b4_2) * s[k-2]
				when Tg1R =>
					T <= Tg2R;  -- To next state
					-- Save previous_R to qkd0 as q[k] = previous_R
					-- When solving previous_R you'd get:
					-- s[k] = a4_0 * q[k] + a4_2 * q[k-2] + (-b4_1) * s[k-1] + (-b4_2) * s[k-2]
					R_skd0 <= R;
					-- Stage 5: Numerator
					N1 <= (others => '0');
					N2 <= a5_0;
					N3 <= R;  -- same as s[k] or skd0
					-- Performs R = (a5_0) * s[k]
				when Tg2R =>
					T <= Tg3R;  -- To next state
					N1 <= R;
					N2 <= a5_2;
					N3 <= R_skd2;
					-- Performs R = previous_R + a5_2 * s[k-2]
				when Tg3R =>
					T <= Tg4R;  -- To next state
					-- Stage 5: Denominator
					N1 <= R;
					N2 <= b5_1;
					N3 <= R_tkd1;
					-- Performs R = previous_R + (-b5_1) * t[k-1]
				when Tg4R =>
					T <= Th1R;  -- To next state
					N1 <= R;
					N2 <= b5_2;
					N3 <= R_tkd2;
					-- Performs R = previous_R + (-b5_2) * t[k-2]
				when Th1R =>
					T <= Th2R;  -- To next state
					-- Save previous_R to qkd0 as q[k] = previous_R
					-- When solving previous_R you'd get:
					-- t[k] = a5_0 * s[k] + a5_2 * s[k-2] + (-b5_1) * t[k-1] + (-b5_2) * t[k-2]
					R_tkd0 <= R;
					-- Stage 6: Numerator
					N1 <= (others => '0');
					N2 <= a6_0;
					N3 <= R;  -- same as t[k] or tkd0
					-- Performs R = (a6_0) * t[k]
				when Th2R =>
					T <= Th3R;  -- To next state
					N1 <= R;
					N2 <= a6_2;
					N3 <= R_tkd2;
					-- Performs R = previous_R + a6_2 * t[k-2]
				when Th3R =>
					T <= Th4R;  -- To next state
					-- Stage 6: Denominator
					N1 <= R;
					N2 <= b6_1;
					N3 <= R_ukd1;
					-- Performs R = previous_R + (-b6_1) * u[k-1]
				when Th4R =>
					T <= Ti1R;  -- To next state
					N1 <= R;
					N2 <= b6_2;
					N3 <= R_ukd2;
					-- Performs R = previous_R + (-b6_2) * u[k-2]
				when Ti1R =>
					T <= Ti2R;  -- To next state
					-- Save previous_R to qkd0 as q[k] = previous_R
					-- When solving previous_R you'd get:
					-- u[k] = a6_0 * t[k] + a6_2 * t[k-2] + (-b6_1) * u[k-1] + (-b6_2) * u[k-2]
					R_ukd0 <= R;
					-- Stage 7: Numerator
					N1 <= (others => '0');
					N2 <= a7_0;
					N3 <= R;  -- same as u[k] or ukd0
					-- Performs R = (a7_0) * u[k]
				when Ti2R =>
					T <= Ti3R;  -- To next state
					N1 <= R;
					N2 <= a7_2;
					N3 <= R_ukd2;
					-- Performs R = previous_R + a7_2 * u[k-2]
				when Ti3R =>
					T <= Ti4R;  -- To next state
					-- Stage 7: Denominator
					N1 <= R;
					N2 <= b7_1;
					N3 <= R_vkd1;
					-- Performs R = previous_R + (-b7_1) * v[k-1]
				when Ti4R =>
					T <= Tj1R;  -- To next state
					N1 <= R;
					N2 <= b7_2;
					N3 <= R_vkd2;
					-- Performs R = previous_R + (-b7_2) * v[k-2]
				when Tj1R =>
					T <= Tj2R;  -- To next state
					-- Save previous_R to qkd0 as q[k] = previous_R
					-- When solving previous_R you'd get:
					-- v[k] = a7_0 * u[k] + a7_2 * u[k-2] + (-b7_1) * v[k-1] + (-b7_2) * v[k-2]
					R_vkd0 <= R;
					-- Stage 8: Numerator
					N1 <= (others => '0');
					N2 <= a8_0;
					N3 <= R;  -- same as v[k] or vkd0
					-- Performs R = a8_0 * v[k]
				when Tj2R =>
					T <= Tj3R;  -- To next state
					N1 <= R;
					N2 <= a8_2;
					N3 <= R_vkd2;
					-- Performs R = previous_R + a8_2 * v[k-2]
				when Tj3R =>
					T <= Tj4R;  -- To next state
					-- Stage 8: Denominator
					N1 <= R;
					N2 <= b8_1;
					N3 <= R_ykd1;
					-- Performs R = previous_R + (-b8_1) * y[k-1]
				when Tj4R =>
					T <= TkR;  -- To next state
					N1 <= R;
					N2 <= b8_2;
					N3 <= R_ykd2;
					-- Performs R = previous_R + (-b8_2) * y[k-2]
				when TkR =>
					T <= Ta;  -- To initial state
					-- Save previous_R to ykd0 as y[k] = previous_R
					-- When solving previous_R you'd get:
					-- y[k] = a8_0 * v[k] + a8_2 * v[k-2] + (-b8_1) * y[k-1] + (-b8_2) * y[k-2]
					R_ykd0 <= R;
				-- If there is no more stages, BPF output is ready
					R_Yk <= R;	   -- Send previous_R = y[k] to output Yk
					Rdone <= '1';  -- Notify Yk output is ready with 'done' signal
				when others =>
					T <= Ta;  -- To inital state
			end case;
		end if;
	end process;
	
	-- Port map SingleAddProduct component to perform R = N1 + (N2 * N3)
	SingleCalc: SingleAddProduct port map (N1,N2,N3,R);

end Logic;
