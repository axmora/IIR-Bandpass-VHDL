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
-- Module Name:	Float2Fixed.vhd
-- 
-- Description:	Convert number from floating point to fixed format.
-- Comment:			Used to convert BPF floating point output to I2S two's
--						complement format (transmitter)
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

entity Float2Fixed is
	generic(
		float_width		: integer := 32;  -- 32bits for single precision floating number
		fixed_width		: integer := 24   -- 24bits for I2S two's complement output format
		);
	port(
		FloatInput		: in std_logic_vector(float_width-1 downto 0);  -- From BPF
		FixedOutput		: out std_logic_vector(fixed_width-1 downto 0)  -- To I2S
		);
end Float2Fixed;

-- Advise: To use FLOAT_PKG operations, data must match with the corresponding floating
--         point type specified in package. Input and output data type were left as
--         STD_LOGIC_VECTOR for better data handling between modules and to perform
--         simulations as FLOAT_PKG types are not supported.

architecture Logic of Float2Fixed is

	signal Float_int	: float32;                         -- Single precision IEEE754 format
	signal Fixed_int	: sfixed(fixed_width-1 downto 0);  -- Signed fixed with no fraction

begin

	Float_int <= to_float(FloatInput);                   -- Convert input to float
	Fixed_int <= to_sfixed(Float_int, fixed_width-1, 0);  -- Convert float to sfixed
	FixedOutput <= to_slv(Fixed_int);         -- Convert sfixed to std_logic_vector

end Logic;
