-- File created by Bench2VHDL
-- Name: s444
-- File: bench/s444.bench
-- Timestamp: 2019-05-21T22:08:28.054099
--
-- Original File
-- =============
--	# s444
--	# 3 inputs
--	# 6 outputs
--	# 21 D-type flipflops
--	# 62 inverters
--	# 119 gates (13 ANDs + 58 NANDs + 14 ORs + 34 NORs)
--	
--	INPUT(G0)
--	INPUT(G1)
--	INPUT(G2)
--	
--	OUTPUT(G118)
--	OUTPUT(G167)
--	OUTPUT(G107)
--	OUTPUT(G119)
--	OUTPUT(G168)
--	OUTPUT(G108)
--	
--	G11 = DFF(G37)
--	G12 = DFF(G41)
--	G13 = DFF(G45)
--	G14 = DFF(G49)
--	G15 = DFF(G58)
--	G16 = DFF(G62)
--	G17 = DFF(G66)
--	G18 = DFF(G70)
--	G19 = DFF(G80)
--	G20 = DFF(G84)
--	G21 = DFF(G88)
--	G22 = DFF(G92)
--	G23 = DFF(G101)
--	G24 = DFF(G162BF)
--	G25 = DFF(G109)
--	G26 = DFF(G110)
--	G27 = DFF(G111)
--	G28 = DFF(G112)
--	G29 = DFF(G113)
--	G30 = DFF(G114)
--	G31 = DFF(G155)
--	
--	I372 = NOT(G0)
--	I382 = NOT(G1)
--	I318 = NOT(G2)
--	G34 = NOT(G11)
--	I180 = NOT(G11)
--	G35 = NOT(G12)
--	G77 = NOT(G20)
--	G135 = NOT(G20)
--	G36 = NOT(G13)
--	G78 = NOT(G21)
--	G144 = NOT(G21)
--	G32 = NOT(G14)
--	G74 = NOT(G22)
--	G142 = NOT(G22)
--	I392 = NOT(G30)
--	G55 = NOT(G15)
--	G102 = NOT(G23)
--	G136 = NOT(G23)
--	G156 = NOT(G31)
--	G56 = NOT(G16)
--	G143 = NOT(G24)
--	G161 = NOT(G17)
--	I321 = NOT(G25)
--	G53 = NOT(G18)
--	I324 = NOT(G26)
--	G76 = NOT(G19)
--	G150 = NOT(G19)
--	I336 = NOT(G27)
--	G119 = NOT(G28)
--	G167 = NOT(G29)
--	G152 = NOT(I372)
--	G160 = NOT(I382)
--	G106 = NOT(I318)
--	G43 = NOT(G34)
--	I182 = NOT(I180)
--	G168 = NOT(I392)
--	G107 = NOT(I321)
--	G108 = NOT(I324)
--	G118 = NOT(I336)
--	G99 = NOT(G152)
--	G139 = NOT(G152)
--	G153 = NOT(G152)
--	G157 = NOT(G160)
--	G103 = NOT(G106)
--	G38 = NOT(G40)
--	G60 = NOT(G57)
--	G79 = NOT(G97)
--	G42 = NOT(G44)
--	G46 = NOT(G48)
--	I105 = NOT(G162)
--	G166 = NOT(G162)
--	G50 = NOT(G52)
--	G82 = NOT(G79)
--	G162BF = NOT(I105)
--	G59 = NOT(G61)
--	G63 = NOT(G65)
--	G67 = NOT(G69)
--	G71 = NOT(G73)
--	G81 = NOT(G83)
--	G85 = NOT(G87)
--	G89 = NOT(G91)
--	G94 = NOT(G96)
--	
--	G122 = AND(G24, G121)
--	G124 = AND(G139, G22, G150)
--	G125 = AND(G139, G20, G19)
--	G126 = AND(G139, G21)
--	G127 = AND(G139, G24)
--	G154 = AND(G158, G159)
--	G100 = AND(G104, G105)
--	G155 = AND(G154, G153)
--	G101 = AND(G100, G99)
--	G115 = AND(G161, G117, G162)
--	G163 = AND(G161, G165, G162)
--	G116 = AND(G117, G166)
--	G164 = AND(G165, G166)
--	
--	G141 = OR(G24, G22, G21)
--	G137 = OR(G136, G20, G19)
--	G138 = OR(G136, G142)
--	G140 = OR(G24, G21, G20, G150)
--	G133 = OR(G152, G136, G22, G144)
--	G134 = OR(G152, G142, G21)
--	G145 = OR(G152, G142, G20, G19)
--	G146 = OR(G152, G143)
--	G147 = OR(G152, G144)
--	G158 = OR(G31, G160)
--	G104 = OR(G23, G106)
--	G131 = OR(G144, G22, G23, G129)
--	G159 = OR(G156, G157)
--	G105 = OR(G102, G103)
--	
--	I181 = NAND(G11, I180)
--	G129 = NAND(G19, G135)
--	G121 = NAND(G19, G135, G142, G136)
--	I190 = NAND(G12, G43)
--	G40 = NAND(I181, I182)
--	I200 = NAND(G13, G47)
--	I210 = NAND(G14, G51)
--	G120 = NAND(G150, G128)
--	G132 = NAND(G133, G134)
--	G111 = NAND(G140, G141, G139)
--	G123 = NAND(G137, G138, G21, G139)
--	G151 = NAND(G20, G144, G143, G139)
--	G117 = NAND(G145, G146, G147)
--	I191 = NAND(G12, I190)
--	I192 = NAND(G43, I190)
--	I201 = NAND(G13, I200)
--	I202 = NAND(G47, I200)
--	G149 = NAND(G131, G130)
--	I211 = NAND(G14, I210)
--	I212 = NAND(G51, I210)
--	G148 = NAND(G150, G135, G132)
--	G44 = NAND(I191, I192)
--	G48 = NAND(I201, I202)
--	G162 = NAND(G120, G149)
--	G52 = NAND(I211, I212)
--	I225 = NAND(G15, G60)
--	I235 = NAND(G16, G64)
--	I245 = NAND(G17, G68)
--	I255 = NAND(G18, G72)
--	G165 = NAND(G148, G149)
--	I226 = NAND(G15, I225)
--	I227 = NAND(G60, I225)
--	I236 = NAND(G16, I235)
--	I237 = NAND(G64, I235)
--	I246 = NAND(G17, I245)
--	I247 = NAND(G68, I245)
--	I256 = NAND(G18, I255)
--	I257 = NAND(G72, I255)
--	G61 = NAND(I226, I227)
--	G65 = NAND(I236, I237)
--	G69 = NAND(I246, I247)
--	G73 = NAND(I256, I257)
--	I271 = NAND(G19, G82)
--	I281 = NAND(G20, G86)
--	I291 = NAND(G21, G90)
--	I302 = NAND(G22, G95)
--	I272 = NAND(G19, I271)
--	I273 = NAND(G82, I271)
--	I282 = NAND(G20, I281)
--	I283 = NAND(G86, I281)
--	I292 = NAND(G21, I291)
--	I293 = NAND(G90, I291)
--	I303 = NAND(G22, I302)
--	I304 = NAND(G95, I302)
--	G83 = NAND(I272, I273)
--	G87 = NAND(I282, I283)
--	G91 = NAND(I292, I293)
--	G96 = NAND(I303, I304)
--	
--	G33 = NOR(G11, G12, G13)
--	G54 = NOR(G15, G16, G17)
--	G75 = NOR(G19, G20, G21)
--	G47 = NOR(G34, G35)
--	G51 = NOR(G34, G35, G36)
--	G98 = NOR(G32, G33)
--	G128 = NOR(G20, G144, G136, G152)
--	G130 = NOR(G143, G152)
--	G57 = NOR(G31, G98)
--	G64 = NOR(G55, G57)
--	G68 = NOR(G55, G56, G57)
--	G72 = NOR(G55, G56, G161, G57)
--	G97 = NOR(G53, G57, G54)
--	G109 = NOR(G122, G123)
--	G110 = NOR(G124, G125, G126, G127)
--	G114 = NOR(G150, G151)
--	G37 = NOR(G98, G38, G152)
--	G86 = NOR(G76, G79)
--	G90 = NOR(G76, G77, G79)
--	G93 = NOR(G74, G79, G75)
--	G95 = NOR(G76, G77, G78, G79)
--	G41 = NOR(G98, G42, G152)
--	G45 = NOR(G98, G46, G152)
--	G49 = NOR(G98, G50, G152)
--	G112 = NOR(G115, G116)
--	G113 = NOR(G163, G164)
--	G58 = NOR(G97, G59, G152)
--	G62 = NOR(G97, G63, G152)
--	G66 = NOR(G97, G67, G152)
--	G70 = NOR(G97, G71, G152)
--	G80 = NOR(G93, G81, G152)
--	G84 = NOR(G93, G85, G152)
--	G88 = NOR(G93, G89, G152)
--	G92 = NOR(G93, G94, G152)
--
-- VHDL Output
-- =============
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity s444 is
	port (
		CLK: in std_logic;
		G0: in std_logic;
		G1: in std_logic;
		G2: in std_logic;
		G107: out std_logic;
		G108: out std_logic;
		G118: out std_logic;
		G119: out std_logic;
		G167: out std_logic;
		G168: out std_logic
	);
end entity;

architecture RTL of s444 is
	attribute dont_touch: boolean;

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
	signal G66: std_logic; attribute dont_touch of G66: signal is true;
	signal G67: std_logic; attribute dont_touch of G67: signal is true;
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
	signal G109: std_logic; attribute dont_touch of G109: signal is true;
	signal G110: std_logic; attribute dont_touch of G110: signal is true;
	signal G111: std_logic; attribute dont_touch of G111: signal is true;
	signal G112: std_logic; attribute dont_touch of G112: signal is true;
	signal G113: std_logic; attribute dont_touch of G113: signal is true;
	signal G114: std_logic; attribute dont_touch of G114: signal is true;
	signal G115: std_logic; attribute dont_touch of G115: signal is true;
	signal G116: std_logic; attribute dont_touch of G116: signal is true;
	signal G117: std_logic; attribute dont_touch of G117: signal is true;
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
	signal G132: std_logic; attribute dont_touch of G132: signal is true;
	signal G133: std_logic; attribute dont_touch of G133: signal is true;
	signal G134: std_logic; attribute dont_touch of G134: signal is true;
	signal G135: std_logic; attribute dont_touch of G135: signal is true;
	signal G136: std_logic; attribute dont_touch of G136: signal is true;
	signal G137: std_logic; attribute dont_touch of G137: signal is true;
	signal G138: std_logic; attribute dont_touch of G138: signal is true;
	signal G139: std_logic; attribute dont_touch of G139: signal is true;
	signal G140: std_logic; attribute dont_touch of G140: signal is true;
	signal G141: std_logic; attribute dont_touch of G141: signal is true;
	signal G142: std_logic; attribute dont_touch of G142: signal is true;
	signal G143: std_logic; attribute dont_touch of G143: signal is true;
	signal G144: std_logic; attribute dont_touch of G144: signal is true;
	signal G145: std_logic; attribute dont_touch of G145: signal is true;
	signal G146: std_logic; attribute dont_touch of G146: signal is true;
	signal G147: std_logic; attribute dont_touch of G147: signal is true;
	signal G148: std_logic; attribute dont_touch of G148: signal is true;
	signal G149: std_logic; attribute dont_touch of G149: signal is true;
	signal G150: std_logic; attribute dont_touch of G150: signal is true;
	signal G151: std_logic; attribute dont_touch of G151: signal is true;
	signal G152: std_logic; attribute dont_touch of G152: signal is true;
	signal G153: std_logic; attribute dont_touch of G153: signal is true;
	signal G154: std_logic; attribute dont_touch of G154: signal is true;
	signal G155: std_logic; attribute dont_touch of G155: signal is true;
	signal G156: std_logic; attribute dont_touch of G156: signal is true;
	signal G157: std_logic; attribute dont_touch of G157: signal is true;
	signal G158: std_logic; attribute dont_touch of G158: signal is true;
	signal G159: std_logic; attribute dont_touch of G159: signal is true;
	signal G160: std_logic; attribute dont_touch of G160: signal is true;
	signal G161: std_logic; attribute dont_touch of G161: signal is true;
	signal G162: std_logic; attribute dont_touch of G162: signal is true;
	signal G162BF: std_logic; attribute dont_touch of G162BF: signal is true;
	signal G163: std_logic; attribute dont_touch of G163: signal is true;
	signal G164: std_logic; attribute dont_touch of G164: signal is true;
	signal G165: std_logic; attribute dont_touch of G165: signal is true;
	signal G166: std_logic; attribute dont_touch of G166: signal is true;
	signal I105: std_logic; attribute dont_touch of I105: signal is true;
	signal I180: std_logic; attribute dont_touch of I180: signal is true;
	signal I181: std_logic; attribute dont_touch of I181: signal is true;
	signal I182: std_logic; attribute dont_touch of I182: signal is true;
	signal I190: std_logic; attribute dont_touch of I190: signal is true;
	signal I191: std_logic; attribute dont_touch of I191: signal is true;
	signal I192: std_logic; attribute dont_touch of I192: signal is true;
	signal I200: std_logic; attribute dont_touch of I200: signal is true;
	signal I201: std_logic; attribute dont_touch of I201: signal is true;
	signal I202: std_logic; attribute dont_touch of I202: signal is true;
	signal I210: std_logic; attribute dont_touch of I210: signal is true;
	signal I211: std_logic; attribute dont_touch of I211: signal is true;
	signal I212: std_logic; attribute dont_touch of I212: signal is true;
	signal I225: std_logic; attribute dont_touch of I225: signal is true;
	signal I226: std_logic; attribute dont_touch of I226: signal is true;
	signal I227: std_logic; attribute dont_touch of I227: signal is true;
	signal I235: std_logic; attribute dont_touch of I235: signal is true;
	signal I236: std_logic; attribute dont_touch of I236: signal is true;
	signal I237: std_logic; attribute dont_touch of I237: signal is true;
	signal I245: std_logic; attribute dont_touch of I245: signal is true;
	signal I246: std_logic; attribute dont_touch of I246: signal is true;
	signal I247: std_logic; attribute dont_touch of I247: signal is true;
	signal I255: std_logic; attribute dont_touch of I255: signal is true;
	signal I256: std_logic; attribute dont_touch of I256: signal is true;
	signal I257: std_logic; attribute dont_touch of I257: signal is true;
	signal I271: std_logic; attribute dont_touch of I271: signal is true;
	signal I272: std_logic; attribute dont_touch of I272: signal is true;
	signal I273: std_logic; attribute dont_touch of I273: signal is true;
	signal I281: std_logic; attribute dont_touch of I281: signal is true;
	signal I282: std_logic; attribute dont_touch of I282: signal is true;
	signal I283: std_logic; attribute dont_touch of I283: signal is true;
	signal I291: std_logic; attribute dont_touch of I291: signal is true;
	signal I292: std_logic; attribute dont_touch of I292: signal is true;
	signal I293: std_logic; attribute dont_touch of I293: signal is true;
	signal I302: std_logic; attribute dont_touch of I302: signal is true;
	signal I303: std_logic; attribute dont_touch of I303: signal is true;
	signal I304: std_logic; attribute dont_touch of I304: signal is true;
	signal I318: std_logic; attribute dont_touch of I318: signal is true;
	signal I321: std_logic; attribute dont_touch of I321: signal is true;
	signal I324: std_logic; attribute dont_touch of I324: signal is true;
	signal I336: std_logic; attribute dont_touch of I336: signal is true;
	signal I372: std_logic; attribute dont_touch of I372: signal is true;
	signal I382: std_logic; attribute dont_touch of I382: signal is true;
	signal I392: std_logic; attribute dont_touch of I392: signal is true;
begin
	process(CLK)
	begin
		if(rising_edge(CLK)) then
			G11<=G37;
			G12<=G41;
			G13<=G45;
			G14<=G49;
			G15<=G58;
			G16<=G62;
			G17<=G66;
			G18<=G70;
			G19<=G80;
			G20<=G84;
			G21<=G88;
			G22<=G92;
			G23<=G101;
			G24<=G162BF;
			G25<=G109;
			G26<=G110;
			G27<=G111;
			G28<=G112;
			G29<=G113;
			G30<=G114;
			G31<=G155;
		end if;
	end process;
	G32<= not G14;
	G34<= not G11;
	G35<= not G12;
	G36<= not G13;
	G38<= not G40;
	G42<= not G44;
	G43<= not G34;
	G46<= not G48;
	G50<= not G52;
	G53<= not G18;
	G55<= not G15;
	G56<= not G16;
	G59<= not G61;
	G60<= not G57;
	G63<= not G65;
	G67<= not G69;
	G71<= not G73;
	G74<= not G22;
	G76<= not G19;
	G77<= not G20;
	G78<= not G21;
	G79<= not G97;
	G81<= not G83;
	G82<= not G79;
	G85<= not G87;
	G89<= not G91;
	G94<= not G96;
	G99<= not G152;
	G102<= not G23;
	G103<= not G106;
	G106<= not I318;
	G107<= not I321;
	G108<= not I324;
	G118<= not I336;
	G119<= not G28;
	G135<= not G20;
	G136<= not G23;
	G139<= not G152;
	G142<= not G22;
	G143<= not G24;
	G144<= not G21;
	G150<= not G19;
	G152<= not I372;
	G153<= not G152;
	G156<= not G31;
	G157<= not G160;
	G160<= not I382;
	G161<= not G17;
	G162BF<= not I105;
	G166<= not G162;
	G167<= not G29;
	G168<= not I392;
	I105<= not G162;
	I180<= not G11;
	I182<= not I180;
	I318<= not G2;
	I321<= not G25;
	I324<= not G26;
	I336<= not G27;
	I372<= not G0;
	I382<= not G1;
	I392<= not G30;
	G100<=G104 and G105;
	G101<=G100 and G99;
	G115<=G161 and G117 and G162;
	G116<=G117 and G166;
	G122<=G24 and G121;
	G124<=G139 and G22 and G150;
	G125<=G139 and G20 and G19;
	G126<=G139 and G21;
	G127<=G139 and G24;
	G154<=G158 and G159;
	G155<=G154 and G153;
	G163<=G161 and G165 and G162;
	G164<=G165 and G166;
	G40<= not (I181 and I182);
	G44<= not (I191 and I192);
	G48<= not (I201 and I202);
	G52<= not (I211 and I212);
	G61<= not (I226 and I227);
	G65<= not (I236 and I237);
	G69<= not (I246 and I247);
	G73<= not (I256 and I257);
	G83<= not (I272 and I273);
	G87<= not (I282 and I283);
	G91<= not (I292 and I293);
	G96<= not (I303 and I304);
	G111<= not (G140 and G141 and G139);
	G117<= not (G145 and G146 and G147);
	G120<= not (G150 and G128);
	G121<= not (G19 and G135 and G142 and G136);
	G123<= not (G137 and G138 and G21 and G139);
	G129<= not (G19 and G135);
	G132<= not (G133 and G134);
	G148<= not (G150 and G135 and G132);
	G149<= not (G131 and G130);
	G151<= not (G20 and G144 and G143 and G139);
	G162<= not (G120 and G149);
	G165<= not (G148 and G149);
	I181<= not (G11 and I180);
	I190<= not (G12 and G43);
	I191<= not (G12 and I190);
	I192<= not (G43 and I190);
	I200<= not (G13 and G47);
	I201<= not (G13 and I200);
	I202<= not (G47 and I200);
	I210<= not (G14 and G51);
	I211<= not (G14 and I210);
	I212<= not (G51 and I210);
	I225<= not (G15 and G60);
	I226<= not (G15 and I225);
	I227<= not (G60 and I225);
	I235<= not (G16 and G64);
	I236<= not (G16 and I235);
	I237<= not (G64 and I235);
	I245<= not (G17 and G68);
	I246<= not (G17 and I245);
	I247<= not (G68 and I245);
	I255<= not (G18 and G72);
	I256<= not (G18 and I255);
	I257<= not (G72 and I255);
	I271<= not (G19 and G82);
	I272<= not (G19 and I271);
	I273<= not (G82 and I271);
	I281<= not (G20 and G86);
	I282<= not (G20 and I281);
	I283<= not (G86 and I281);
	I291<= not (G21 and G90);
	I292<= not (G21 and I291);
	I293<= not (G90 and I291);
	I302<= not (G22 and G95);
	I303<= not (G22 and I302);
	I304<= not (G95 and I302);
	G104<=G23 or G106;
	G105<=G102 or G103;
	G131<=G144 or G22 or G23 or G129;
	G133<=G152 or G136 or G22 or G144;
	G134<=G152 or G142 or G21;
	G137<=G136 or G20 or G19;
	G138<=G136 or G142;
	G140<=G24 or G21 or G20 or G150;
	G141<=G24 or G22 or G21;
	G145<=G152 or G142 or G20 or G19;
	G146<=G152 or G143;
	G147<=G152 or G144;
	G158<=G31 or G160;
	G159<=G156 or G157;
	G33<= not (G11 or G12 or G13);
	G37<= not (G98 or G38 or G152);
	G41<= not (G98 or G42 or G152);
	G45<= not (G98 or G46 or G152);
	G47<= not (G34 or G35);
	G49<= not (G98 or G50 or G152);
	G51<= not (G34 or G35 or G36);
	G54<= not (G15 or G16 or G17);
	G57<= not (G31 or G98);
	G58<= not (G97 or G59 or G152);
	G62<= not (G97 or G63 or G152);
	G64<= not (G55 or G57);
	G66<= not (G97 or G67 or G152);
	G68<= not (G55 or G56 or G57);
	G70<= not (G97 or G71 or G152);
	G72<= not (G55 or G56 or G161 or G57);
	G75<= not (G19 or G20 or G21);
	G80<= not (G93 or G81 or G152);
	G84<= not (G93 or G85 or G152);
	G86<= not (G76 or G79);
	G88<= not (G93 or G89 or G152);
	G90<= not (G76 or G77 or G79);
	G92<= not (G93 or G94 or G152);
	G93<= not (G74 or G79 or G75);
	G95<= not (G76 or G77 or G78 or G79);
	G97<= not (G53 or G57 or G54);
	G98<= not (G32 or G33);
	G109<= not (G122 or G123);
	G110<= not (G124 or G125 or G126 or G127);
	G112<= not (G115 or G116);
	G113<= not (G163 or G164);
	G114<= not (G150 or G151);
	G128<= not (G20 or G144 or G136 or G152);
	G130<= not (G143 or G152);
end RTL;
