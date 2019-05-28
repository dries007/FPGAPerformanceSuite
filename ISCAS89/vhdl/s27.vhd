-- File created by Bench2VHDL
-- Name: s27
-- File: bench/s27.bench
-- Timestamp: 2019-05-21T22:08:28.431682
--
-- Original File
-- =============
--	# 4 inputs
--	# 1 outputs
--	# 3 D-type flipflops
--	# 2 inverters
--	# 8 gates (1 ANDs + 1 NANDs + 2 ORs + 4 NORs)
--	
--	INPUT(G0)
--	INPUT(G1)
--	INPUT(G2)
--	INPUT(G3)
--	
--	OUTPUT(G17)
--	
--	G5 = DFF(G10)
--	G6 = DFF(G11)
--	G7 = DFF(G13)
--	
--	G14 = NOT(G0)
--	G17 = NOT(G11)
--	
--	G8 = AND(G14, G6)
--	
--	G15 = OR(G12, G8)
--	G16 = OR(G3, G8)
--	
--	G9 = NAND(G16, G15)
--	
--	G10 = NOR(G14, G11)
--	G11 = NOR(G5, G9)
--	G12 = NOR(G1, G7)
--	G13 = NOR(G2, G12)
--
-- VHDL Output
-- =============
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity s27 is
	port (
		CLK: in std_logic;
		G0: in std_logic;
		G1: in std_logic;
		G2: in std_logic;
		G3: in std_logic;
		G17: out std_logic
	);
end entity;

architecture RTL of s27 is
	attribute dont_touch: boolean;

	signal G5: std_logic; attribute dont_touch of G5: signal is true;
	signal G6: std_logic; attribute dont_touch of G6: signal is true;
	signal G7: std_logic; attribute dont_touch of G7: signal is true;
	signal G8: std_logic; attribute dont_touch of G8: signal is true;
	signal G9: std_logic; attribute dont_touch of G9: signal is true;
	signal G10: std_logic; attribute dont_touch of G10: signal is true;
	signal G11: std_logic; attribute dont_touch of G11: signal is true;
	signal G12: std_logic; attribute dont_touch of G12: signal is true;
	signal G13: std_logic; attribute dont_touch of G13: signal is true;
	signal G14: std_logic; attribute dont_touch of G14: signal is true;
	signal G15: std_logic; attribute dont_touch of G15: signal is true;
	signal G16: std_logic; attribute dont_touch of G16: signal is true;
begin
	process(CLK)
	begin
		if(rising_edge(CLK)) then
			G5<=G10;
			G6<=G11;
			G7<=G13;
		end if;
	end process;
	G14<= not G0;
	G17<= not G11;
	G8<=G14 and G6;
	G9<= not (G16 and G15);
	G15<=G12 or G8;
	G16<=G3 or G8;
	G10<= not (G14 or G11);
	G11<= not (G5 or G9);
	G12<= not (G1 or G7);
	G13<= not (G2 or G12);
end RTL;
