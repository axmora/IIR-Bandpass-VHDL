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
-- Module Name:	Fixed2Float.vhd
-- 
-- Description:	Convert number from fixed to floating point format.
-- Comment:			Used to convert I2S two's complement output (receiver)
--						to floating point and match BPF input format.
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

entity Fixed2Float is
	generic(
		fixed_width		: integer := 24;  -- 24bits for I2S two's complement output format
		float_width		: integer := 32   -- 32bits for single precision floating number
		);
	port(
		FixedInput		: in std_logic_vector(fixed_width-1 downto 0);  -- From I2S
		FloatOutput		: out std_logic_vector(float_width-1 downto 0)  -- To BPF
		);
end Fixed2Float;

-- Advise: To use FLOAT_PKG operations, data must match with the corresponding floating
--         point type specified in package. Input and output data type were left as
--         STD_LOGIC_VECTOR for better data handling between modules and to perform
--         simulations as FLOAT_PKG types are not supported.

architecture Logic of Fixed2Float is

	signal Fixed_int	: sfixed(fixed_width-1 downto 0);  -- Signed fixed with no fraction
	signal Float_int	: float32;                         -- Single precision IEEE754 format

begin

	Fixed_int <= to_sfixed(FixedInput, fixed_width-1, 0);  -- Convert input to sfixed
	Float_int <= to_float(Fixed_int);                       -- Convert sfixed to float
	FloatOutput <= to_slv(Float_int);            -- Convert float to std_logic_vector

end Logic;
