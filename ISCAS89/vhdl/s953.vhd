-- File created by Bench2VHDL
-- Name: s953
-- File: bench/s953.bench
-- Timestamp: 2019-05-21T22:08:28.928349
--
-- Original File
-- =============
--	# s953
--	# 16 inputs
--	# 23 outputs
--	# 29 D-type flipflops
--	# 84 inverters
--	# 311 gates (49 ANDs + 114 NANDs + 36 ORs + 112 NORs)
--	
--	INPUT(Rdy1RtHS1)
--	INPUT(Rdy2RtHS1)
--	INPUT(Rdy1BmHS1)
--	INPUT(Rdy2BmHS1)
--	INPUT(InDoneHS1)
--	INPUT(RtTSHS1)
--	INPUT(TpArrayHS1)
--	INPUT(OutputHS1)
--	INPUT(WantBmHS1)
--	INPUT(WantRtHS1)
--	INPUT(OutAvHS1)
--	INPUT(FullOHS1)
--	INPUT(FullIHS1)
--	INPUT(Prog_2)
--	INPUT(Prog_1)
--	INPUT(Prog_0)
--	
--	OUTPUT(ReWhBufHS1)
--	OUTPUT(TgWhBufHS1)
--	OUTPUT(SeOutAvHS1)
--	OUTPUT(LdProgHS1)
--	OUTPUT(Mode2HS1)
--	OUTPUT(ReRtTSHS1)
--	OUTPUT(ShftIRHS1)
--	OUTPUT(NewTrHS1)
--	OUTPUT(Mode1HS1)
--	OUTPUT(ShftORHS1)
--	OUTPUT(ActRtHS1)
--	OUTPUT(Mode0HS1)
--	OUTPUT(TxHInHS1)
--	OUTPUT(LxHInHS1)
--	OUTPUT(NewLineHS1)
--	OUTPUT(ActBmHS1)
--	OUTPUT(GoBmHS1)
--	OUTPUT(LoadOHHS1)
--	OUTPUT(DumpIHS1)
--	OUTPUT(SeFullOHS1)
--	OUTPUT(GoRtHS1)
--	OUTPUT(LoadIHHS1)
--	OUTPUT(SeFullIHS1)
--	
--	State_5 = DFF(I2)
--	State_4 = DFF(I3)
--	State_3 = DFF(I4)
--	State_2 = DFF(I5)
--	State_1 = DFF(I6)
--	State_0 = DFF(I7)
--	ActRtHS1 = DFF(I8)
--	ActBmHS1 = DFF(I9)
--	GoRtHS1 = DFF(I10)
--	GoBmHS1 = DFF(I11)
--	NewTrHS1 = DFF(I12)
--	ReRtTSHS1 = DFF(I13)
--	Mode0HS1 = DFF(I14)
--	Mode1HS1 = DFF(I15)
--	Mode2HS1 = DFF(I16)
--	NewLineHS1 = DFF(I17)
--	ShftORHS1 = DFF(I18)
--	ShftIRHS1 = DFF(I19)
--	LxHInHS1 = DFF(I20)
--	TxHInHS1 = DFF(I21)
--	LoadOHHS1 = DFF(I22)
--	LoadIHHS1 = DFF(I23)
--	SeOutAvHS1 = DFF(I24)
--	SeFullOHS1 = DFF(I25)
--	SeFullIHS1 = DFF(I26)
--	TgWhBufHS1 = DFF(I27)
--	ReWhBufHS1 = DFF(I28)
--	LdProgHS1 = DFF(I29)
--	DumpIHS1 = DFF(I30)
--	
--	I265 = NOT(Rdy1BmHS1)
--	I266 = NOT(Rdy2BmHS1)
--	I263 = NOT(Rdy1RtHS1)
--	I264 = NOT(Rdy2RtHS1)
--	I271 = NOT(WantBmHS1)
--	I272 = NOT(WantRtHS1)
--	I284 = NOT(Prog_0)
--	I283 = NOT(Prog_1)
--	I282 = NOT(Prog_2)
--	I275 = NOT(FullIHS1)
--	I274 = NOT(FullOHS1)
--	I281 = NOT(State_0)
--	I280 = NOT(State_1)
--	I279 = NOT(State_2)
--	I278 = NOT(State_3)
--	I277 = NOT(State_4)
--	I276 = NOT(State_5)
--	I269 = NOT(TpArrayHS1)
--	I267 = NOT(InDoneHS1)
--	I344 = NOT(I345)
--	I327 = NOT(I326)
--	I625 = NOT(I624)
--	I494 = NOT(I495)
--	I513 = NOT(I512)
--	I508 = NOT(I509)
--	I571 = NOT(I570)
--	I331 = NOT(I330)
--	I441 = NOT(I440)
--	I504 = NOT(I505)
--	I339 = NOT(I338)
--	I342 = NOT(I343)
--	I424 = NOT(I425)
--	I486 = NOT(I487)
--	I437 = NOT(I436)
--	I451 = NOT(I450)
--	I459 = NOT(I458)
--	I535 = NOT(I534)
--	I554 = NOT(I555)
--	I390 = NOT(I391)
--	I341 = NOT(I340)
--	I397 = NOT(I396)
--	I415 = NOT(I414)
--	I469 = NOT(I468)
--	I16 = NOT(I323)
--	I322 = NOT(I323)
--	I398 = NOT(I399)
--	I428 = NOT(I429)
--	I452 = NOT(I453)
--	I444 = NOT(I445)
--	I380 = NOT(I381)
--	I13 = NOT(I415)
--	I367 = NOT(I366)
--	I475 = NOT(I474)
--	I431 = NOT(I430)
--	I435 = NOT(I434)
--	I467 = NOT(I466)
--	I370 = NOT(I371)
--	I377 = NOT(I376)
--	I358 = NOT(I359)
--	I552 = NOT(I553)
--	I566 = NOT(I567)
--	I410 = NOT(I411)
--	I355 = NOT(I354)
--	I363 = NOT(I362)
--	I379 = NOT(I378)
--	I423 = NOT(I422)
--	I329 = NOT(I328)
--	I18 = NOT(I295)
--	I446 = NOT(I447)
--	I771 = NOT(I770)
--	I691 = NOT(I690)
--	I769 = NOT(I768)
--	I477 = NOT(I476)
--	I405 = NOT(I404)
--	I661 = NOT(I660)
--	I20 = NOT(I297)
--	I663 = NOT(I662)
--	I17 = NOT(I294)
--	I351 = NOT(I350)
--	I779 = NOT(I778)
--	I7 = NOT(I311)
--	I10 = NOT(I287)
--	I23 = NOT(I300)
--	I26 = NOT(I303)
--	
--	I840_2 = AND(Prog_1, Prog_0)
--	I873_1 = AND(I263, I264)
--	I840_1 = AND(I283, I284)
--	I850_1 = AND(I610, I612)
--	I963_1 = AND(I335, I345)
--	I966_1 = AND(I335, I357)
--	I1025_1 = AND(Rdy2BmHS1, I325)
--	I910_1 = AND(I277, I360)
--	I850_2 = AND(WantRtHS1, I614)
--	I1044_1 = AND(I497, I570)
--	I1077_1 = AND(I458, I512)
--	I1083_1 = AND(I458, I506)
--	I1170_1 = AND(I393, I414)
--	I1193_1 = AND(I424, I521)
--	I1184_1 = AND(I486, I506)
--	I1080_1 = AND(Prog_0, I382)
--	I1107_1 = AND(I284, I382)
--	I1103_1 = AND(State_5, I418)
--	I1196_1 = AND(I345, I418)
--	I1040_1 = AND(OutputHS1, I322)
--	I1103_2 = AND(Prog_0, I322)
--	I1180_1 = AND(I267, I322)
--	I1031_1 = AND(I317, I398)
--	I1166_1 = AND(I357, I529)
--	I1160_1 = AND(I281, I412)
--	I1034_1 = AND(I317, I428)
--	I1163_1 = AND(I345, I531)
--	I1136_1 = AND(I282, I590)
--	I1166_2 = AND(Prog_2, I452)
--	I1173_1 = AND(I263, I466)
--	I1110_1 = AND(I277, I388)
--	I1188_2 = AND(I267, I388)
--	I1199_2 = AND(I267, I380)
--	I789_1 = AND(I278, I580)
--	I1184_2 = AND(I269, I376)
--	I1188_1 = AND(State_1, I376)
--	I1143_2 = AND(I274, I596)
--	I1100_1 = AND(WantBmHS1, I384)
--	I1128_1 = AND(I378, I568)
--	I1056_1 = AND(I280, I358)
--	I1176_1 = AND(State_4, I566)
--	I1097_1 = AND(I317, I556)
--	I1180_2 = AND(I348, I554)
--	I1176_2 = AND(Prog_0, I600)
--	I810_1 = AND(I364, I562)
--	I1199_1 = AND(I338, I364)
--	I1143_1 = AND(I353, I404)
--	I1140_1 = AND(I271, I573)
--	I1094_1 = AND(WantRtHS1, I582)
--	
--	I1047_2 = OR(Rdy1BmHS1, Prog_0)
--	I881_1 = OR(InDoneHS1, Prog_2)
--	I1047_1 = OR(I264, I284)
--	I881_2 = OR(I282, I326)
--	I857_1 = OR(Prog_0, I493)
--	I834_1 = OR(FullIHS1, I523)
--	I892_1 = OR(I279, I495)
--	I1037_1 = OR(Prog_0, I336)
--	I861_2 = OR(I265, I457)
--	I892_2 = OR(I269, I625)
--	I896_1 = OR(I279, I320)
--	I861_1 = OR(I263, I455)
--	I1121_1 = OR(State_0, I589)
--	I796_1 = OR(I283, I323)
--	I1203_2 = OR(I543, I577)
--	I1216_1 = OR(I449, I537)
--	I1113_1 = OR(I282, I415)
--	I1118_1 = OR(State_1, I479)
--	I1203_1 = OR(I463, I491)
--	I1216_2 = OR(I465, I489)
--	I1154_1 = OR(I267, I371)
--	I1028_1 = OR(I367, I493)
--	I1132_1 = OR(I593, I595)
--	I1132_2 = OR(I281, I467)
--	I1148_1 = OR(I267, I565)
--	I1121_2 = OR(Rdy2BmHS1, I559)
--	I1125_1 = OR(Rdy2RtHS1, I561)
--	I1087_1 = OR(Prog_0, I526)
--	I814_1 = OR(FullOHS1, I355)
--	I1157_1 = OR(I274, I599)
--	I1210_1 = OR(I339, I421)
--	I1091_1 = OR(I585, I587)
--	I829_1 = OR(I547, I575)
--	I1213_1 = OR(I498, I547)
--	I1207_1 = OR(I519, I579)
--	I1151_1 = OR(I405, I537)
--	
--	I357 = NAND(Rdy1BmHS1, Rdy2BmHS1)
--	I345 = NAND(Rdy1RtHS1, Rdy2RtHS1)
--	I519 = NAND(Rdy2BmHS1, WantBmHS1)
--	I317 = NAND(FullOHS1, FullIHS1)
--	I511 = NAND(State_1, State_0)
--	I543 = NAND(I265, Rdy2BmHS1)
--	I473 = NAND(I265, I266)
--	I493 = NAND(Rdy1BmHS1, I266)
--	I537 = NAND(I263, Rdy2RtHS1)
--	I575 = NAND(I271, I284)
--	I393 = NAND(I282, I283)
--	I587 = NAND(Prog_0, I317)
--	I523 = NAND(I274, Prog_2)
--	I539 = NAND(I263, I274)
--	I595 = NAND(Rdy2BmHS1, I274)
--	I495 = NAND(I280, I281)
--	I521 = NAND(RtTSHS1, I278)
--	I335 = NAND(I277, I282)
--	I525 = NAND(I277, I280)
--	I509 = NAND(I276, I277)
--	I336 = NAND(I473, I357)
--	I330 = NAND(WantBmHS1, I493)
--	I439 = NAND(Prog_0, I514)
--	I568 = NAND(I1047_1, I1047_2)
--	I360 = NAND(I881_1, I881_2)
--	I457 = NAND(I266, I506)
--	I461 = NAND(I282, I506)
--	I320 = NAND(I495, I511)
--	I455 = NAND(I264, I512)
--	I489 = NAND(I506, I570)
--	I505 = NAND(I279, I570)
--	I338 = NAND(I857_1, I439)
--	I318 = NAND(I834_1, I277)
--	I497 = NAND(I455, I457)
--	I343 = NAND(I276, I394, I482)
--	I589 = NAND(Prog_2, I482)
--	I425 = NAND(State_2, I281, I508)
--	I487 = NAND(State_3, I508)
--	I562 = NAND(I1037_1, I439)
--	I372 = NAND(I892_1, I892_2)
--	I374 = NAND(I896_1, I461)
--	I340 = NAND(I861_1, I861_2)
--	I485 = NAND(I277, I548)
--	I491 = NAND(State_5, I548)
--	I323 = NAND(State_4, I281, I436)
--	I399 = NAND(I284, I436)
--	I577 = NAND(State_0, I318, I436)
--	I429 = NAND(Prog_0, I450)
--	I449 = NAND(State_1, I318, I450)
--	I453 = NAND(I277, I327, I504)
--	I503 = NAND(I277, I504)
--	I551 = NAND(I279, I442)
--	I445 = NAND(I374, I534)
--	I381 = NAND(State_3, I396)
--	I479 = NAND(I279, I486)
--	I481 = NAND(I372, I486)
--	I529 = NAND(I399, I489)
--	I531 = NAND(I429, I491)
--	I371 = NAND(I279, I382)
--	I680 = NAND(I445, I381)
--	I407 = NAND(I412, I532)
--	I593 = NAND(I284, I430)
--	I359 = NAND(Rdy1RtHS1, I432, I532)
--	I553 = NAND(State_1, I500)
--	I403 = NAND(I634, I434, I494)
--	I609 = NAND(I265, I434)
--	I411 = NAND(I279, Prog_0, I416)
--	I19 = NAND(I371, I323)
--	I676 = NAND(I1113_1, I343)
--	I682 = NAND(I1118_1, I323)
--	I738 = NAND(I1203_1, I1203_2)
--	I746 = NAND(I1216_1, I1216_2)
--	I706 = NAND(I1154_1, I403)
--	I12 = NAND(I377, I469)
--	I599 = NAND(I275, I354)
--	I447 = NAND(Rdy2RtHS1, I362)
--	I545 = NAND(I272, I362)
--	I421 = NAND(I274, I422)
--	I585 = NAND(I353, I422)
--	I517 = NAND(I264, I358)
--	I770 = NAND(I715, I713)
--	I690 = NAND(I1132_1, I1132_2)
--	I768 = NAND(I719, I717)
--	I15 = NAND(I796_1, I675)
--	I4 = NAND(I725, I381, I551)
--	I5 = NAND(I733, I729, I731, I397)
--	I702 = NAND(I1148_1, I481)
--	I556 = NAND(I1028_1, I355)
--	I684 = NAND(I1121_1, I1121_2)
--	I686 = NAND(I1125_1, I441)
--	I573 = NAND(I517, I545)
--	I678 = NAND(I329, I423)
--	I8 = NAND(I655, I657)
--	I14 = NAND(I671, I673)
--	I660 = NAND(I1087_1, I469)
--	I547 = NAND(WantRtHS1, I446)
--	I742 = NAND(I1210_1, I551)
--	I662 = NAND(I1091_1, I329)
--	I21 = NAND(I689, I693, I691)
--	I2 = NAND(I711, I771, I769)
--	I9 = NAND(I377, I661, I659)
--	I11 = NAND(I475, I669, I667)
--	I744 = NAND(I1213_1, I553)
--	I740 = NAND(I1207_1, I477)
--	I3 = NAND(I721, I723)
--	I778 = NAND(I737, I735)
--	I704 = NAND(I1151_1, I329)
--	I22 = NAND(I699, I695, I697, I481)
--	I750 = NAND(I665, I663)
--	I30 = NAND(I829_1, I351)
--	I700 = NAND(I403, I351)
--	I708 = NAND(I1157_1, I351)
--	I6 = NAND(I377, I779, I777)
--	I25 = NAND(I814_1, I767)
--	
--	I326 = NOR(FullOHS1, FullIHS1)
--	I28 = NOR(OutAvHS1, FullIHS1)
--	I514 = NOR(I263, Rdy2RtHS1)
--	I610 = NOR(Prog_2, I284)
--	I27 = NOR(OutAvHS1, I275)
--	I24 = NOR(OutAvHS1, I326)
--	I612 = NOR(Rdy1RtHS1, I274)
--	I506 = NOR(State_1, I281)
--	I624 = NOR(State_2, I511)
--	I386 = NOR(State_2, I280)
--	I512 = NOR(I280, State_0)
--	I570 = NOR(I276, State_3)
--	I498 = NOR(I271, I473)
--	I315 = NOR(I272, I514)
--	I353 = NOR(I344, I873_1)
--	I325 = NOR(I840_1, I840_2)
--	I394 = NOR(State_0, I327, I357)
--	I532 = NOR(State_4, I327)
--	I614 = NOR(I523, I575)
--	I482 = NOR(State_3, State_2, I525)
--	I440 = NOR(I495, I509)
--	I347 = NOR(State_3, I394)
--	I548 = NOR(State_3, I513)
--	I436 = NOR(State_1, I505)
--	I450 = NOR(State_0, I505)
--	I458 = NOR(I279, I571)
--	I470 = NOR(I320, I335, I571)
--	I534 = NOR(State_4, I571)
--	I555 = NOR(I330, I1025_1)
--	I442 = NOR(State_1, I347, I509)
--	I391 = NOR(State_2, I910_1)
--	I333 = NOR(I850_1, I850_2)
--	I29 = NOR(I278, State_2, I441)
--	I396 = NOR(I280, I425)
--	I414 = NOR(State_1, I425, I521)
--	I468 = NOR(State_0, I386, I487)
--	I634 = NOR(I264, I333)
--	I382 = NOR(I276, Prog_2, I485)
--	I418 = NOR(I279, I485)
--	I366 = NOR(State_0, I335, I399)
--	I412 = NOR(I282, I437)
--	I474 = NOR(I493, I577)
--	I590 = NOR(I429, I539)
--	I540 = NOR(Rdy2RtHS1, I263, I449)
--	I430 = NOR(Prog_2, I451)
--	I432 = NOR(I282, I451)
--	I500 = NOR(I281, I453)
--	I434 = NOR(FullIHS1, I503)
--	I466 = NOR(Rdy1BmHS1, I503)
--	I388 = NOR(I320, I459)
--	I416 = NOR(I461, I535)
--	I463 = NOR(I390, I963_1)
--	I465 = NOR(I390, I966_1)
--	I580 = NOR(I345, I397)
--	I733 = NOR(I342, I1193_1)
--	I376 = NOR(I281, I479)
--	I655 = NOR(I322, I1077_1)
--	I659 = NOR(I322, I1083_1)
--	I717 = NOR(I322, I1170_1)
--	I731 = NOR(I540, I474)
--	I567 = NOR(I388, I1044_1)
--	I565 = NOR(I444, I1040_1)
--	I671 = NOR(I1103_1, I1103_2)
--	I354 = NOR(I367, I543)
--	I596 = NOR(I336, I367)
--	I559 = NOR(I412, I1031_1)
--	I362 = NOR(State_0, I407)
--	I384 = NOR(I315, I407, I493)
--	I711 = NOR(I388, I1160_1)
--	I561 = NOR(I432, I1034_1)
--	I713 = NOR(I470, I1163_1)
--	I693 = NOR(I376, I1136_1)
--	I378 = NOR(FullIHS1, I431)
--	I422 = NOR(I431, I525)
--	I715 = NOR(I1166_1, I1166_2)
--	I408 = NOR(I341, I435, I523)
--	I328 = NOR(I609, I511, I539)
--	I719 = NOR(I500, I1173_1)
--	I675 = NOR(I470, I1110_1)
--	I526 = NOR(I370, I416)
--	I725 = NOR(I1184_1, I1184_2)
--	I729 = NOR(I1188_1, I1188_2)
--	I295 = NOR(I376, I682, I680)
--	I735 = NOR(I552, I1196_1)
--	I695 = NOR(I408, I328)
--	I657 = NOR(I410, I1080_1)
--	I673 = NOR(I410, I1107_1)
--	I348 = NOR(I315, I363)
--	I600 = NOR(I331, I447)
--	I476 = NOR(I519, I545)
--	I669 = NOR(I342, I1100_1)
--	I364 = NOR(I274, I379, I525)
--	I689 = NOR(I440, I1128_1)
--	I404 = NOR(I284, I421)
--	I582 = NOR(I331, I517)
--	I579 = NOR(I446, I1056_1)
--	I297 = NOR(I376, I686, I684)
--	I294 = NOR(I408, I678, I676)
--	I667 = NOR(I328, I1097_1)
--	I723 = NOR(I1180_1, I1180_2)
--	I721 = NOR(I1176_1, I1176_2)
--	I350 = NOR(I325, I477)
--	I737 = NOR(I1199_1, I1199_2)
--	I699 = NOR(I1143_1, I1143_2)
--	I697 = NOR(I384, I1140_1)
--	I665 = NOR(I540, I1094_1)
--	I311 = NOR(I742, I746, I744)
--	I777 = NOR(I740, I738)
--	I767 = NOR(I704, I702)
--	I287 = NOR(I750, I789_1)
--	I300 = NOR(I700, I810_1)
--	I303 = NOR(I706, I708)
--
-- VHDL Output
-- =============
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity s953 is
	port (
		CLK: in std_logic;
		FULLIHS1: in std_logic;
		FULLOHS1: in std_logic;
		INDONEHS1: in std_logic;
		OUTAVHS1: in std_logic;
		OUTPUTHS1: in std_logic;
		PROG_0: in std_logic;
		PROG_1: in std_logic;
		PROG_2: in std_logic;
		RDY1BMHS1: in std_logic;
		RDY1RTHS1: in std_logic;
		RDY2BMHS1: in std_logic;
		RDY2RTHS1: in std_logic;
		RTTSHS1: in std_logic;
		TPARRAYHS1: in std_logic;
		WANTBMHS1: in std_logic;
		WANTRTHS1: in std_logic;
		ACTBMHS1: out std_logic;
		ACTRTHS1: out std_logic;
		DUMPIHS1: out std_logic;
		GOBMHS1: out std_logic;
		GORTHS1: out std_logic;
		LDPROGHS1: out std_logic;
		LOADIHHS1: out std_logic;
		LOADOHHS1: out std_logic;
		LXHINHS1: out std_logic;
		MODE0HS1: out std_logic;
		MODE1HS1: out std_logic;
		MODE2HS1: out std_logic;
		NEWLINEHS1: out std_logic;
		NEWTRHS1: out std_logic;
		RERTTSHS1: out std_logic;
		REWHBUFHS1: out std_logic;
		SEFULLIHS1: out std_logic;
		SEFULLOHS1: out std_logic;
		SEOUTAVHS1: out std_logic;
		SHFTIRHS1: out std_logic;
		SHFTORHS1: out std_logic;
		TGWHBUFHS1: out std_logic;
		TXHINHS1: out std_logic
	);
end entity;

architecture RTL of s953 is
	attribute dont_touch: boolean;

	signal I2: std_logic; attribute dont_touch of I2: signal is true;
	signal I3: std_logic; attribute dont_touch of I3: signal is true;
	signal I4: std_logic; attribute dont_touch of I4: signal is true;
	signal I5: std_logic; attribute dont_touch of I5: signal is true;
	signal I6: std_logic; attribute dont_touch of I6: signal is true;
	signal I7: std_logic; attribute dont_touch of I7: signal is true;
	signal I8: std_logic; attribute dont_touch of I8: signal is true;
	signal I9: std_logic; attribute dont_touch of I9: signal is true;
	signal I10: std_logic; attribute dont_touch of I10: signal is true;
	signal I11: std_logic; attribute dont_touch of I11: signal is true;
	signal I12: std_logic; attribute dont_touch of I12: signal is true;
	signal I13: std_logic; attribute dont_touch of I13: signal is true;
	signal I14: std_logic; attribute dont_touch of I14: signal is true;
	signal I15: std_logic; attribute dont_touch of I15: signal is true;
	signal I16: std_logic; attribute dont_touch of I16: signal is true;
	signal I17: std_logic; attribute dont_touch of I17: signal is true;
	signal I18: std_logic; attribute dont_touch of I18: signal is true;
	signal I19: std_logic; attribute dont_touch of I19: signal is true;
	signal I20: std_logic; attribute dont_touch of I20: signal is true;
	signal I21: std_logic; attribute dont_touch of I21: signal is true;
	signal I22: std_logic; attribute dont_touch of I22: signal is true;
	signal I23: std_logic; attribute dont_touch of I23: signal is true;
	signal I24: std_logic; attribute dont_touch of I24: signal is true;
	signal I25: std_logic; attribute dont_touch of I25: signal is true;
	signal I26: std_logic; attribute dont_touch of I26: signal is true;
	signal I27: std_logic; attribute dont_touch of I27: signal is true;
	signal I28: std_logic; attribute dont_touch of I28: signal is true;
	signal I29: std_logic; attribute dont_touch of I29: signal is true;
	signal I30: std_logic; attribute dont_touch of I30: signal is true;
	signal I263: std_logic; attribute dont_touch of I263: signal is true;
	signal I264: std_logic; attribute dont_touch of I264: signal is true;
	signal I265: std_logic; attribute dont_touch of I265: signal is true;
	signal I266: std_logic; attribute dont_touch of I266: signal is true;
	signal I267: std_logic; attribute dont_touch of I267: signal is true;
	signal I269: std_logic; attribute dont_touch of I269: signal is true;
	signal I271: std_logic; attribute dont_touch of I271: signal is true;
	signal I272: std_logic; attribute dont_touch of I272: signal is true;
	signal I274: std_logic; attribute dont_touch of I274: signal is true;
	signal I275: std_logic; attribute dont_touch of I275: signal is true;
	signal I276: std_logic; attribute dont_touch of I276: signal is true;
	signal I277: std_logic; attribute dont_touch of I277: signal is true;
	signal I278: std_logic; attribute dont_touch of I278: signal is true;
	signal I279: std_logic; attribute dont_touch of I279: signal is true;
	signal I280: std_logic; attribute dont_touch of I280: signal is true;
	signal I281: std_logic; attribute dont_touch of I281: signal is true;
	signal I282: std_logic; attribute dont_touch of I282: signal is true;
	signal I283: std_logic; attribute dont_touch of I283: signal is true;
	signal I284: std_logic; attribute dont_touch of I284: signal is true;
	signal I287: std_logic; attribute dont_touch of I287: signal is true;
	signal I294: std_logic; attribute dont_touch of I294: signal is true;
	signal I295: std_logic; attribute dont_touch of I295: signal is true;
	signal I297: std_logic; attribute dont_touch of I297: signal is true;
	signal I300: std_logic; attribute dont_touch of I300: signal is true;
	signal I303: std_logic; attribute dont_touch of I303: signal is true;
	signal I311: std_logic; attribute dont_touch of I311: signal is true;
	signal I315: std_logic; attribute dont_touch of I315: signal is true;
	signal I317: std_logic; attribute dont_touch of I317: signal is true;
	signal I318: std_logic; attribute dont_touch of I318: signal is true;
	signal I320: std_logic; attribute dont_touch of I320: signal is true;
	signal I322: std_logic; attribute dont_touch of I322: signal is true;
	signal I323: std_logic; attribute dont_touch of I323: signal is true;
	signal I325: std_logic; attribute dont_touch of I325: signal is true;
	signal I326: std_logic; attribute dont_touch of I326: signal is true;
	signal I327: std_logic; attribute dont_touch of I327: signal is true;
	signal I328: std_logic; attribute dont_touch of I328: signal is true;
	signal I329: std_logic; attribute dont_touch of I329: signal is true;
	signal I330: std_logic; attribute dont_touch of I330: signal is true;
	signal I331: std_logic; attribute dont_touch of I331: signal is true;
	signal I333: std_logic; attribute dont_touch of I333: signal is true;
	signal I335: std_logic; attribute dont_touch of I335: signal is true;
	signal I336: std_logic; attribute dont_touch of I336: signal is true;
	signal I338: std_logic; attribute dont_touch of I338: signal is true;
	signal I339: std_logic; attribute dont_touch of I339: signal is true;
	signal I340: std_logic; attribute dont_touch of I340: signal is true;
	signal I341: std_logic; attribute dont_touch of I341: signal is true;
	signal I342: std_logic; attribute dont_touch of I342: signal is true;
	signal I343: std_logic; attribute dont_touch of I343: signal is true;
	signal I344: std_logic; attribute dont_touch of I344: signal is true;
	signal I345: std_logic; attribute dont_touch of I345: signal is true;
	signal I347: std_logic; attribute dont_touch of I347: signal is true;
	signal I348: std_logic; attribute dont_touch of I348: signal is true;
	signal I350: std_logic; attribute dont_touch of I350: signal is true;
	signal I351: std_logic; attribute dont_touch of I351: signal is true;
	signal I353: std_logic; attribute dont_touch of I353: signal is true;
	signal I354: std_logic; attribute dont_touch of I354: signal is true;
	signal I355: std_logic; attribute dont_touch of I355: signal is true;
	signal I357: std_logic; attribute dont_touch of I357: signal is true;
	signal I358: std_logic; attribute dont_touch of I358: signal is true;
	signal I359: std_logic; attribute dont_touch of I359: signal is true;
	signal I360: std_logic; attribute dont_touch of I360: signal is true;
	signal I362: std_logic; attribute dont_touch of I362: signal is true;
	signal I363: std_logic; attribute dont_touch of I363: signal is true;
	signal I364: std_logic; attribute dont_touch of I364: signal is true;
	signal I366: std_logic; attribute dont_touch of I366: signal is true;
	signal I367: std_logic; attribute dont_touch of I367: signal is true;
	signal I370: std_logic; attribute dont_touch of I370: signal is true;
	signal I371: std_logic; attribute dont_touch of I371: signal is true;
	signal I372: std_logic; attribute dont_touch of I372: signal is true;
	signal I374: std_logic; attribute dont_touch of I374: signal is true;
	signal I376: std_logic; attribute dont_touch of I376: signal is true;
	signal I377: std_logic; attribute dont_touch of I377: signal is true;
	signal I378: std_logic; attribute dont_touch of I378: signal is true;
	signal I379: std_logic; attribute dont_touch of I379: signal is true;
	signal I380: std_logic; attribute dont_touch of I380: signal is true;
	signal I381: std_logic; attribute dont_touch of I381: signal is true;
	signal I382: std_logic; attribute dont_touch of I382: signal is true;
	signal I384: std_logic; attribute dont_touch of I384: signal is true;
	signal I386: std_logic; attribute dont_touch of I386: signal is true;
	signal I388: std_logic; attribute dont_touch of I388: signal is true;
	signal I390: std_logic; attribute dont_touch of I390: signal is true;
	signal I391: std_logic; attribute dont_touch of I391: signal is true;
	signal I393: std_logic; attribute dont_touch of I393: signal is true;
	signal I394: std_logic; attribute dont_touch of I394: signal is true;
	signal I396: std_logic; attribute dont_touch of I396: signal is true;
	signal I397: std_logic; attribute dont_touch of I397: signal is true;
	signal I398: std_logic; attribute dont_touch of I398: signal is true;
	signal I399: std_logic; attribute dont_touch of I399: signal is true;
	signal I403: std_logic; attribute dont_touch of I403: signal is true;
	signal I404: std_logic; attribute dont_touch of I404: signal is true;
	signal I405: std_logic; attribute dont_touch of I405: signal is true;
	signal I407: std_logic; attribute dont_touch of I407: signal is true;
	signal I408: std_logic; attribute dont_touch of I408: signal is true;
	signal I410: std_logic; attribute dont_touch of I410: signal is true;
	signal I411: std_logic; attribute dont_touch of I411: signal is true;
	signal I412: std_logic; attribute dont_touch of I412: signal is true;
	signal I414: std_logic; attribute dont_touch of I414: signal is true;
	signal I415: std_logic; attribute dont_touch of I415: signal is true;
	signal I416: std_logic; attribute dont_touch of I416: signal is true;
	signal I418: std_logic; attribute dont_touch of I418: signal is true;
	signal I421: std_logic; attribute dont_touch of I421: signal is true;
	signal I422: std_logic; attribute dont_touch of I422: signal is true;
	signal I423: std_logic; attribute dont_touch of I423: signal is true;
	signal I424: std_logic; attribute dont_touch of I424: signal is true;
	signal I425: std_logic; attribute dont_touch of I425: signal is true;
	signal I428: std_logic; attribute dont_touch of I428: signal is true;
	signal I429: std_logic; attribute dont_touch of I429: signal is true;
	signal I430: std_logic; attribute dont_touch of I430: signal is true;
	signal I431: std_logic; attribute dont_touch of I431: signal is true;
	signal I432: std_logic; attribute dont_touch of I432: signal is true;
	signal I434: std_logic; attribute dont_touch of I434: signal is true;
	signal I435: std_logic; attribute dont_touch of I435: signal is true;
	signal I436: std_logic; attribute dont_touch of I436: signal is true;
	signal I437: std_logic; attribute dont_touch of I437: signal is true;
	signal I439: std_logic; attribute dont_touch of I439: signal is true;
	signal I440: std_logic; attribute dont_touch of I440: signal is true;
	signal I441: std_logic; attribute dont_touch of I441: signal is true;
	signal I442: std_logic; attribute dont_touch of I442: signal is true;
	signal I444: std_logic; attribute dont_touch of I444: signal is true;
	signal I445: std_logic; attribute dont_touch of I445: signal is true;
	signal I446: std_logic; attribute dont_touch of I446: signal is true;
	signal I447: std_logic; attribute dont_touch of I447: signal is true;
	signal I449: std_logic; attribute dont_touch of I449: signal is true;
	signal I450: std_logic; attribute dont_touch of I450: signal is true;
	signal I451: std_logic; attribute dont_touch of I451: signal is true;
	signal I452: std_logic; attribute dont_touch of I452: signal is true;
	signal I453: std_logic; attribute dont_touch of I453: signal is true;
	signal I455: std_logic; attribute dont_touch of I455: signal is true;
	signal I457: std_logic; attribute dont_touch of I457: signal is true;
	signal I458: std_logic; attribute dont_touch of I458: signal is true;
	signal I459: std_logic; attribute dont_touch of I459: signal is true;
	signal I461: std_logic; attribute dont_touch of I461: signal is true;
	signal I463: std_logic; attribute dont_touch of I463: signal is true;
	signal I465: std_logic; attribute dont_touch of I465: signal is true;
	signal I466: std_logic; attribute dont_touch of I466: signal is true;
	signal I467: std_logic; attribute dont_touch of I467: signal is true;
	signal I468: std_logic; attribute dont_touch of I468: signal is true;
	signal I469: std_logic; attribute dont_touch of I469: signal is true;
	signal I470: std_logic; attribute dont_touch of I470: signal is true;
	signal I473: std_logic; attribute dont_touch of I473: signal is true;
	signal I474: std_logic; attribute dont_touch of I474: signal is true;
	signal I475: std_logic; attribute dont_touch of I475: signal is true;
	signal I476: std_logic; attribute dont_touch of I476: signal is true;
	signal I477: std_logic; attribute dont_touch of I477: signal is true;
	signal I479: std_logic; attribute dont_touch of I479: signal is true;
	signal I481: std_logic; attribute dont_touch of I481: signal is true;
	signal I482: std_logic; attribute dont_touch of I482: signal is true;
	signal I485: std_logic; attribute dont_touch of I485: signal is true;
	signal I486: std_logic; attribute dont_touch of I486: signal is true;
	signal I487: std_logic; attribute dont_touch of I487: signal is true;
	signal I489: std_logic; attribute dont_touch of I489: signal is true;
	signal I491: std_logic; attribute dont_touch of I491: signal is true;
	signal I493: std_logic; attribute dont_touch of I493: signal is true;
	signal I494: std_logic; attribute dont_touch of I494: signal is true;
	signal I495: std_logic; attribute dont_touch of I495: signal is true;
	signal I497: std_logic; attribute dont_touch of I497: signal is true;
	signal I498: std_logic; attribute dont_touch of I498: signal is true;
	signal I500: std_logic; attribute dont_touch of I500: signal is true;
	signal I503: std_logic; attribute dont_touch of I503: signal is true;
	signal I504: std_logic; attribute dont_touch of I504: signal is true;
	signal I505: std_logic; attribute dont_touch of I505: signal is true;
	signal I506: std_logic; attribute dont_touch of I506: signal is true;
	signal I508: std_logic; attribute dont_touch of I508: signal is true;
	signal I509: std_logic; attribute dont_touch of I509: signal is true;
	signal I511: std_logic; attribute dont_touch of I511: signal is true;
	signal I512: std_logic; attribute dont_touch of I512: signal is true;
	signal I513: std_logic; attribute dont_touch of I513: signal is true;
	signal I514: std_logic; attribute dont_touch of I514: signal is true;
	signal I517: std_logic; attribute dont_touch of I517: signal is true;
	signal I519: std_logic; attribute dont_touch of I519: signal is true;
	signal I521: std_logic; attribute dont_touch of I521: signal is true;
	signal I523: std_logic; attribute dont_touch of I523: signal is true;
	signal I525: std_logic; attribute dont_touch of I525: signal is true;
	signal I526: std_logic; attribute dont_touch of I526: signal is true;
	signal I529: std_logic; attribute dont_touch of I529: signal is true;
	signal I531: std_logic; attribute dont_touch of I531: signal is true;
	signal I532: std_logic; attribute dont_touch of I532: signal is true;
	signal I534: std_logic; attribute dont_touch of I534: signal is true;
	signal I535: std_logic; attribute dont_touch of I535: signal is true;
	signal I537: std_logic; attribute dont_touch of I537: signal is true;
	signal I539: std_logic; attribute dont_touch of I539: signal is true;
	signal I540: std_logic; attribute dont_touch of I540: signal is true;
	signal I543: std_logic; attribute dont_touch of I543: signal is true;
	signal I545: std_logic; attribute dont_touch of I545: signal is true;
	signal I547: std_logic; attribute dont_touch of I547: signal is true;
	signal I548: std_logic; attribute dont_touch of I548: signal is true;
	signal I551: std_logic; attribute dont_touch of I551: signal is true;
	signal I552: std_logic; attribute dont_touch of I552: signal is true;
	signal I553: std_logic; attribute dont_touch of I553: signal is true;
	signal I554: std_logic; attribute dont_touch of I554: signal is true;
	signal I555: std_logic; attribute dont_touch of I555: signal is true;
	signal I556: std_logic; attribute dont_touch of I556: signal is true;
	signal I559: std_logic; attribute dont_touch of I559: signal is true;
	signal I561: std_logic; attribute dont_touch of I561: signal is true;
	signal I562: std_logic; attribute dont_touch of I562: signal is true;
	signal I565: std_logic; attribute dont_touch of I565: signal is true;
	signal I566: std_logic; attribute dont_touch of I566: signal is true;
	signal I567: std_logic; attribute dont_touch of I567: signal is true;
	signal I568: std_logic; attribute dont_touch of I568: signal is true;
	signal I570: std_logic; attribute dont_touch of I570: signal is true;
	signal I571: std_logic; attribute dont_touch of I571: signal is true;
	signal I573: std_logic; attribute dont_touch of I573: signal is true;
	signal I575: std_logic; attribute dont_touch of I575: signal is true;
	signal I577: std_logic; attribute dont_touch of I577: signal is true;
	signal I579: std_logic; attribute dont_touch of I579: signal is true;
	signal I580: std_logic; attribute dont_touch of I580: signal is true;
	signal I582: std_logic; attribute dont_touch of I582: signal is true;
	signal I585: std_logic; attribute dont_touch of I585: signal is true;
	signal I587: std_logic; attribute dont_touch of I587: signal is true;
	signal I589: std_logic; attribute dont_touch of I589: signal is true;
	signal I590: std_logic; attribute dont_touch of I590: signal is true;
	signal I593: std_logic; attribute dont_touch of I593: signal is true;
	signal I595: std_logic; attribute dont_touch of I595: signal is true;
	signal I596: std_logic; attribute dont_touch of I596: signal is true;
	signal I599: std_logic; attribute dont_touch of I599: signal is true;
	signal I600: std_logic; attribute dont_touch of I600: signal is true;
	signal I609: std_logic; attribute dont_touch of I609: signal is true;
	signal I610: std_logic; attribute dont_touch of I610: signal is true;
	signal I612: std_logic; attribute dont_touch of I612: signal is true;
	signal I614: std_logic; attribute dont_touch of I614: signal is true;
	signal I624: std_logic; attribute dont_touch of I624: signal is true;
	signal I625: std_logic; attribute dont_touch of I625: signal is true;
	signal I634: std_logic; attribute dont_touch of I634: signal is true;
	signal I655: std_logic; attribute dont_touch of I655: signal is true;
	signal I657: std_logic; attribute dont_touch of I657: signal is true;
	signal I659: std_logic; attribute dont_touch of I659: signal is true;
	signal I660: std_logic; attribute dont_touch of I660: signal is true;
	signal I661: std_logic; attribute dont_touch of I661: signal is true;
	signal I662: std_logic; attribute dont_touch of I662: signal is true;
	signal I663: std_logic; attribute dont_touch of I663: signal is true;
	signal I665: std_logic; attribute dont_touch of I665: signal is true;
	signal I667: std_logic; attribute dont_touch of I667: signal is true;
	signal I669: std_logic; attribute dont_touch of I669: signal is true;
	signal I671: std_logic; attribute dont_touch of I671: signal is true;
	signal I673: std_logic; attribute dont_touch of I673: signal is true;
	signal I675: std_logic; attribute dont_touch of I675: signal is true;
	signal I676: std_logic; attribute dont_touch of I676: signal is true;
	signal I678: std_logic; attribute dont_touch of I678: signal is true;
	signal I680: std_logic; attribute dont_touch of I680: signal is true;
	signal I682: std_logic; attribute dont_touch of I682: signal is true;
	signal I684: std_logic; attribute dont_touch of I684: signal is true;
	signal I686: std_logic; attribute dont_touch of I686: signal is true;
	signal I689: std_logic; attribute dont_touch of I689: signal is true;
	signal I690: std_logic; attribute dont_touch of I690: signal is true;
	signal I691: std_logic; attribute dont_touch of I691: signal is true;
	signal I693: std_logic; attribute dont_touch of I693: signal is true;
	signal I695: std_logic; attribute dont_touch of I695: signal is true;
	signal I697: std_logic; attribute dont_touch of I697: signal is true;
	signal I699: std_logic; attribute dont_touch of I699: signal is true;
	signal I700: std_logic; attribute dont_touch of I700: signal is true;
	signal I702: std_logic; attribute dont_touch of I702: signal is true;
	signal I704: std_logic; attribute dont_touch of I704: signal is true;
	signal I706: std_logic; attribute dont_touch of I706: signal is true;
	signal I708: std_logic; attribute dont_touch of I708: signal is true;
	signal I711: std_logic; attribute dont_touch of I711: signal is true;
	signal I713: std_logic; attribute dont_touch of I713: signal is true;
	signal I715: std_logic; attribute dont_touch of I715: signal is true;
	signal I717: std_logic; attribute dont_touch of I717: signal is true;
	signal I719: std_logic; attribute dont_touch of I719: signal is true;
	signal I721: std_logic; attribute dont_touch of I721: signal is true;
	signal I723: std_logic; attribute dont_touch of I723: signal is true;
	signal I725: std_logic; attribute dont_touch of I725: signal is true;
	signal I729: std_logic; attribute dont_touch of I729: signal is true;
	signal I731: std_logic; attribute dont_touch of I731: signal is true;
	signal I733: std_logic; attribute dont_touch of I733: signal is true;
	signal I735: std_logic; attribute dont_touch of I735: signal is true;
	signal I737: std_logic; attribute dont_touch of I737: signal is true;
	signal I738: std_logic; attribute dont_touch of I738: signal is true;
	signal I740: std_logic; attribute dont_touch of I740: signal is true;
	signal I742: std_logic; attribute dont_touch of I742: signal is true;
	signal I744: std_logic; attribute dont_touch of I744: signal is true;
	signal I746: std_logic; attribute dont_touch of I746: signal is true;
	signal I750: std_logic; attribute dont_touch of I750: signal is true;
	signal I767: std_logic; attribute dont_touch of I767: signal is true;
	signal I768: std_logic; attribute dont_touch of I768: signal is true;
	signal I769: std_logic; attribute dont_touch of I769: signal is true;
	signal I770: std_logic; attribute dont_touch of I770: signal is true;
	signal I771: std_logic; attribute dont_touch of I771: signal is true;
	signal I777: std_logic; attribute dont_touch of I777: signal is true;
	signal I778: std_logic; attribute dont_touch of I778: signal is true;
	signal I779: std_logic; attribute dont_touch of I779: signal is true;
	signal I789_1: std_logic; attribute dont_touch of I789_1: signal is true;
	signal I796_1: std_logic; attribute dont_touch of I796_1: signal is true;
	signal I810_1: std_logic; attribute dont_touch of I810_1: signal is true;
	signal I814_1: std_logic; attribute dont_touch of I814_1: signal is true;
	signal I829_1: std_logic; attribute dont_touch of I829_1: signal is true;
	signal I834_1: std_logic; attribute dont_touch of I834_1: signal is true;
	signal I840_1: std_logic; attribute dont_touch of I840_1: signal is true;
	signal I840_2: std_logic; attribute dont_touch of I840_2: signal is true;
	signal I850_1: std_logic; attribute dont_touch of I850_1: signal is true;
	signal I850_2: std_logic; attribute dont_touch of I850_2: signal is true;
	signal I857_1: std_logic; attribute dont_touch of I857_1: signal is true;
	signal I861_1: std_logic; attribute dont_touch of I861_1: signal is true;
	signal I861_2: std_logic; attribute dont_touch of I861_2: signal is true;
	signal I873_1: std_logic; attribute dont_touch of I873_1: signal is true;
	signal I881_1: std_logic; attribute dont_touch of I881_1: signal is true;
	signal I881_2: std_logic; attribute dont_touch of I881_2: signal is true;
	signal I892_1: std_logic; attribute dont_touch of I892_1: signal is true;
	signal I892_2: std_logic; attribute dont_touch of I892_2: signal is true;
	signal I896_1: std_logic; attribute dont_touch of I896_1: signal is true;
	signal I910_1: std_logic; attribute dont_touch of I910_1: signal is true;
	signal I963_1: std_logic; attribute dont_touch of I963_1: signal is true;
	signal I966_1: std_logic; attribute dont_touch of I966_1: signal is true;
	signal I1025_1: std_logic; attribute dont_touch of I1025_1: signal is true;
	signal I1028_1: std_logic; attribute dont_touch of I1028_1: signal is true;
	signal I1031_1: std_logic; attribute dont_touch of I1031_1: signal is true;
	signal I1034_1: std_logic; attribute dont_touch of I1034_1: signal is true;
	signal I1037_1: std_logic; attribute dont_touch of I1037_1: signal is true;
	signal I1040_1: std_logic; attribute dont_touch of I1040_1: signal is true;
	signal I1044_1: std_logic; attribute dont_touch of I1044_1: signal is true;
	signal I1047_1: std_logic; attribute dont_touch of I1047_1: signal is true;
	signal I1047_2: std_logic; attribute dont_touch of I1047_2: signal is true;
	signal I1056_1: std_logic; attribute dont_touch of I1056_1: signal is true;
	signal I1077_1: std_logic; attribute dont_touch of I1077_1: signal is true;
	signal I1080_1: std_logic; attribute dont_touch of I1080_1: signal is true;
	signal I1083_1: std_logic; attribute dont_touch of I1083_1: signal is true;
	signal I1087_1: std_logic; attribute dont_touch of I1087_1: signal is true;
	signal I1091_1: std_logic; attribute dont_touch of I1091_1: signal is true;
	signal I1094_1: std_logic; attribute dont_touch of I1094_1: signal is true;
	signal I1097_1: std_logic; attribute dont_touch of I1097_1: signal is true;
	signal I1100_1: std_logic; attribute dont_touch of I1100_1: signal is true;
	signal I1103_1: std_logic; attribute dont_touch of I1103_1: signal is true;
	signal I1103_2: std_logic; attribute dont_touch of I1103_2: signal is true;
	signal I1107_1: std_logic; attribute dont_touch of I1107_1: signal is true;
	signal I1110_1: std_logic; attribute dont_touch of I1110_1: signal is true;
	signal I1113_1: std_logic; attribute dont_touch of I1113_1: signal is true;
	signal I1118_1: std_logic; attribute dont_touch of I1118_1: signal is true;
	signal I1121_1: std_logic; attribute dont_touch of I1121_1: signal is true;
	signal I1121_2: std_logic; attribute dont_touch of I1121_2: signal is true;
	signal I1125_1: std_logic; attribute dont_touch of I1125_1: signal is true;
	signal I1128_1: std_logic; attribute dont_touch of I1128_1: signal is true;
	signal I1132_1: std_logic; attribute dont_touch of I1132_1: signal is true;
	signal I1132_2: std_logic; attribute dont_touch of I1132_2: signal is true;
	signal I1136_1: std_logic; attribute dont_touch of I1136_1: signal is true;
	signal I1140_1: std_logic; attribute dont_touch of I1140_1: signal is true;
	signal I1143_1: std_logic; attribute dont_touch of I1143_1: signal is true;
	signal I1143_2: std_logic; attribute dont_touch of I1143_2: signal is true;
	signal I1148_1: std_logic; attribute dont_touch of I1148_1: signal is true;
	signal I1151_1: std_logic; attribute dont_touch of I1151_1: signal is true;
	signal I1154_1: std_logic; attribute dont_touch of I1154_1: signal is true;
	signal I1157_1: std_logic; attribute dont_touch of I1157_1: signal is true;
	signal I1160_1: std_logic; attribute dont_touch of I1160_1: signal is true;
	signal I1163_1: std_logic; attribute dont_touch of I1163_1: signal is true;
	signal I1166_1: std_logic; attribute dont_touch of I1166_1: signal is true;
	signal I1166_2: std_logic; attribute dont_touch of I1166_2: signal is true;
	signal I1170_1: std_logic; attribute dont_touch of I1170_1: signal is true;
	signal I1173_1: std_logic; attribute dont_touch of I1173_1: signal is true;
	signal I1176_1: std_logic; attribute dont_touch of I1176_1: signal is true;
	signal I1176_2: std_logic; attribute dont_touch of I1176_2: signal is true;
	signal I1180_1: std_logic; attribute dont_touch of I1180_1: signal is true;
	signal I1180_2: std_logic; attribute dont_touch of I1180_2: signal is true;
	signal I1184_1: std_logic; attribute dont_touch of I1184_1: signal is true;
	signal I1184_2: std_logic; attribute dont_touch of I1184_2: signal is true;
	signal I1188_1: std_logic; attribute dont_touch of I1188_1: signal is true;
	signal I1188_2: std_logic; attribute dont_touch of I1188_2: signal is true;
	signal I1193_1: std_logic; attribute dont_touch of I1193_1: signal is true;
	signal I1196_1: std_logic; attribute dont_touch of I1196_1: signal is true;
	signal I1199_1: std_logic; attribute dont_touch of I1199_1: signal is true;
	signal I1199_2: std_logic; attribute dont_touch of I1199_2: signal is true;
	signal I1203_1: std_logic; attribute dont_touch of I1203_1: signal is true;
	signal I1203_2: std_logic; attribute dont_touch of I1203_2: signal is true;
	signal I1207_1: std_logic; attribute dont_touch of I1207_1: signal is true;
	signal I1210_1: std_logic; attribute dont_touch of I1210_1: signal is true;
	signal I1213_1: std_logic; attribute dont_touch of I1213_1: signal is true;
	signal I1216_1: std_logic; attribute dont_touch of I1216_1: signal is true;
	signal I1216_2: std_logic; attribute dont_touch of I1216_2: signal is true;
	signal STATE_0: std_logic; attribute dont_touch of STATE_0: signal is true;
	signal STATE_1: std_logic; attribute dont_touch of STATE_1: signal is true;
	signal STATE_2: std_logic; attribute dont_touch of STATE_2: signal is true;
	signal STATE_3: std_logic; attribute dont_touch of STATE_3: signal is true;
	signal STATE_4: std_logic; attribute dont_touch of STATE_4: signal is true;
	signal STATE_5: std_logic; attribute dont_touch of STATE_5: signal is true;
begin
	process(CLK)
	begin
		if(rising_edge(CLK)) then
			ACTBMHS1<=I9;
			ACTRTHS1<=I8;
			DUMPIHS1<=I30;
			GOBMHS1<=I11;
			GORTHS1<=I10;
			LDPROGHS1<=I29;
			LOADIHHS1<=I23;
			LOADOHHS1<=I22;
			LXHINHS1<=I20;
			MODE0HS1<=I14;
			MODE1HS1<=I15;
			MODE2HS1<=I16;
			NEWLINEHS1<=I17;
			NEWTRHS1<=I12;
			RERTTSHS1<=I13;
			REWHBUFHS1<=I28;
			SEFULLIHS1<=I26;
			SEFULLOHS1<=I25;
			SEOUTAVHS1<=I24;
			SHFTIRHS1<=I19;
			SHFTORHS1<=I18;
			STATE_0<=I7;
			STATE_1<=I6;
			STATE_2<=I5;
			STATE_3<=I4;
			STATE_4<=I3;
			STATE_5<=I2;
			TGWHBUFHS1<=I27;
			TXHINHS1<=I21;
		end if;
	end process;
	I7<= not I311;
	I10<= not I287;
	I13<= not I415;
	I16<= not I323;
	I17<= not I294;
	I18<= not I295;
	I20<= not I297;
	I23<= not I300;
	I26<= not I303;
	I263<= not RDY1RTHS1;
	I264<= not RDY2RTHS1;
	I265<= not RDY1BMHS1;
	I266<= not RDY2BMHS1;
	I267<= not INDONEHS1;
	I269<= not TPARRAYHS1;
	I271<= not WANTBMHS1;
	I272<= not WANTRTHS1;
	I274<= not FULLOHS1;
	I275<= not FULLIHS1;
	I276<= not STATE_5;
	I277<= not STATE_4;
	I278<= not STATE_3;
	I279<= not STATE_2;
	I280<= not STATE_1;
	I281<= not STATE_0;
	I282<= not PROG_2;
	I283<= not PROG_1;
	I284<= not PROG_0;
	I322<= not I323;
	I327<= not I326;
	I329<= not I328;
	I331<= not I330;
	I339<= not I338;
	I341<= not I340;
	I342<= not I343;
	I344<= not I345;
	I351<= not I350;
	I355<= not I354;
	I358<= not I359;
	I363<= not I362;
	I367<= not I366;
	I370<= not I371;
	I377<= not I376;
	I379<= not I378;
	I380<= not I381;
	I390<= not I391;
	I397<= not I396;
	I398<= not I399;
	I405<= not I404;
	I410<= not I411;
	I415<= not I414;
	I423<= not I422;
	I424<= not I425;
	I428<= not I429;
	I431<= not I430;
	I435<= not I434;
	I437<= not I436;
	I441<= not I440;
	I444<= not I445;
	I446<= not I447;
	I451<= not I450;
	I452<= not I453;
	I459<= not I458;
	I467<= not I466;
	I469<= not I468;
	I475<= not I474;
	I477<= not I476;
	I486<= not I487;
	I494<= not I495;
	I504<= not I505;
	I508<= not I509;
	I513<= not I512;
	I535<= not I534;
	I552<= not I553;
	I554<= not I555;
	I566<= not I567;
	I571<= not I570;
	I625<= not I624;
	I661<= not I660;
	I663<= not I662;
	I691<= not I690;
	I769<= not I768;
	I771<= not I770;
	I779<= not I778;
	I789_1<=I278 and I580;
	I810_1<=I364 and I562;
	I840_1<=I283 and I284;
	I840_2<=PROG_1 and PROG_0;
	I850_1<=I610 and I612;
	I850_2<=WANTRTHS1 and I614;
	I873_1<=I263 and I264;
	I910_1<=I277 and I360;
	I963_1<=I335 and I345;
	I966_1<=I335 and I357;
	I1025_1<=RDY2BMHS1 and I325;
	I1031_1<=I317 and I398;
	I1034_1<=I317 and I428;
	I1040_1<=OUTPUTHS1 and I322;
	I1044_1<=I497 and I570;
	I1056_1<=I280 and I358;
	I1077_1<=I458 and I512;
	I1080_1<=PROG_0 and I382;
	I1083_1<=I458 and I506;
	I1094_1<=WANTRTHS1 and I582;
	I1097_1<=I317 and I556;
	I1100_1<=WANTBMHS1 and I384;
	I1103_1<=STATE_5 and I418;
	I1103_2<=PROG_0 and I322;
	I1107_1<=I284 and I382;
	I1110_1<=I277 and I388;
	I1128_1<=I378 and I568;
	I1136_1<=I282 and I590;
	I1140_1<=I271 and I573;
	I1143_1<=I353 and I404;
	I1143_2<=I274 and I596;
	I1160_1<=I281 and I412;
	I1163_1<=I345 and I531;
	I1166_1<=I357 and I529;
	I1166_2<=PROG_2 and I452;
	I1170_1<=I393 and I414;
	I1173_1<=I263 and I466;
	I1176_1<=STATE_4 and I566;
	I1176_2<=PROG_0 and I600;
	I1180_1<=I267 and I322;
	I1180_2<=I348 and I554;
	I1184_1<=I486 and I506;
	I1184_2<=I269 and I376;
	I1188_1<=STATE_1 and I376;
	I1188_2<=I267 and I388;
	I1193_1<=I424 and I521;
	I1196_1<=I345 and I418;
	I1199_1<=I338 and I364;
	I1199_2<=I267 and I380;
	I2<= not (I711 and I771 and I769);
	I3<= not (I721 and I723);
	I4<= not (I725 and I381 and I551);
	I5<= not (I733 and I729 and I731 and I397);
	I6<= not (I377 and I779 and I777);
	I8<= not (I655 and I657);
	I9<= not (I377 and I661 and I659);
	I11<= not (I475 and I669 and I667);
	I12<= not (I377 and I469);
	I14<= not (I671 and I673);
	I15<= not (I796_1 and I675);
	I19<= not (I371 and I323);
	I21<= not (I689 and I693 and I691);
	I22<= not (I699 and I695 and I697 and I481);
	I25<= not (I814_1 and I767);
	I30<= not (I829_1 and I351);
	I317<= not (FULLOHS1 and FULLIHS1);
	I318<= not (I834_1 and I277);
	I320<= not (I495 and I511);
	I323<= not (STATE_4 and I281 and I436);
	I330<= not (WANTBMHS1 and I493);
	I335<= not (I277 and I282);
	I336<= not (I473 and I357);
	I338<= not (I857_1 and I439);
	I340<= not (I861_1 and I861_2);
	I343<= not (I276 and I394 and I482);
	I345<= not (RDY1RTHS1 and RDY2RTHS1);
	I357<= not (RDY1BMHS1 and RDY2BMHS1);
	I359<= not (RDY1RTHS1 and I432 and I532);
	I360<= not (I881_1 and I881_2);
	I371<= not (I279 and I382);
	I372<= not (I892_1 and I892_2);
	I374<= not (I896_1 and I461);
	I381<= not (STATE_3 and I396);
	I393<= not (I282 and I283);
	I399<= not (I284 and I436);
	I403<= not (I634 and I434 and I494);
	I407<= not (I412 and I532);
	I411<= not (I279 and PROG_0 and I416);
	I421<= not (I274 and I422);
	I425<= not (STATE_2 and I281 and I508);
	I429<= not (PROG_0 and I450);
	I439<= not (PROG_0 and I514);
	I445<= not (I374 and I534);
	I447<= not (RDY2RTHS1 and I362);
	I449<= not (STATE_1 and I318 and I450);
	I453<= not (I277 and I327 and I504);
	I455<= not (I264 and I512);
	I457<= not (I266 and I506);
	I461<= not (I282 and I506);
	I473<= not (I265 and I266);
	I479<= not (I279 and I486);
	I481<= not (I372 and I486);
	I485<= not (I277 and I548);
	I487<= not (STATE_3 and I508);
	I489<= not (I506 and I570);
	I491<= not (STATE_5 and I548);
	I493<= not (RDY1BMHS1 and I266);
	I495<= not (I280 and I281);
	I497<= not (I455 and I457);
	I503<= not (I277 and I504);
	I505<= not (I279 and I570);
	I509<= not (I276 and I277);
	I511<= not (STATE_1 and STATE_0);
	I517<= not (I264 and I358);
	I519<= not (RDY2BMHS1 and WANTBMHS1);
	I521<= not (RTTSHS1 and I278);
	I523<= not (I274 and PROG_2);
	I525<= not (I277 and I280);
	I529<= not (I399 and I489);
	I531<= not (I429 and I491);
	I537<= not (I263 and RDY2RTHS1);
	I539<= not (I263 and I274);
	I543<= not (I265 and RDY2BMHS1);
	I545<= not (I272 and I362);
	I547<= not (WANTRTHS1 and I446);
	I551<= not (I279 and I442);
	I553<= not (STATE_1 and I500);
	I556<= not (I1028_1 and I355);
	I562<= not (I1037_1 and I439);
	I568<= not (I1047_1 and I1047_2);
	I573<= not (I517 and I545);
	I575<= not (I271 and I284);
	I577<= not (STATE_0 and I318 and I436);
	I585<= not (I353 and I422);
	I587<= not (PROG_0 and I317);
	I589<= not (PROG_2 and I482);
	I593<= not (I284 and I430);
	I595<= not (RDY2BMHS1 and I274);
	I599<= not (I275 and I354);
	I609<= not (I265 and I434);
	I660<= not (I1087_1 and I469);
	I662<= not (I1091_1 and I329);
	I676<= not (I1113_1 and I343);
	I678<= not (I329 and I423);
	I680<= not (I445 and I381);
	I682<= not (I1118_1 and I323);
	I684<= not (I1121_1 and I1121_2);
	I686<= not (I1125_1 and I441);
	I690<= not (I1132_1 and I1132_2);
	I700<= not (I403 and I351);
	I702<= not (I1148_1 and I481);
	I704<= not (I1151_1 and I329);
	I706<= not (I1154_1 and I403);
	I708<= not (I1157_1 and I351);
	I738<= not (I1203_1 and I1203_2);
	I740<= not (I1207_1 and I477);
	I742<= not (I1210_1 and I551);
	I744<= not (I1213_1 and I553);
	I746<= not (I1216_1 and I1216_2);
	I750<= not (I665 and I663);
	I768<= not (I719 and I717);
	I770<= not (I715 and I713);
	I778<= not (I737 and I735);
	I796_1<=I283 or I323;
	I814_1<=FULLOHS1 or I355;
	I829_1<=I547 or I575;
	I834_1<=FULLIHS1 or I523;
	I857_1<=PROG_0 or I493;
	I861_1<=I263 or I455;
	I861_2<=I265 or I457;
	I881_1<=INDONEHS1 or PROG_2;
	I881_2<=I282 or I326;
	I892_1<=I279 or I495;
	I892_2<=I269 or I625;
	I896_1<=I279 or I320;
	I1028_1<=I367 or I493;
	I1037_1<=PROG_0 or I336;
	I1047_1<=I264 or I284;
	I1047_2<=RDY1BMHS1 or PROG_0;
	I1087_1<=PROG_0 or I526;
	I1091_1<=I585 or I587;
	I1113_1<=I282 or I415;
	I1118_1<=STATE_1 or I479;
	I1121_1<=STATE_0 or I589;
	I1121_2<=RDY2BMHS1 or I559;
	I1125_1<=RDY2RTHS1 or I561;
	I1132_1<=I593 or I595;
	I1132_2<=I281 or I467;
	I1148_1<=I267 or I565;
	I1151_1<=I405 or I537;
	I1154_1<=I267 or I371;
	I1157_1<=I274 or I599;
	I1203_1<=I463 or I491;
	I1203_2<=I543 or I577;
	I1207_1<=I519 or I579;
	I1210_1<=I339 or I421;
	I1213_1<=I498 or I547;
	I1216_1<=I449 or I537;
	I1216_2<=I465 or I489;
	I24<= not (OUTAVHS1 or I326);
	I27<= not (OUTAVHS1 or I275);
	I28<= not (OUTAVHS1 or FULLIHS1);
	I29<= not (I278 or STATE_2 or I441);
	I287<= not (I750 or I789_1);
	I294<= not (I408 or I678 or I676);
	I295<= not (I376 or I682 or I680);
	I297<= not (I376 or I686 or I684);
	I300<= not (I700 or I810_1);
	I303<= not (I706 or I708);
	I311<= not (I742 or I746 or I744);
	I315<= not (I272 or I514);
	I325<= not (I840_1 or I840_2);
	I326<= not (FULLOHS1 or FULLIHS1);
	I328<= not (I609 or I511 or I539);
	I333<= not (I850_1 or I850_2);
	I347<= not (STATE_3 or I394);
	I348<= not (I315 or I363);
	I350<= not (I325 or I477);
	I353<= not (I344 or I873_1);
	I354<= not (I367 or I543);
	I362<= not (STATE_0 or I407);
	I364<= not (I274 or I379 or I525);
	I366<= not (STATE_0 or I335 or I399);
	I376<= not (I281 or I479);
	I378<= not (FULLIHS1 or I431);
	I382<= not (I276 or PROG_2 or I485);
	I384<= not (I315 or I407 or I493);
	I386<= not (STATE_2 or I280);
	I388<= not (I320 or I459);
	I391<= not (STATE_2 or I910_1);
	I394<= not (STATE_0 or I327 or I357);
	I396<= not (I280 or I425);
	I404<= not (I284 or I421);
	I408<= not (I341 or I435 or I523);
	I412<= not (I282 or I437);
	I414<= not (STATE_1 or I425 or I521);
	I416<= not (I461 or I535);
	I418<= not (I279 or I485);
	I422<= not (I431 or I525);
	I430<= not (PROG_2 or I451);
	I432<= not (I282 or I451);
	I434<= not (FULLIHS1 or I503);
	I436<= not (STATE_1 or I505);
	I440<= not (I495 or I509);
	I442<= not (STATE_1 or I347 or I509);
	I450<= not (STATE_0 or I505);
	I458<= not (I279 or I571);
	I463<= not (I390 or I963_1);
	I465<= not (I390 or I966_1);
	I466<= not (RDY1BMHS1 or I503);
	I468<= not (STATE_0 or I386 or I487);
	I470<= not (I320 or I335 or I571);
	I474<= not (I493 or I577);
	I476<= not (I519 or I545);
	I482<= not (STATE_3 or STATE_2 or I525);
	I498<= not (I271 or I473);
	I500<= not (I281 or I453);
	I506<= not (STATE_1 or I281);
	I512<= not (I280 or STATE_0);
	I514<= not (I263 or RDY2RTHS1);
	I526<= not (I370 or I416);
	I532<= not (STATE_4 or I327);
	I534<= not (STATE_4 or I571);
	I540<= not (RDY2RTHS1 or I263 or I449);
	I548<= not (STATE_3 or I513);
	I555<= not (I330 or I1025_1);
	I559<= not (I412 or I1031_1);
	I561<= not (I432 or I1034_1);
	I565<= not (I444 or I1040_1);
	I567<= not (I388 or I1044_1);
	I570<= not (I276 or STATE_3);
	I579<= not (I446 or I1056_1);
	I580<= not (I345 or I397);
	I582<= not (I331 or I517);
	I590<= not (I429 or I539);
	I596<= not (I336 or I367);
	I600<= not (I331 or I447);
	I610<= not (PROG_2 or I284);
	I612<= not (RDY1RTHS1 or I274);
	I614<= not (I523 or I575);
	I624<= not (STATE_2 or I511);
	I634<= not (I264 or I333);
	I655<= not (I322 or I1077_1);
	I657<= not (I410 or I1080_1);
	I659<= not (I322 or I1083_1);
	I665<= not (I540 or I1094_1);
	I667<= not (I328 or I1097_1);
	I669<= not (I342 or I1100_1);
	I671<= not (I1103_1 or I1103_2);
	I673<= not (I410 or I1107_1);
	I675<= not (I470 or I1110_1);
	I689<= not (I440 or I1128_1);
	I693<= not (I376 or I1136_1);
	I695<= not (I408 or I328);
	I697<= not (I384 or I1140_1);
	I699<= not (I1143_1 or I1143_2);
	I711<= not (I388 or I1160_1);
	I713<= not (I470 or I1163_1);
	I715<= not (I1166_1 or I1166_2);
	I717<= not (I322 or I1170_1);
	I719<= not (I500 or I1173_1);
	I721<= not (I1176_1 or I1176_2);
	I723<= not (I1180_1 or I1180_2);
	I725<= not (I1184_1 or I1184_2);
	I729<= not (I1188_1 or I1188_2);
	I731<= not (I540 or I474);
	I733<= not (I342 or I1193_1);
	I735<= not (I552 or I1196_1);
	I737<= not (I1199_1 or I1199_2);
	I767<= not (I704 or I702);
	I777<= not (I740 or I738);
end RTL;
