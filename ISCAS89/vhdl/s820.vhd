-- File created by Bench2VHDL
-- Name: s820
-- File: bench/s820.bench
-- Timestamp: 2019-05-21T22:08:29.271363
--
-- Original File
-- =============
--	# s820
--	# 18 inputs
--	# 19 outputs
--	# 5 D-type flipflops
--	# 33 inverters
--	# 256 gates (76 ANDs + 54 NANDs + 60 ORs + 66 NORs)
--	
--	INPUT(G0)
--	INPUT(G1)
--	INPUT(G2)
--	INPUT(G3)
--	INPUT(G4)
--	INPUT(G5)
--	INPUT(G6)
--	INPUT(G7)
--	INPUT(G8)
--	INPUT(G9)
--	INPUT(G10)
--	INPUT(G11)
--	INPUT(G12)
--	INPUT(G13)
--	INPUT(G14)
--	INPUT(G15)
--	INPUT(G16)
--	INPUT(G18)
--	
--	OUTPUT(G290)
--	OUTPUT(G327)
--	OUTPUT(G47)
--	OUTPUT(G55)
--	OUTPUT(G288)
--	OUTPUT(G296)
--	OUTPUT(G310)
--	OUTPUT(G312)
--	OUTPUT(G325)
--	OUTPUT(G300)
--	OUTPUT(G43)
--	OUTPUT(G53)
--	OUTPUT(G298)
--	OUTPUT(G315)
--	OUTPUT(G322)
--	OUTPUT(G49)
--	OUTPUT(G45)
--	OUTPUT(G292)
--	OUTPUT(G302)
--	
--	G38 = DFF(G90)
--	G39 = DFF(G93)
--	G40 = DFF(G96)
--	G41 = DFF(G99)
--	G42 = DFF(G102)
--	
--	G245 = NOT(G0)
--	G323 = NOT(G1)
--	G181 = NOT(G2)
--	G256 = NOT(G4)
--	G130 = NOT(G5)
--	G203 = NOT(G6)
--	G202 = NOT(G7)
--	G112 = NOT(G8)
--	G198 = NOT(G9)
--	G171 = NOT(G10)
--	G172 = NOT(G11)
--	G168 = NOT(G12)
--	G201 = NOT(G13)
--	G267 = NOT(G15)
--	G317 = NOT(G40)
--	G281 = NOT(G16)
--	G313 = NOT(G41)
--	G328 = NOT(G42)
--	G88 = NOT(G18)
--	G91 = NOT(G18)
--	G94 = NOT(G18)
--	G97 = NOT(G18)
--	G100 = NOT(G18)
--	G280 = NOT(G38)
--	G318 = NOT(G39)
--	I127 = NOT(G38)
--	G228 = NOT(I127)
--	I130 = NOT(G15)
--	G229 = NOT(I130)
--	I133 = NOT(G313)
--	G231 = NOT(I133)
--	I198 = NOT(G38)
--	G247 = NOT(I198)
--	
--	G143 = AND(G40, G4)
--	G161 = AND(G3, G42)
--	G162 = AND(G1, G42)
--	G163 = AND(G41, G42)
--	G188 = AND(G3, G42)
--	G189 = AND(G1, G42)
--	G190 = AND(G41, G42)
--	G195 = AND(G41, G42)
--	G215 = AND(G41, G42)
--	G120 = AND(G39, G40, G42)
--	G250 = AND(G39, G40, G42)
--	G118 = AND(G245, G38, G39)
--	G166 = AND(G245, G38, G42)
--	G199 = AND(G245, G38, G42)
--	G170 = AND(G171, G172)
--	G169 = AND(G172, G168)
--	G129 = AND(G39, G317)
--	G265 = AND(G317, G267)
--	G142 = AND(G40, G281)
--	G279 = AND(G281, G42)
--	G103 = AND(G313, G38)
--	G164 = AND(G42, G313)
--	G167 = AND(G256, G38, G313)
--	G191 = AND(G42, G313)
--	G200 = AND(G256, G38, G313)
--	G214 = AND(G267, G16)
--	G234 = AND(G15, G40, G313, G42)
--	G283 = AND(G317, G313)
--	G141 = AND(G317, G16, G323, G140)
--	G127 = AND(G38, G39, G313, G328)
--	G160 = AND(G5, G313, G328)
--	G187 = AND(G5, G313, G328)
--	G193 = AND(G11, G328)
--	G194 = AND(G10, G328)
--	G213 = AND(G16, G313, G328)
--	G235 = AND(G317, G328)
--	G249 = AND(G40, G41, G328)
--	G268 = AND(G328, G267)
--	G276 = AND(G0, G38, G328)
--	G282 = AND(G317, G328)
--	G117 = AND(G1, G39, G313)
--	G277 = AND(G323, G281, G280)
--	G278 = AND(G280, G42)
--	G121 = AND(G318, G317, G328)
--	G128 = AND(G280, G318, G40)
--	G232 = AND(G38, G318)
--	G233 = AND(G15, G318)
--	G251 = AND(G318, G313)
--	G252 = AND(G318, G317)
--	G271 = AND(G318, G15, G14, G270)
--	G210 = AND(G39, G38, G245, G209)
--	G226 = AND(G318, G225)
--	G175 = AND(G317, G176)
--	G197 = AND(G8, G7, G6, G196)
--	G263 = AND(G39, G38, G262)
--	G150 = AND(G256, G147, G148, G149)
--	G158 = AND(G280, G157)
--	G185 = AND(G280, G184)
--	G174 = AND(G41, G40, G15, G173)
--	G211 = AND(G317, G39, G256, G212)
--	G223 = AND(G16, G222)
--	G272 = AND(G318, G4, G274)
--	G264 = AND(G318, G266)
--	G294 = AND(G16, G293)
--	G152 = AND(G313, G317, G318, G154)
--	G218 = AND(G2, G323, G216, G217)
--	G151 = AND(G38, G16, G256, G153)
--	G273 = AND(G40, G39, G275)
--	G258 = AND(G318, G280, G257)
--	G219 = AND(G318, G220)
--	G259 = AND(G41, G260)
--	G90 = AND(G89, G88)
--	G93 = AND(G92, G91)
--	G96 = AND(G95, G94)
--	G99 = AND(G98, G97)
--	G102 = AND(G101, G100)
--	
--	G126 = OR(G10, G11)
--	G124 = OR(G11, G12)
--	G125 = OR(G10, G12)
--	G107 = OR(G41, G40, G1)
--	G145 = OR(G16, G41)
--	G243 = OR(G5, G41)
--	G111 = OR(G15, G42)
--	G144 = OR(G16, G42)
--	G239 = OR(G40, G41, G42)
--	G287 = OR(G42, G5)
--	G115 = OR(G39, G42)
--	G183 = OR(G38, G39, G41)
--	G237 = OR(G16, G39, G40)
--	G246 = OR(G4, G39)
--	G113 = OR(G203, G202, G112, G198)
--	G132 = OR(G171, G11, G12, G42)
--	G133 = OR(G10, G172, G12, G42)
--	G182 = OR(G14, G267, G38, G39)
--	G238 = OR(G14, G267, G40, G42)
--	G241 = OR(G256, G317)
--	G136 = OR(G4, G281)
--	G116 = OR(G39, G313)
--	G286 = OR(G42, G313)
--	G108 = OR(G328, G15)
--	G109 = OR(G201, G267, G328)
--	G240 = OR(G256, G313, G328)
--	G242 = OR(G41, G328)
--	G244 = OR(G281, G328)
--	G110 = OR(G280, G42)
--	G134 = OR(G280, G42)
--	G135 = OR(G280, G40)
--	G114 = OR(G267, G318, G328)
--	G236 = OR(G318, G317, G328)
--	G248 = OR(G245, G318)
--	G321 = OR(G317, G318, G38, G319)
--	G180 = OR(G41, G178)
--	G78 = OR(G39, G4, G73, G74)
--	G285 = OR(G3, G2, G1, G284)
--	G63 = OR(G40, G318, G4, G59)
--	G106 = OR(G8, G7, G203, G105)
--	G308 = OR(G40, G318, G16, G304)
--	G320 = OR(G40, G39, G38, G316)
--	G52 = OR(G328, G313, G39, G50)
--	G139 = OR(G317, G137)
--	G255 = OR(G317, G253)
--	G207 = OR(G202, G203, G204, G205)
--	G309 = OR(G39, G38, G305)
--	G62 = OR(G267, G4, G57, G58)
--	G307 = OR(G328, G313, G39, G303)
--	G85 = OR(G328, G313, G317, G81)
--	G67 = OR(G174, G175, G177)
--	G70 = OR(G318, G4, G65, G66)
--	G89 = OR(G150, G151, G152, G155)
--	G79 = OR(G40, G281, G4, G75)
--	G64 = OR(G317, G318, G60)
--	G72 = OR(G317, G318, G68)
--	G71 = OR(G39, G281, G4, G67)
--	G86 = OR(G38, G82)
--	G80 = OR(G38, G76)
--	G87 = OR(G281, G83)
--	
--	G204 = NAND(G9, G8)
--	G73 = NAND(G42, G41, G40)
--	G319 = NAND(G42, G41)
--	G123 = NAND(G124, G125, G126, G256)
--	G65 = NAND(G42, G41, G317)
--	G295 = NAND(G41, G317, G39, G256)
--	G284 = NAND(G42, G313)
--	G291 = NAND(G313, G317, G39, G15)
--	G329 = NAND(G313, G317, G39, G15)
--	G59 = NAND(G144, G145)
--	G105 = NAND(G328, G40, G15, G9)
--	G225 = NAND(G41, G256)
--	G316 = NAND(G328, G313)
--	G48 = NAND(G40, G39, G280, G130)
--	G56 = NAND(G40, G39, G280, G5)
--	G176 = NAND(G42, G41, G280, G15)
--	G289 = NAND(G313, G40, G39, G280)
--	G297 = NAND(G41, G40, G39, G280)
--	G311 = NAND(G313, G40, G39, G280)
--	G314 = NAND(G40, G39, G280, G16)
--	G326 = NAND(G313, G40, G39, G280)
--	G301 = NAND(G281, G3, G323, G119)
--	G44 = NAND(G317, G318, G280, G15)
--	G54 = NAND(G41, G317, G318, G280)
--	G57 = NAND(G41, G40, G318, G16)
--	G156 = NAND(G318, G280, G281)
--	G299 = NAND(G318, G280, G15, G14)
--	G262 = NAND(G113, G317)
--	G179 = NAND(G182, G183)
--	G205 = NAND(G228, G229)
--	G224 = NAND(G238, G239, G240, G241)
--	G227 = NAND(G242, G243, G244, G40)
--	G266 = NAND(G109, G110, G111, G40)
--	G293 = NAND(G8, G7, G6, G131)
--	G58 = NAND(G132, G133, G134)
--	G303 = NAND(G135, G136)
--	G269 = NAND(G114, G115, G116, G317)
--	G217 = NAND(G236, G237)
--	G81 = NAND(G246, G247, G248)
--	G46 = NAND(G318, G280, G16, G122)
--	G69 = NAND(G180, G328, G317, G179)
--	G275 = NAND(G285, G286, G287)
--	G257 = NAND(G106, G107, G108)
--	G315 = NAND(G320, G321)
--	G306 = NAND(G139, G138)
--	G84 = NAND(G255, G254)
--	G49 = NAND(G52, G51)
--	G61 = NAND(G328, G313, G317, G146)
--	G75 = NAND(G207, G206)
--	G302 = NAND(G307, G308, G309, G306)
--	G92 = NAND(G62, G63, G64, G61)
--	G95 = NAND(G70, G71, G72, G69)
--	G98 = NAND(G78, G79, G80, G77)
--	G101 = NAND(G85, G86, G87, G84)
--	
--	G216 = NOR(G41, G3)
--	G140 = NOR(G42, G41)
--	G119 = NOR(G39, G38)
--	G178 = NOR(G16, G3, G181, G1)
--	G74 = NOR(G281, G267, G201)
--	G147 = NOR(G38, G281, G267)
--	G148 = NOR(G42, G313, G317, G39)
--	G270 = NOR(G42, G313, G40)
--	G209 = NOR(G328, G313, G317)
--	G304 = NOR(G328, G313)
--	G50 = NOR(G40, G280)
--	G131 = NOR(G280, G267, G198)
--	G137 = NOR(G42, G41, G280)
--	G177 = NOR(G195, G280)
--	G196 = NOR(G280, G267, G198)
--	G253 = NOR(G42, G41, G280)
--	G138 = NOR(G318, G256)
--	G254 = NOR(G318, G256)
--	G122 = NOR(G267, G123)
--	G149 = NOR(G169, G170)
--	G165 = NOR(G166, G167)
--	G192 = NOR(G199, G200)
--	G290 = NOR(G42, G291)
--	G327 = NOR(G328, G329)
--	G305 = NOR(G141, G142, G143)
--	G157 = NOR(G160, G161, G162, G163)
--	G184 = NOR(G187, G188, G189, G190)
--	G173 = NOR(G193, G194)
--	G212 = NOR(G213, G214, G215)
--	G222 = NOR(G234, G235)
--	G274 = NOR(G282, G283)
--	G47 = NOR(G42, G41, G48)
--	G55 = NOR(G42, G41, G56)
--	G104 = NOR(G117, G118)
--	G154 = NOR(G276, G277, G278, G279)
--	G288 = NOR(G42, G289)
--	G296 = NOR(G42, G297)
--	G310 = NOR(G328, G311)
--	G312 = NOR(G328, G313, G314)
--	G325 = NOR(G328, G326)
--	G300 = NOR(G42, G41, G40, G301)
--	G43 = NOR(G42, G313, G44)
--	G53 = NOR(G42, G54)
--	G324 = NOR(G120, G121)
--	G51 = NOR(G127, G128, G129)
--	G146 = NOR(G3, G181, G1, G156)
--	G206 = NOR(G231, G232, G233)
--	G153 = NOR(G249, G250, G251, G252)
--	G298 = NOR(G42, G313, G40, G299)
--	G159 = NOR(G164, G165)
--	G186 = NOR(G191, G192)
--	G221 = NOR(G226, G227)
--	G155 = NOR(G103, G328, G317, G104)
--	G66 = NOR(G197, G281)
--	G261 = NOR(G268, G269)
--	G322 = NOR(G41, G38, G323, G324)
--	G45 = NOR(G42, G313, G317, G46)
--	G60 = NOR(G158, G159)
--	G68 = NOR(G185, G186)
--	G77 = NOR(G210, G211)
--	G220 = NOR(G223, G224)
--	G260 = NOR(G263, G264, G265)
--	G292 = NOR(G294, G328, G295)
--	G82 = NOR(G271, G272, G273)
--	G76 = NOR(G218, G219, G221)
--	G83 = NOR(G258, G259, G261)
--
-- VHDL Output
-- =============
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity s820 is
	port (
		CLK: in std_logic;
		G0: in std_logic;
		G1: in std_logic;
		G2: in std_logic;
		G3: in std_logic;
		G4: in std_logic;
		G5: in std_logic;
		G6: in std_logic;
		G7: in std_logic;
		G8: in std_logic;
		G9: in std_logic;
		G10: in std_logic;
		G11: in std_logic;
		G12: in std_logic;
		G13: in std_logic;
		G14: in std_logic;
		G15: in std_logic;
		G16: in std_logic;
		G18: in std_logic;
		G43: out std_logic;
		G45: out std_logic;
		G47: out std_logic;
		G49: out std_logic;
		G53: out std_logic;
		G55: out std_logic;
		G288: out std_logic;
		G290: out std_logic;
		G292: out std_logic;
		G296: out std_logic;
		G298: out std_logic;
		G300: out std_logic;
		G302: out std_logic;
		G310: out std_logic;
		G312: out std_logic;
		G315: out std_logic;
		G322: out std_logic;
		G325: out std_logic;
		G327: out std_logic
	);
end entity;

architecture RTL of s820 is
	attribute dont_touch: boolean;

	signal G38: std_logic; attribute dont_touch of G38: signal is true;
	signal G39: std_logic; attribute dont_touch of G39: signal is true;
	signal G40: std_logic; attribute dont_touch of G40: signal is true;
	signal G41: std_logic; attribute dont_touch of G41: signal is true;
	signal G42: std_logic; attribute dont_touch of G42: signal is true;
	signal G44: std_logic; attribute dont_touch of G44: signal is true;
	signal G46: std_logic; attribute dont_touch of G46: signal is true;
	signal G48: std_logic; attribute dont_touch of G48: signal is true;
	signal G50: std_logic; attribute dont_touch of G50: signal is true;
	signal G51: std_logic; attribute dont_touch of G51: signal is true;
	signal G52: std_logic; attribute dont_touch of G52: signal is true;
	signal G54: std_logic; attribute dont_touch of G54: signal is true;
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
	signal G198: std_logic; attribute dont_touch of G198: signal is true;
	signal G199: std_logic; attribute dont_touch of G199: signal is true;
	signal G200: std_logic; attribute dont_touch of G200: signal is true;
	signal G201: std_logic; attribute dont_touch of G201: signal is true;
	signal G202: std_logic; attribute dont_touch of G202: signal is true;
	signal G203: std_logic; attribute dont_touch of G203: signal is true;
	signal G204: std_logic; attribute dont_touch of G204: signal is true;
	signal G205: std_logic; attribute dont_touch of G205: signal is true;
	signal G206: std_logic; attribute dont_touch of G206: signal is true;
	signal G207: std_logic; attribute dont_touch of G207: signal is true;
	signal G209: std_logic; attribute dont_touch of G209: signal is true;
	signal G210: std_logic; attribute dont_touch of G210: signal is true;
	signal G211: std_logic; attribute dont_touch of G211: signal is true;
	signal G212: std_logic; attribute dont_touch of G212: signal is true;
	signal G213: std_logic; attribute dont_touch of G213: signal is true;
	signal G214: std_logic; attribute dont_touch of G214: signal is true;
	signal G215: std_logic; attribute dont_touch of G215: signal is true;
	signal G216: std_logic; attribute dont_touch of G216: signal is true;
	signal G217: std_logic; attribute dont_touch of G217: signal is true;
	signal G218: std_logic; attribute dont_touch of G218: signal is true;
	signal G219: std_logic; attribute dont_touch of G219: signal is true;
	signal G220: std_logic; attribute dont_touch of G220: signal is true;
	signal G221: std_logic; attribute dont_touch of G221: signal is true;
	signal G222: std_logic; attribute dont_touch of G222: signal is true;
	signal G223: std_logic; attribute dont_touch of G223: signal is true;
	signal G224: std_logic; attribute dont_touch of G224: signal is true;
	signal G225: std_logic; attribute dont_touch of G225: signal is true;
	signal G226: std_logic; attribute dont_touch of G226: signal is true;
	signal G227: std_logic; attribute dont_touch of G227: signal is true;
	signal G228: std_logic; attribute dont_touch of G228: signal is true;
	signal G229: std_logic; attribute dont_touch of G229: signal is true;
	signal G231: std_logic; attribute dont_touch of G231: signal is true;
	signal G232: std_logic; attribute dont_touch of G232: signal is true;
	signal G233: std_logic; attribute dont_touch of G233: signal is true;
	signal G234: std_logic; attribute dont_touch of G234: signal is true;
	signal G235: std_logic; attribute dont_touch of G235: signal is true;
	signal G236: std_logic; attribute dont_touch of G236: signal is true;
	signal G237: std_logic; attribute dont_touch of G237: signal is true;
	signal G238: std_logic; attribute dont_touch of G238: signal is true;
	signal G239: std_logic; attribute dont_touch of G239: signal is true;
	signal G240: std_logic; attribute dont_touch of G240: signal is true;
	signal G241: std_logic; attribute dont_touch of G241: signal is true;
	signal G242: std_logic; attribute dont_touch of G242: signal is true;
	signal G243: std_logic; attribute dont_touch of G243: signal is true;
	signal G244: std_logic; attribute dont_touch of G244: signal is true;
	signal G245: std_logic; attribute dont_touch of G245: signal is true;
	signal G246: std_logic; attribute dont_touch of G246: signal is true;
	signal G247: std_logic; attribute dont_touch of G247: signal is true;
	signal G248: std_logic; attribute dont_touch of G248: signal is true;
	signal G249: std_logic; attribute dont_touch of G249: signal is true;
	signal G250: std_logic; attribute dont_touch of G250: signal is true;
	signal G251: std_logic; attribute dont_touch of G251: signal is true;
	signal G252: std_logic; attribute dont_touch of G252: signal is true;
	signal G253: std_logic; attribute dont_touch of G253: signal is true;
	signal G254: std_logic; attribute dont_touch of G254: signal is true;
	signal G255: std_logic; attribute dont_touch of G255: signal is true;
	signal G256: std_logic; attribute dont_touch of G256: signal is true;
	signal G257: std_logic; attribute dont_touch of G257: signal is true;
	signal G258: std_logic; attribute dont_touch of G258: signal is true;
	signal G259: std_logic; attribute dont_touch of G259: signal is true;
	signal G260: std_logic; attribute dont_touch of G260: signal is true;
	signal G261: std_logic; attribute dont_touch of G261: signal is true;
	signal G262: std_logic; attribute dont_touch of G262: signal is true;
	signal G263: std_logic; attribute dont_touch of G263: signal is true;
	signal G264: std_logic; attribute dont_touch of G264: signal is true;
	signal G265: std_logic; attribute dont_touch of G265: signal is true;
	signal G266: std_logic; attribute dont_touch of G266: signal is true;
	signal G267: std_logic; attribute dont_touch of G267: signal is true;
	signal G268: std_logic; attribute dont_touch of G268: signal is true;
	signal G269: std_logic; attribute dont_touch of G269: signal is true;
	signal G270: std_logic; attribute dont_touch of G270: signal is true;
	signal G271: std_logic; attribute dont_touch of G271: signal is true;
	signal G272: std_logic; attribute dont_touch of G272: signal is true;
	signal G273: std_logic; attribute dont_touch of G273: signal is true;
	signal G274: std_logic; attribute dont_touch of G274: signal is true;
	signal G275: std_logic; attribute dont_touch of G275: signal is true;
	signal G276: std_logic; attribute dont_touch of G276: signal is true;
	signal G277: std_logic; attribute dont_touch of G277: signal is true;
	signal G278: std_logic; attribute dont_touch of G278: signal is true;
	signal G279: std_logic; attribute dont_touch of G279: signal is true;
	signal G280: std_logic; attribute dont_touch of G280: signal is true;
	signal G281: std_logic; attribute dont_touch of G281: signal is true;
	signal G282: std_logic; attribute dont_touch of G282: signal is true;
	signal G283: std_logic; attribute dont_touch of G283: signal is true;
	signal G284: std_logic; attribute dont_touch of G284: signal is true;
	signal G285: std_logic; attribute dont_touch of G285: signal is true;
	signal G286: std_logic; attribute dont_touch of G286: signal is true;
	signal G287: std_logic; attribute dont_touch of G287: signal is true;
	signal G289: std_logic; attribute dont_touch of G289: signal is true;
	signal G291: std_logic; attribute dont_touch of G291: signal is true;
	signal G293: std_logic; attribute dont_touch of G293: signal is true;
	signal G294: std_logic; attribute dont_touch of G294: signal is true;
	signal G295: std_logic; attribute dont_touch of G295: signal is true;
	signal G297: std_logic; attribute dont_touch of G297: signal is true;
	signal G299: std_logic; attribute dont_touch of G299: signal is true;
	signal G301: std_logic; attribute dont_touch of G301: signal is true;
	signal G303: std_logic; attribute dont_touch of G303: signal is true;
	signal G304: std_logic; attribute dont_touch of G304: signal is true;
	signal G305: std_logic; attribute dont_touch of G305: signal is true;
	signal G306: std_logic; attribute dont_touch of G306: signal is true;
	signal G307: std_logic; attribute dont_touch of G307: signal is true;
	signal G308: std_logic; attribute dont_touch of G308: signal is true;
	signal G309: std_logic; attribute dont_touch of G309: signal is true;
	signal G311: std_logic; attribute dont_touch of G311: signal is true;
	signal G313: std_logic; attribute dont_touch of G313: signal is true;
	signal G314: std_logic; attribute dont_touch of G314: signal is true;
	signal G316: std_logic; attribute dont_touch of G316: signal is true;
	signal G317: std_logic; attribute dont_touch of G317: signal is true;
	signal G318: std_logic; attribute dont_touch of G318: signal is true;
	signal G319: std_logic; attribute dont_touch of G319: signal is true;
	signal G320: std_logic; attribute dont_touch of G320: signal is true;
	signal G321: std_logic; attribute dont_touch of G321: signal is true;
	signal G323: std_logic; attribute dont_touch of G323: signal is true;
	signal G324: std_logic; attribute dont_touch of G324: signal is true;
	signal G326: std_logic; attribute dont_touch of G326: signal is true;
	signal G328: std_logic; attribute dont_touch of G328: signal is true;
	signal G329: std_logic; attribute dont_touch of G329: signal is true;
	signal I127: std_logic; attribute dont_touch of I127: signal is true;
	signal I130: std_logic; attribute dont_touch of I130: signal is true;
	signal I133: std_logic; attribute dont_touch of I133: signal is true;
	signal I198: std_logic; attribute dont_touch of I198: signal is true;
begin
	process(CLK)
	begin
		if(rising_edge(CLK)) then
			G38<=G90;
			G39<=G93;
			G40<=G96;
			G41<=G99;
			G42<=G102;
		end if;
	end process;
	G88<= not G18;
	G91<= not G18;
	G94<= not G18;
	G97<= not G18;
	G100<= not G18;
	G112<= not G8;
	G130<= not G5;
	G168<= not G12;
	G171<= not G10;
	G172<= not G11;
	G181<= not G2;
	G198<= not G9;
	G201<= not G13;
	G202<= not G7;
	G203<= not G6;
	G228<= not I127;
	G229<= not I130;
	G231<= not I133;
	G245<= not G0;
	G247<= not I198;
	G256<= not G4;
	G267<= not G15;
	G280<= not G38;
	G281<= not G16;
	G313<= not G41;
	G317<= not G40;
	G318<= not G39;
	G323<= not G1;
	G328<= not G42;
	I127<= not G38;
	I130<= not G15;
	I133<= not G313;
	I198<= not G38;
	G90<=G89 and G88;
	G93<=G92 and G91;
	G96<=G95 and G94;
	G99<=G98 and G97;
	G102<=G101 and G100;
	G103<=G313 and G38;
	G117<=G1 and G39 and G313;
	G118<=G245 and G38 and G39;
	G120<=G39 and G40 and G42;
	G121<=G318 and G317 and G328;
	G127<=G38 and G39 and G313 and G328;
	G128<=G280 and G318 and G40;
	G129<=G39 and G317;
	G141<=G317 and G16 and G323 and G140;
	G142<=G40 and G281;
	G143<=G40 and G4;
	G150<=G256 and G147 and G148 and G149;
	G151<=G38 and G16 and G256 and G153;
	G152<=G313 and G317 and G318 and G154;
	G158<=G280 and G157;
	G160<=G5 and G313 and G328;
	G161<=G3 and G42;
	G162<=G1 and G42;
	G163<=G41 and G42;
	G164<=G42 and G313;
	G166<=G245 and G38 and G42;
	G167<=G256 and G38 and G313;
	G169<=G172 and G168;
	G170<=G171 and G172;
	G174<=G41 and G40 and G15 and G173;
	G175<=G317 and G176;
	G185<=G280 and G184;
	G187<=G5 and G313 and G328;
	G188<=G3 and G42;
	G189<=G1 and G42;
	G190<=G41 and G42;
	G191<=G42 and G313;
	G193<=G11 and G328;
	G194<=G10 and G328;
	G195<=G41 and G42;
	G197<=G8 and G7 and G6 and G196;
	G199<=G245 and G38 and G42;
	G200<=G256 and G38 and G313;
	G210<=G39 and G38 and G245 and G209;
	G211<=G317 and G39 and G256 and G212;
	G213<=G16 and G313 and G328;
	G214<=G267 and G16;
	G215<=G41 and G42;
	G218<=G2 and G323 and G216 and G217;
	G219<=G318 and G220;
	G223<=G16 and G222;
	G226<=G318 and G225;
	G232<=G38 and G318;
	G233<=G15 and G318;
	G234<=G15 and G40 and G313 and G42;
	G235<=G317 and G328;
	G249<=G40 and G41 and G328;
	G250<=G39 and G40 and G42;
	G251<=G318 and G313;
	G252<=G318 and G317;
	G258<=G318 and G280 and G257;
	G259<=G41 and G260;
	G263<=G39 and G38 and G262;
	G264<=G318 and G266;
	G265<=G317 and G267;
	G268<=G328 and G267;
	G271<=G318 and G15 and G14 and G270;
	G272<=G318 and G4 and G274;
	G273<=G40 and G39 and G275;
	G276<=G0 and G38 and G328;
	G277<=G323 and G281 and G280;
	G278<=G280 and G42;
	G279<=G281 and G42;
	G282<=G317 and G328;
	G283<=G317 and G313;
	G294<=G16 and G293;
	G44<= not (G317 and G318 and G280 and G15);
	G46<= not (G318 and G280 and G16 and G122);
	G48<= not (G40 and G39 and G280 and G130);
	G49<= not (G52 and G51);
	G54<= not (G41 and G317 and G318 and G280);
	G56<= not (G40 and G39 and G280 and G5);
	G57<= not (G41 and G40 and G318 and G16);
	G58<= not (G132 and G133 and G134);
	G59<= not (G144 and G145);
	G61<= not (G328 and G313 and G317 and G146);
	G65<= not (G42 and G41 and G317);
	G69<= not (G180 and G328 and G317 and G179);
	G73<= not (G42 and G41 and G40);
	G75<= not (G207 and G206);
	G81<= not (G246 and G247 and G248);
	G84<= not (G255 and G254);
	G92<= not (G62 and G63 and G64 and G61);
	G95<= not (G70 and G71 and G72 and G69);
	G98<= not (G78 and G79 and G80 and G77);
	G101<= not (G85 and G86 and G87 and G84);
	G105<= not (G328 and G40 and G15 and G9);
	G123<= not (G124 and G125 and G126 and G256);
	G156<= not (G318 and G280 and G281);
	G176<= not (G42 and G41 and G280 and G15);
	G179<= not (G182 and G183);
	G204<= not (G9 and G8);
	G205<= not (G228 and G229);
	G217<= not (G236 and G237);
	G224<= not (G238 and G239 and G240 and G241);
	G225<= not (G41 and G256);
	G227<= not (G242 and G243 and G244 and G40);
	G257<= not (G106 and G107 and G108);
	G262<= not (G113 and G317);
	G266<= not (G109 and G110 and G111 and G40);
	G269<= not (G114 and G115 and G116 and G317);
	G275<= not (G285 and G286 and G287);
	G284<= not (G42 and G313);
	G289<= not (G313 and G40 and G39 and G280);
	G291<= not (G313 and G317 and G39 and G15);
	G293<= not (G8 and G7 and G6 and G131);
	G295<= not (G41 and G317 and G39 and G256);
	G297<= not (G41 and G40 and G39 and G280);
	G299<= not (G318 and G280 and G15 and G14);
	G301<= not (G281 and G3 and G323 and G119);
	G302<= not (G307 and G308 and G309 and G306);
	G303<= not (G135 and G136);
	G306<= not (G139 and G138);
	G311<= not (G313 and G40 and G39 and G280);
	G314<= not (G40 and G39 and G280 and G16);
	G315<= not (G320 and G321);
	G316<= not (G328 and G313);
	G319<= not (G42 and G41);
	G326<= not (G313 and G40 and G39 and G280);
	G329<= not (G313 and G317 and G39 and G15);
	G52<=G328 or G313 or G39 or G50;
	G62<=G267 or G4 or G57 or G58;
	G63<=G40 or G318 or G4 or G59;
	G64<=G317 or G318 or G60;
	G67<=G174 or G175 or G177;
	G70<=G318 or G4 or G65 or G66;
	G71<=G39 or G281 or G4 or G67;
	G72<=G317 or G318 or G68;
	G78<=G39 or G4 or G73 or G74;
	G79<=G40 or G281 or G4 or G75;
	G80<=G38 or G76;
	G85<=G328 or G313 or G317 or G81;
	G86<=G38 or G82;
	G87<=G281 or G83;
	G89<=G150 or G151 or G152 or G155;
	G106<=G8 or G7 or G203 or G105;
	G107<=G41 or G40 or G1;
	G108<=G328 or G15;
	G109<=G201 or G267 or G328;
	G110<=G280 or G42;
	G111<=G15 or G42;
	G113<=G203 or G202 or G112 or G198;
	G114<=G267 or G318 or G328;
	G115<=G39 or G42;
	G116<=G39 or G313;
	G124<=G11 or G12;
	G125<=G10 or G12;
	G126<=G10 or G11;
	G132<=G171 or G11 or G12 or G42;
	G133<=G10 or G172 or G12 or G42;
	G134<=G280 or G42;
	G135<=G280 or G40;
	G136<=G4 or G281;
	G139<=G317 or G137;
	G144<=G16 or G42;
	G145<=G16 or G41;
	G180<=G41 or G178;
	G182<=G14 or G267 or G38 or G39;
	G183<=G38 or G39 or G41;
	G207<=G202 or G203 or G204 or G205;
	G236<=G318 or G317 or G328;
	G237<=G16 or G39 or G40;
	G238<=G14 or G267 or G40 or G42;
	G239<=G40 or G41 or G42;
	G240<=G256 or G313 or G328;
	G241<=G256 or G317;
	G242<=G41 or G328;
	G243<=G5 or G41;
	G244<=G281 or G328;
	G246<=G4 or G39;
	G248<=G245 or G318;
	G255<=G317 or G253;
	G285<=G3 or G2 or G1 or G284;
	G286<=G42 or G313;
	G287<=G42 or G5;
	G307<=G328 or G313 or G39 or G303;
	G308<=G40 or G318 or G16 or G304;
	G309<=G39 or G38 or G305;
	G320<=G40 or G39 or G38 or G316;
	G321<=G317 or G318 or G38 or G319;
	G43<= not (G42 or G313 or G44);
	G45<= not (G42 or G313 or G317 or G46);
	G47<= not (G42 or G41 or G48);
	G50<= not (G40 or G280);
	G51<= not (G127 or G128 or G129);
	G53<= not (G42 or G54);
	G55<= not (G42 or G41 or G56);
	G60<= not (G158 or G159);
	G66<= not (G197 or G281);
	G68<= not (G185 or G186);
	G74<= not (G281 or G267 or G201);
	G76<= not (G218 or G219 or G221);
	G77<= not (G210 or G211);
	G82<= not (G271 or G272 or G273);
	G83<= not (G258 or G259 or G261);
	G104<= not (G117 or G118);
	G119<= not (G39 or G38);
	G122<= not (G267 or G123);
	G131<= not (G280 or G267 or G198);
	G137<= not (G42 or G41 or G280);
	G138<= not (G318 or G256);
	G140<= not (G42 or G41);
	G146<= not (G3 or G181 or G1 or G156);
	G147<= not (G38 or G281 or G267);
	G148<= not (G42 or G313 or G317 or G39);
	G149<= not (G169 or G170);
	G153<= not (G249 or G250 or G251 or G252);
	G154<= not (G276 or G277 or G278 or G279);
	G155<= not (G103 or G328 or G317 or G104);
	G157<= not (G160 or G161 or G162 or G163);
	G159<= not (G164 or G165);
	G165<= not (G166 or G167);
	G173<= not (G193 or G194);
	G177<= not (G195 or G280);
	G178<= not (G16 or G3 or G181 or G1);
	G184<= not (G187 or G188 or G189 or G190);
	G186<= not (G191 or G192);
	G192<= not (G199 or G200);
	G196<= not (G280 or G267 or G198);
	G206<= not (G231 or G232 or G233);
	G209<= not (G328 or G313 or G317);
	G212<= not (G213 or G214 or G215);
	G216<= not (G41 or G3);
	G220<= not (G223 or G224);
	G221<= not (G226 or G227);
	G222<= not (G234 or G235);
	G253<= not (G42 or G41 or G280);
	G254<= not (G318 or G256);
	G260<= not (G263 or G264 or G265);
	G261<= not (G268 or G269);
	G270<= not (G42 or G313 or G40);
	G274<= not (G282 or G283);
	G288<= not (G42 or G289);
	G290<= not (G42 or G291);
	G292<= not (G294 or G328 or G295);
	G296<= not (G42 or G297);
	G298<= not (G42 or G313 or G40 or G299);
	G300<= not (G42 or G41 or G40 or G301);
	G304<= not (G328 or G313);
	G305<= not (G141 or G142 or G143);
	G310<= not (G328 or G311);
	G312<= not (G328 or G313 or G314);
	G322<= not (G41 or G38 or G323 or G324);
	G324<= not (G120 or G121);
	G325<= not (G328 or G326);
	G327<= not (G328 or G329);
end RTL;
