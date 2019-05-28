-- File created by Bench2VHDL
-- Name: s713
-- File: bench/s713.bench
-- Timestamp: 2019-05-21T22:08:28.075723
--
-- Original File
-- =============
--	# s713
--	# 35 inputs
--	# 23 outputs
--	# 19 D-type flipflops
--	# 254 inverters
--	# 139 gates (94 ANDs + 28 NANDs + 17 ORs + 0 NORs)
--	
--	INPUT(G1)
--	INPUT(G2)
--	INPUT(G3)
--	INPUT(G4)
--	INPUT(G5)
--	INPUT(G6)
--	INPUT(G8)
--	INPUT(G9)
--	INPUT(G10)
--	INPUT(G11)
--	INPUT(G12)
--	INPUT(G13)
--	INPUT(G14)
--	INPUT(G15)
--	INPUT(G16)
--	INPUT(G17)
--	INPUT(G18)
--	INPUT(G19)
--	INPUT(G20)
--	INPUT(G21)
--	INPUT(G22)
--	INPUT(G23)
--	INPUT(G24)
--	INPUT(G25)
--	INPUT(G26)
--	INPUT(G27)
--	INPUT(G28)
--	INPUT(G29)
--	INPUT(G30)
--	INPUT(G31)
--	INPUT(G32)
--	INPUT(G33)
--	INPUT(G34)
--	INPUT(G35)
--	INPUT(G36)
--	
--	OUTPUT(G103BF)
--	OUTPUT(G104BF)
--	OUTPUT(G105BF)
--	OUTPUT(G106BF)
--	OUTPUT(G107)
--	OUTPUT(G83)
--	OUTPUT(G84)
--	OUTPUT(G85)
--	OUTPUT(G86BF)
--	OUTPUT(G87BF)
--	OUTPUT(G88BF)
--	OUTPUT(G89BF)
--	OUTPUT(G90)
--	OUTPUT(G91)
--	OUTPUT(G92)
--	OUTPUT(G94)
--	OUTPUT(G95BF)
--	OUTPUT(G96BF)
--	OUTPUT(G97BF)
--	OUTPUT(G98BF)
--	OUTPUT(G99BF)
--	OUTPUT(G100BF)
--	OUTPUT(G101BF)
--	
--	G64 = DFF(G380)
--	G65 = DFF(G262)
--	G66 = DFF(G394)
--	G67 = DFF(G250)
--	G68 = DFF(G122)
--	G69 = DFF(G133)
--	G70 = DFF(G138)
--	G71 = DFF(G139)
--	G72 = DFF(G140)
--	G73 = DFF(G141)
--	G74 = DFF(G142)
--	G75 = DFF(G125)
--	G76 = DFF(G126)
--	G77 = DFF(G127)
--	G78 = DFF(G128)
--	G79 = DFF(G129)
--	G80 = DFF(G130)
--	G81 = DFF(G131)
--	G82 = DFF(G132)
--	
--	I633 = NOT(G1)
--	G366 = NOT(G2)
--	G379 = NOT(G3)
--	I643 = NOT(G4)
--	I646 = NOT(G5)
--	I649 = NOT(G6)
--	I652 = NOT(G8)
--	I655 = NOT(G9)
--	I660 = NOT(G10)
--	I680 = NOT(G11)
--	I684 = NOT(G12)
--	I687 = NOT(G13)
--	I165 = NOT(G27)
--	G91 = NOT(I165)
--	II178 = NOT(G29)
--	I169 = NOT(G70)
--	G113 = NOT(I169)
--	I172 = NOT(G71)
--	G115 = NOT(I172)
--	I175 = NOT(G72)
--	G117 = NOT(I175)
--	I178 = NOT(G80)
--	G219 = NOT(I178)
--	I181 = NOT(G73)
--	G119 = NOT(I181)
--	I184 = NOT(G81)
--	G221 = NOT(I184)
--	I187 = NOT(G74)
--	G121 = NOT(I187)
--	I190 = NOT(G82)
--	G223 = NOT(I190)
--	I193 = NOT(G75)
--	G209 = NOT(I193)
--	I196 = NOT(G68)
--	G109 = NOT(I196)
--	I199 = NOT(G76)
--	G211 = NOT(I199)
--	I202 = NOT(G69)
--	G111 = NOT(I202)
--	I205 = NOT(G77)
--	G213 = NOT(I205)
--	I208 = NOT(G78)
--	G215 = NOT(I208)
--	I211 = NOT(G79)
--	G217 = NOT(I211)
--	G352 = NOT(I633)
--	G360 = NOT(I643)
--	G361 = NOT(I646)
--	G362 = NOT(I649)
--	G363 = NOT(I652)
--	G364 = NOT(I655)
--	G367 = NOT(I660)
--	G386 = NOT(I680)
--	G388 = NOT(I684)
--	G389 = NOT(I687)
--	G94 = NOT(II178)
--	G110 = NOT(G360)
--	G114 = NOT(G360)
--	G118 = NOT(G360)
--	G216 = NOT(G360)
--	G218 = NOT(G360)
--	G220 = NOT(G360)
--	G222 = NOT(G360)
--	G365 = NOT(G364)
--	G368 = NOT(G367)
--	G387 = NOT(G386)
--	G225 = NOT(G388)
--	G390 = NOT(G389)
--	I356 = NOT(G289)
--	I254 = NOT(G324)
--	G166 = NOT(I254)
--	I257 = NOT(G324)
--	G325 = NOT(I257)
--	I260 = NOT(G338)
--	G194 = NOT(I260)
--	I263 = NOT(G338)
--	G339 = NOT(I263)
--	I266 = NOT(G344)
--	G202 = NOT(I266)
--	I269 = NOT(G344)
--	G345 = NOT(I269)
--	I272 = NOT(G312)
--	G313 = NOT(I272)
--	I275 = NOT(G315)
--	G316 = NOT(I275)
--	I278 = NOT(G318)
--	G319 = NOT(I278)
--	I281 = NOT(G321)
--	G322 = NOT(I281)
--	G143 = NOT(I356)
--	I287 = NOT(G166)
--	G381 = NOT(I287)
--	I291 = NOT(G194)
--	G375 = NOT(I291)
--	I295 = NOT(G202)
--	G371 = NOT(I295)
--	I303 = NOT(G143)
--	G350 = NOT(I303)
--	I299 = NOT(G281)
--	I313 = NOT(G283)
--	G382 = NOT(G381)
--	G100BF = NOT(G100)
--	G376 = NOT(G375)
--	G98BF = NOT(G98)
--	G372 = NOT(G371)
--	G96BF = NOT(G96)
--	I301 = NOT(I299)
--	I315 = NOT(I313)
--	I321 = NOT(G135)
--	G329 = NOT(I321)
--	I324 = NOT(G137)
--	G333 = NOT(I324)
--	G87BF = NOT(G87)
--	I406 = NOT(G87)
--	G89BF = NOT(G89)
--	I422 = NOT(G89)
--	G173 = NOT(I406)
--	G183 = NOT(I422)
--	I335 = NOT(G173)
--	G174 = NOT(I335)
--	I338 = NOT(G183)
--	G184 = NOT(I338)
--	I341 = NOT(G174)
--	G355 = NOT(I341)
--	G359 = NOT(G184)
--	G356 = NOT(G355)
--	G108 = NOT(G359)
--	G116 = NOT(G356)
--	I354 = NOT(G293)
--	G146 = NOT(I354)
--	I357 = NOT(G293)
--	G294 = NOT(I357)
--	I360 = NOT(G309)
--	G162 = NOT(I360)
--	I363 = NOT(G309)
--	G310 = NOT(I363)
--	I366 = NOT(G341)
--	G198 = NOT(I366)
--	I369 = NOT(G341)
--	G342 = NOT(I369)
--	I372 = NOT(G303)
--	G154 = NOT(I372)
--	I375 = NOT(G303)
--	G304 = NOT(I375)
--	I378 = NOT(G146)
--	G383 = NOT(I378)
--	I382 = NOT(G162)
--	G396 = NOT(I382)
--	I386 = NOT(G198)
--	G373 = NOT(I386)
--	I390 = NOT(G154)
--	G392 = NOT(I390)
--	G384 = NOT(G383)
--	G101BF = NOT(G101)
--	G397 = NOT(G396)
--	G106BF = NOT(G106)
--	G374 = NOT(G373)
--	G97BF = NOT(G97)
--	G393 = NOT(G392)
--	G104BF = NOT(G104)
--	II476 = NOT(G384)
--	I279 = NOT(G278)
--	G224 = NOT(II476)
--	G132 = NOT(I279)
--	I306 = NOT(G282)
--	I334 = NOT(G286)
--	I327 = NOT(G285)
--	II208 = NOT(G268)
--	I308 = NOT(I306)
--	I336 = NOT(I334)
--	I329 = NOT(I327)
--	I210 = NOT(II208)
--	I442 = NOT(G136)
--	G331 = NOT(I442)
--	G88BF = NOT(G88)
--	I414 = NOT(G88)
--	G178 = NOT(I414)
--	I449 = NOT(G178)
--	G179 = NOT(I449)
--	I452 = NOT(G179)
--	G357 = NOT(I452)
--	G358 = NOT(G357)
--	G112 = NOT(G358)
--	I460 = NOT(G335)
--	G190 = NOT(I460)
--	I463 = NOT(G335)
--	G336 = NOT(I463)
--	I466 = NOT(G306)
--	G158 = NOT(I466)
--	I469 = NOT(G306)
--	G307 = NOT(I469)
--	I472 = NOT(G190)
--	G377 = NOT(I472)
--	I476 = NOT(G158)
--	G394 = NOT(I476)
--	G378 = NOT(G377)
--	G99BF = NOT(G99)
--	G395 = NOT(G158)
--	G105BF = NOT(G105)
--	II272 = NOT(G277)
--	G131 = NOT(II272)
--	I265 = NOT(G276)
--	I320 = NOT(G284)
--	I285 = NOT(G279)
--	I292 = NOT(G280)
--	G130 = NOT(I265)
--	I322 = NOT(I320)
--	II287 = NOT(I285)
--	I294 = NOT(I292)
--	I517 = NOT(G134)
--	G327 = NOT(I517)
--	G86BF = NOT(G86)
--	I398 = NOT(G86)
--	G168 = NOT(I398)
--	I524 = NOT(G168)
--	G169 = NOT(I524)
--	I527 = NOT(G169)
--	G353 = NOT(I527)
--	G354 = NOT(G353)
--	G120 = NOT(G354)
--	I535 = NOT(G347)
--	G206 = NOT(I535)
--	I538 = NOT(G347)
--	G348 = NOT(I538)
--	I541 = NOT(G300)
--	G150 = NOT(I541)
--	I544 = NOT(G300)
--	G301 = NOT(I544)
--	I547 = NOT(G206)
--	G369 = NOT(I547)
--	I551 = NOT(G150)
--	G380 = NOT(I551)
--	G370 = NOT(G369)
--	G95BF = NOT(G95)
--	G391 = NOT(G150)
--	G103BF = NOT(G103)
--	I230 = NOT(G271)
--	I258 = NOT(G275)
--	I348 = NOT(G288)
--	II341 = NOT(G287)
--	G125 = NOT(I230)
--	G129 = NOT(I258)
--	I222 = NOT(G270)
--	I350 = NOT(I348)
--	I343 = NOT(II341)
--	I237 = NOT(G272)
--	I244 = NOT(G273)
--	I251 = NOT(G274)
--	I224 = NOT(I222)
--	G126 = NOT(I237)
--	G127 = NOT(I244)
--	G128 = NOT(I251)
--	I608 = NOT(G124)
--	G298 = NOT(I608)
--	
--	G289 = AND(G386, G388, G389)
--	G324 = AND(G110, G111)
--	G338 = AND(G114, G115)
--	G344 = AND(G118, G119)
--	G312 = AND(G216, G217)
--	G315 = AND(G218, G219)
--	G318 = AND(G220, G221)
--	G321 = AND(G222, G223)
--	G231 = AND(G379, G387)
--	G232 = AND(G379, G387)
--	G233 = AND(G379, G387)
--	G234 = AND(G379, G387)
--	G247 = AND(G379, G365, G368, G390)
--	G248 = AND(G379, G365, G367, G390)
--	G263 = AND(G379, G364, G368, G390)
--	G264 = AND(G379, G364, G367, G390)
--	G100 = AND(G325, G35)
--	G98 = AND(G339, G33)
--	G96 = AND(G345, G31)
--	G107 = AND(G313, G18)
--	G83 = AND(G316, G19)
--	G84 = AND(G319, G20)
--	G85 = AND(G322, G21)
--	G92 = AND(G350, G28)
--	G87 = AND(G329, G23)
--	G89 = AND(G333, G25)
--	G293 = AND(G108, G109)
--	G309 = AND(G214, G215)
--	G341 = AND(G116, G117)
--	G303 = AND(G210, G211)
--	G101 = AND(G294, G36)
--	G106 = AND(G310, G17)
--	G97 = AND(G342, G32)
--	G104 = AND(G304, G15)
--	G240 = AND(G359, G383)
--	G266 = AND(G364, G367, G383, G390)
--	G229 = AND(G366, G396)
--	G245 = AND(G352, G396)
--	G250 = AND(G366, G396)
--	G278 = AND(G366, G396)
--	G253 = AND(G356, G373, G375)
--	I533 = AND(G365, G367, G373)
--	G227 = AND(G366, G392)
--	G243 = AND(G392, G361)
--	G249 = AND(G366, G66, G397)
--	G265 = AND(G375, G390, I533)
--	G236 = AND(G374, G376)
--	G237 = AND(G374, G375)
--	G252 = AND(G355, G374, G375)
--	II527 = AND(G366, G64, G393)
--	G88 = AND(G331, G24)
--	G335 = AND(G112, G113)
--	G306 = AND(G212, G213)
--	G99 = AND(G336, G34)
--	G105 = AND(G307, G16)
--	G251 = AND(G358, G377, G381)
--	I512 = AND(G364, G368, G377)
--	II538 = AND(G377, G381, G383, G387)
--	G228 = AND(G366, G158)
--	G244 = AND(G158, G362)
--	G277 = AND(G366, G158, G397)
--	G256 = AND(G381, G390, I512)
--	G230 = AND(G378, G382)
--	G235 = AND(G378, G381)
--	G246 = AND(G357, G378, G381)
--	I515 = AND(G393, G395, G397)
--	G261 = AND(G395, G397, II527)
--	G262 = AND(G366, G392, G395, G397)
--	G276 = AND(G366, G392, G395, G397)
--	G86 = AND(G327, G22)
--	G347 = AND(G120, G121)
--	G300 = AND(G208, G209)
--	G95 = AND(G348, G30)
--	G103 = AND(G301, G14)
--	I495 = AND(G365, G368, G369)
--	G255 = AND(G354, G369, G371)
--	G257 = AND(G363, G369, G371, I515)
--	I537 = AND(G369, G371, G373, G375)
--	G226 = AND(G366, G150)
--	G242 = AND(G150, G363)
--	I553 = AND(G366, G150, G393)
--	G241 = AND(G371, G390, I495)
--	G267 = AND(I537, II538)
--	G238 = AND(G370, G372)
--	G239 = AND(G370, G371)
--	G254 = AND(G353, G370, G371)
--	G275 = AND(G395, G397, I553)
--	I518 = AND(G391, G395, G397)
--	I521 = AND(G391, G393, G397)
--	II524 = AND(G352, G391, G393)
--	G258 = AND(G361, G373, G375, I518)
--	G259 = AND(G362, G377, G381, I521)
--	G260 = AND(G395, G383, II524)
--	G90 = AND(G298, G26)
--	
--	G281 = OR(G232, G248, G65)
--	G283 = OR(G234, G67, G264)
--	G282 = OR(G233, G249, G263)
--	G286 = OR(G237, G253)
--	G285 = OR(G236, G252)
--	G268 = OR(G224, G240)
--	G284 = OR(G235, G251)
--	G279 = OR(G230, G246)
--	G280 = OR(G231, G247, G261)
--	G271 = OR(G226, G242, G257)
--	I546 = OR(G225, G241, G256)
--	G288 = OR(G239, G255)
--	G287 = OR(G238, G254)
--	G270 = OR(G265, G266, G267, I546)
--	G272 = OR(G227, G243, G258)
--	G273 = OR(G228, G244, G259)
--	G274 = OR(G229, G245, G260)
--	
--	I300 = NAND(G281, I299)
--	I314 = NAND(G283, I313)
--	G135 = NAND(I300, I301)
--	G137 = NAND(I314, I315)
--	G214 = NAND(G379, G359)
--	G210 = NAND(G379, G356)
--	I307 = NAND(G282, I306)
--	II335 = NAND(G286, I334)
--	I328 = NAND(G285, I327)
--	I209 = NAND(G268, II208)
--	G136 = NAND(I307, I308)
--	G140 = NAND(II335, I336)
--	G139 = NAND(I328, I329)
--	G122 = NAND(I209, I210)
--	G212 = NAND(G379, G358)
--	II321 = NAND(G284, I320)
--	I286 = NAND(G279, I285)
--	I293 = NAND(G280, I292)
--	G138 = NAND(II321, I322)
--	G133 = NAND(I286, II287)
--	G134 = NAND(I293, I294)
--	G208 = NAND(G379, G354)
--	I349 = NAND(G288, I348)
--	I342 = NAND(G287, II341)
--	I223 = NAND(G270, I222)
--	G142 = NAND(I349, I350)
--	G141 = NAND(I342, I343)
--	G124 = NAND(I223, I224)
--
-- VHDL Output
-- =============
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity s713 is
	port (
		CLK: in std_logic;
		G1: in std_logic;
		G2: in std_logic;
		G3: in std_logic;
		G4: in std_logic;
		G5: in std_logic;
		G6: in std_logic;
		G8: in std_logic;
		G9: in std_logic;
		G10: in std_logic;
		G11: in std_logic;
		G12: in std_logic;
		G13: in std_logic;
		G14: in std_logic;
		G15: in std_logic;
		G16: in std_logic;
		G17: in std_logic;
		G18: in std_logic;
		G19: in std_logic;
		G20: in std_logic;
		G21: in std_logic;
		G22: in std_logic;
		G23: in std_logic;
		G24: in std_logic;
		G25: in std_logic;
		G26: in std_logic;
		G27: in std_logic;
		G28: in std_logic;
		G29: in std_logic;
		G30: in std_logic;
		G31: in std_logic;
		G32: in std_logic;
		G33: in std_logic;
		G34: in std_logic;
		G35: in std_logic;
		G36: in std_logic;
		G83: out std_logic;
		G84: out std_logic;
		G85: out std_logic;
		G86BF: out std_logic;
		G87BF: out std_logic;
		G88BF: out std_logic;
		G89BF: out std_logic;
		G90: out std_logic;
		G91: out std_logic;
		G92: out std_logic;
		G94: out std_logic;
		G95BF: out std_logic;
		G96BF: out std_logic;
		G97BF: out std_logic;
		G98BF: out std_logic;
		G99BF: out std_logic;
		G100BF: out std_logic;
		G101BF: out std_logic;
		G103BF: out std_logic;
		G104BF: out std_logic;
		G105BF: out std_logic;
		G106BF: out std_logic;
		G107: out std_logic
	);
end entity;

architecture RTL of s713 is
	attribute dont_touch: boolean;

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
	signal G86: std_logic; attribute dont_touch of G86: signal is true;
	signal G87: std_logic; attribute dont_touch of G87: signal is true;
	signal G88: std_logic; attribute dont_touch of G88: signal is true;
	signal G89: std_logic; attribute dont_touch of G89: signal is true;
	signal G95: std_logic; attribute dont_touch of G95: signal is true;
	signal G96: std_logic; attribute dont_touch of G96: signal is true;
	signal G97: std_logic; attribute dont_touch of G97: signal is true;
	signal G98: std_logic; attribute dont_touch of G98: signal is true;
	signal G99: std_logic; attribute dont_touch of G99: signal is true;
	signal G100: std_logic; attribute dont_touch of G100: signal is true;
	signal G101: std_logic; attribute dont_touch of G101: signal is true;
	signal G103: std_logic; attribute dont_touch of G103: signal is true;
	signal G104: std_logic; attribute dont_touch of G104: signal is true;
	signal G105: std_logic; attribute dont_touch of G105: signal is true;
	signal G106: std_logic; attribute dont_touch of G106: signal is true;
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
	signal G146: std_logic; attribute dont_touch of G146: signal is true;
	signal G150: std_logic; attribute dont_touch of G150: signal is true;
	signal G154: std_logic; attribute dont_touch of G154: signal is true;
	signal G158: std_logic; attribute dont_touch of G158: signal is true;
	signal G162: std_logic; attribute dont_touch of G162: signal is true;
	signal G166: std_logic; attribute dont_touch of G166: signal is true;
	signal G168: std_logic; attribute dont_touch of G168: signal is true;
	signal G169: std_logic; attribute dont_touch of G169: signal is true;
	signal G173: std_logic; attribute dont_touch of G173: signal is true;
	signal G174: std_logic; attribute dont_touch of G174: signal is true;
	signal G178: std_logic; attribute dont_touch of G178: signal is true;
	signal G179: std_logic; attribute dont_touch of G179: signal is true;
	signal G183: std_logic; attribute dont_touch of G183: signal is true;
	signal G184: std_logic; attribute dont_touch of G184: signal is true;
	signal G190: std_logic; attribute dont_touch of G190: signal is true;
	signal G194: std_logic; attribute dont_touch of G194: signal is true;
	signal G198: std_logic; attribute dont_touch of G198: signal is true;
	signal G202: std_logic; attribute dont_touch of G202: signal is true;
	signal G206: std_logic; attribute dont_touch of G206: signal is true;
	signal G208: std_logic; attribute dont_touch of G208: signal is true;
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
	signal G230: std_logic; attribute dont_touch of G230: signal is true;
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
	signal G288: std_logic; attribute dont_touch of G288: signal is true;
	signal G289: std_logic; attribute dont_touch of G289: signal is true;
	signal G293: std_logic; attribute dont_touch of G293: signal is true;
	signal G294: std_logic; attribute dont_touch of G294: signal is true;
	signal G298: std_logic; attribute dont_touch of G298: signal is true;
	signal G300: std_logic; attribute dont_touch of G300: signal is true;
	signal G301: std_logic; attribute dont_touch of G301: signal is true;
	signal G303: std_logic; attribute dont_touch of G303: signal is true;
	signal G304: std_logic; attribute dont_touch of G304: signal is true;
	signal G306: std_logic; attribute dont_touch of G306: signal is true;
	signal G307: std_logic; attribute dont_touch of G307: signal is true;
	signal G309: std_logic; attribute dont_touch of G309: signal is true;
	signal G310: std_logic; attribute dont_touch of G310: signal is true;
	signal G312: std_logic; attribute dont_touch of G312: signal is true;
	signal G313: std_logic; attribute dont_touch of G313: signal is true;
	signal G315: std_logic; attribute dont_touch of G315: signal is true;
	signal G316: std_logic; attribute dont_touch of G316: signal is true;
	signal G318: std_logic; attribute dont_touch of G318: signal is true;
	signal G319: std_logic; attribute dont_touch of G319: signal is true;
	signal G321: std_logic; attribute dont_touch of G321: signal is true;
	signal G322: std_logic; attribute dont_touch of G322: signal is true;
	signal G324: std_logic; attribute dont_touch of G324: signal is true;
	signal G325: std_logic; attribute dont_touch of G325: signal is true;
	signal G327: std_logic; attribute dont_touch of G327: signal is true;
	signal G329: std_logic; attribute dont_touch of G329: signal is true;
	signal G331: std_logic; attribute dont_touch of G331: signal is true;
	signal G333: std_logic; attribute dont_touch of G333: signal is true;
	signal G335: std_logic; attribute dont_touch of G335: signal is true;
	signal G336: std_logic; attribute dont_touch of G336: signal is true;
	signal G338: std_logic; attribute dont_touch of G338: signal is true;
	signal G339: std_logic; attribute dont_touch of G339: signal is true;
	signal G341: std_logic; attribute dont_touch of G341: signal is true;
	signal G342: std_logic; attribute dont_touch of G342: signal is true;
	signal G344: std_logic; attribute dont_touch of G344: signal is true;
	signal G345: std_logic; attribute dont_touch of G345: signal is true;
	signal G347: std_logic; attribute dont_touch of G347: signal is true;
	signal G348: std_logic; attribute dont_touch of G348: signal is true;
	signal G350: std_logic; attribute dont_touch of G350: signal is true;
	signal G352: std_logic; attribute dont_touch of G352: signal is true;
	signal G353: std_logic; attribute dont_touch of G353: signal is true;
	signal G354: std_logic; attribute dont_touch of G354: signal is true;
	signal G355: std_logic; attribute dont_touch of G355: signal is true;
	signal G356: std_logic; attribute dont_touch of G356: signal is true;
	signal G357: std_logic; attribute dont_touch of G357: signal is true;
	signal G358: std_logic; attribute dont_touch of G358: signal is true;
	signal G359: std_logic; attribute dont_touch of G359: signal is true;
	signal G360: std_logic; attribute dont_touch of G360: signal is true;
	signal G361: std_logic; attribute dont_touch of G361: signal is true;
	signal G362: std_logic; attribute dont_touch of G362: signal is true;
	signal G363: std_logic; attribute dont_touch of G363: signal is true;
	signal G364: std_logic; attribute dont_touch of G364: signal is true;
	signal G365: std_logic; attribute dont_touch of G365: signal is true;
	signal G366: std_logic; attribute dont_touch of G366: signal is true;
	signal G367: std_logic; attribute dont_touch of G367: signal is true;
	signal G368: std_logic; attribute dont_touch of G368: signal is true;
	signal G369: std_logic; attribute dont_touch of G369: signal is true;
	signal G370: std_logic; attribute dont_touch of G370: signal is true;
	signal G371: std_logic; attribute dont_touch of G371: signal is true;
	signal G372: std_logic; attribute dont_touch of G372: signal is true;
	signal G373: std_logic; attribute dont_touch of G373: signal is true;
	signal G374: std_logic; attribute dont_touch of G374: signal is true;
	signal G375: std_logic; attribute dont_touch of G375: signal is true;
	signal G376: std_logic; attribute dont_touch of G376: signal is true;
	signal G377: std_logic; attribute dont_touch of G377: signal is true;
	signal G378: std_logic; attribute dont_touch of G378: signal is true;
	signal G379: std_logic; attribute dont_touch of G379: signal is true;
	signal G380: std_logic; attribute dont_touch of G380: signal is true;
	signal G381: std_logic; attribute dont_touch of G381: signal is true;
	signal G382: std_logic; attribute dont_touch of G382: signal is true;
	signal G383: std_logic; attribute dont_touch of G383: signal is true;
	signal G384: std_logic; attribute dont_touch of G384: signal is true;
	signal G386: std_logic; attribute dont_touch of G386: signal is true;
	signal G387: std_logic; attribute dont_touch of G387: signal is true;
	signal G388: std_logic; attribute dont_touch of G388: signal is true;
	signal G389: std_logic; attribute dont_touch of G389: signal is true;
	signal G390: std_logic; attribute dont_touch of G390: signal is true;
	signal G391: std_logic; attribute dont_touch of G391: signal is true;
	signal G392: std_logic; attribute dont_touch of G392: signal is true;
	signal G393: std_logic; attribute dont_touch of G393: signal is true;
	signal G394: std_logic; attribute dont_touch of G394: signal is true;
	signal G395: std_logic; attribute dont_touch of G395: signal is true;
	signal G396: std_logic; attribute dont_touch of G396: signal is true;
	signal G397: std_logic; attribute dont_touch of G397: signal is true;
	signal I165: std_logic; attribute dont_touch of I165: signal is true;
	signal I169: std_logic; attribute dont_touch of I169: signal is true;
	signal I172: std_logic; attribute dont_touch of I172: signal is true;
	signal I175: std_logic; attribute dont_touch of I175: signal is true;
	signal I178: std_logic; attribute dont_touch of I178: signal is true;
	signal I181: std_logic; attribute dont_touch of I181: signal is true;
	signal I184: std_logic; attribute dont_touch of I184: signal is true;
	signal I187: std_logic; attribute dont_touch of I187: signal is true;
	signal I190: std_logic; attribute dont_touch of I190: signal is true;
	signal I193: std_logic; attribute dont_touch of I193: signal is true;
	signal I196: std_logic; attribute dont_touch of I196: signal is true;
	signal I199: std_logic; attribute dont_touch of I199: signal is true;
	signal I202: std_logic; attribute dont_touch of I202: signal is true;
	signal I205: std_logic; attribute dont_touch of I205: signal is true;
	signal I208: std_logic; attribute dont_touch of I208: signal is true;
	signal I209: std_logic; attribute dont_touch of I209: signal is true;
	signal I210: std_logic; attribute dont_touch of I210: signal is true;
	signal I211: std_logic; attribute dont_touch of I211: signal is true;
	signal I222: std_logic; attribute dont_touch of I222: signal is true;
	signal I223: std_logic; attribute dont_touch of I223: signal is true;
	signal I224: std_logic; attribute dont_touch of I224: signal is true;
	signal I230: std_logic; attribute dont_touch of I230: signal is true;
	signal I237: std_logic; attribute dont_touch of I237: signal is true;
	signal I244: std_logic; attribute dont_touch of I244: signal is true;
	signal I251: std_logic; attribute dont_touch of I251: signal is true;
	signal I254: std_logic; attribute dont_touch of I254: signal is true;
	signal I257: std_logic; attribute dont_touch of I257: signal is true;
	signal I258: std_logic; attribute dont_touch of I258: signal is true;
	signal I260: std_logic; attribute dont_touch of I260: signal is true;
	signal I263: std_logic; attribute dont_touch of I263: signal is true;
	signal I265: std_logic; attribute dont_touch of I265: signal is true;
	signal I266: std_logic; attribute dont_touch of I266: signal is true;
	signal I269: std_logic; attribute dont_touch of I269: signal is true;
	signal I272: std_logic; attribute dont_touch of I272: signal is true;
	signal I275: std_logic; attribute dont_touch of I275: signal is true;
	signal I278: std_logic; attribute dont_touch of I278: signal is true;
	signal I279: std_logic; attribute dont_touch of I279: signal is true;
	signal I281: std_logic; attribute dont_touch of I281: signal is true;
	signal I285: std_logic; attribute dont_touch of I285: signal is true;
	signal I286: std_logic; attribute dont_touch of I286: signal is true;
	signal I287: std_logic; attribute dont_touch of I287: signal is true;
	signal I291: std_logic; attribute dont_touch of I291: signal is true;
	signal I292: std_logic; attribute dont_touch of I292: signal is true;
	signal I293: std_logic; attribute dont_touch of I293: signal is true;
	signal I294: std_logic; attribute dont_touch of I294: signal is true;
	signal I295: std_logic; attribute dont_touch of I295: signal is true;
	signal I299: std_logic; attribute dont_touch of I299: signal is true;
	signal I300: std_logic; attribute dont_touch of I300: signal is true;
	signal I301: std_logic; attribute dont_touch of I301: signal is true;
	signal I303: std_logic; attribute dont_touch of I303: signal is true;
	signal I306: std_logic; attribute dont_touch of I306: signal is true;
	signal I307: std_logic; attribute dont_touch of I307: signal is true;
	signal I308: std_logic; attribute dont_touch of I308: signal is true;
	signal I313: std_logic; attribute dont_touch of I313: signal is true;
	signal I314: std_logic; attribute dont_touch of I314: signal is true;
	signal I315: std_logic; attribute dont_touch of I315: signal is true;
	signal I320: std_logic; attribute dont_touch of I320: signal is true;
	signal I321: std_logic; attribute dont_touch of I321: signal is true;
	signal I322: std_logic; attribute dont_touch of I322: signal is true;
	signal I324: std_logic; attribute dont_touch of I324: signal is true;
	signal I327: std_logic; attribute dont_touch of I327: signal is true;
	signal I328: std_logic; attribute dont_touch of I328: signal is true;
	signal I329: std_logic; attribute dont_touch of I329: signal is true;
	signal I334: std_logic; attribute dont_touch of I334: signal is true;
	signal I335: std_logic; attribute dont_touch of I335: signal is true;
	signal I336: std_logic; attribute dont_touch of I336: signal is true;
	signal I338: std_logic; attribute dont_touch of I338: signal is true;
	signal I341: std_logic; attribute dont_touch of I341: signal is true;
	signal I342: std_logic; attribute dont_touch of I342: signal is true;
	signal I343: std_logic; attribute dont_touch of I343: signal is true;
	signal I348: std_logic; attribute dont_touch of I348: signal is true;
	signal I349: std_logic; attribute dont_touch of I349: signal is true;
	signal I350: std_logic; attribute dont_touch of I350: signal is true;
	signal I354: std_logic; attribute dont_touch of I354: signal is true;
	signal I356: std_logic; attribute dont_touch of I356: signal is true;
	signal I357: std_logic; attribute dont_touch of I357: signal is true;
	signal I360: std_logic; attribute dont_touch of I360: signal is true;
	signal I363: std_logic; attribute dont_touch of I363: signal is true;
	signal I366: std_logic; attribute dont_touch of I366: signal is true;
	signal I369: std_logic; attribute dont_touch of I369: signal is true;
	signal I372: std_logic; attribute dont_touch of I372: signal is true;
	signal I375: std_logic; attribute dont_touch of I375: signal is true;
	signal I378: std_logic; attribute dont_touch of I378: signal is true;
	signal I382: std_logic; attribute dont_touch of I382: signal is true;
	signal I386: std_logic; attribute dont_touch of I386: signal is true;
	signal I390: std_logic; attribute dont_touch of I390: signal is true;
	signal I398: std_logic; attribute dont_touch of I398: signal is true;
	signal I406: std_logic; attribute dont_touch of I406: signal is true;
	signal I414: std_logic; attribute dont_touch of I414: signal is true;
	signal I422: std_logic; attribute dont_touch of I422: signal is true;
	signal I442: std_logic; attribute dont_touch of I442: signal is true;
	signal I449: std_logic; attribute dont_touch of I449: signal is true;
	signal I452: std_logic; attribute dont_touch of I452: signal is true;
	signal I460: std_logic; attribute dont_touch of I460: signal is true;
	signal I463: std_logic; attribute dont_touch of I463: signal is true;
	signal I466: std_logic; attribute dont_touch of I466: signal is true;
	signal I469: std_logic; attribute dont_touch of I469: signal is true;
	signal I472: std_logic; attribute dont_touch of I472: signal is true;
	signal I476: std_logic; attribute dont_touch of I476: signal is true;
	signal I495: std_logic; attribute dont_touch of I495: signal is true;
	signal I512: std_logic; attribute dont_touch of I512: signal is true;
	signal I515: std_logic; attribute dont_touch of I515: signal is true;
	signal I517: std_logic; attribute dont_touch of I517: signal is true;
	signal I518: std_logic; attribute dont_touch of I518: signal is true;
	signal I521: std_logic; attribute dont_touch of I521: signal is true;
	signal I524: std_logic; attribute dont_touch of I524: signal is true;
	signal I527: std_logic; attribute dont_touch of I527: signal is true;
	signal I533: std_logic; attribute dont_touch of I533: signal is true;
	signal I535: std_logic; attribute dont_touch of I535: signal is true;
	signal I537: std_logic; attribute dont_touch of I537: signal is true;
	signal I538: std_logic; attribute dont_touch of I538: signal is true;
	signal I541: std_logic; attribute dont_touch of I541: signal is true;
	signal I544: std_logic; attribute dont_touch of I544: signal is true;
	signal I546: std_logic; attribute dont_touch of I546: signal is true;
	signal I547: std_logic; attribute dont_touch of I547: signal is true;
	signal I551: std_logic; attribute dont_touch of I551: signal is true;
	signal I553: std_logic; attribute dont_touch of I553: signal is true;
	signal I608: std_logic; attribute dont_touch of I608: signal is true;
	signal I633: std_logic; attribute dont_touch of I633: signal is true;
	signal I643: std_logic; attribute dont_touch of I643: signal is true;
	signal I646: std_logic; attribute dont_touch of I646: signal is true;
	signal I649: std_logic; attribute dont_touch of I649: signal is true;
	signal I652: std_logic; attribute dont_touch of I652: signal is true;
	signal I655: std_logic; attribute dont_touch of I655: signal is true;
	signal I660: std_logic; attribute dont_touch of I660: signal is true;
	signal I680: std_logic; attribute dont_touch of I680: signal is true;
	signal I684: std_logic; attribute dont_touch of I684: signal is true;
	signal I687: std_logic; attribute dont_touch of I687: signal is true;
	signal II178: std_logic; attribute dont_touch of II178: signal is true;
	signal II208: std_logic; attribute dont_touch of II208: signal is true;
	signal II272: std_logic; attribute dont_touch of II272: signal is true;
	signal II287: std_logic; attribute dont_touch of II287: signal is true;
	signal II321: std_logic; attribute dont_touch of II321: signal is true;
	signal II335: std_logic; attribute dont_touch of II335: signal is true;
	signal II341: std_logic; attribute dont_touch of II341: signal is true;
	signal II476: std_logic; attribute dont_touch of II476: signal is true;
	signal II524: std_logic; attribute dont_touch of II524: signal is true;
	signal II527: std_logic; attribute dont_touch of II527: signal is true;
	signal II538: std_logic; attribute dont_touch of II538: signal is true;
begin
	process(CLK)
	begin
		if(rising_edge(CLK)) then
			G64<=G380;
			G65<=G262;
			G66<=G394;
			G67<=G250;
			G68<=G122;
			G69<=G133;
			G70<=G138;
			G71<=G139;
			G72<=G140;
			G73<=G141;
			G74<=G142;
			G75<=G125;
			G76<=G126;
			G77<=G127;
			G78<=G128;
			G79<=G129;
			G80<=G130;
			G81<=G131;
			G82<=G132;
		end if;
	end process;
	G86BF<= not G86;
	G87BF<= not G87;
	G88BF<= not G88;
	G89BF<= not G89;
	G91<= not I165;
	G94<= not II178;
	G95BF<= not G95;
	G96BF<= not G96;
	G97BF<= not G97;
	G98BF<= not G98;
	G99BF<= not G99;
	G100BF<= not G100;
	G101BF<= not G101;
	G103BF<= not G103;
	G104BF<= not G104;
	G105BF<= not G105;
	G106BF<= not G106;
	G108<= not G359;
	G109<= not I196;
	G110<= not G360;
	G111<= not I202;
	G112<= not G358;
	G113<= not I169;
	G114<= not G360;
	G115<= not I172;
	G116<= not G356;
	G117<= not I175;
	G118<= not G360;
	G119<= not I181;
	G120<= not G354;
	G121<= not I187;
	G125<= not I230;
	G126<= not I237;
	G127<= not I244;
	G128<= not I251;
	G129<= not I258;
	G130<= not I265;
	G131<= not II272;
	G132<= not I279;
	G143<= not I356;
	G146<= not I354;
	G150<= not I541;
	G154<= not I372;
	G158<= not I466;
	G162<= not I360;
	G166<= not I254;
	G168<= not I398;
	G169<= not I524;
	G173<= not I406;
	G174<= not I335;
	G178<= not I414;
	G179<= not I449;
	G183<= not I422;
	G184<= not I338;
	G190<= not I460;
	G194<= not I260;
	G198<= not I366;
	G202<= not I266;
	G206<= not I535;
	G209<= not I193;
	G211<= not I199;
	G213<= not I205;
	G215<= not I208;
	G216<= not G360;
	G217<= not I211;
	G218<= not G360;
	G219<= not I178;
	G220<= not G360;
	G221<= not I184;
	G222<= not G360;
	G223<= not I190;
	G224<= not II476;
	G225<= not G388;
	G294<= not I357;
	G298<= not I608;
	G301<= not I544;
	G304<= not I375;
	G307<= not I469;
	G310<= not I363;
	G313<= not I272;
	G316<= not I275;
	G319<= not I278;
	G322<= not I281;
	G325<= not I257;
	G327<= not I517;
	G329<= not I321;
	G331<= not I442;
	G333<= not I324;
	G336<= not I463;
	G339<= not I263;
	G342<= not I369;
	G345<= not I269;
	G348<= not I538;
	G350<= not I303;
	G352<= not I633;
	G353<= not I527;
	G354<= not G353;
	G355<= not I341;
	G356<= not G355;
	G357<= not I452;
	G358<= not G357;
	G359<= not G184;
	G360<= not I643;
	G361<= not I646;
	G362<= not I649;
	G363<= not I652;
	G364<= not I655;
	G365<= not G364;
	G366<= not G2;
	G367<= not I660;
	G368<= not G367;
	G369<= not I547;
	G370<= not G369;
	G371<= not I295;
	G372<= not G371;
	G373<= not I386;
	G374<= not G373;
	G375<= not I291;
	G376<= not G375;
	G377<= not I472;
	G378<= not G377;
	G379<= not G3;
	G380<= not I551;
	G381<= not I287;
	G382<= not G381;
	G383<= not I378;
	G384<= not G383;
	G386<= not I680;
	G387<= not G386;
	G388<= not I684;
	G389<= not I687;
	G390<= not G389;
	G391<= not G150;
	G392<= not I390;
	G393<= not G392;
	G394<= not I476;
	G395<= not G158;
	G396<= not I382;
	G397<= not G396;
	I165<= not G27;
	I169<= not G70;
	I172<= not G71;
	I175<= not G72;
	I178<= not G80;
	I181<= not G73;
	I184<= not G81;
	I187<= not G74;
	I190<= not G82;
	I193<= not G75;
	I196<= not G68;
	I199<= not G76;
	I202<= not G69;
	I205<= not G77;
	I208<= not G78;
	I210<= not II208;
	I211<= not G79;
	I222<= not G270;
	I224<= not I222;
	I230<= not G271;
	I237<= not G272;
	I244<= not G273;
	I251<= not G274;
	I254<= not G324;
	I257<= not G324;
	I258<= not G275;
	I260<= not G338;
	I263<= not G338;
	I265<= not G276;
	I266<= not G344;
	I269<= not G344;
	I272<= not G312;
	I275<= not G315;
	I278<= not G318;
	I279<= not G278;
	I281<= not G321;
	I285<= not G279;
	I287<= not G166;
	I291<= not G194;
	I292<= not G280;
	I294<= not I292;
	I295<= not G202;
	I299<= not G281;
	I301<= not I299;
	I303<= not G143;
	I306<= not G282;
	I308<= not I306;
	I313<= not G283;
	I315<= not I313;
	I320<= not G284;
	I321<= not G135;
	I322<= not I320;
	I324<= not G137;
	I327<= not G285;
	I329<= not I327;
	I334<= not G286;
	I335<= not G173;
	I336<= not I334;
	I338<= not G183;
	I341<= not G174;
	I343<= not II341;
	I348<= not G288;
	I350<= not I348;
	I354<= not G293;
	I356<= not G289;
	I357<= not G293;
	I360<= not G309;
	I363<= not G309;
	I366<= not G341;
	I369<= not G341;
	I372<= not G303;
	I375<= not G303;
	I378<= not G146;
	I382<= not G162;
	I386<= not G198;
	I390<= not G154;
	I398<= not G86;
	I406<= not G87;
	I414<= not G88;
	I422<= not G89;
	I442<= not G136;
	I449<= not G178;
	I452<= not G179;
	I460<= not G335;
	I463<= not G335;
	I466<= not G306;
	I469<= not G306;
	I472<= not G190;
	I476<= not G158;
	I517<= not G134;
	I524<= not G168;
	I527<= not G169;
	I535<= not G347;
	I538<= not G347;
	I541<= not G300;
	I544<= not G300;
	I547<= not G206;
	I551<= not G150;
	I608<= not G124;
	I633<= not G1;
	I643<= not G4;
	I646<= not G5;
	I649<= not G6;
	I652<= not G8;
	I655<= not G9;
	I660<= not G10;
	I680<= not G11;
	I684<= not G12;
	I687<= not G13;
	II178<= not G29;
	II208<= not G268;
	II272<= not G277;
	II287<= not I285;
	II341<= not G287;
	II476<= not G384;
	G83<=G316 and G19;
	G84<=G319 and G20;
	G85<=G322 and G21;
	G86<=G327 and G22;
	G87<=G329 and G23;
	G88<=G331 and G24;
	G89<=G333 and G25;
	G90<=G298 and G26;
	G92<=G350 and G28;
	G95<=G348 and G30;
	G96<=G345 and G31;
	G97<=G342 and G32;
	G98<=G339 and G33;
	G99<=G336 and G34;
	G100<=G325 and G35;
	G101<=G294 and G36;
	G103<=G301 and G14;
	G104<=G304 and G15;
	G105<=G307 and G16;
	G106<=G310 and G17;
	G107<=G313 and G18;
	G226<=G366 and G150;
	G227<=G366 and G392;
	G228<=G366 and G158;
	G229<=G366 and G396;
	G230<=G378 and G382;
	G231<=G379 and G387;
	G232<=G379 and G387;
	G233<=G379 and G387;
	G234<=G379 and G387;
	G235<=G378 and G381;
	G236<=G374 and G376;
	G237<=G374 and G375;
	G238<=G370 and G372;
	G239<=G370 and G371;
	G240<=G359 and G383;
	G241<=G371 and G390 and I495;
	G242<=G150 and G363;
	G243<=G392 and G361;
	G244<=G158 and G362;
	G245<=G352 and G396;
	G246<=G357 and G378 and G381;
	G247<=G379 and G365 and G368 and G390;
	G248<=G379 and G365 and G367 and G390;
	G249<=G366 and G66 and G397;
	G250<=G366 and G396;
	G251<=G358 and G377 and G381;
	G252<=G355 and G374 and G375;
	G253<=G356 and G373 and G375;
	G254<=G353 and G370 and G371;
	G255<=G354 and G369 and G371;
	G256<=G381 and G390 and I512;
	G257<=G363 and G369 and G371 and I515;
	G258<=G361 and G373 and G375 and I518;
	G259<=G362 and G377 and G381 and I521;
	G260<=G395 and G383 and II524;
	G261<=G395 and G397 and II527;
	G262<=G366 and G392 and G395 and G397;
	G263<=G379 and G364 and G368 and G390;
	G264<=G379 and G364 and G367 and G390;
	G265<=G375 and G390 and I533;
	G266<=G364 and G367 and G383 and G390;
	G267<=I537 and II538;
	G275<=G395 and G397 and I553;
	G276<=G366 and G392 and G395 and G397;
	G277<=G366 and G158 and G397;
	G278<=G366 and G396;
	G289<=G386 and G388 and G389;
	G293<=G108 and G109;
	G300<=G208 and G209;
	G303<=G210 and G211;
	G306<=G212 and G213;
	G309<=G214 and G215;
	G312<=G216 and G217;
	G315<=G218 and G219;
	G318<=G220 and G221;
	G321<=G222 and G223;
	G324<=G110 and G111;
	G335<=G112 and G113;
	G338<=G114 and G115;
	G341<=G116 and G117;
	G344<=G118 and G119;
	G347<=G120 and G121;
	I495<=G365 and G368 and G369;
	I512<=G364 and G368 and G377;
	I515<=G393 and G395 and G397;
	I518<=G391 and G395 and G397;
	I521<=G391 and G393 and G397;
	I533<=G365 and G367 and G373;
	I537<=G369 and G371 and G373 and G375;
	I553<=G366 and G150 and G393;
	II524<=G352 and G391 and G393;
	II527<=G366 and G64 and G393;
	II538<=G377 and G381 and G383 and G387;
	G122<= not (I209 and I210);
	G124<= not (I223 and I224);
	G133<= not (I286 and II287);
	G134<= not (I293 and I294);
	G135<= not (I300 and I301);
	G136<= not (I307 and I308);
	G137<= not (I314 and I315);
	G138<= not (II321 and I322);
	G139<= not (I328 and I329);
	G140<= not (II335 and I336);
	G141<= not (I342 and I343);
	G142<= not (I349 and I350);
	G208<= not (G379 and G354);
	G210<= not (G379 and G356);
	G212<= not (G379 and G358);
	G214<= not (G379 and G359);
	I209<= not (G268 and II208);
	I223<= not (G270 and I222);
	I286<= not (G279 and I285);
	I293<= not (G280 and I292);
	I300<= not (G281 and I299);
	I307<= not (G282 and I306);
	I314<= not (G283 and I313);
	I328<= not (G285 and I327);
	I342<= not (G287 and II341);
	I349<= not (G288 and I348);
	II321<= not (G284 and I320);
	II335<= not (G286 and I334);
	G268<=G224 or G240;
	G270<=G265 or G266 or G267 or I546;
	G271<=G226 or G242 or G257;
	G272<=G227 or G243 or G258;
	G273<=G228 or G244 or G259;
	G274<=G229 or G245 or G260;
	G279<=G230 or G246;
	G280<=G231 or G247 or G261;
	G281<=G232 or G248 or G65;
	G282<=G233 or G249 or G263;
	G283<=G234 or G67 or G264;
	G284<=G235 or G251;
	G285<=G236 or G252;
	G286<=G237 or G253;
	G287<=G238 or G254;
	G288<=G239 or G255;
	I546<=G225 or G241 or G256;
end RTL;
