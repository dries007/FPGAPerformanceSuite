-- File created by Bench2VHDL
-- Name: s208
-- File: bench/s208.bench
-- Timestamp: 2019-05-21T22:08:28.050860
--
-- Original File
-- =============
--	# s208
--	# 11 inputs
--	# 2 outputs
--	# 8 D-type flipflops
--	# 35 inverters
--	# 61 gates (17 ANDs + 19 NANDs + 4 ORs + 21 NORs)
--	
--	INPUT(X)
--	INPUT(Clear)
--	INPUT(C_8)
--	INPUT(C_7)
--	INPUT(C_6)
--	INPUT(C_5)
--	INPUT(C_4)
--	INPUT(C_3)
--	INPUT(C_2)
--	INPUT(C_1)
--	INPUT(C_0)
--	
--	OUTPUT(W)
--	OUTPUT(Z)
--	
--	Y_4 = DFF(II3)
--	Y_3 = DFF(II4)
--	Y_2 = DFF(II5)
--	Y_1 = DFF(II6)
--	Y_8 = DFF(II155)
--	Y_7 = DFF(II156)
--	Y_6 = DFF(II157)
--	Y_5 = DFF(II158)
--	
--	II6 = NOT(II104)
--	II50 = NOT(II92)
--	II40 = NOT(X)
--	II41 = NOT(Y_4)
--	II42 = NOT(Y_3)
--	II43 = NOT(Y_2)
--	II44 = NOT(Y_1)
--	II3 = NOT(II46)
--	II4 = NOT(II47)
--	II158 = NOT(II256)
--	II202 = NOT(II244)
--	II192 = NOT(II1_1)
--	II193 = NOT(Y_8)
--	II194 = NOT(Y_7)
--	II195 = NOT(Y_6)
--	II196 = NOT(Y_5)
--	II155 = NOT(II198)
--	II156 = NOT(II199)
--	II307_1 = NOT(II341)
--	II318 = NOT(II341)
--	II309 = NOT(Y_1)
--	II310 = NOT(Y_2)
--	II311 = NOT(Y_3)
--	P_1 = NOT(II314)
--	P_3 = NOT(II316)
--	P_4 = NOT(II317)
--	II368 = NOT(Y_4)
--	II369 = NOT(Y_5)
--	II370 = NOT(Y_6)
--	II371 = NOT(Y_7)
--	II372 = NOT(Y_8)
--	P_6 = NOT(II374)
--	Z = NOT(II446)
--	II487 = NOT(II488)
--	II489 = NOT(II490)
--	
--	II127_1 = AND(II41, Y_3, II109)
--	II127_2 = AND(II96, II113, Y_4)
--	II131_1 = AND(II113, II92, Y_3)
--	II131_2 = AND(II42, II109)
--	II279_1 = AND(II193, Y_7, II261)
--	II279_2 = AND(II248, II265, Y_8)
--	II283_1 = AND(II265, II244, Y_7)
--	II283_2 = AND(II194, II261)
--	II497_1 = AND(P_8, C_8)
--	II500_1 = AND(P_5, C_5)
--	II500_2 = AND(P_2, C_2)
--	II504_1 = AND(P_3, C_3)
--	II504_2 = AND(P_4, C_4)
--	II508_1 = AND(X, C_0)
--	II508_2 = AND(P_1, C_1)
--	II512_1 = AND(P_6, C_6)
--	II512_2 = AND(P_7, C_7)
--	
--	II135_1 = OR(II43, II104)
--	II135_2 = OR(Y_2, II100)
--	II287_1 = OR(II195, II256)
--	II287_2 = OR(Y_6, II252)
--	
--	II5 = NAND(II135_1, II135_2)
--	II92 = NAND(Y_2, Y_1)
--	II96 = NAND(Y_3, II50)
--	II100 = NAND(Y_1, II113)
--	II104 = NAND(II44, II113)
--	II157 = NAND(II287_1, II287_2)
--	II244 = NAND(Y_6, Y_5)
--	II248 = NAND(Y_7, II202)
--	II252 = NAND(Y_5, II265)
--	II256 = NAND(II196, II265)
--	II314 = NAND(X, Y_1)
--	II316 = NAND(Y_3, II347)
--	II317 = NAND(Y_4, II318)
--	II341 = NAND(II311, II347)
--	II350 = NAND(X, II309)
--	II374 = NAND(Y_6, II406)
--	II378 = NAND(II406, II370)
--	II409 = NAND(II368, II307_1)
--	II495 = NAND(II484, II494)
--	
--	II1_1 = NOR(II41, II96)
--	II46 = NOR(II127_1, II127_2)
--	II47 = NOR(II131_1, II131_2)
--	II109 = NOR(II43, II100)
--	II113 = NOR(Clear, II40)
--	W = NOR(II193, II248)
--	II198 = NOR(II279_1, II279_2)
--	II199 = NOR(II283_1, II283_2)
--	II261 = NOR(II195, II252)
--	II265 = NOR(Clear, II192)
--	P_2 = NOR(II310, II350)
--	II347 = NOR(Y_2, II350)
--	P_5 = NOR(II369, II409)
--	P_7 = NOR(II371, II378)
--	P_8 = NOR(Y_7, II378, II372)
--	II406 = NOR(II409, Y_5)
--	II446 = NOR(II495, II487, II497_1)
--	II484 = NOR(II500_1, II500_2)
--	II488 = NOR(II504_1, II504_2)
--	II490 = NOR(II508_1, II508_2)
--	II494 = NOR(II512_1, II512_2, II489)
--
-- VHDL Output
-- =============
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity s208 is
	port (
		CLEAR: in std_logic;
		CLK: in std_logic;
		C_0: in std_logic;
		C_1: in std_logic;
		C_2: in std_logic;
		C_3: in std_logic;
		C_4: in std_logic;
		C_5: in std_logic;
		C_6: in std_logic;
		C_7: in std_logic;
		C_8: in std_logic;
		X: in std_logic;
		W: out std_logic;
		Z: out std_logic
	);
end entity;

architecture RTL of s208 is
	attribute dont_touch: boolean;

	signal II1_1: std_logic; attribute dont_touch of II1_1: signal is true;
	signal II3: std_logic; attribute dont_touch of II3: signal is true;
	signal II4: std_logic; attribute dont_touch of II4: signal is true;
	signal II5: std_logic; attribute dont_touch of II5: signal is true;
	signal II6: std_logic; attribute dont_touch of II6: signal is true;
	signal II40: std_logic; attribute dont_touch of II40: signal is true;
	signal II41: std_logic; attribute dont_touch of II41: signal is true;
	signal II42: std_logic; attribute dont_touch of II42: signal is true;
	signal II43: std_logic; attribute dont_touch of II43: signal is true;
	signal II44: std_logic; attribute dont_touch of II44: signal is true;
	signal II46: std_logic; attribute dont_touch of II46: signal is true;
	signal II47: std_logic; attribute dont_touch of II47: signal is true;
	signal II50: std_logic; attribute dont_touch of II50: signal is true;
	signal II92: std_logic; attribute dont_touch of II92: signal is true;
	signal II96: std_logic; attribute dont_touch of II96: signal is true;
	signal II100: std_logic; attribute dont_touch of II100: signal is true;
	signal II104: std_logic; attribute dont_touch of II104: signal is true;
	signal II109: std_logic; attribute dont_touch of II109: signal is true;
	signal II113: std_logic; attribute dont_touch of II113: signal is true;
	signal II127_1: std_logic; attribute dont_touch of II127_1: signal is true;
	signal II127_2: std_logic; attribute dont_touch of II127_2: signal is true;
	signal II131_1: std_logic; attribute dont_touch of II131_1: signal is true;
	signal II131_2: std_logic; attribute dont_touch of II131_2: signal is true;
	signal II135_1: std_logic; attribute dont_touch of II135_1: signal is true;
	signal II135_2: std_logic; attribute dont_touch of II135_2: signal is true;
	signal II155: std_logic; attribute dont_touch of II155: signal is true;
	signal II156: std_logic; attribute dont_touch of II156: signal is true;
	signal II157: std_logic; attribute dont_touch of II157: signal is true;
	signal II158: std_logic; attribute dont_touch of II158: signal is true;
	signal II192: std_logic; attribute dont_touch of II192: signal is true;
	signal II193: std_logic; attribute dont_touch of II193: signal is true;
	signal II194: std_logic; attribute dont_touch of II194: signal is true;
	signal II195: std_logic; attribute dont_touch of II195: signal is true;
	signal II196: std_logic; attribute dont_touch of II196: signal is true;
	signal II198: std_logic; attribute dont_touch of II198: signal is true;
	signal II199: std_logic; attribute dont_touch of II199: signal is true;
	signal II202: std_logic; attribute dont_touch of II202: signal is true;
	signal II244: std_logic; attribute dont_touch of II244: signal is true;
	signal II248: std_logic; attribute dont_touch of II248: signal is true;
	signal II252: std_logic; attribute dont_touch of II252: signal is true;
	signal II256: std_logic; attribute dont_touch of II256: signal is true;
	signal II261: std_logic; attribute dont_touch of II261: signal is true;
	signal II265: std_logic; attribute dont_touch of II265: signal is true;
	signal II279_1: std_logic; attribute dont_touch of II279_1: signal is true;
	signal II279_2: std_logic; attribute dont_touch of II279_2: signal is true;
	signal II283_1: std_logic; attribute dont_touch of II283_1: signal is true;
	signal II283_2: std_logic; attribute dont_touch of II283_2: signal is true;
	signal II287_1: std_logic; attribute dont_touch of II287_1: signal is true;
	signal II287_2: std_logic; attribute dont_touch of II287_2: signal is true;
	signal II307_1: std_logic; attribute dont_touch of II307_1: signal is true;
	signal II309: std_logic; attribute dont_touch of II309: signal is true;
	signal II310: std_logic; attribute dont_touch of II310: signal is true;
	signal II311: std_logic; attribute dont_touch of II311: signal is true;
	signal II314: std_logic; attribute dont_touch of II314: signal is true;
	signal II316: std_logic; attribute dont_touch of II316: signal is true;
	signal II317: std_logic; attribute dont_touch of II317: signal is true;
	signal II318: std_logic; attribute dont_touch of II318: signal is true;
	signal II341: std_logic; attribute dont_touch of II341: signal is true;
	signal II347: std_logic; attribute dont_touch of II347: signal is true;
	signal II350: std_logic; attribute dont_touch of II350: signal is true;
	signal II368: std_logic; attribute dont_touch of II368: signal is true;
	signal II369: std_logic; attribute dont_touch of II369: signal is true;
	signal II370: std_logic; attribute dont_touch of II370: signal is true;
	signal II371: std_logic; attribute dont_touch of II371: signal is true;
	signal II372: std_logic; attribute dont_touch of II372: signal is true;
	signal II374: std_logic; attribute dont_touch of II374: signal is true;
	signal II378: std_logic; attribute dont_touch of II378: signal is true;
	signal II406: std_logic; attribute dont_touch of II406: signal is true;
	signal II409: std_logic; attribute dont_touch of II409: signal is true;
	signal II446: std_logic; attribute dont_touch of II446: signal is true;
	signal II484: std_logic; attribute dont_touch of II484: signal is true;
	signal II487: std_logic; attribute dont_touch of II487: signal is true;
	signal II488: std_logic; attribute dont_touch of II488: signal is true;
	signal II489: std_logic; attribute dont_touch of II489: signal is true;
	signal II490: std_logic; attribute dont_touch of II490: signal is true;
	signal II494: std_logic; attribute dont_touch of II494: signal is true;
	signal II495: std_logic; attribute dont_touch of II495: signal is true;
	signal II497_1: std_logic; attribute dont_touch of II497_1: signal is true;
	signal II500_1: std_logic; attribute dont_touch of II500_1: signal is true;
	signal II500_2: std_logic; attribute dont_touch of II500_2: signal is true;
	signal II504_1: std_logic; attribute dont_touch of II504_1: signal is true;
	signal II504_2: std_logic; attribute dont_touch of II504_2: signal is true;
	signal II508_1: std_logic; attribute dont_touch of II508_1: signal is true;
	signal II508_2: std_logic; attribute dont_touch of II508_2: signal is true;
	signal II512_1: std_logic; attribute dont_touch of II512_1: signal is true;
	signal II512_2: std_logic; attribute dont_touch of II512_2: signal is true;
	signal P_1: std_logic; attribute dont_touch of P_1: signal is true;
	signal P_2: std_logic; attribute dont_touch of P_2: signal is true;
	signal P_3: std_logic; attribute dont_touch of P_3: signal is true;
	signal P_4: std_logic; attribute dont_touch of P_4: signal is true;
	signal P_5: std_logic; attribute dont_touch of P_5: signal is true;
	signal P_6: std_logic; attribute dont_touch of P_6: signal is true;
	signal P_7: std_logic; attribute dont_touch of P_7: signal is true;
	signal P_8: std_logic; attribute dont_touch of P_8: signal is true;
	signal Y_1: std_logic; attribute dont_touch of Y_1: signal is true;
	signal Y_2: std_logic; attribute dont_touch of Y_2: signal is true;
	signal Y_3: std_logic; attribute dont_touch of Y_3: signal is true;
	signal Y_4: std_logic; attribute dont_touch of Y_4: signal is true;
	signal Y_5: std_logic; attribute dont_touch of Y_5: signal is true;
	signal Y_6: std_logic; attribute dont_touch of Y_6: signal is true;
	signal Y_7: std_logic; attribute dont_touch of Y_7: signal is true;
	signal Y_8: std_logic; attribute dont_touch of Y_8: signal is true;
begin
	process(CLK)
	begin
		if(rising_edge(CLK)) then
			Y_1<=II6;
			Y_2<=II5;
			Y_3<=II4;
			Y_4<=II3;
			Y_5<=II158;
			Y_6<=II157;
			Y_7<=II156;
			Y_8<=II155;
		end if;
	end process;
	II3<= not II46;
	II4<= not II47;
	II6<= not II104;
	II40<= not X;
	II41<= not Y_4;
	II42<= not Y_3;
	II43<= not Y_2;
	II44<= not Y_1;
	II50<= not II92;
	II155<= not II198;
	II156<= not II199;
	II158<= not II256;
	II192<= not II1_1;
	II193<= not Y_8;
	II194<= not Y_7;
	II195<= not Y_6;
	II196<= not Y_5;
	II202<= not II244;
	II307_1<= not II341;
	II309<= not Y_1;
	II310<= not Y_2;
	II311<= not Y_3;
	II318<= not II341;
	II368<= not Y_4;
	II369<= not Y_5;
	II370<= not Y_6;
	II371<= not Y_7;
	II372<= not Y_8;
	II487<= not II488;
	II489<= not II490;
	P_1<= not II314;
	P_3<= not II316;
	P_4<= not II317;
	P_6<= not II374;
	Z<= not II446;
	II127_1<=II41 and Y_3 and II109;
	II127_2<=II96 and II113 and Y_4;
	II131_1<=II113 and II92 and Y_3;
	II131_2<=II42 and II109;
	II279_1<=II193 and Y_7 and II261;
	II279_2<=II248 and II265 and Y_8;
	II283_1<=II265 and II244 and Y_7;
	II283_2<=II194 and II261;
	II497_1<=P_8 and C_8;
	II500_1<=P_5 and C_5;
	II500_2<=P_2 and C_2;
	II504_1<=P_3 and C_3;
	II504_2<=P_4 and C_4;
	II508_1<=X and C_0;
	II508_2<=P_1 and C_1;
	II512_1<=P_6 and C_6;
	II512_2<=P_7 and C_7;
	II5<= not (II135_1 and II135_2);
	II92<= not (Y_2 and Y_1);
	II96<= not (Y_3 and II50);
	II100<= not (Y_1 and II113);
	II104<= not (II44 and II113);
	II157<= not (II287_1 and II287_2);
	II244<= not (Y_6 and Y_5);
	II248<= not (Y_7 and II202);
	II252<= not (Y_5 and II265);
	II256<= not (II196 and II265);
	II314<= not (X and Y_1);
	II316<= not (Y_3 and II347);
	II317<= not (Y_4 and II318);
	II341<= not (II311 and II347);
	II350<= not (X and II309);
	II374<= not (Y_6 and II406);
	II378<= not (II406 and II370);
	II409<= not (II368 and II307_1);
	II495<= not (II484 and II494);
	II135_1<=II43 or II104;
	II135_2<=Y_2 or II100;
	II287_1<=II195 or II256;
	II287_2<=Y_6 or II252;
	II1_1<= not (II41 or II96);
	II46<= not (II127_1 or II127_2);
	II47<= not (II131_1 or II131_2);
	II109<= not (II43 or II100);
	II113<= not (CLEAR or II40);
	II198<= not (II279_1 or II279_2);
	II199<= not (II283_1 or II283_2);
	II261<= not (II195 or II252);
	II265<= not (CLEAR or II192);
	II347<= not (Y_2 or II350);
	II406<= not (II409 or Y_5);
	II446<= not (II495 or II487 or II497_1);
	II484<= not (II500_1 or II500_2);
	II488<= not (II504_1 or II504_2);
	II490<= not (II508_1 or II508_2);
	II494<= not (II512_1 or II512_2 or II489);
	P_2<= not (II310 or II350);
	P_5<= not (II369 or II409);
	P_7<= not (II371 or II378);
	P_8<= not (Y_7 or II378 or II372);
	W<= not (II193 or II248);
end RTL;
