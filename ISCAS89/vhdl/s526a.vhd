-- File created by Bench2VHDL
-- Name: s526a
-- File: bench/s526a.bench
-- Timestamp: 2019-05-21T22:08:29.040945
--
-- Original File
-- =============
--	# s526n
--	# 3 inputs
--	# 6 outputs
--	# 21 D-type flipflops
--	# 54 inverters
--	# 140 gates (55 ANDs + 22 NANDs + 28 ORs + 35 NORs)
--	
--	INPUT(G0)
--	INPUT(G1)
--	INPUT(G2)
--	
--	OUTPUT(G147)
--	OUTPUT(G148)
--	OUTPUT(G198)
--	OUTPUT(G199)
--	OUTPUT(G213)
--	OUTPUT(G214)
--	
--	G10 = DFF(G60)
--	G11 = DFF(G61)
--	G12 = DFF(G62)
--	G13 = DFF(G69)
--	G14 = DFF(G79)
--	G15 = DFF(G84)
--	G16 = DFF(G89)
--	G17 = DFF(G96)
--	G18 = DFF(G101)
--	G19 = DFF(G106)
--	G20 = DFF(G115)
--	G21 = DFF(G127)
--	G22 = DFF(G137)
--	G23 = DFF(G167)
--	G24 = DFF(G173)
--	G25 = DFF(G179)
--	G26 = DFF(G183)
--	G27 = DFF(G188)
--	G28 = DFF(G194)
--	G29 = DFF(G200)
--	G30 = DFF(G206)
--	
--	I359 = NOT(G0)
--	I362 = NOT(G1)
--	I351 = NOT(G2)
--	G83 = NOT(G10)
--	G107 = NOT(G11)
--	G65 = NOT(G12)
--	G136 = NOT(G12)
--	G184 = NOT(G12)
--	G124 = NOT(G20)
--	G135 = NOT(G20)
--	G163 = NOT(G20)
--	G72 = NOT(G13)
--	G177 = NOT(G13)
--	G131 = NOT(G21)
--	G140 = NOT(G21)
--	G172 = NOT(G21)
--	G90 = NOT(G14)
--	G145 = NOT(G22)
--	G122 = NOT(G30)
--	G208 = NOT(G30)
--	G85 = NOT(G15)
--	I285 = NOT(G23)
--	G168 = NOT(G23)
--	G94 = NOT(G16)
--	I288 = NOT(G24)
--	G174 = NOT(G24)
--	G116 = NOT(G17)
--	G180 = NOT(G25)
--	I340 = NOT(G25)
--	G104 = NOT(G18)
--	G157 = NOT(G18)
--	I343 = NOT(G26)
--	G112 = NOT(G19)
--	I365 = NOT(G27)
--	G195 = NOT(G28)
--	I368 = NOT(G28)
--	G141 = NOT(G29)
--	G202 = NOT(G29)
--	G211 = NOT(I359)
--	G212 = NOT(I362)
--	G205 = NOT(I351)
--	G147 = NOT(I285)
--	G148 = NOT(I288)
--	G198 = NOT(I340)
--	G199 = NOT(I343)
--	I268 = NOT(G112)
--	G56 = NOT(I268)
--	G213 = NOT(I365)
--	G214 = NOT(I368)
--	G59 = NOT(G211)
--	G207 = NOT(G212)
--	G201 = NOT(G205)
--	G126 = NOT(G59)
--	G189 = NOT(G193)
--	
--	G77 = AND(G10, G11)
--	G80 = AND(G10, G11, G14)
--	G155 = AND(G21, G13, G26)
--	G78 = AND(G83, G107)
--	G39 = AND(G65, G21)
--	G170 = AND(G184, G177)
--	G176 = AND(G177, G12)
--	G40 = AND(G12, G131)
--	G156 = AND(G163, G172, G13)
--	G171 = AND(G172, G184)
--	G35 = AND(G10, G107, G90, G15)
--	G76 = AND(G10, G90, G15)
--	G81 = AND(G83, G90)
--	G82 = AND(G107, G90)
--	G87 = AND(G85, G86)
--	G169 = AND(G13, G168)
--	G175 = AND(G174, G12)
--	G47 = AND(G116, G18)
--	G55 = AND(G116, G18)
--	G181 = AND(G180, G13, G21)
--	G54 = AND(G17, G104)
--	G46 = AND(G116, G112)
--	G196 = AND(G195, G13)
--	G210 = AND(G212, G30)
--	G204 = AND(G205, G29)
--	G138 = AND(G140, G20, G141, G142)
--	G143 = AND(G140, G20, G141, G142)
--	G34 = AND(G122, G123)
--	G36 = AND(G122, G123)
--	G38 = AND(G122, G123)
--	G93 = AND(G94, G122, G123)
--	G99 = AND(G116, G122, G123)
--	G103 = AND(G104, G122, G123)
--	G110 = AND(G112, G122, G123)
--	G120 = AND(G124, G122, G123)
--	G92 = AND(G90, G107, G10, G91)
--	G121 = AND(G124, G125)
--	G44 = AND(G59, G94)
--	G45 = AND(G122, G59)
--	G51 = AND(G59, G16, G17)
--	G52 = AND(G59, G18)
--	G57 = AND(G59, G16, G17, G18)
--	G58 = AND(G59, G19)
--	G209 = AND(G207, G208)
--	G203 = AND(G201, G202)
--	G139 = AND(G145, G146)
--	G144 = AND(G145, G146)
--	G102 = AND(G18, G17, G16, G118)
--	G119 = AND(G116, G16, G117, G118)
--	G98 = AND(G107, G10, G108, G97)
--	G109 = AND(G107, G10, G108, G113)
--	G111 = AND(G16, G30, G113)
--	G192 = AND(G18, G193)
--	G186 = AND(G184, G189, G185)
--	G191 = AND(G189, G190)
--	
--	G161 = OR(G20, G13)
--	G162 = OR(G21, G12)
--	G50 = OR(G16, G17)
--	G43 = OR(G83, G11, G14)
--	G150 = OR(G184, G25)
--	G151 = OR(G184, G13)
--	G154 = OR(G184, G27)
--	G160 = OR(G184, G13)
--	G152 = OR(G163, G21, G12)
--	G33 = OR(G72, G12)
--	G149 = OR(G20, G21, G12, G177)
--	G164 = OR(G20, G21, G12, G177)
--	G153 = OR(G172, G27)
--	G165 = OR(G163, G172, G13)
--	G166 = OR(G172, G177, G24)
--	G42 = OR(G83, G107, G90, G85)
--	G53 = OR(G83, G11, G14, G85)
--	G49 = OR(G122, G94, G116)
--	G48 = OR(G122, G94, G18, G112)
--	G32 = OR(G30, G31)
--	G67 = OR(G211, G63, G64, G71)
--	G74 = OR(G211, G125, G70, G71)
--	G134 = OR(G131, G211, G132)
--	G68 = OR(G65, G211, G66)
--	G133 = OR(G211, G128, G129, G130)
--	G75 = OR(G72, G211, G73)
--	G158 = OR(G193, G184, G177, G26)
--	G159 = OR(G189, G157)
--	
--	G86 = NAND(G14, G11, G10)
--	G64 = NAND(G65, G21, G20, G19)
--	G70 = NAND(G72, G12, G21, G20)
--	G123 = NAND(G15, G90, G107, G10)
--	G128 = NAND(G116, G16)
--	G63 = NAND(G104, G116, G16)
--	G125 = NAND(G19, G104, G116, G16)
--	G129 = NAND(G131, G20, G19, G104)
--	G146 = NAND(G140, G135, G29, G142)
--	G190 = NAND(G152, G153, G154, G13)
--	G118 = NAND(G53, G122)
--	G41 = NAND(G104, G116, G16, G37)
--	G88 = NAND(G42, G43, G59)
--	G100 = NAND(G48, G49, G50, G59)
--	G130 = NAND(G32, G33)
--	G62 = NAND(G67, G68)
--	G127 = NAND(G133, G134)
--	G69 = NAND(G74, G75)
--	G178 = NAND(G164, G165, G166, G189)
--	G182 = NAND(G149, G150, G151, G189)
--	G197 = NAND(G160, G161, G162, G189)
--	G187 = NAND(G158, G159)
--	
--	G142 = NOR(G13, G136)
--	G31 = NOR(G85, G14, G11, G83)
--	G91 = NOR(G94, G85)
--	G108 = NOR(G94, G85, G14)
--	G37 = NOR(G124, G112)
--	G117 = NOR(G124, G112, G18)
--	G60 = NOR(G10, G211)
--	G185 = NOR(G155, G156)
--	G71 = NOR(G35, G30)
--	G61 = NOR(G76, G77, G78, G211)
--	G79 = NOR(G80, G81, G82, G211)
--	G97 = NOR(G46, G47)
--	G113 = NOR(G54, G55, G56)
--	G132 = NOR(G34, G124, G125)
--	G66 = NOR(G36, G131, G124, G125)
--	G73 = NOR(G38, G39, G40, G41)
--	G95 = NOR(G44, G45)
--	G105 = NOR(G51, G52)
--	G114 = NOR(G57, G58)
--	G84 = NOR(G87, G88)
--	G206 = NOR(G209, G210, G211)
--	G200 = NOR(G203, G204, G211)
--	G137 = NOR(G138, G139, G211)
--	G193 = NOR(G143, G144)
--	G115 = NOR(G119, G120, G121, G126)
--	G96 = NOR(G98, G99, G100)
--	G89 = NOR(G92, G93, G95)
--	G101 = NOR(G102, G103, G105)
--	G106 = NOR(G109, G110, G111, G114)
--	G167 = NOR(G169, G170, G171, G193)
--	G173 = NOR(G175, G176, G178)
--	G179 = NOR(G181, G182)
--	G188 = NOR(G191, G192)
--	G194 = NOR(G196, G197)
--	G183 = NOR(G186, G187)
--
-- VHDL Output
-- =============
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity s526a is
	port (
		CLK: in std_logic;
		G0: in std_logic;
		G1: in std_logic;
		G2: in std_logic;
		G147: out std_logic;
		G148: out std_logic;
		G198: out std_logic;
		G199: out std_logic;
		G213: out std_logic;
		G214: out std_logic
	);
end entity;

architecture RTL of s526a is
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
	signal G117: std_logic; attribute dont_touch of G117: signal is true;
	signal G118: std_logic; attribute dont_touch of G118: signal is true;
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
	signal G163: std_logic; attribute dont_touch of G163: signal is true;
	signal G164: std_logic; attribute dont_touch of G164: signal is true;
	signal G165: std_logic; attribute dont_touch of G165: signal is true;
	signal G166: std_logic; attribute dont_touch of G166: signal is true;
	signal G167: std_logic; attribute dont_touch of G167: signal is true;
	signal G168: std_logic; attribute dont_touch of G168: signal is true;
	signal G169: std_logic; attribute dont_touch of G169: signal is true;
	signal G170: std_logic; attribute dont_touch of G170: signal is true;
	signal G171: std_logic; attribute dont_touch of G171: signal is true;
	signal G172: std_logic; attribute dont_touch of G172: signal is true;
	signal G173: std_logic; attribute dont_touch of G173: signal is true;
	signal G174: std_logic; attribute dont_touch of G174: signal is true;
	signal G175: std_logic; attribute dont_touch of G175: signal is true;
	signal G176: std_logic; attribute dont_touch of G176: signal is true;
	signal G177: std_logic; attribute dont_touch of G177: signal is true;
	signal G178: std_logic; attribute dont_touch of G178: signal is true;
	signal G179: std_logic; attribute dont_touch of G179: signal is true;
	signal G180: std_logic; attribute dont_touch of G180: signal is true;
	signal G181: std_logic; attribute dont_touch of G181: signal is true;
	signal G182: std_logic; attribute dont_touch of G182: signal is true;
	signal G183: std_logic; attribute dont_touch of G183: signal is true;
	signal G184: std_logic; attribute dont_touch of G184: signal is true;
	signal G185: std_logic; attribute dont_touch of G185: signal is true;
	signal G186: std_logic; attribute dont_touch of G186: signal is true;
	signal G187: std_logic; attribute dont_touch of G187: signal is true;
	signal G188: std_logic; attribute dont_touch of G188: signal is true;
	signal G189: std_logic; attribute dont_touch of G189: signal is true;
	signal G190: std_logic; attribute dont_touch of G190: signal is true;
	signal G191: std_logic; attribute dont_touch of G191: signal is true;
	signal G192: std_logic; attribute dont_touch of G192: signal is true;
	signal G193: std_logic; attribute dont_touch of G193: signal is true;
	signal G194: std_logic; attribute dont_touch of G194: signal is true;
	signal G195: std_logic; attribute dont_touch of G195: signal is true;
	signal G196: std_logic; attribute dont_touch of G196: signal is true;
	signal G197: std_logic; attribute dont_touch of G197: signal is true;
	signal G200: std_logic; attribute dont_touch of G200: signal is true;
	signal G201: std_logic; attribute dont_touch of G201: signal is true;
	signal G202: std_logic; attribute dont_touch of G202: signal is true;
	signal G203: std_logic; attribute dont_touch of G203: signal is true;
	signal G204: std_logic; attribute dont_touch of G204: signal is true;
	signal G205: std_logic; attribute dont_touch of G205: signal is true;
	signal G206: std_logic; attribute dont_touch of G206: signal is true;
	signal G207: std_logic; attribute dont_touch of G207: signal is true;
	signal G208: std_logic; attribute dont_touch of G208: signal is true;
	signal G209: std_logic; attribute dont_touch of G209: signal is true;
	signal G210: std_logic; attribute dont_touch of G210: signal is true;
	signal G211: std_logic; attribute dont_touch of G211: signal is true;
	signal G212: std_logic; attribute dont_touch of G212: signal is true;
	signal I268: std_logic; attribute dont_touch of I268: signal is true;
	signal I285: std_logic; attribute dont_touch of I285: signal is true;
	signal I288: std_logic; attribute dont_touch of I288: signal is true;
	signal I340: std_logic; attribute dont_touch of I340: signal is true;
	signal I343: std_logic; attribute dont_touch of I343: signal is true;
	signal I351: std_logic; attribute dont_touch of I351: signal is true;
	signal I359: std_logic; attribute dont_touch of I359: signal is true;
	signal I362: std_logic; attribute dont_touch of I362: signal is true;
	signal I365: std_logic; attribute dont_touch of I365: signal is true;
	signal I368: std_logic; attribute dont_touch of I368: signal is true;
begin
	process(CLK)
	begin
		if(rising_edge(CLK)) then
			G10<=G60;
			G11<=G61;
			G12<=G62;
			G13<=G69;
			G14<=G79;
			G15<=G84;
			G16<=G89;
			G17<=G96;
			G18<=G101;
			G19<=G106;
			G20<=G115;
			G21<=G127;
			G22<=G137;
			G23<=G167;
			G24<=G173;
			G25<=G179;
			G26<=G183;
			G27<=G188;
			G28<=G194;
			G29<=G200;
			G30<=G206;
		end if;
	end process;
	G56<= not I268;
	G59<= not G211;
	G65<= not G12;
	G72<= not G13;
	G83<= not G10;
	G85<= not G15;
	G90<= not G14;
	G94<= not G16;
	G104<= not G18;
	G107<= not G11;
	G112<= not G19;
	G116<= not G17;
	G122<= not G30;
	G124<= not G20;
	G126<= not G59;
	G131<= not G21;
	G135<= not G20;
	G136<= not G12;
	G140<= not G21;
	G141<= not G29;
	G145<= not G22;
	G147<= not I285;
	G148<= not I288;
	G157<= not G18;
	G163<= not G20;
	G168<= not G23;
	G172<= not G21;
	G174<= not G24;
	G177<= not G13;
	G180<= not G25;
	G184<= not G12;
	G189<= not G193;
	G195<= not G28;
	G198<= not I340;
	G199<= not I343;
	G201<= not G205;
	G202<= not G29;
	G205<= not I351;
	G207<= not G212;
	G208<= not G30;
	G211<= not I359;
	G212<= not I362;
	G213<= not I365;
	G214<= not I368;
	I268<= not G112;
	I285<= not G23;
	I288<= not G24;
	I340<= not G25;
	I343<= not G26;
	I351<= not G2;
	I359<= not G0;
	I362<= not G1;
	I365<= not G27;
	I368<= not G28;
	G34<=G122 and G123;
	G35<=G10 and G107 and G90 and G15;
	G36<=G122 and G123;
	G38<=G122 and G123;
	G39<=G65 and G21;
	G40<=G12 and G131;
	G44<=G59 and G94;
	G45<=G122 and G59;
	G46<=G116 and G112;
	G47<=G116 and G18;
	G51<=G59 and G16 and G17;
	G52<=G59 and G18;
	G54<=G17 and G104;
	G55<=G116 and G18;
	G57<=G59 and G16 and G17 and G18;
	G58<=G59 and G19;
	G76<=G10 and G90 and G15;
	G77<=G10 and G11;
	G78<=G83 and G107;
	G80<=G10 and G11 and G14;
	G81<=G83 and G90;
	G82<=G107 and G90;
	G87<=G85 and G86;
	G92<=G90 and G107 and G10 and G91;
	G93<=G94 and G122 and G123;
	G98<=G107 and G10 and G108 and G97;
	G99<=G116 and G122 and G123;
	G102<=G18 and G17 and G16 and G118;
	G103<=G104 and G122 and G123;
	G109<=G107 and G10 and G108 and G113;
	G110<=G112 and G122 and G123;
	G111<=G16 and G30 and G113;
	G119<=G116 and G16 and G117 and G118;
	G120<=G124 and G122 and G123;
	G121<=G124 and G125;
	G138<=G140 and G20 and G141 and G142;
	G139<=G145 and G146;
	G143<=G140 and G20 and G141 and G142;
	G144<=G145 and G146;
	G155<=G21 and G13 and G26;
	G156<=G163 and G172 and G13;
	G169<=G13 and G168;
	G170<=G184 and G177;
	G171<=G172 and G184;
	G175<=G174 and G12;
	G176<=G177 and G12;
	G181<=G180 and G13 and G21;
	G186<=G184 and G189 and G185;
	G191<=G189 and G190;
	G192<=G18 and G193;
	G196<=G195 and G13;
	G203<=G201 and G202;
	G204<=G205 and G29;
	G209<=G207 and G208;
	G210<=G212 and G30;
	G41<= not (G104 and G116 and G16 and G37);
	G62<= not (G67 and G68);
	G63<= not (G104 and G116 and G16);
	G64<= not (G65 and G21 and G20 and G19);
	G69<= not (G74 and G75);
	G70<= not (G72 and G12 and G21 and G20);
	G86<= not (G14 and G11 and G10);
	G88<= not (G42 and G43 and G59);
	G100<= not (G48 and G49 and G50 and G59);
	G118<= not (G53 and G122);
	G123<= not (G15 and G90 and G107 and G10);
	G125<= not (G19 and G104 and G116 and G16);
	G127<= not (G133 and G134);
	G128<= not (G116 and G16);
	G129<= not (G131 and G20 and G19 and G104);
	G130<= not (G32 and G33);
	G146<= not (G140 and G135 and G29 and G142);
	G178<= not (G164 and G165 and G166 and G189);
	G182<= not (G149 and G150 and G151 and G189);
	G187<= not (G158 and G159);
	G190<= not (G152 and G153 and G154 and G13);
	G197<= not (G160 and G161 and G162 and G189);
	G32<=G30 or G31;
	G33<=G72 or G12;
	G42<=G83 or G107 or G90 or G85;
	G43<=G83 or G11 or G14;
	G48<=G122 or G94 or G18 or G112;
	G49<=G122 or G94 or G116;
	G50<=G16 or G17;
	G53<=G83 or G11 or G14 or G85;
	G67<=G211 or G63 or G64 or G71;
	G68<=G65 or G211 or G66;
	G74<=G211 or G125 or G70 or G71;
	G75<=G72 or G211 or G73;
	G133<=G211 or G128 or G129 or G130;
	G134<=G131 or G211 or G132;
	G149<=G20 or G21 or G12 or G177;
	G150<=G184 or G25;
	G151<=G184 or G13;
	G152<=G163 or G21 or G12;
	G153<=G172 or G27;
	G154<=G184 or G27;
	G158<=G193 or G184 or G177 or G26;
	G159<=G189 or G157;
	G160<=G184 or G13;
	G161<=G20 or G13;
	G162<=G21 or G12;
	G164<=G20 or G21 or G12 or G177;
	G165<=G163 or G172 or G13;
	G166<=G172 or G177 or G24;
	G31<= not (G85 or G14 or G11 or G83);
	G37<= not (G124 or G112);
	G60<= not (G10 or G211);
	G61<= not (G76 or G77 or G78 or G211);
	G66<= not (G36 or G131 or G124 or G125);
	G71<= not (G35 or G30);
	G73<= not (G38 or G39 or G40 or G41);
	G79<= not (G80 or G81 or G82 or G211);
	G84<= not (G87 or G88);
	G89<= not (G92 or G93 or G95);
	G91<= not (G94 or G85);
	G95<= not (G44 or G45);
	G96<= not (G98 or G99 or G100);
	G97<= not (G46 or G47);
	G101<= not (G102 or G103 or G105);
	G105<= not (G51 or G52);
	G106<= not (G109 or G110 or G111 or G114);
	G108<= not (G94 or G85 or G14);
	G113<= not (G54 or G55 or G56);
	G114<= not (G57 or G58);
	G115<= not (G119 or G120 or G121 or G126);
	G117<= not (G124 or G112 or G18);
	G132<= not (G34 or G124 or G125);
	G137<= not (G138 or G139 or G211);
	G142<= not (G13 or G136);
	G167<= not (G169 or G170 or G171 or G193);
	G173<= not (G175 or G176 or G178);
	G179<= not (G181 or G182);
	G183<= not (G186 or G187);
	G185<= not (G155 or G156);
	G188<= not (G191 or G192);
	G193<= not (G143 or G144);
	G194<= not (G196 or G197);
	G200<= not (G203 or G204 or G211);
	G206<= not (G209 or G210 or G211);
end RTL;
