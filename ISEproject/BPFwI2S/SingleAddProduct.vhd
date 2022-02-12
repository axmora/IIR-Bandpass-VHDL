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
-- Parent Module:	BPF2channels.vhd
-- Module Name:	SingleAddProduct.vhd
-- 
-- Description:	Performs the operation N1+(N2*N3).
-- Comment:			Will be used recursively by BPF to calculate the filter output.
-- 
-- Dependencies:	IEEE standard library for standard behaviour.
--						IEEE_PROPOSED library for floating point number operations.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Dependencies for FLOAT_PKG
use IEEE.NUMERIC_STD.ALL;
library IEEE_PROPOSED;
use IEEE_PROPOSED.FIXED_FLOAT_TYPES.all;
use IEEE_PROPOSED.FIXED_PKG.all;
use IEEE_PROPOSED.FLOAT_PKG.ALL;

entity SingleAddProduct is
	generic(
		float_width		: integer := 32  -- 32bits for single precision floating number
		);
	port(
		N1		: in std_logic_vector(float_width-1 downto 0);  -- input with IEEE754 format
		N2		: in std_logic_vector(float_width-1 downto 0);  -- input with IEEE754 format
		N3		: in std_logic_vector(float_width-1 downto 0);  -- input with IEEE754 format
		R		: out std_logic_vector(float_width-1 downto 0)  -- output with IEEE754 format
		);
end SingleAddProduct;

-- Advise: To use FLOAT_PKG operations, data must match with the corresponding floating
--         point type specified in package. Input and output data type were left as
--         STD_LOGIC_VECTOR for better data handling between modules and to perform
--         simulations as FLOAT_PKG types are not supported.

architecture Logic of SingleAddProduct is

	-- float32 data type matchs IEEE754 format
	signal N1fp		: float32;  -- N1 with float32 data type
	signal N2fp		: float32;  -- N2 with float32 data type
	signal N3fp		: float32;  -- N3 with float32 data type
	signal Rfp		: float32;  -- R with float32 data type

begin

	N1fp <= to_float(N1);  -- Convert N1 to float32 data type
	N2fp <= to_float(N2);  -- Convert N2 to float32 data type
	N3fp <= to_float(N3);  -- Convert N3 to float32 data type
	
	Rfp <= N1fp + (N2fp * N3fp);  -- Performs R = N1 + (N2 * N3)
	
	R <= to_slv(Rfp);  -- Convert float32 to STD_LOGIC_VECTOR and assign to R

end Logic;
