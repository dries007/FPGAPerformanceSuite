-- File created by Bench2VHDL
-- Name: s298
-- File: bench/s298.bench
-- Timestamp: 2019-05-21T22:08:28.082200
--
-- Original File
-- =============
--	# s298
--	# 3 inputs
--	# 6 outputs
--	# 14 D-type flipflops
--	# 44 inverters
--	# 75 gates (31 ANDs + 9 NANDs + 16 ORs + 19 NORs)
--	
--	INPUT(G0)
--	INPUT(G1)
--	INPUT(G2)
--	
--	OUTPUT(G117)
--	OUTPUT(G132)
--	OUTPUT(G66)
--	OUTPUT(G118)
--	OUTPUT(G133)
--	OUTPUT(G67)
--	
--	G10 = DFF(G29)
--	G11 = DFF(G30)
--	G12 = DFF(G34)
--	G13 = DFF(G39)
--	G14 = DFF(G44)
--	G15 = DFF(G56)
--	G16 = DFF(G86)
--	G17 = DFF(G92)
--	G18 = DFF(G98)
--	G19 = DFF(G102)
--	G20 = DFF(G107)
--	G21 = DFF(G113)
--	G22 = DFF(G119)
--	G23 = DFF(G125)
--	
--	G28 = NOT(G130)
--	G38 = NOT(G10)
--	G40 = NOT(G13)
--	G45 = NOT(G12)
--	G46 = NOT(G11)
--	G50 = NOT(G14)
--	G51 = NOT(G23)
--	G54 = NOT(G11)
--	G55 = NOT(G13)
--	G59 = NOT(G12)
--	G60 = NOT(G22)
--	G64 = NOT(G15)
--	I155 = NOT(G16)
--	G66 = NOT(I155)
--	I158 = NOT(G17)
--	G67 = NOT(I158)
--	G76 = NOT(G10)
--	G82 = NOT(G11)
--	G87 = NOT(G16)
--	G91 = NOT(G12)
--	G93 = NOT(G17)
--	G96 = NOT(G14)
--	G99 = NOT(G18)
--	G103 = NOT(G13)
--	G108 = NOT(G112)
--	G114 = NOT(G21)
--	I210 = NOT(G18)
--	G117 = NOT(I210)
--	I213 = NOT(G19)
--	G118 = NOT(I213)
--	G120 = NOT(G124)
--	G121 = NOT(G22)
--	I221 = NOT(G2)
--	G124 = NOT(I221)
--	G126 = NOT(G131)
--	G127 = NOT(G23)
--	I229 = NOT(G0)
--	G130 = NOT(I229)
--	I232 = NOT(G1)
--	G131 = NOT(I232)
--	I235 = NOT(G20)
--	G132 = NOT(I235)
--	I238 = NOT(G21)
--	G133 = NOT(I238)
--	
--	G26 = AND(G28, G50)
--	G27 = AND(G51, G28)
--	G31 = AND(G10, G45, G13)
--	G32 = AND(G10, G11)
--	G33 = AND(G38, G46)
--	G35 = AND(G10, G11, G12)
--	G36 = AND(G38, G45)
--	G37 = AND(G46, G45)
--	G42 = AND(G40, G41)
--	G48 = AND(G45, G46, G10, G47)
--	G49 = AND(G50, G51, G52)
--	G57 = AND(G59, G11, G60, G61)
--	G58 = AND(G64, G65)
--	G62 = AND(G59, G11, G60, G61)
--	G63 = AND(G64, G65)
--	G74 = AND(G12, G14, G19)
--	G75 = AND(G82, G91, G14)
--	G88 = AND(G14, G87)
--	G89 = AND(G103, G96)
--	G90 = AND(G91, G103)
--	G94 = AND(G93, G13)
--	G95 = AND(G96, G13)
--	G100 = AND(G99, G14, G12)
--	G105 = AND(G103, G108, G104)
--	G110 = AND(G108, G109)
--	G111 = AND(G10, G112)
--	G115 = AND(G114, G14)
--	G122 = AND(G120, G121)
--	G123 = AND(G124, G22)
--	G128 = AND(G126, G127)
--	G129 = AND(G131, G23)
--	
--	G24 = OR(G38, G46, G45, G40)
--	G25 = OR(G38, G11, G12)
--	G68 = OR(G11, G12, G13, G96)
--	G69 = OR(G103, G18)
--	G70 = OR(G103, G14)
--	G71 = OR(G82, G12, G13)
--	G72 = OR(G91, G20)
--	G73 = OR(G103, G20)
--	G77 = OR(G112, G103, G96, G19)
--	G78 = OR(G108, G76)
--	G79 = OR(G103, G14)
--	G80 = OR(G11, G14)
--	G81 = OR(G12, G13)
--	G83 = OR(G11, G12, G13, G96)
--	G84 = OR(G82, G91, G14)
--	G85 = OR(G91, G96, G17)
--	
--	G41 = NAND(G12, G11, G10)
--	G43 = NAND(G24, G25, G28)
--	G52 = NAND(G13, G45, G46, G10)
--	G65 = NAND(G59, G54, G22, G61)
--	G97 = NAND(G83, G84, G85, G108)
--	G101 = NAND(G68, G69, G70, G108)
--	G106 = NAND(G77, G78)
--	G109 = NAND(G71, G72, G73, G14)
--	G116 = NAND(G79, G80, G81, G108)
--	
--	G29 = NOR(G10, G130)
--	G30 = NOR(G31, G32, G33, G130)
--	G34 = NOR(G35, G36, G37, G130)
--	G39 = NOR(G42, G43)
--	G44 = NOR(G48, G49, G53)
--	G47 = NOR(G50, G40)
--	G53 = NOR(G26, G27)
--	G56 = NOR(G57, G58, G130)
--	G61 = NOR(G14, G55)
--	G86 = NOR(G88, G89, G90, G112)
--	G92 = NOR(G94, G95, G97)
--	G98 = NOR(G100, G101)
--	G102 = NOR(G105, G106)
--	G104 = NOR(G74, G75)
--	G107 = NOR(G110, G111)
--	G112 = NOR(G62, G63)
--	G113 = NOR(G115, G116)
--	G119 = NOR(G122, G123, G130)
--	G125 = NOR(G128, G129, G130)
--
-- VHDL Output
-- =============
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity s298 is
	port (
		CLK: in std_logic;
		G0: in std_logic;
		G1: in std_logic;
		G2: in std_logic;
		G66: out std_logic;
		G67: out std_logic;
		G117: out std_logic;
		G118: out std_logic;
		G132: out std_logic;
		G133: out std_logic
	);
end entity;

architecture RTL of s298 is
	attribute dont_touch: boolean;

	signal G10: std_logic; attribute dont_touch of G10: signal is true;
	signal G11: std_logic; attribute dont_touch of G11: signal is true;
	signal G12: std_logic; attribute dont_touch of G12: signal is true;
	signal G13: std_logic; attribute dont_touch of G13: signal is true;
	signal G14: std_logic; attribute dont_touch of G14: signal is true;
	signal G15: std_logic; attribute dont_touch of G15: signal is true;
	signal G16: std_logic; attribute dont_touch of G16: signal is true;
	signal G17: std_logic; attribute dont_touch of G17: signal is true;
	signal G18: std_logic; attribute dont_touch of G18: signal is true;
	signal G19: std_logic; attribute dont_touch of G19: signal is true;
	signal G20: std_logic; attribute dont_touch of G20: signal is true;
	signal G21: std_logic; attribute dont_touch of G21: signal is true;
	signal G22: std_logic; attribute dont_touch of G22: signal is true;
	signal G23: std_logic; attribute dont_touch of G23: signal is true;
	signal G24: std_logic; attribute dont_touch of G24: signal is true;
	signal G25: std_logic; attribute dont_touch of G25: signal is true;
	signal G26: std_logic; attribute dont_touch of G26: signal is true;
	signal G27: std_logic; attribute dont_touch of G27: signal is true;
	signal G28: std_logic; attribute dont_touch of G28: signal is true;
	signal G29: std_logic; attribute dont_touch of G29: signal is true;
	signal G30: std_logic; attribute dont_touch of G30: signal is true;
	signal G31: std_logic; attribute dont_touch of G31: signal is true;
	signal G32: std_logic; attribute dont_touch of G32: signal is true;
	signal G33: std_logic; attribute dont_touch of G33: signal is true;
	signal G34: std_logic; attribute dont_touch of G34: signal is true;
	signal G35: std_logic; attribute dont_touch of G35: signal is true;
	signal G36: std_logic; attribute dont_touch of G36: signal is true;
	signal G37: std_logic; attribute dont_touch of G37: signal is true;
	signal G38: std_logic; attribute dont_touch of G38: signal is true;
	signal G39: std_logic; attribute dont_touch of G39: signal is true;
	signal G40: std_logic; attribute dont_touch of G40: signal is true;
	signal G41: std_logic; attribute dont_touch of G41: signal is true;
	signal G42: std_logic; attribute dont_touch of G42: signal is true;
	signal G43: std_logic; attribute dont_touch of G43: signal is true;
	signal G44: std_logic; attribute dont_touch of G44: signal is true;
	signal G45: std_logic; attribute dont_touch of G45: signal is true;
	signal G46: std_logic; attribute dont_touch of G46: signal is true;
	signal G47: std_logic; attribute dont_touch of G47: signal is true;
	signal G48: std_logic; attribute dont_touch of G48: signal is true;
	signal G49: std_logic; attribute dont_touch of G49: signal is true;
	signal G50: std_logic; attribute dont_touch of G50: signal is true;
	signal G51: std_logic; attribute dont_touch of G51: signal is true;
	signal G52: std_logic; attribute dont_touch of G52: signal is true;
	signal G53: std_logic; attribute dont_touch of G53: signal is true;
	signal G54: std_logic; attribute dont_touch of G54: signal is true;
	signal G55: std_logic; attribute dont_touch of G55: signal is true;
	signal G56: std_logic; attribute dont_touch of G56: signal is true;
	signal G57: std_logic; attribute dont_touch of G57: signal is true;
	signal G58: std_logic; attribute dont_touch of G58: signal is true;
	signal G59: std_logic; attribute dont_touch of G59: signal is true;
	signal G60: std_logic; attribute dont_touch of G60: signal is true;
	signal G61: std_logic; attribute dont_touch of G61: signal is true;
	signal G62: std_logic; attribute dont_touch of G62: signal is true;
	signal G63: std_logic; attribute dont_touch of G63: signal is true;
	signal G64: std_logic; attribute dont_touch of G64: signal is true;
	signal G65: std_logic; attribute dont_touch of G65: signal is true;
	signal G68: std_logic; attribute dont_touch of G68: signal is true;
	signal G69: std_logic; attribute dont_touch of G69: signal is true;
	signal G70: std_logic; attribute dont_touch of G70: signal is true;
	signal G71: std_logic; attribute dont_touch of G71: signal is true;
	signal G72: std_logic; attribute dont_touch of G72: signal is true;
	signal G73: std_logic; attribute dont_touch of G73: signal is true;
	signal G74: std_logic; attribute dont_touch of G74: signal is true;
	signal G75: std_logic; attribute dont_touch of G75: signal is true;
	signal G76: std_logic; attribute dont_touch of G76: signal is true;
	signal G77: std_logic; attribute dont_touch of G77: signal is true;
	signal G78: std_logic; attribute dont_touch of G78: signal is true;
	signal G79: std_logic; attribute dont_touch of G79: signal is true;
	signal G80: std_logic; attribute dont_touch of G80: signal is true;
	signal G81: std_logic; attribute dont_touch of G81: signal is true;
	signal G82: std_logic; attribute dont_touch of G82: signal is true;
	signal G83: std_logic; attribute dont_touch of G83: signal is true;
	signal G84: std_logic; attribute dont_touch of G84: signal is true;
	signal G85: std_logic; attribute dont_touch of G85: signal is true;
	signal G86: std_logic; attribute dont_touch of G86: signal is true;
	signal G87: std_logic; attribute dont_touch of G87: signal is true;
	signal G88: std_logic; attribute dont_touch of G88: signal is true;
	signal G89: std_logic; attribute dont_touch of G89: signal is true;
	signal G90: std_logic; attribute dont_touch of G90: signal is true;
	signal G91: std_logic; attribute dont_touch of G91: signal is true;
	signal G92: std_logic; attribute dont_touch of G92: signal is true;
	signal G93: std_logic; attribute dont_touch of G93: signal is true;
	signal G94: std_logic; attribute dont_touch of G94: signal is true;
	signal G95: std_logic; attribute dont_touch of G95: signal is true;
	signal G96: std_logic; attribute dont_touch of G96: signal is true;
	signal G97: std_logic; attribute dont_touch of G97: signal is true;
	signal G98: std_logic; attribute dont_touch of G98: signal is true;
	signal G99: std_logic; attribute dont_touch of G99: signal is true;
	signal G100: std_logic; attribute dont_touch of G100: signal is true;
	signal G101: std_logic; attribute dont_touch of G101: signal is true;
	signal G102: std_logic; attribute dont_touch of G102: signal is true;
	signal G103: std_logic; attribute dont_touch of G103: signal is true;
	signal G104: std_logic; attribute dont_touch of G104: signal is true;
	signal G105: std_logic; attribute dont_touch of G105: signal is true;
	signal G106: std_logic; attribute dont_touch of G106: signal is true;
	signal G107: std_logic; attribute dont_touch of G107: signal is true;
	signal G108: std_logic; attribute dont_touch of G108: signal is true;
	signal G109: std_logic; attribute dont_touch of G109: signal is true;
	signal G110: std_logic; attribute dont_touch of G110: signal is true;
	signal G111: std_logic; attribute dont_touch of G111: signal is true;
	signal G112: std_logic; attribute dont_touch of G112: signal is true;
	signal G113: std_logic; attribute dont_touch of G113: signal is true;
	signal G114: std_logic; attribute dont_touch of G114: signal is true;
	signal G115: std_logic; attribute dont_touch of G115: signal is true;
	signal G116: std_logic; attribute dont_touch of G116: signal is true;
	signal G119: std_logic; attribute dont_touch of G119: signal is true;
	signal G120: std_logic; attribute dont_touch of G120: signal is true;
	signal G121: std_logic; attribute dont_touch of G121: signal is true;
	signal G122: std_logic; attribute dont_touch of G122: signal is true;
	signal G123: std_logic; attribute dont_touch of G123: signal is true;
	signal G124: std_logic; attribute dont_touch of G124: signal is true;
	signal G125: std_logic; attribute dont_touch of G125: signal is true;
	signal G126: std_logic; attribute dont_touch of G126: signal is true;
	signal G127: std_logic; attribute dont_touch of G127: signal is true;
	signal G128: std_logic; attribute dont_touch of G128: signal is true;
	signal G129: std_logic; attribute dont_touch of G129: signal is true;
	signal G130: std_logic; attribute dont_touch of G130: signal is true;
	signal G131: std_logic; attribute dont_touch of G131: signal is true;
	signal I155: std_logic; attribute dont_touch of I155: signal is true;
	signal I158: std_logic; attribute dont_touch of I158: signal is true;
	signal I210: std_logic; attribute dont_touch of I210: signal is true;
	signal I213: std_logic; attribute dont_touch of I213: signal is true;
	signal I221: std_logic; attribute dont_touch of I221: signal is true;
	signal I229: std_logic; attribute dont_touch of I229: signal is true;
	signal I232: std_logic; attribute dont_touch of I232: signal is true;
	signal I235: std_logic; attribute dont_touch of I235: signal is true;
	signal I238: std_logic; attribute dont_touch of I238: signal is true;
begin
	process(CLK)
	begin
		if(rising_edge(CLK)) then
			G10<=G29;
			G11<=G30;
			G12<=G34;
			G13<=G39;
			G14<=G44;
			G15<=G56;
			G16<=G86;
			G17<=G92;
			G18<=G98;
			G19<=G102;
			G20<=G107;
			G21<=G113;
			G22<=G119;
			G23<=G125;
		end if;
	end process;
	G28<= not G130;
	G38<= not G10;
	G40<= not G13;
	G45<= not G12;
	G46<= not G11;
	G50<= not G14;
	G51<= not G23;
	G54<= not G11;
	G55<= not G13;
	G59<= not G12;
	G60<= not G22;
	G64<= not G15;
	G66<= not I155;
	G67<= not I158;
	G76<= not G10;
	G82<= not G11;
	G87<= not G16;
	G91<= not G12;
	G93<= not G17;
	G96<= not G14;
	G99<= not G18;
	G103<= not G13;
	G108<= not G112;
	G114<= not G21;
	G117<= not I210;
	G118<= not I213;
	G120<= not G124;
	G121<= not G22;
	G124<= not I221;
	G126<= not G131;
	G127<= not G23;
	G130<= not I229;
	G131<= not I232;
	G132<= not I235;
	G133<= not I238;
	I155<= not G16;
	I158<= not G17;
	I210<= not G18;
	I213<= not G19;
	I221<= not G2;
	I229<= not G0;
	I232<= not G1;
	I235<= not G20;
	I238<= not G21;
	G26<=G28 and G50;
	G27<=G51 and G28;
	G31<=G10 and G45 and G13;
	G32<=G10 and G11;
	G33<=G38 and G46;
	G35<=G10 and G11 and G12;
	G36<=G38 and G45;
	G37<=G46 and G45;
	G42<=G40 and G41;
	G48<=G45 and G46 and G10 and G47;
	G49<=G50 and G51 and G52;
	G57<=G59 and G11 and G60 and G61;
	G58<=G64 and G65;
	G62<=G59 and G11 and G60 and G61;
	G63<=G64 and G65;
	G74<=G12 and G14 and G19;
	G75<=G82 and G91 and G14;
	G88<=G14 and G87;
	G89<=G103 and G96;
	G90<=G91 and G103;
	G94<=G93 and G13;
	G95<=G96 and G13;
	G100<=G99 and G14 and G12;
	G105<=G103 and G108 and G104;
	G110<=G108 and G109;
	G111<=G10 and G112;
	G115<=G114 and G14;
	G122<=G120 and G121;
	G123<=G124 and G22;
	G128<=G126 and G127;
	G129<=G131 and G23;
	G41<= not (G12 and G11 and G10);
	G43<= not (G24 and G25 and G28);
	G52<= not (G13 and G45 and G46 and G10);
	G65<= not (G59 and G54 and G22 and G61);
	G97<= not (G83 and G84 and G85 and G108);
	G101<= not (G68 and G69 and G70 and G108);
	G106<= not (G77 and G78);
	G109<= not (G71 and G72 and G73 and G14);
	G116<= not (G79 and G80 and G81 and G108);
	G24<=G38 or G46 or G45 or G40;
	G25<=G38 or G11 or G12;
	G68<=G11 or G12 or G13 or G96;
	G69<=G103 or G18;
	G70<=G103 or G14;
	G71<=G82 or G12 or G13;
	G72<=G91 or G20;
	G73<=G103 or G20;
	G77<=G112 or G103 or G96 or G19;
	G78<=G108 or G76;
	G79<=G103 or G14;
	G80<=G11 or G14;
	G81<=G12 or G13;
	G83<=G11 or G12 or G13 or G96;
	G84<=G82 or G91 or G14;
	G85<=G91 or G96 or G17;
	G29<= not (G10 or G130);
	G30<= not (G31 or G32 or G33 or G130);
	G34<= not (G35 or G36 or G37 or G130);
	G39<= not (G42 or G43);
	G44<= not (G48 or G49 or G53);
	G47<= not (G50 or G40);
	G53<= not (G26 or G27);
	G56<= not (G57 or G58 or G130);
	G61<= not (G14 or G55);
	G86<= not (G88 or G89 or G90 or G112);
	G92<= not (G94 or G95 or G97);
	G98<= not (G100 or G101);
	G102<= not (G105 or G106);
	G104<= not (G74 or G75);
	G107<= not (G110 or G111);
	G112<= not (G62 or G63);
	G113<= not (G115 or G116);
	G119<= not (G122 or G123 or G130);
	G125<= not (G128 or G129 or G130);
end RTL;
