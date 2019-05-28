-- File created by Bench2VHDL
-- Name: s420
-- File: bench/s420.bench
-- Timestamp: 2019-05-21T22:08:28.919754
--
-- Original File
-- =============
--	#s420
--	# 19 inputs
--	# 2 outputs
--	# 16 D-type flipflops
--	# 74 inverters
--	# 122 gates (28 ANDs + 46 NANDs + 9 ORs + 39 NORs)
--	
--	INPUT(X)
--	INPUT(Clear)
--	INPUT(C_16)
--	INPUT(C_15)
--	INPUT(C_14)
--	INPUT(C_13)
--	INPUT(C_12)
--	INPUT(C_11)
--	INPUT(C_10)
--	INPUT(C_9)
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
--	Y_12 = DFF(II307)
--	Y_11 = DFF(II308)
--	Y_10 = DFF(II309)
--	Y_9 = DFF(II310)
--	Y_16 = DFF(II459)
--	Y_15 = DFF(II460)
--	Y_14 = DFF(II461)
--	Y_13 = DFF(II462)
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
--	II310 = NOT(II408)
--	II354 = NOT(II396)
--	II344 = NOT(II1_2)
--	II345 = NOT(Y_12)
--	II346 = NOT(Y_11)
--	II347 = NOT(Y_10)
--	II348 = NOT(Y_9)
--	II307 = NOT(II350)
--	II308 = NOT(II351)
--	II462 = NOT(II560)
--	II506 = NOT(II548)
--	II496 = NOT(II1_3)
--	II497 = NOT(Y_16)
--	II498 = NOT(Y_15)
--	II499 = NOT(Y_14)
--	II500 = NOT(Y_13)
--	II459 = NOT(II502)
--	II460 = NOT(II503)
--	II611_1 = NOT(II645)
--	II622 = NOT(II645)
--	II613 = NOT(Y_1)
--	II614 = NOT(Y_2)
--	II615 = NOT(Y_3)
--	P_1 = NOT(II618)
--	P_3 = NOT(II620)
--	P_4 = NOT(II621)
--	II611_2 = NOT(II708)
--	II682 = NOT(II708)
--	II672 = NOT(Y_4)
--	II673 = NOT(Y_5)
--	II674 = NOT(Y_6)
--	II675 = NOT(Y_7)
--	P_7 = NOT(II680)
--	P_8 = NOT(II681)
--	II721 = NOT(II720)
--	II611_3 = NOT(II776)
--	II750 = NOT(II776)
--	II740 = NOT(Y_8)
--	II741 = NOT(Y_9)
--	II742 = NOT(Y_10)
--	II743 = NOT(Y_11)
--	P_11 = NOT(II748)
--	P_12 = NOT(II749)
--	II789 = NOT(II788)
--	II808 = NOT(Y_12)
--	II809 = NOT(Y_13)
--	II810 = NOT(Y_14)
--	II811 = NOT(Y_15)
--	II812 = NOT(Y_16)
--	P_14 = NOT(II814)
--	II884 = NOT(X)
--	II901 = NOT(C_0)
--	Z = NOT(II902)
--	II982 = NOT(II981)
--	II990 = NOT(II989)
--	II991 = NOT(II992)
--	
--	II127_1 = AND(II41, Y_3, II109)
--	II127_2 = AND(II96, II113, Y_4)
--	II131_1 = AND(II113, II92, Y_3)
--	II131_2 = AND(II42, II109)
--	II279_1 = AND(II193, Y_7, II261)
--	II279_2 = AND(II248, II265, Y_8)
--	II283_1 = AND(II265, II244, Y_7)
--	II283_2 = AND(II194, II261)
--	II431_1 = AND(II345, Y_11, II413)
--	II431_2 = AND(II400, II417, Y_12)
--	II435_1 = AND(II417, II396, Y_11)
--	II435_2 = AND(II346, II413)
--	II583_1 = AND(II497, Y_15, II565)
--	II583_2 = AND(II552, II569, Y_16)
--	II587_1 = AND(II569, II548, Y_15)
--	II587_2 = AND(II498, II565)
--	II1001_1 = AND(P_9, C_9)
--	II1008_1 = AND(P_3, C_3)
--	II1008_2 = AND(P_12, C_12)
--	II1012_1 = AND(P_15, C_15)
--	II1012_2 = AND(P_16, C_16)
--	II1019_1 = AND(P_7, C_7)
--	II1019_2 = AND(P_6, C_6)
--	II1023_1 = AND(P_8, C_8)
--	II1023_2 = AND(P_4, C_4)
--	II1028_1 = AND(P_5, C_5)
--	II1032_1 = AND(P_2, C_2)
--	II1032_2 = AND(P_1, C_1)
--	
--	II135_1 = OR(II43, II104)
--	II135_2 = OR(Y_2, II100)
--	II287_1 = OR(II195, II256)
--	II287_2 = OR(Y_6, II252)
--	II439_1 = OR(II347, II408)
--	II439_2 = OR(Y_10, II404)
--	II591_1 = OR(II499, II560)
--	II591_2 = OR(Y_14, II556)
--	II1016_1 = OR(II884, II901)
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
--	II309 = NAND(II439_1, II439_2)
--	II396 = NAND(Y_10, Y_9)
--	II400 = NAND(Y_11, II354)
--	II404 = NAND(Y_9, II417)
--	II408 = NAND(II348, II417)
--	II461 = NAND(II591_1, II591_2)
--	II548 = NAND(Y_14, Y_13)
--	II552 = NAND(Y_15, II506)
--	II556 = NAND(Y_13, II569)
--	II560 = NAND(II500, II569)
--	II618 = NAND(X, Y_1)
--	II620 = NAND(Y_3, II651)
--	II621 = NAND(Y_4, II622)
--	II645 = NAND(II615, II651)
--	II654 = NAND(X, II613)
--	II680 = NAND(Y_7, II713)
--	II681 = NAND(Y_8, II682)
--	II708 = NAND(II675, II713)
--	II716 = NAND(II673, II721)
--	II720 = NAND(II611_1, II672)
--	II748 = NAND(Y_11, II781)
--	II749 = NAND(Y_12, II750)
--	II776 = NAND(II743, II781)
--	II784 = NAND(II741, II789)
--	II788 = NAND(II611_2, II740)
--	II814 = NAND(Y_14, II846)
--	II818 = NAND(II846, II810)
--	II849 = NAND(II808, II611_3)
--	II945 = NAND(P_10, C_10)
--	II949 = NAND(P_11, C_11)
--	II957 = NAND(P_13, C_13)
--	II961 = NAND(P_14, C_14)
--	II975 = NAND(II1016_1, II972)
--	II981 = NAND(II978, II980)
--	II989 = NAND(II982, II949, II974, II957)
--	II997 = NAND(II990, II984, II945, II961)
--	
--	II1_1 = NOR(II41, II96)
--	II46 = NOR(II127_1, II127_2)
--	II47 = NOR(II131_1, II131_2)
--	II109 = NOR(II43, II100)
--	II113 = NOR(Clear, II40)
--	II1_2 = NOR(II193, II248)
--	II198 = NOR(II279_1, II279_2)
--	II199 = NOR(II283_1, II283_2)
--	II261 = NOR(II195, II252)
--	II265 = NOR(Clear, II192)
--	II1_3 = NOR(II345, II400)
--	II350 = NOR(II431_1, II431_2)
--	II351 = NOR(II435_1, II435_2)
--	II413 = NOR(II347, II404)
--	II417 = NOR(Clear, II344)
--	W = NOR(II497, II552)
--	II502 = NOR(II583_1, II583_2)
--	II503 = NOR(II587_1, II587_2)
--	II565 = NOR(II499, II556)
--	II569 = NOR(Clear, II496)
--	P_2 = NOR(II614, II654)
--	II651 = NOR(Y_2, II654)
--	P_5 = NOR(II673, II720)
--	P_6 = NOR(II674, II716)
--	II713 = NOR(Y_6, II716)
--	P_9 = NOR(II741, II788)
--	P_10 = NOR(II742, II784)
--	II781 = NOR(Y_10, II784)
--	P_13 = NOR(II809, II849)
--	P_15 = NOR(II811, II818)
--	P_16 = NOR(Y_15, II818, II812)
--	II846 = NOR(II849, Y_13)
--	II902 = NOR(II997, II991, II1001_1)
--	II972 = NOR(II1008_1, II1008_2)
--	II974 = NOR(II1012_1, II1012_2)
--	II978 = NOR(II1019_1, II1019_2)
--	II980 = NOR(II1023_1, II1023_2)
--	II984 = NOR(II975, II1028_1)
--	II992 = NOR(II1032_1, II1032_2)
--
-- VHDL Output
-- =============
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity s420 is
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
		C_9: in std_logic;
		C_10: in std_logic;
		C_11: in std_logic;
		C_12: in std_logic;
		C_13: in std_logic;
		C_14: in std_logic;
		C_15: in std_logic;
		C_16: in std_logic;
		X: in std_logic;
		W: out std_logic;
		Z: out std_logic
	);
end entity;

architecture RTL of s420 is
	attribute dont_touch: boolean;

	signal II1_1: std_logic; attribute dont_touch of II1_1: signal is true;
	signal II1_2: std_logic; attribute dont_touch of II1_2: signal is true;
	signal II1_3: std_logic; attribute dont_touch of II1_3: signal is true;
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
	signal II307: std_logic; attribute dont_touch of II307: signal is true;
	signal II308: std_logic; attribute dont_touch of II308: signal is true;
	signal II309: std_logic; attribute dont_touch of II309: signal is true;
	signal II310: std_logic; attribute dont_touch of II310: signal is true;
	signal II344: std_logic; attribute dont_touch of II344: signal is true;
	signal II345: std_logic; attribute dont_touch of II345: signal is true;
	signal II346: std_logic; attribute dont_touch of II346: signal is true;
	signal II347: std_logic; attribute dont_touch of II347: signal is true;
	signal II348: std_logic; attribute dont_touch of II348: signal is true;
	signal II350: std_logic; attribute dont_touch of II350: signal is true;
	signal II351: std_logic; attribute dont_touch of II351: signal is true;
	signal II354: std_logic; attribute dont_touch of II354: signal is true;
	signal II396: std_logic; attribute dont_touch of II396: signal is true;
	signal II400: std_logic; attribute dont_touch of II400: signal is true;
	signal II404: std_logic; attribute dont_touch of II404: signal is true;
	signal II408: std_logic; attribute dont_touch of II408: signal is true;
	signal II413: std_logic; attribute dont_touch of II413: signal is true;
	signal II417: std_logic; attribute dont_touch of II417: signal is true;
	signal II431_1: std_logic; attribute dont_touch of II431_1: signal is true;
	signal II431_2: std_logic; attribute dont_touch of II431_2: signal is true;
	signal II435_1: std_logic; attribute dont_touch of II435_1: signal is true;
	signal II435_2: std_logic; attribute dont_touch of II435_2: signal is true;
	signal II439_1: std_logic; attribute dont_touch of II439_1: signal is true;
	signal II439_2: std_logic; attribute dont_touch of II439_2: signal is true;
	signal II459: std_logic; attribute dont_touch of II459: signal is true;
	signal II460: std_logic; attribute dont_touch of II460: signal is true;
	signal II461: std_logic; attribute dont_touch of II461: signal is true;
	signal II462: std_logic; attribute dont_touch of II462: signal is true;
	signal II496: std_logic; attribute dont_touch of II496: signal is true;
	signal II497: std_logic; attribute dont_touch of II497: signal is true;
	signal II498: std_logic; attribute dont_touch of II498: signal is true;
	signal II499: std_logic; attribute dont_touch of II499: signal is true;
	signal II500: std_logic; attribute dont_touch of II500: signal is true;
	signal II502: std_logic; attribute dont_touch of II502: signal is true;
	signal II503: std_logic; attribute dont_touch of II503: signal is true;
	signal II506: std_logic; attribute dont_touch of II506: signal is true;
	signal II548: std_logic; attribute dont_touch of II548: signal is true;
	signal II552: std_logic; attribute dont_touch of II552: signal is true;
	signal II556: std_logic; attribute dont_touch of II556: signal is true;
	signal II560: std_logic; attribute dont_touch of II560: signal is true;
	signal II565: std_logic; attribute dont_touch of II565: signal is true;
	signal II569: std_logic; attribute dont_touch of II569: signal is true;
	signal II583_1: std_logic; attribute dont_touch of II583_1: signal is true;
	signal II583_2: std_logic; attribute dont_touch of II583_2: signal is true;
	signal II587_1: std_logic; attribute dont_touch of II587_1: signal is true;
	signal II587_2: std_logic; attribute dont_touch of II587_2: signal is true;
	signal II591_1: std_logic; attribute dont_touch of II591_1: signal is true;
	signal II591_2: std_logic; attribute dont_touch of II591_2: signal is true;
	signal II611_1: std_logic; attribute dont_touch of II611_1: signal is true;
	signal II611_2: std_logic; attribute dont_touch of II611_2: signal is true;
	signal II611_3: std_logic; attribute dont_touch of II611_3: signal is true;
	signal II613: std_logic; attribute dont_touch of II613: signal is true;
	signal II614: std_logic; attribute dont_touch of II614: signal is true;
	signal II615: std_logic; attribute dont_touch of II615: signal is true;
	signal II618: std_logic; attribute dont_touch of II618: signal is true;
	signal II620: std_logic; attribute dont_touch of II620: signal is true;
	signal II621: std_logic; attribute dont_touch of II621: signal is true;
	signal II622: std_logic; attribute dont_touch of II622: signal is true;
	signal II645: std_logic; attribute dont_touch of II645: signal is true;
	signal II651: std_logic; attribute dont_touch of II651: signal is true;
	signal II654: std_logic; attribute dont_touch of II654: signal is true;
	signal II672: std_logic; attribute dont_touch of II672: signal is true;
	signal II673: std_logic; attribute dont_touch of II673: signal is true;
	signal II674: std_logic; attribute dont_touch of II674: signal is true;
	signal II675: std_logic; attribute dont_touch of II675: signal is true;
	signal II680: std_logic; attribute dont_touch of II680: signal is true;
	signal II681: std_logic; attribute dont_touch of II681: signal is true;
	signal II682: std_logic; attribute dont_touch of II682: signal is true;
	signal II708: std_logic; attribute dont_touch of II708: signal is true;
	signal II713: std_logic; attribute dont_touch of II713: signal is true;
	signal II716: std_logic; attribute dont_touch of II716: signal is true;
	signal II720: std_logic; attribute dont_touch of II720: signal is true;
	signal II721: std_logic; attribute dont_touch of II721: signal is true;
	signal II740: std_logic; attribute dont_touch of II740: signal is true;
	signal II741: std_logic; attribute dont_touch of II741: signal is true;
	signal II742: std_logic; attribute dont_touch of II742: signal is true;
	signal II743: std_logic; attribute dont_touch of II743: signal is true;
	signal II748: std_logic; attribute dont_touch of II748: signal is true;
	signal II749: std_logic; attribute dont_touch of II749: signal is true;
	signal II750: std_logic; attribute dont_touch of II750: signal is true;
	signal II776: std_logic; attribute dont_touch of II776: signal is true;
	signal II781: std_logic; attribute dont_touch of II781: signal is true;
	signal II784: std_logic; attribute dont_touch of II784: signal is true;
	signal II788: std_logic; attribute dont_touch of II788: signal is true;
	signal II789: std_logic; attribute dont_touch of II789: signal is true;
	signal II808: std_logic; attribute dont_touch of II808: signal is true;
	signal II809: std_logic; attribute dont_touch of II809: signal is true;
	signal II810: std_logic; attribute dont_touch of II810: signal is true;
	signal II811: std_logic; attribute dont_touch of II811: signal is true;
	signal II812: std_logic; attribute dont_touch of II812: signal is true;
	signal II814: std_logic; attribute dont_touch of II814: signal is true;
	signal II818: std_logic; attribute dont_touch of II818: signal is true;
	signal II846: std_logic; attribute dont_touch of II846: signal is true;
	signal II849: std_logic; attribute dont_touch of II849: signal is true;
	signal II884: std_logic; attribute dont_touch of II884: signal is true;
	signal II901: std_logic; attribute dont_touch of II901: signal is true;
	signal II902: std_logic; attribute dont_touch of II902: signal is true;
	signal II945: std_logic; attribute dont_touch of II945: signal is true;
	signal II949: std_logic; attribute dont_touch of II949: signal is true;
	signal II957: std_logic; attribute dont_touch of II957: signal is true;
	signal II961: std_logic; attribute dont_touch of II961: signal is true;
	signal II972: std_logic; attribute dont_touch of II972: signal is true;
	signal II974: std_logic; attribute dont_touch of II974: signal is true;
	signal II975: std_logic; attribute dont_touch of II975: signal is true;
	signal II978: std_logic; attribute dont_touch of II978: signal is true;
	signal II980: std_logic; attribute dont_touch of II980: signal is true;
	signal II981: std_logic; attribute dont_touch of II981: signal is true;
	signal II982: std_logic; attribute dont_touch of II982: signal is true;
	signal II984: std_logic; attribute dont_touch of II984: signal is true;
	signal II989: std_logic; attribute dont_touch of II989: signal is true;
	signal II990: std_logic; attribute dont_touch of II990: signal is true;
	signal II991: std_logic; attribute dont_touch of II991: signal is true;
	signal II992: std_logic; attribute dont_touch of II992: signal is true;
	signal II997: std_logic; attribute dont_touch of II997: signal is true;
	signal II1001_1: std_logic; attribute dont_touch of II1001_1: signal is true;
	signal II1008_1: std_logic; attribute dont_touch of II1008_1: signal is true;
	signal II1008_2: std_logic; attribute dont_touch of II1008_2: signal is true;
	signal II1012_1: std_logic; attribute dont_touch of II1012_1: signal is true;
	signal II1012_2: std_logic; attribute dont_touch of II1012_2: signal is true;
	signal II1016_1: std_logic; attribute dont_touch of II1016_1: signal is true;
	signal II1019_1: std_logic; attribute dont_touch of II1019_1: signal is true;
	signal II1019_2: std_logic; attribute dont_touch of II1019_2: signal is true;
	signal II1023_1: std_logic; attribute dont_touch of II1023_1: signal is true;
	signal II1023_2: std_logic; attribute dont_touch of II1023_2: signal is true;
	signal II1028_1: std_logic; attribute dont_touch of II1028_1: signal is true;
	signal II1032_1: std_logic; attribute dont_touch of II1032_1: signal is true;
	signal II1032_2: std_logic; attribute dont_touch of II1032_2: signal is true;
	signal P_1: std_logic; attribute dont_touch of P_1: signal is true;
	signal P_2: std_logic; attribute dont_touch of P_2: signal is true;
	signal P_3: std_logic; attribute dont_touch of P_3: signal is true;
	signal P_4: std_logic; attribute dont_touch of P_4: signal is true;
	signal P_5: std_logic; attribute dont_touch of P_5: signal is true;
	signal P_6: std_logic; attribute dont_touch of P_6: signal is true;
	signal P_7: std_logic; attribute dont_touch of P_7: signal is true;
	signal P_8: std_logic; attribute dont_touch of P_8: signal is true;
	signal P_9: std_logic; attribute dont_touch of P_9: signal is true;
	signal P_10: std_logic; attribute dont_touch of P_10: signal is true;
	signal P_11: std_logic; attribute dont_touch of P_11: signal is true;
	signal P_12: std_logic; attribute dont_touch of P_12: signal is true;
	signal P_13: std_logic; attribute dont_touch of P_13: signal is true;
	signal P_14: std_logic; attribute dont_touch of P_14: signal is true;
	signal P_15: std_logic; attribute dont_touch of P_15: signal is true;
	signal P_16: std_logic; attribute dont_touch of P_16: signal is true;
	signal Y_1: std_logic; attribute dont_touch of Y_1: signal is true;
	signal Y_2: std_logic; attribute dont_touch of Y_2: signal is true;
	signal Y_3: std_logic; attribute dont_touch of Y_3: signal is true;
	signal Y_4: std_logic; attribute dont_touch of Y_4: signal is true;
	signal Y_5: std_logic; attribute dont_touch of Y_5: signal is true;
	signal Y_6: std_logic; attribute dont_touch of Y_6: signal is true;
	signal Y_7: std_logic; attribute dont_touch of Y_7: signal is true;
	signal Y_8: std_logic; attribute dont_touch of Y_8: signal is true;
	signal Y_9: std_logic; attribute dont_touch of Y_9: signal is true;
	signal Y_10: std_logic; attribute dont_touch of Y_10: signal is true;
	signal Y_11: std_logic; attribute dont_touch of Y_11: signal is true;
	signal Y_12: std_logic; attribute dont_touch of Y_12: signal is true;
	signal Y_13: std_logic; attribute dont_touch of Y_13: signal is true;
	signal Y_14: std_logic; attribute dont_touch of Y_14: signal is true;
	signal Y_15: std_logic; attribute dont_touch of Y_15: signal is true;
	signal Y_16: std_logic; attribute dont_touch of Y_16: signal is true;
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
			Y_9<=II310;
			Y_10<=II309;
			Y_11<=II308;
			Y_12<=II307;
			Y_13<=II462;
			Y_14<=II461;
			Y_15<=II460;
			Y_16<=II459;
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
	II307<= not II350;
	II308<= not II351;
	II310<= not II408;
	II344<= not II1_2;
	II345<= not Y_12;
	II346<= not Y_11;
	II347<= not Y_10;
	II348<= not Y_9;
	II354<= not II396;
	II459<= not II502;
	II460<= not II503;
	II462<= not II560;
	II496<= not II1_3;
	II497<= not Y_16;
	II498<= not Y_15;
	II499<= not Y_14;
	II500<= not Y_13;
	II506<= not II548;
	II611_1<= not II645;
	II611_2<= not II708;
	II611_3<= not II776;
	II613<= not Y_1;
	II614<= not Y_2;
	II615<= not Y_3;
	II622<= not II645;
	II672<= not Y_4;
	II673<= not Y_5;
	II674<= not Y_6;
	II675<= not Y_7;
	II682<= not II708;
	II721<= not II720;
	II740<= not Y_8;
	II741<= not Y_9;
	II742<= not Y_10;
	II743<= not Y_11;
	II750<= not II776;
	II789<= not II788;
	II808<= not Y_12;
	II809<= not Y_13;
	II810<= not Y_14;
	II811<= not Y_15;
	II812<= not Y_16;
	II884<= not X;
	II901<= not C_0;
	II982<= not II981;
	II990<= not II989;
	II991<= not II992;
	P_1<= not II618;
	P_3<= not II620;
	P_4<= not II621;
	P_7<= not II680;
	P_8<= not II681;
	P_11<= not II748;
	P_12<= not II749;
	P_14<= not II814;
	Z<= not II902;
	II127_1<=II41 and Y_3 and II109;
	II127_2<=II96 and II113 and Y_4;
	II131_1<=II113 and II92 and Y_3;
	II131_2<=II42 and II109;
	II279_1<=II193 and Y_7 and II261;
	II279_2<=II248 and II265 and Y_8;
	II283_1<=II265 and II244 and Y_7;
	II283_2<=II194 and II261;
	II431_1<=II345 and Y_11 and II413;
	II431_2<=II400 and II417 and Y_12;
	II435_1<=II417 and II396 and Y_11;
	II435_2<=II346 and II413;
	II583_1<=II497 and Y_15 and II565;
	II583_2<=II552 and II569 and Y_16;
	II587_1<=II569 and II548 and Y_15;
	II587_2<=II498 and II565;
	II1001_1<=P_9 and C_9;
	II1008_1<=P_3 and C_3;
	II1008_2<=P_12 and C_12;
	II1012_1<=P_15 and C_15;
	II1012_2<=P_16 and C_16;
	II1019_1<=P_7 and C_7;
	II1019_2<=P_6 and C_6;
	II1023_1<=P_8 and C_8;
	II1023_2<=P_4 and C_4;
	II1028_1<=P_5 and C_5;
	II1032_1<=P_2 and C_2;
	II1032_2<=P_1 and C_1;
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
	II309<= not (II439_1 and II439_2);
	II396<= not (Y_10 and Y_9);
	II400<= not (Y_11 and II354);
	II404<= not (Y_9 and II417);
	II408<= not (II348 and II417);
	II461<= not (II591_1 and II591_2);
	II548<= not (Y_14 and Y_13);
	II552<= not (Y_15 and II506);
	II556<= not (Y_13 and II569);
	II560<= not (II500 and II569);
	II618<= not (X and Y_1);
	II620<= not (Y_3 and II651);
	II621<= not (Y_4 and II622);
	II645<= not (II615 and II651);
	II654<= not (X and II613);
	II680<= not (Y_7 and II713);
	II681<= not (Y_8 and II682);
	II708<= not (II675 and II713);
	II716<= not (II673 and II721);
	II720<= not (II611_1 and II672);
	II748<= not (Y_11 and II781);
	II749<= not (Y_12 and II750);
	II776<= not (II743 and II781);
	II784<= not (II741 and II789);
	II788<= not (II611_2 and II740);
	II814<= not (Y_14 and II846);
	II818<= not (II846 and II810);
	II849<= not (II808 and II611_3);
	II945<= not (P_10 and C_10);
	II949<= not (P_11 and C_11);
	II957<= not (P_13 and C_13);
	II961<= not (P_14 and C_14);
	II975<= not (II1016_1 and II972);
	II981<= not (II978 and II980);
	II989<= not (II982 and II949 and II974 and II957);
	II997<= not (II990 and II984 and II945 and II961);
	II135_1<=II43 or II104;
	II135_2<=Y_2 or II100;
	II287_1<=II195 or II256;
	II287_2<=Y_6 or II252;
	II439_1<=II347 or II408;
	II439_2<=Y_10 or II404;
	II591_1<=II499 or II560;
	II591_2<=Y_14 or II556;
	II1016_1<=II884 or II901;
	II1_1<= not (II41 or II96);
	II1_2<= not (II193 or II248);
	II1_3<= not (II345 or II400);
	II46<= not (II127_1 or II127_2);
	II47<= not (II131_1 or II131_2);
	II109<= not (II43 or II100);
	II113<= not (CLEAR or II40);
	II198<= not (II279_1 or II279_2);
	II199<= not (II283_1 or II283_2);
	II261<= not (II195 or II252);
	II265<= not (CLEAR or II192);
	II350<= not (II431_1 or II431_2);
	II351<= not (II435_1 or II435_2);
	II413<= not (II347 or II404);
	II417<= not (CLEAR or II344);
	II502<= not (II583_1 or II583_2);
	II503<= not (II587_1 or II587_2);
	II565<= not (II499 or II556);
	II569<= not (CLEAR or II496);
	II651<= not (Y_2 or II654);
	II713<= not (Y_6 or II716);
	II781<= not (Y_10 or II784);
	II846<= not (II849 or Y_13);
	II902<= not (II997 or II991 or II1001_1);
	II972<= not (II1008_1 or II1008_2);
	II974<= not (II1012_1 or II1012_2);
	II978<= not (II1019_1 or II1019_2);
	II980<= not (II1023_1 or II1023_2);
	II984<= not (II975 or II1028_1);
	II992<= not (II1032_1 or II1032_2);
	P_2<= not (II614 or II654);
	P_5<= not (II673 or II720);
	P_6<= not (II674 or II716);
	P_9<= not (II741 or II788);
	P_10<= not (II742 or II784);
	P_13<= not (II809 or II849);
	P_15<= not (II811 or II818);
	P_16<= not (Y_15 or II818 or II812);
	W<= not (II497 or II552);
end RTL;
