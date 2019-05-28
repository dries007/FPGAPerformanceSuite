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
	signal G5: std_logic;
	signal G6: std_logic;
	signal G7: std_logic;
	signal G8: std_logic;
	signal G9: std_logic;
	signal G10: std_logic;
	signal G11: std_logic;
	signal G12: std_logic;
	signal G13: std_logic;
	signal G14: std_logic;
	signal G15: std_logic;
	signal G16: std_logic;
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
