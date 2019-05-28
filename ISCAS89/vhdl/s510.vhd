-- File created by Bench2VHDL
-- Name: s510
-- File: bench/s510.bench
-- Timestamp: 2019-05-21T22:08:29.052126
--
-- Original File
-- =============
--	# s510
--	# 19 inputs
--	# 7 outputs
--	# 6 D-type flipflops
--	# 32 inverters
--	# 179 gates (34 ANDs + 61 NANDs + 29 ORs + 55 NORs)
--	
--	INPUT(john)
--	INPUT(cnt13)
--	INPUT(cnt21)
--	INPUT(cnt284)
--	INPUT(pcnt6)
--	INPUT(cnt261)
--	INPUT(cnt44)
--	INPUT(pcnt12)
--	INPUT(pcnt17)
--	INPUT(cnt591)
--	INPUT(cnt45)
--	INPUT(cnt567)
--	INPUT(pcnt27)
--	INPUT(cnt283)
--	INPUT(cnt272)
--	INPUT(cnt10)
--	INPUT(cnt511)
--	INPUT(pcnt241)
--	INPUT(cnt509)
--	
--	OUTPUT(csm)
--	OUTPUT(pclr)
--	OUTPUT(pc)
--	OUTPUT(cclr)
--	OUTPUT(vsync)
--	OUTPUT(cblank)
--	OUTPUT(csync)
--	
--	st_5 = DFF(I2)
--	st_4 = DFF(I3)
--	st_3 = DFF(I4)
--	st_2 = DFF(I5)
--	st_1 = DFF(I6)
--	st_0 = DFF(I7)
--	
--	I68 = NOT(cnt44)
--	I67 = NOT(cnt261)
--	I78 = NOT(cnt511)
--	I73 = NOT(cnt567)
--	I61 = NOT(st_0)
--	I60 = NOT(st_1)
--	I59 = NOT(st_2)
--	I58 = NOT(st_3)
--	I57 = NOT(st_4)
--	I56 = NOT(st_5)
--	I69 = NOT(pcnt12)
--	I70 = NOT(pcnt17)
--	I554 = NOT(I555)
--	I591 = NOT(I590)
--	I594 = NOT(I595)
--	I546 = NOT(I547)
--	I667 = NOT(I666)
--	I475 = NOT(I474)
--	I798 = NOT(I799)
--	I495 = NOT(I494)
--	I467 = NOT(I466)
--	I462 = NOT(I463)
--	I130 = NOT(I131)
--	I567 = NOT(I566)
--	I483 = NOT(I482)
--	I530 = NOT(I531)
--	I486 = NOT(I487)
--	I607 = NOT(I606)
--	I778 = NOT(I779)
--	I347 = NOT(I346)
--	I204 = NOT(I205)
--	I216 = NOT(I217)
--	
--	I936_2 = AND(cnt272, st_2)
--	I946_1 = AND(cnt10, st_5)
--	I946_2 = AND(john, st_4)
--	I936_1 = AND(cnt591, I59)
--	I1089_1 = AND(I59, I555)
--	I1044_1 = AND(I70, cnt284)
--	I943_1 = AND(I578, st_3)
--	I1102_2 = AND(I56, I675)
--	I1059_1 = AND(st_5, I671)
--	I1071_1 = AND(I551, I671)
--	I1106_1 = AND(I60, I551)
--	I1123_1 = AND(I551, I663)
--	I967_1 = AND(I498, I57)
--	I1055_1 = AND(I570, st_0, st_2)
--	I1062_1 = AND(I535, I598)
--	I1120_1 = AND(I795, I618)
--	I1116_1 = AND(I95, I603)
--	I950_2 = AND(I463, cnt283)
--	I950_1 = AND(I455, cnt45)
--	I1102_1 = AND(st_5, I455)
--	I954_2 = AND(cnt45, I587, I104)
--	I1081_1 = AND(I543, I490, I58)
--	I1106_2 = AND(I57, I543)
--	I940_1 = AND(I495, I60)
--	I1077_1 = AND(I104, I539)
--	I988_1 = AND(I694, I698)
--	I1085_1 = AND(I787, I130)
--	I954_1 = AND(st_5, cnt509, I567)
--	I1081_2 = AND(st_2, I483)
--	I1116_2 = AND(I61, I230)
--	I1065_1 = AND(I475, I232)
--	I1113_1 = AND(st_4, I234)
--	I1055_2 = AND(I58, I204)
--	I1085_2 = AND(I61, I216)
--	
--	I1038_1 = OR(cnt21, st_0)
--	I985_1 = OR(pcnt27, I73)
--	I914_1 = OR(I60, I61)
--	I1068_1 = OR(st_4, I590)
--	I933_1 = OR(I57, I58)
--	I958_1 = OR(I57, I59)
--	I958_2 = OR(cnt284, I642)
--	I924_2 = OR(I474, I666)
--	I903_2 = OR(I58, I478)
--	I1092_1 = OR(st_4, I478)
--	I917_1 = OR(I458, I494, st_5)
--	I921_1 = OR(I494, I570)
--	I909_1 = OR(I466, I627)
--	I962_2 = OR(I466, I78)
--	I1095_1 = OR(cnt13, I506)
--	I1099_1 = OR(I506, I209)
--	I917_2 = OR(I482, I590)
--	I982_1 = OR(I559, I487)
--	I1074_1 = OR(I475, I546)
--	I1095_2 = OR(I475, I578)
--	I970_1 = OR(I495, I603)
--	I900_1 = OR(I56, I207)
--	I903_1 = OR(I606, I742)
--	I962_1 = OR(I462, I73)
--	I975_1 = OR(I531, I483)
--	I978_1 = OR(I483, I747)
--	I928_1 = OR(st_0, I530)
--	I1110_1 = OR(I61, I530)
--	I924_1 = OR(st_0, I731)
--	
--	I590 = NAND(st_1, st_2)
--	I458 = NAND(st_3, st_1)
--	I490 = NAND(cnt284, pcnt17)
--	I578 = NAND(I61, st_1)
--	I666 = NAND(I61, st_3)
--	I658 = NAND(st_2, I58)
--	I814 = NAND(I58, cnt21, I595)
--	I574 = NAND(st_3, I57)
--	I498 = NAND(I511, I587)
--	I638 = NAND(I511, st_0)
--	I642 = NAND(I739, st_2)
--	I474 = NAND(I56, I57)
--	I570 = NAND(I458, I56)
--	I598 = NAND(cnt13, I56)
--	I742 = NAND(I56, st_0)
--	I618 = NAND(I69, cnt44)
--	I478 = NAND(I547, I739)
--	I494 = NAND(I57, I547)
--	I774 = NAND(st_5, I547, I458)
--	I466 = NAND(st_3, I535)
--	I506 = NAND(I535, I58)
--	I566 = NAND(I663, st_2)
--	I104 = NAND(I933_1, I56)
--	I482 = NAND(I58, I551)
--	I390 = NAND(st_0, I583)
--	I834 = NAND(I1068_1, I642)
--	I698 = NAND(I563, I59)
--	I694 = NAND(I795, I57)
--	I274 = NAND(I56, I667)
--	I606 = NAND(I95, I57)
--	I346 = NAND(I985_1, I463)
--	I810 = NAND(pcnt6, cnt284, I455)
--	I782 = NAND(I67, I559, I675)
--	I230 = NAND(I958_1, I958_2)
--	I870 = NAND(I1092_1, I566)
--	I298 = NAND(I539, I574)
--	I710 = NAND(I467, cnt10)
--	I714 = NAND(I1038_1, I567)
--	pclr = NAND(I917_1, I917_2)
--	I326 = NAND(I982_1, I61)
--	pc = NAND(I921_1, I837)
--	I270 = NAND(st_3, I615)
--	I838 = NAND(I1074_1, I530)
--	I872 = NAND(I1095_1, I1095_2, I774)
--	I266 = NAND(I970_1, st_1)
--	I232 = NAND(I962_1, I962_2, I810)
--	cclr = NAND(I486, I877, I546, I390)
--	I234 = NAND(I213, I814, I710, I714)
--	I278 = NAND(I975_1, I60)
--	I282 = NAND(I978_1, st_1)
--	I3 = NAND(I903_1, I903_2, I823)
--	vsync = NAND(I914_1, I855, I867)
--	cblank = NAND(I928_1, I841)
--	I4 = NAND(I278, I274, I270, I266)
--	I884 = NAND(I1110_1, I861, I326)
--	I5 = NAND(I282, I889, I827, I298)
--	csync = NAND(I924_1, I924_2, I881)
--	I6 = NAND(I909_1, I899, I895)
--	I2 = NAND(I900_1, I821)
--	I874 = NAND(I1099_1, I863, I831)
--	I7 = NAND(I778, I782, I887)
--	
--	I555 = NOR(st_0, st_1)
--	I587 = NOR(st_1, st_2)
--	I595 = NOR(st_0, st_2)
--	I511 = NOR(st_3, st_5)
--	I739 = NOR(st_5, st_1)
--	I627 = NOR(pcnt241, I78)
--	I547 = NOR(I61, st_2)
--	I675 = NOR(I61, st_1)
--	I535 = NOR(I590, st_0)
--	I671 = NOR(I458, I59)
--	I663 = NOR(st_1, I58)
--	I551 = NOR(I61, I57)
--	I583 = NOR(I511, I60)
--	I603 = NOR(I61, I56)
--	I799 = NOR(I56, I58, I59)
--	I209 = NOR(I946_1, I946_2)
--	I563 = NOR(I578, I56)
--	I795 = NOR(st_3, st_2, I578)
--	I95 = NOR(I587, I591)
--	I463 = NOR(I458, I594)
--	I131 = NOR(I936_1, I936_2)
--	I455 = NOR(I554, I658)
--	I559 = NOR(I658, I56)
--	I531 = NOR(I574, I59)
--	I787 = NOR(I554, st_5, I574)
--	I487 = NOR(st_4, I498)
--	I543 = NOR(I742, I590)
--	I747 = NOR(I638, I1044_1)
--	I539 = NOR(I546, I60)
--	I207 = NOR(I595, I943_1)
--	I779 = NOR(I95, st_4, I638)
--	I259 = NOR(st_0, I967_1)
--	I837 = NOR(I487, I1071_1)
--	I867 = NOR(I834, I1089_1)
--	I615 = NOR(I475, st_2)
--	I827 = NOR(I531, I1062_1)
--	csm = NOR(I555, I798)
--	I213 = NOR(I950_1, I950_2)
--	I877 = NOR(I1102_1, I1102_2, I551)
--	I823 = NOR(I259, I1059_1)
--	I855 = NOR(I615, st_3)
--	I205 = NOR(I563, I940_1)
--	I841 = NOR(I799, I1077_1)
--	I371 = NOR(I68, I988_1)
--	I731 = NOR(I583, I607)
--	I217 = NOR(I954_1, I954_2)
--	I861 = NOR(I1081_1, I1081_2)
--	I889 = NOR(I1116_1, I1116_2, I870)
--	I881 = NOR(I1106_1, I1106_2, I838)
--	I899 = NOR(I872, I347, I1123_1)
--	I831 = NOR(I371, I1065_1)
--	I895 = NOR(I884, I1120_1)
--	I821 = NOR(I1055_1, I1055_2)
--	I863 = NOR(I1085_1, I1085_2)
--	I887 = NOR(I874, I1113_1)
--
-- VHDL Output
-- =============
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity s510 is
	port (
		CLK: in std_logic;
		CNT10: in std_logic;
		CNT13: in std_logic;
		CNT21: in std_logic;
		CNT44: in std_logic;
		CNT45: in std_logic;
		CNT261: in std_logic;
		CNT272: in std_logic;
		CNT283: in std_logic;
		CNT284: in std_logic;
		CNT509: in std_logic;
		CNT511: in std_logic;
		CNT567: in std_logic;
		CNT591: in std_logic;
		JOHN: in std_logic;
		PCNT6: in std_logic;
		PCNT12: in std_logic;
		PCNT17: in std_logic;
		PCNT27: in std_logic;
		PCNT241: in std_logic;
		CBLANK: out std_logic;
		CCLR: out std_logic;
		CSM: out std_logic;
		CSYNC: out std_logic;
		PC: out std_logic;
		PCLR: out std_logic;
		VSYNC: out std_logic
	);
end entity;

architecture RTL of s510 is
	attribute dont_touch: boolean;

	signal I2: std_logic; attribute dont_touch of I2: signal is true;
	signal I3: std_logic; attribute dont_touch of I3: signal is true;
	signal I4: std_logic; attribute dont_touch of I4: signal is true;
	signal I5: std_logic; attribute dont_touch of I5: signal is true;
	signal I6: std_logic; attribute dont_touch of I6: signal is true;
	signal I7: std_logic; attribute dont_touch of I7: signal is true;
	signal I56: std_logic; attribute dont_touch of I56: signal is true;
	signal I57: std_logic; attribute dont_touch of I57: signal is true;
	signal I58: std_logic; attribute dont_touch of I58: signal is true;
	signal I59: std_logic; attribute dont_touch of I59: signal is true;
	signal I60: std_logic; attribute dont_touch of I60: signal is true;
	signal I61: std_logic; attribute dont_touch of I61: signal is true;
	signal I67: std_logic; attribute dont_touch of I67: signal is true;
	signal I68: std_logic; attribute dont_touch of I68: signal is true;
	signal I69: std_logic; attribute dont_touch of I69: signal is true;
	signal I70: std_logic; attribute dont_touch of I70: signal is true;
	signal I73: std_logic; attribute dont_touch of I73: signal is true;
	signal I78: std_logic; attribute dont_touch of I78: signal is true;
	signal I95: std_logic; attribute dont_touch of I95: signal is true;
	signal I104: std_logic; attribute dont_touch of I104: signal is true;
	signal I130: std_logic; attribute dont_touch of I130: signal is true;
	signal I131: std_logic; attribute dont_touch of I131: signal is true;
	signal I204: std_logic; attribute dont_touch of I204: signal is true;
	signal I205: std_logic; attribute dont_touch of I205: signal is true;
	signal I207: std_logic; attribute dont_touch of I207: signal is true;
	signal I209: std_logic; attribute dont_touch of I209: signal is true;
	signal I213: std_logic; attribute dont_touch of I213: signal is true;
	signal I216: std_logic; attribute dont_touch of I216: signal is true;
	signal I217: std_logic; attribute dont_touch of I217: signal is true;
	signal I230: std_logic; attribute dont_touch of I230: signal is true;
	signal I232: std_logic; attribute dont_touch of I232: signal is true;
	signal I234: std_logic; attribute dont_touch of I234: signal is true;
	signal I259: std_logic; attribute dont_touch of I259: signal is true;
	signal I266: std_logic; attribute dont_touch of I266: signal is true;
	signal I270: std_logic; attribute dont_touch of I270: signal is true;
	signal I274: std_logic; attribute dont_touch of I274: signal is true;
	signal I278: std_logic; attribute dont_touch of I278: signal is true;
	signal I282: std_logic; attribute dont_touch of I282: signal is true;
	signal I298: std_logic; attribute dont_touch of I298: signal is true;
	signal I326: std_logic; attribute dont_touch of I326: signal is true;
	signal I346: std_logic; attribute dont_touch of I346: signal is true;
	signal I347: std_logic; attribute dont_touch of I347: signal is true;
	signal I371: std_logic; attribute dont_touch of I371: signal is true;
	signal I390: std_logic; attribute dont_touch of I390: signal is true;
	signal I455: std_logic; attribute dont_touch of I455: signal is true;
	signal I458: std_logic; attribute dont_touch of I458: signal is true;
	signal I462: std_logic; attribute dont_touch of I462: signal is true;
	signal I463: std_logic; attribute dont_touch of I463: signal is true;
	signal I466: std_logic; attribute dont_touch of I466: signal is true;
	signal I467: std_logic; attribute dont_touch of I467: signal is true;
	signal I474: std_logic; attribute dont_touch of I474: signal is true;
	signal I475: std_logic; attribute dont_touch of I475: signal is true;
	signal I478: std_logic; attribute dont_touch of I478: signal is true;
	signal I482: std_logic; attribute dont_touch of I482: signal is true;
	signal I483: std_logic; attribute dont_touch of I483: signal is true;
	signal I486: std_logic; attribute dont_touch of I486: signal is true;
	signal I487: std_logic; attribute dont_touch of I487: signal is true;
	signal I490: std_logic; attribute dont_touch of I490: signal is true;
	signal I494: std_logic; attribute dont_touch of I494: signal is true;
	signal I495: std_logic; attribute dont_touch of I495: signal is true;
	signal I498: std_logic; attribute dont_touch of I498: signal is true;
	signal I506: std_logic; attribute dont_touch of I506: signal is true;
	signal I511: std_logic; attribute dont_touch of I511: signal is true;
	signal I530: std_logic; attribute dont_touch of I530: signal is true;
	signal I531: std_logic; attribute dont_touch of I531: signal is true;
	signal I535: std_logic; attribute dont_touch of I535: signal is true;
	signal I539: std_logic; attribute dont_touch of I539: signal is true;
	signal I543: std_logic; attribute dont_touch of I543: signal is true;
	signal I546: std_logic; attribute dont_touch of I546: signal is true;
	signal I547: std_logic; attribute dont_touch of I547: signal is true;
	signal I551: std_logic; attribute dont_touch of I551: signal is true;
	signal I554: std_logic; attribute dont_touch of I554: signal is true;
	signal I555: std_logic; attribute dont_touch of I555: signal is true;
	signal I559: std_logic; attribute dont_touch of I559: signal is true;
	signal I563: std_logic; attribute dont_touch of I563: signal is true;
	signal I566: std_logic; attribute dont_touch of I566: signal is true;
	signal I567: std_logic; attribute dont_touch of I567: signal is true;
	signal I570: std_logic; attribute dont_touch of I570: signal is true;
	signal I574: std_logic; attribute dont_touch of I574: signal is true;
	signal I578: std_logic; attribute dont_touch of I578: signal is true;
	signal I583: std_logic; attribute dont_touch of I583: signal is true;
	signal I587: std_logic; attribute dont_touch of I587: signal is true;
	signal I590: std_logic; attribute dont_touch of I590: signal is true;
	signal I591: std_logic; attribute dont_touch of I591: signal is true;
	signal I594: std_logic; attribute dont_touch of I594: signal is true;
	signal I595: std_logic; attribute dont_touch of I595: signal is true;
	signal I598: std_logic; attribute dont_touch of I598: signal is true;
	signal I603: std_logic; attribute dont_touch of I603: signal is true;
	signal I606: std_logic; attribute dont_touch of I606: signal is true;
	signal I607: std_logic; attribute dont_touch of I607: signal is true;
	signal I615: std_logic; attribute dont_touch of I615: signal is true;
	signal I618: std_logic; attribute dont_touch of I618: signal is true;
	signal I627: std_logic; attribute dont_touch of I627: signal is true;
	signal I638: std_logic; attribute dont_touch of I638: signal is true;
	signal I642: std_logic; attribute dont_touch of I642: signal is true;
	signal I658: std_logic; attribute dont_touch of I658: signal is true;
	signal I663: std_logic; attribute dont_touch of I663: signal is true;
	signal I666: std_logic; attribute dont_touch of I666: signal is true;
	signal I667: std_logic; attribute dont_touch of I667: signal is true;
	signal I671: std_logic; attribute dont_touch of I671: signal is true;
	signal I675: std_logic; attribute dont_touch of I675: signal is true;
	signal I694: std_logic; attribute dont_touch of I694: signal is true;
	signal I698: std_logic; attribute dont_touch of I698: signal is true;
	signal I710: std_logic; attribute dont_touch of I710: signal is true;
	signal I714: std_logic; attribute dont_touch of I714: signal is true;
	signal I731: std_logic; attribute dont_touch of I731: signal is true;
	signal I739: std_logic; attribute dont_touch of I739: signal is true;
	signal I742: std_logic; attribute dont_touch of I742: signal is true;
	signal I747: std_logic; attribute dont_touch of I747: signal is true;
	signal I774: std_logic; attribute dont_touch of I774: signal is true;
	signal I778: std_logic; attribute dont_touch of I778: signal is true;
	signal I779: std_logic; attribute dont_touch of I779: signal is true;
	signal I782: std_logic; attribute dont_touch of I782: signal is true;
	signal I787: std_logic; attribute dont_touch of I787: signal is true;
	signal I795: std_logic; attribute dont_touch of I795: signal is true;
	signal I798: std_logic; attribute dont_touch of I798: signal is true;
	signal I799: std_logic; attribute dont_touch of I799: signal is true;
	signal I810: std_logic; attribute dont_touch of I810: signal is true;
	signal I814: std_logic; attribute dont_touch of I814: signal is true;
	signal I821: std_logic; attribute dont_touch of I821: signal is true;
	signal I823: std_logic; attribute dont_touch of I823: signal is true;
	signal I827: std_logic; attribute dont_touch of I827: signal is true;
	signal I831: std_logic; attribute dont_touch of I831: signal is true;
	signal I834: std_logic; attribute dont_touch of I834: signal is true;
	signal I837: std_logic; attribute dont_touch of I837: signal is true;
	signal I838: std_logic; attribute dont_touch of I838: signal is true;
	signal I841: std_logic; attribute dont_touch of I841: signal is true;
	signal I855: std_logic; attribute dont_touch of I855: signal is true;
	signal I861: std_logic; attribute dont_touch of I861: signal is true;
	signal I863: std_logic; attribute dont_touch of I863: signal is true;
	signal I867: std_logic; attribute dont_touch of I867: signal is true;
	signal I870: std_logic; attribute dont_touch of I870: signal is true;
	signal I872: std_logic; attribute dont_touch of I872: signal is true;
	signal I874: std_logic; attribute dont_touch of I874: signal is true;
	signal I877: std_logic; attribute dont_touch of I877: signal is true;
	signal I881: std_logic; attribute dont_touch of I881: signal is true;
	signal I884: std_logic; attribute dont_touch of I884: signal is true;
	signal I887: std_logic; attribute dont_touch of I887: signal is true;
	signal I889: std_logic; attribute dont_touch of I889: signal is true;
	signal I895: std_logic; attribute dont_touch of I895: signal is true;
	signal I899: std_logic; attribute dont_touch of I899: signal is true;
	signal I900_1: std_logic; attribute dont_touch of I900_1: signal is true;
	signal I903_1: std_logic; attribute dont_touch of I903_1: signal is true;
	signal I903_2: std_logic; attribute dont_touch of I903_2: signal is true;
	signal I909_1: std_logic; attribute dont_touch of I909_1: signal is true;
	signal I914_1: std_logic; attribute dont_touch of I914_1: signal is true;
	signal I917_1: std_logic; attribute dont_touch of I917_1: signal is true;
	signal I917_2: std_logic; attribute dont_touch of I917_2: signal is true;
	signal I921_1: std_logic; attribute dont_touch of I921_1: signal is true;
	signal I924_1: std_logic; attribute dont_touch of I924_1: signal is true;
	signal I924_2: std_logic; attribute dont_touch of I924_2: signal is true;
	signal I928_1: std_logic; attribute dont_touch of I928_1: signal is true;
	signal I933_1: std_logic; attribute dont_touch of I933_1: signal is true;
	signal I936_1: std_logic; attribute dont_touch of I936_1: signal is true;
	signal I936_2: std_logic; attribute dont_touch of I936_2: signal is true;
	signal I940_1: std_logic; attribute dont_touch of I940_1: signal is true;
	signal I943_1: std_logic; attribute dont_touch of I943_1: signal is true;
	signal I946_1: std_logic; attribute dont_touch of I946_1: signal is true;
	signal I946_2: std_logic; attribute dont_touch of I946_2: signal is true;
	signal I950_1: std_logic; attribute dont_touch of I950_1: signal is true;
	signal I950_2: std_logic; attribute dont_touch of I950_2: signal is true;
	signal I954_1: std_logic; attribute dont_touch of I954_1: signal is true;
	signal I954_2: std_logic; attribute dont_touch of I954_2: signal is true;
	signal I958_1: std_logic; attribute dont_touch of I958_1: signal is true;
	signal I958_2: std_logic; attribute dont_touch of I958_2: signal is true;
	signal I962_1: std_logic; attribute dont_touch of I962_1: signal is true;
	signal I962_2: std_logic; attribute dont_touch of I962_2: signal is true;
	signal I967_1: std_logic; attribute dont_touch of I967_1: signal is true;
	signal I970_1: std_logic; attribute dont_touch of I970_1: signal is true;
	signal I975_1: std_logic; attribute dont_touch of I975_1: signal is true;
	signal I978_1: std_logic; attribute dont_touch of I978_1: signal is true;
	signal I982_1: std_logic; attribute dont_touch of I982_1: signal is true;
	signal I985_1: std_logic; attribute dont_touch of I985_1: signal is true;
	signal I988_1: std_logic; attribute dont_touch of I988_1: signal is true;
	signal I1038_1: std_logic; attribute dont_touch of I1038_1: signal is true;
	signal I1044_1: std_logic; attribute dont_touch of I1044_1: signal is true;
	signal I1055_1: std_logic; attribute dont_touch of I1055_1: signal is true;
	signal I1055_2: std_logic; attribute dont_touch of I1055_2: signal is true;
	signal I1059_1: std_logic; attribute dont_touch of I1059_1: signal is true;
	signal I1062_1: std_logic; attribute dont_touch of I1062_1: signal is true;
	signal I1065_1: std_logic; attribute dont_touch of I1065_1: signal is true;
	signal I1068_1: std_logic; attribute dont_touch of I1068_1: signal is true;
	signal I1071_1: std_logic; attribute dont_touch of I1071_1: signal is true;
	signal I1074_1: std_logic; attribute dont_touch of I1074_1: signal is true;
	signal I1077_1: std_logic; attribute dont_touch of I1077_1: signal is true;
	signal I1081_1: std_logic; attribute dont_touch of I1081_1: signal is true;
	signal I1081_2: std_logic; attribute dont_touch of I1081_2: signal is true;
	signal I1085_1: std_logic; attribute dont_touch of I1085_1: signal is true;
	signal I1085_2: std_logic; attribute dont_touch of I1085_2: signal is true;
	signal I1089_1: std_logic; attribute dont_touch of I1089_1: signal is true;
	signal I1092_1: std_logic; attribute dont_touch of I1092_1: signal is true;
	signal I1095_1: std_logic; attribute dont_touch of I1095_1: signal is true;
	signal I1095_2: std_logic; attribute dont_touch of I1095_2: signal is true;
	signal I1099_1: std_logic; attribute dont_touch of I1099_1: signal is true;
	signal I1102_1: std_logic; attribute dont_touch of I1102_1: signal is true;
	signal I1102_2: std_logic; attribute dont_touch of I1102_2: signal is true;
	signal I1106_1: std_logic; attribute dont_touch of I1106_1: signal is true;
	signal I1106_2: std_logic; attribute dont_touch of I1106_2: signal is true;
	signal I1110_1: std_logic; attribute dont_touch of I1110_1: signal is true;
	signal I1113_1: std_logic; attribute dont_touch of I1113_1: signal is true;
	signal I1116_1: std_logic; attribute dont_touch of I1116_1: signal is true;
	signal I1116_2: std_logic; attribute dont_touch of I1116_2: signal is true;
	signal I1120_1: std_logic; attribute dont_touch of I1120_1: signal is true;
	signal I1123_1: std_logic; attribute dont_touch of I1123_1: signal is true;
	signal ST_0: std_logic; attribute dont_touch of ST_0: signal is true;
	signal ST_1: std_logic; attribute dont_touch of ST_1: signal is true;
	signal ST_2: std_logic; attribute dont_touch of ST_2: signal is true;
	signal ST_3: std_logic; attribute dont_touch of ST_3: signal is true;
	signal ST_4: std_logic; attribute dont_touch of ST_4: signal is true;
	signal ST_5: std_logic; attribute dont_touch of ST_5: signal is true;
begin
	process(CLK)
	begin
		if(rising_edge(CLK)) then
			ST_0<=I7;
			ST_1<=I6;
			ST_2<=I5;
			ST_3<=I4;
			ST_4<=I3;
			ST_5<=I2;
		end if;
	end process;
	I56<= not ST_5;
	I57<= not ST_4;
	I58<= not ST_3;
	I59<= not ST_2;
	I60<= not ST_1;
	I61<= not ST_0;
	I67<= not CNT261;
	I68<= not CNT44;
	I69<= not PCNT12;
	I70<= not PCNT17;
	I73<= not CNT567;
	I78<= not CNT511;
	I130<= not I131;
	I204<= not I205;
	I216<= not I217;
	I347<= not I346;
	I462<= not I463;
	I467<= not I466;
	I475<= not I474;
	I483<= not I482;
	I486<= not I487;
	I495<= not I494;
	I530<= not I531;
	I546<= not I547;
	I554<= not I555;
	I567<= not I566;
	I591<= not I590;
	I594<= not I595;
	I607<= not I606;
	I667<= not I666;
	I778<= not I779;
	I798<= not I799;
	I936_1<=CNT591 and I59;
	I936_2<=CNT272 and ST_2;
	I940_1<=I495 and I60;
	I943_1<=I578 and ST_3;
	I946_1<=CNT10 and ST_5;
	I946_2<=JOHN and ST_4;
	I950_1<=I455 and CNT45;
	I950_2<=I463 and CNT283;
	I954_1<=ST_5 and CNT509 and I567;
	I954_2<=CNT45 and I587 and I104;
	I967_1<=I498 and I57;
	I988_1<=I694 and I698;
	I1044_1<=I70 and CNT284;
	I1055_1<=I570 and ST_0 and ST_2;
	I1055_2<=I58 and I204;
	I1059_1<=ST_5 and I671;
	I1062_1<=I535 and I598;
	I1065_1<=I475 and I232;
	I1071_1<=I551 and I671;
	I1077_1<=I104 and I539;
	I1081_1<=I543 and I490 and I58;
	I1081_2<=ST_2 and I483;
	I1085_1<=I787 and I130;
	I1085_2<=I61 and I216;
	I1089_1<=I59 and I555;
	I1102_1<=ST_5 and I455;
	I1102_2<=I56 and I675;
	I1106_1<=I60 and I551;
	I1106_2<=I57 and I543;
	I1113_1<=ST_4 and I234;
	I1116_1<=I95 and I603;
	I1116_2<=I61 and I230;
	I1120_1<=I795 and I618;
	I1123_1<=I551 and I663;
	CBLANK<= not (I928_1 and I841);
	CCLR<= not (I486 and I877 and I546 and I390);
	CSYNC<= not (I924_1 and I924_2 and I881);
	I2<= not (I900_1 and I821);
	I3<= not (I903_1 and I903_2 and I823);
	I4<= not (I278 and I274 and I270 and I266);
	I5<= not (I282 and I889 and I827 and I298);
	I6<= not (I909_1 and I899 and I895);
	I7<= not (I778 and I782 and I887);
	I104<= not (I933_1 and I56);
	I230<= not (I958_1 and I958_2);
	I232<= not (I962_1 and I962_2 and I810);
	I234<= not (I213 and I814 and I710 and I714);
	I266<= not (I970_1 and ST_1);
	I270<= not (ST_3 and I615);
	I274<= not (I56 and I667);
	I278<= not (I975_1 and I60);
	I282<= not (I978_1 and ST_1);
	I298<= not (I539 and I574);
	I326<= not (I982_1 and I61);
	I346<= not (I985_1 and I463);
	I390<= not (ST_0 and I583);
	I458<= not (ST_3 and ST_1);
	I466<= not (ST_3 and I535);
	I474<= not (I56 and I57);
	I478<= not (I547 and I739);
	I482<= not (I58 and I551);
	I490<= not (CNT284 and PCNT17);
	I494<= not (I57 and I547);
	I498<= not (I511 and I587);
	I506<= not (I535 and I58);
	I566<= not (I663 and ST_2);
	I570<= not (I458 and I56);
	I574<= not (ST_3 and I57);
	I578<= not (I61 and ST_1);
	I590<= not (ST_1 and ST_2);
	I598<= not (CNT13 and I56);
	I606<= not (I95 and I57);
	I618<= not (I69 and CNT44);
	I638<= not (I511 and ST_0);
	I642<= not (I739 and ST_2);
	I658<= not (ST_2 and I58);
	I666<= not (I61 and ST_3);
	I694<= not (I795 and I57);
	I698<= not (I563 and I59);
	I710<= not (I467 and CNT10);
	I714<= not (I1038_1 and I567);
	I742<= not (I56 and ST_0);
	I774<= not (ST_5 and I547 and I458);
	I782<= not (I67 and I559 and I675);
	I810<= not (PCNT6 and CNT284 and I455);
	I814<= not (I58 and CNT21 and I595);
	I834<= not (I1068_1 and I642);
	I838<= not (I1074_1 and I530);
	I870<= not (I1092_1 and I566);
	I872<= not (I1095_1 and I1095_2 and I774);
	I874<= not (I1099_1 and I863 and I831);
	I884<= not (I1110_1 and I861 and I326);
	PC<= not (I921_1 and I837);
	PCLR<= not (I917_1 and I917_2);
	VSYNC<= not (I914_1 and I855 and I867);
	I900_1<=I56 or I207;
	I903_1<=I606 or I742;
	I903_2<=I58 or I478;
	I909_1<=I466 or I627;
	I914_1<=I60 or I61;
	I917_1<=I458 or I494 or ST_5;
	I917_2<=I482 or I590;
	I921_1<=I494 or I570;
	I924_1<=ST_0 or I731;
	I924_2<=I474 or I666;
	I928_1<=ST_0 or I530;
	I933_1<=I57 or I58;
	I958_1<=I57 or I59;
	I958_2<=CNT284 or I642;
	I962_1<=I462 or I73;
	I962_2<=I466 or I78;
	I970_1<=I495 or I603;
	I975_1<=I531 or I483;
	I978_1<=I483 or I747;
	I982_1<=I559 or I487;
	I985_1<=PCNT27 or I73;
	I1038_1<=CNT21 or ST_0;
	I1068_1<=ST_4 or I590;
	I1074_1<=I475 or I546;
	I1092_1<=ST_4 or I478;
	I1095_1<=CNT13 or I506;
	I1095_2<=I475 or I578;
	I1099_1<=I506 or I209;
	I1110_1<=I61 or I530;
	CSM<= not (I555 or I798);
	I95<= not (I587 or I591);
	I131<= not (I936_1 or I936_2);
	I205<= not (I563 or I940_1);
	I207<= not (I595 or I943_1);
	I209<= not (I946_1 or I946_2);
	I213<= not (I950_1 or I950_2);
	I217<= not (I954_1 or I954_2);
	I259<= not (ST_0 or I967_1);
	I371<= not (I68 or I988_1);
	I455<= not (I554 or I658);
	I463<= not (I458 or I594);
	I487<= not (ST_4 or I498);
	I511<= not (ST_3 or ST_5);
	I531<= not (I574 or I59);
	I535<= not (I590 or ST_0);
	I539<= not (I546 or I60);
	I543<= not (I742 or I590);
	I547<= not (I61 or ST_2);
	I551<= not (I61 or I57);
	I555<= not (ST_0 or ST_1);
	I559<= not (I658 or I56);
	I563<= not (I578 or I56);
	I583<= not (I511 or I60);
	I587<= not (ST_1 or ST_2);
	I595<= not (ST_0 or ST_2);
	I603<= not (I61 or I56);
	I615<= not (I475 or ST_2);
	I627<= not (PCNT241 or I78);
	I663<= not (ST_1 or I58);
	I671<= not (I458 or I59);
	I675<= not (I61 or ST_1);
	I731<= not (I583 or I607);
	I739<= not (ST_5 or ST_1);
	I747<= not (I638 or I1044_1);
	I779<= not (I95 or ST_4 or I638);
	I787<= not (I554 or ST_5 or I574);
	I795<= not (ST_3 or ST_2 or I578);
	I799<= not (I56 or I58 or I59);
	I821<= not (I1055_1 or I1055_2);
	I823<= not (I259 or I1059_1);
	I827<= not (I531 or I1062_1);
	I831<= not (I371 or I1065_1);
	I837<= not (I487 or I1071_1);
	I841<= not (I799 or I1077_1);
	I855<= not (I615 or ST_3);
	I861<= not (I1081_1 or I1081_2);
	I863<= not (I1085_1 or I1085_2);
	I867<= not (I834 or I1089_1);
	I877<= not (I1102_1 or I1102_2 or I551);
	I881<= not (I1106_1 or I1106_2 or I838);
	I887<= not (I874 or I1113_1);
	I889<= not (I1116_1 or I1116_2 or I870);
	I895<= not (I884 or I1120_1);
	I899<= not (I872 or I347 or I1123_1);
end RTL;
