-- File created by Bench2VHDL
-- Name: s386a
-- File: bench/s386a.bench
-- Timestamp: 2019-05-21T22:08:29.060474
--
-- Original File
-- =============
--	# s386
--	# 7 inputs
--	# 7 outputs
--	# 6 D-type flipflops
--	# 41 inverters
--	# 118 gates (83 ANDs + 0 NANDs + 35 ORs + 0 NORs)
--	
--	INPUT(v6)
--	INPUT(v5)
--	INPUT(v4)
--	INPUT(v3)
--	INPUT(v2)
--	INPUT(v1)
--	INPUT(v0)
--	
--	OUTPUT(v13_D_12)
--	OUTPUT(v13_D_11)
--	OUTPUT(v13_D_10)
--	OUTPUT(v13_D_9)
--	OUTPUT(v13_D_8)
--	OUTPUT(v13_D_7)
--	OUTPUT(v13_D_6)
--	
--	v12 = DFF(v13_D_5)
--	v11 = DFF(v13_D_4)
--	v10 = DFF(v13_D_3)
--	v9 = DFF(v13_D_2)
--	v8 = DFF(v13_D_1)
--	v7 = DFF(v13_D_0)
--	
--	v3bar = NOT(v3)
--	v6bar = NOT(v6)
--	v5bar = NOT(v5)
--	B35Bbar = NOT(B35B)
--	B14Bbar = NOT(B14B)
--	B34Bbar = NOT(B34B)
--	v4bar = NOT(v4)
--	v11bar = NOT(v11)
--	v8bar = NOT(v8)
--	v7bar = NOT(v7)
--	v12bar = NOT(v12)
--	v0bar = NOT(v0)
--	v10bar = NOT(v10)
--	v9bar = NOT(v9)
--	v1bar = NOT(v1)
--	I198 = NOT(Lv13_D_12)
--	v13_D_12 = NOT(I198)
--	I201 = NOT(Lv13_D_11)
--	v13_D_11 = NOT(I201)
--	I204 = NOT(Lv13_D_10)
--	v13_D_10 = NOT(I204)
--	I207 = NOT(Lv13_D_9)
--	v13_D_9 = NOT(I207)
--	I210 = NOT(Lv13_D_8)
--	v13_D_8 = NOT(I210)
--	I213 = NOT(Lv13_D_7)
--	v13_D_7 = NOT(I213)
--	I216 = NOT(Lv13_D_6)
--	v13_D_6 = NOT(I216)
--	I219 = NOT(Lv13_D_5)
--	v13_D_5 = NOT(I219)
--	I222 = NOT(Lv13_D_4)
--	v13_D_4 = NOT(I222)
--	I225 = NOT(Lv13_D_3)
--	v13_D_3 = NOT(I225)
--	I228 = NOT(Lv13_D_2)
--	v13_D_2 = NOT(I228)
--	I231 = NOT(Lv13_D_1)
--	v13_D_1 = NOT(I231)
--	I234 = NOT(Lv13_D_0)
--	v13_D_0 = NOT(I234)
--	
--	I64 = AND(v0bar, v5, v7bar, v8bar)
--	I65 = AND(v9, v10, v11bar, v12bar)
--	Lv13_D_12 = AND(I64, I65)
--	I114 = AND(v9bar, v12bar)
--	I113 = AND(v7bar, v8bar)
--	I111 = AND(v7bar, v8bar)
--	I109 = AND(v3bar, v4bar, v11bar)
--	I108 = AND(v7, v11)
--	I106 = AND(v5bar, v7bar, v11, v12)
--	I105 = AND(v2, v11bar, v12bar)
--	I103 = AND(v8, v11, v12bar)
--	I102 = AND(v8bar, v11bar, v12)
--	I100 = AND(v2, v8bar)
--	II98 = AND(v0, v5)
--	I96 = AND(v1, v9bar)
--	I89 = AND(v5bar, v7bar, v8bar)
--	I94 = AND(v10, v11bar, I89)
--	I93 = AND(v9bar, v10bar)
--	I91 = AND(v0, v11bar, v12bar)
--	I90 = AND(v9bar, v10bar)
--	I97 = AND(v0, v6bar, v7bar, v8bar)
--	I98 = AND(v9bar, v10, v11bar, v12bar)
--	Lv13_D_8 = AND(I97, I98)
--	I87 = AND(v5bar, v9, v11bar, v12bar)
--	I104 = AND(v2, v3, v8)
--	I85 = AND(v11bar, v12bar, I104)
--	I84 = AND(v8bar, v11, v12)
--	I79 = AND(v11bar, v12bar)
--	I77 = AND(v0, v8bar, v10)
--	I76 = AND(v1bar, v4, v10bar, B34Bbar)
--	I74 = AND(v7, v8bar, v11)
--	I73 = AND(v4bar, v11bar, B34Bbar)
--	I71 = AND(v4bar, v11bar, B34Bbar)
--	I69 = AND(v7, v11bar)
--	I124 = AND(B40B, v1, v7bar, v8bar)
--	Lv13_D_10 = AND(v9, v11bar, v12bar, I124)
--	I66 = AND(v4, v7)
--	II65 = AND(B35B, B34B)
--	I63 = AND(v9bar, v10bar, v12bar)
--	I62 = AND(B23B, v7bar, v8bar)
--	I60 = AND(v1, B42B)
--	I59 = AND(B43B, v8, v12bar)
--	I57 = AND(B32B, v7bar)
--	I56 = AND(v11, v12bar, B14Bbar)
--	I54 = AND(v0bar, v9bar, v10bar)
--	I53 = AND(B27B, v1)
--	I51 = AND(v9bar, v10bar, v12bar)
--	I50 = AND(B21B, v7bar, v8bar)
--	I48 = AND(B14B, v11)
--	I47 = AND(v4bar, v11bar, B34Bbar)
--	I148 = AND(B38B, v0, v1bar)
--	Lv13_D_7 = AND(v9bar, v10bar, v12bar, I148)
--	I44 = AND(v8bar, B29B)
--	I43 = AND(B30B, v12bar)
--	I41 = AND(v4, v11bar, B17B)
--	I40 = AND(v3, v8, B16B)
--	I39 = AND(v5, v7, v8bar, v11)
--	I158 = AND(B39B, v7bar, v9bar)
--	Lv13_D_9 = AND(v11bar, v12bar, I158)
--	I36 = AND(v7bar, v8bar, B25B, B26B)
--	I35 = AND(B28B, v12bar)
--	I164 = AND(B15B, v0, v1bar)
--	Lv13_D_0 = AND(v9bar, v10bar, v12bar, I164)
--	I167 = AND(B33B, v0, v1bar)
--	Lv13_D_5 = AND(v9bar, v10bar, I167)
--	I31 = AND(B36B, v11bar, v12bar)
--	I171 = AND(v5, v7bar, v8bar)
--	I30 = AND(v11, v12, I171)
--	I175 = AND(v0, v7bar, v8bar)
--	I28 = AND(v10, v11bar, v12bar, I175)
--	I27 = AND(B44B, v10bar)
--	I25 = AND(v0bar, B22B)
--	I24 = AND(B24B, v1)
--	I22 = AND(v7bar, B18B)
--	I21 = AND(B19B, v12bar)
--	I186 = AND(B31B, v0, v1bar)
--	Lv13_D_4 = AND(v9bar, v10bar, I186)
--	I18 = AND(v0bar, v10bar, B41B)
--	I17 = AND(B45B, v9bar)
--	I192 = AND(B37B, v0, v1bar)
--	Lv13_D_6 = AND(v9bar, v10bar, I192)
--	I195 = AND(B20B, v0, v1bar)
--	Lv13_D_1 = AND(v9bar, v10bar, I195)
--	
--	B41B = OR(I113, I114)
--	B42B = OR(I111, v12bar)
--	B43B = OR(I108, I109)
--	B29B = OR(I105, I106)
--	B18B = OR(I102, I103)
--	B17B = OR(v7, I100)
--	B40B = OR(II98, v10bar)
--	B26B = OR(v0bar, I96)
--	B27B = OR(I93, I94)
--	B23B = OR(I90, I91)
--	B21B = OR(v10bar, I87)
--	B32B = OR(I84, I85)
--	B34B = OR(v8bar, v3)
--	B14B = OR(v7bar, v8bar)
--	B35B = OR(v2, v7)
--	B25B = OR(v10bar, I79)
--	B39B = OR(I76, I77)
--	B38B = OR(I73, I74)
--	B30B = OR(I71, v7)
--	B16B = OR(B35Bbar, I69)
--	B36B = OR(II65, I66)
--	B24B = OR(I62, I63)
--	B44B = OR(I59, I60)
--	B33B = OR(I56, I57)
--	B28B = OR(I53, I54)
--	B22B = OR(I50, I51)
--	B15B = OR(I47, I48)
--	B31B = OR(I43, I44)
--	B19B = OR(I39, I40, I41)
--	Lv13_D_3 = OR(I35, I36)
--	B37B = OR(I30, I31)
--	B45B = OR(I27, I28)
--	Lv13_D_2 = OR(I24, I25)
--	B20B = OR(I21, I22)
--	Lv13_D_11 = OR(I17, I18)
--
-- VHDL Output
-- =============
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity s386a is
	port (
		CLK: in std_logic;
		V0: in std_logic;
		V1: in std_logic;
		V2: in std_logic;
		V3: in std_logic;
		V4: in std_logic;
		V5: in std_logic;
		V6: in std_logic;
		V13_D_6: out std_logic;
		V13_D_7: out std_logic;
		V13_D_8: out std_logic;
		V13_D_9: out std_logic;
		V13_D_10: out std_logic;
		V13_D_11: out std_logic;
		V13_D_12: out std_logic
	);
end entity;

architecture RTL of s386a is
	attribute dont_touch: boolean;

	signal B14B: std_logic; attribute dont_touch of B14B: signal is true;
	signal B14BBAR: std_logic; attribute dont_touch of B14BBAR: signal is true;
	signal B15B: std_logic; attribute dont_touch of B15B: signal is true;
	signal B16B: std_logic; attribute dont_touch of B16B: signal is true;
	signal B17B: std_logic; attribute dont_touch of B17B: signal is true;
	signal B18B: std_logic; attribute dont_touch of B18B: signal is true;
	signal B19B: std_logic; attribute dont_touch of B19B: signal is true;
	signal B20B: std_logic; attribute dont_touch of B20B: signal is true;
	signal B21B: std_logic; attribute dont_touch of B21B: signal is true;
	signal B22B: std_logic; attribute dont_touch of B22B: signal is true;
	signal B23B: std_logic; attribute dont_touch of B23B: signal is true;
	signal B24B: std_logic; attribute dont_touch of B24B: signal is true;
	signal B25B: std_logic; attribute dont_touch of B25B: signal is true;
	signal B26B: std_logic; attribute dont_touch of B26B: signal is true;
	signal B27B: std_logic; attribute dont_touch of B27B: signal is true;
	signal B28B: std_logic; attribute dont_touch of B28B: signal is true;
	signal B29B: std_logic; attribute dont_touch of B29B: signal is true;
	signal B30B: std_logic; attribute dont_touch of B30B: signal is true;
	signal B31B: std_logic; attribute dont_touch of B31B: signal is true;
	signal B32B: std_logic; attribute dont_touch of B32B: signal is true;
	signal B33B: std_logic; attribute dont_touch of B33B: signal is true;
	signal B34B: std_logic; attribute dont_touch of B34B: signal is true;
	signal B34BBAR: std_logic; attribute dont_touch of B34BBAR: signal is true;
	signal B35B: std_logic; attribute dont_touch of B35B: signal is true;
	signal B35BBAR: std_logic; attribute dont_touch of B35BBAR: signal is true;
	signal B36B: std_logic; attribute dont_touch of B36B: signal is true;
	signal B37B: std_logic; attribute dont_touch of B37B: signal is true;
	signal B38B: std_logic; attribute dont_touch of B38B: signal is true;
	signal B39B: std_logic; attribute dont_touch of B39B: signal is true;
	signal B40B: std_logic; attribute dont_touch of B40B: signal is true;
	signal B41B: std_logic; attribute dont_touch of B41B: signal is true;
	signal B42B: std_logic; attribute dont_touch of B42B: signal is true;
	signal B43B: std_logic; attribute dont_touch of B43B: signal is true;
	signal B44B: std_logic; attribute dont_touch of B44B: signal is true;
	signal B45B: std_logic; attribute dont_touch of B45B: signal is true;
	signal I17: std_logic; attribute dont_touch of I17: signal is true;
	signal I18: std_logic; attribute dont_touch of I18: signal is true;
	signal I21: std_logic; attribute dont_touch of I21: signal is true;
	signal I22: std_logic; attribute dont_touch of I22: signal is true;
	signal I24: std_logic; attribute dont_touch of I24: signal is true;
	signal I25: std_logic; attribute dont_touch of I25: signal is true;
	signal I27: std_logic; attribute dont_touch of I27: signal is true;
	signal I28: std_logic; attribute dont_touch of I28: signal is true;
	signal I30: std_logic; attribute dont_touch of I30: signal is true;
	signal I31: std_logic; attribute dont_touch of I31: signal is true;
	signal I35: std_logic; attribute dont_touch of I35: signal is true;
	signal I36: std_logic; attribute dont_touch of I36: signal is true;
	signal I39: std_logic; attribute dont_touch of I39: signal is true;
	signal I40: std_logic; attribute dont_touch of I40: signal is true;
	signal I41: std_logic; attribute dont_touch of I41: signal is true;
	signal I43: std_logic; attribute dont_touch of I43: signal is true;
	signal I44: std_logic; attribute dont_touch of I44: signal is true;
	signal I47: std_logic; attribute dont_touch of I47: signal is true;
	signal I48: std_logic; attribute dont_touch of I48: signal is true;
	signal I50: std_logic; attribute dont_touch of I50: signal is true;
	signal I51: std_logic; attribute dont_touch of I51: signal is true;
	signal I53: std_logic; attribute dont_touch of I53: signal is true;
	signal I54: std_logic; attribute dont_touch of I54: signal is true;
	signal I56: std_logic; attribute dont_touch of I56: signal is true;
	signal I57: std_logic; attribute dont_touch of I57: signal is true;
	signal I59: std_logic; attribute dont_touch of I59: signal is true;
	signal I60: std_logic; attribute dont_touch of I60: signal is true;
	signal I62: std_logic; attribute dont_touch of I62: signal is true;
	signal I63: std_logic; attribute dont_touch of I63: signal is true;
	signal I64: std_logic; attribute dont_touch of I64: signal is true;
	signal I65: std_logic; attribute dont_touch of I65: signal is true;
	signal I66: std_logic; attribute dont_touch of I66: signal is true;
	signal I69: std_logic; attribute dont_touch of I69: signal is true;
	signal I71: std_logic; attribute dont_touch of I71: signal is true;
	signal I73: std_logic; attribute dont_touch of I73: signal is true;
	signal I74: std_logic; attribute dont_touch of I74: signal is true;
	signal I76: std_logic; attribute dont_touch of I76: signal is true;
	signal I77: std_logic; attribute dont_touch of I77: signal is true;
	signal I79: std_logic; attribute dont_touch of I79: signal is true;
	signal I84: std_logic; attribute dont_touch of I84: signal is true;
	signal I85: std_logic; attribute dont_touch of I85: signal is true;
	signal I87: std_logic; attribute dont_touch of I87: signal is true;
	signal I89: std_logic; attribute dont_touch of I89: signal is true;
	signal I90: std_logic; attribute dont_touch of I90: signal is true;
	signal I91: std_logic; attribute dont_touch of I91: signal is true;
	signal I93: std_logic; attribute dont_touch of I93: signal is true;
	signal I94: std_logic; attribute dont_touch of I94: signal is true;
	signal I96: std_logic; attribute dont_touch of I96: signal is true;
	signal I97: std_logic; attribute dont_touch of I97: signal is true;
	signal I98: std_logic; attribute dont_touch of I98: signal is true;
	signal I100: std_logic; attribute dont_touch of I100: signal is true;
	signal I102: std_logic; attribute dont_touch of I102: signal is true;
	signal I103: std_logic; attribute dont_touch of I103: signal is true;
	signal I104: std_logic; attribute dont_touch of I104: signal is true;
	signal I105: std_logic; attribute dont_touch of I105: signal is true;
	signal I106: std_logic; attribute dont_touch of I106: signal is true;
	signal I108: std_logic; attribute dont_touch of I108: signal is true;
	signal I109: std_logic; attribute dont_touch of I109: signal is true;
	signal I111: std_logic; attribute dont_touch of I111: signal is true;
	signal I113: std_logic; attribute dont_touch of I113: signal is true;
	signal I114: std_logic; attribute dont_touch of I114: signal is true;
	signal I124: std_logic; attribute dont_touch of I124: signal is true;
	signal I148: std_logic; attribute dont_touch of I148: signal is true;
	signal I158: std_logic; attribute dont_touch of I158: signal is true;
	signal I164: std_logic; attribute dont_touch of I164: signal is true;
	signal I167: std_logic; attribute dont_touch of I167: signal is true;
	signal I171: std_logic; attribute dont_touch of I171: signal is true;
	signal I175: std_logic; attribute dont_touch of I175: signal is true;
	signal I186: std_logic; attribute dont_touch of I186: signal is true;
	signal I192: std_logic; attribute dont_touch of I192: signal is true;
	signal I195: std_logic; attribute dont_touch of I195: signal is true;
	signal I198: std_logic; attribute dont_touch of I198: signal is true;
	signal I201: std_logic; attribute dont_touch of I201: signal is true;
	signal I204: std_logic; attribute dont_touch of I204: signal is true;
	signal I207: std_logic; attribute dont_touch of I207: signal is true;
	signal I210: std_logic; attribute dont_touch of I210: signal is true;
	signal I213: std_logic; attribute dont_touch of I213: signal is true;
	signal I216: std_logic; attribute dont_touch of I216: signal is true;
	signal I219: std_logic; attribute dont_touch of I219: signal is true;
	signal I222: std_logic; attribute dont_touch of I222: signal is true;
	signal I225: std_logic; attribute dont_touch of I225: signal is true;
	signal I228: std_logic; attribute dont_touch of I228: signal is true;
	signal I231: std_logic; attribute dont_touch of I231: signal is true;
	signal I234: std_logic; attribute dont_touch of I234: signal is true;
	signal II65: std_logic; attribute dont_touch of II65: signal is true;
	signal II98: std_logic; attribute dont_touch of II98: signal is true;
	signal LV13_D_0: std_logic; attribute dont_touch of LV13_D_0: signal is true;
	signal LV13_D_1: std_logic; attribute dont_touch of LV13_D_1: signal is true;
	signal LV13_D_2: std_logic; attribute dont_touch of LV13_D_2: signal is true;
	signal LV13_D_3: std_logic; attribute dont_touch of LV13_D_3: signal is true;
	signal LV13_D_4: std_logic; attribute dont_touch of LV13_D_4: signal is true;
	signal LV13_D_5: std_logic; attribute dont_touch of LV13_D_5: signal is true;
	signal LV13_D_6: std_logic; attribute dont_touch of LV13_D_6: signal is true;
	signal LV13_D_7: std_logic; attribute dont_touch of LV13_D_7: signal is true;
	signal LV13_D_8: std_logic; attribute dont_touch of LV13_D_8: signal is true;
	signal LV13_D_9: std_logic; attribute dont_touch of LV13_D_9: signal is true;
	signal LV13_D_10: std_logic; attribute dont_touch of LV13_D_10: signal is true;
	signal LV13_D_11: std_logic; attribute dont_touch of LV13_D_11: signal is true;
	signal LV13_D_12: std_logic; attribute dont_touch of LV13_D_12: signal is true;
	signal V0BAR: std_logic; attribute dont_touch of V0BAR: signal is true;
	signal V1BAR: std_logic; attribute dont_touch of V1BAR: signal is true;
	signal V3BAR: std_logic; attribute dont_touch of V3BAR: signal is true;
	signal V4BAR: std_logic; attribute dont_touch of V4BAR: signal is true;
	signal V5BAR: std_logic; attribute dont_touch of V5BAR: signal is true;
	signal V6BAR: std_logic; attribute dont_touch of V6BAR: signal is true;
	signal V7: std_logic; attribute dont_touch of V7: signal is true;
	signal V7BAR: std_logic; attribute dont_touch of V7BAR: signal is true;
	signal V8: std_logic; attribute dont_touch of V8: signal is true;
	signal V8BAR: std_logic; attribute dont_touch of V8BAR: signal is true;
	signal V9: std_logic; attribute dont_touch of V9: signal is true;
	signal V9BAR: std_logic; attribute dont_touch of V9BAR: signal is true;
	signal V10: std_logic; attribute dont_touch of V10: signal is true;
	signal V10BAR: std_logic; attribute dont_touch of V10BAR: signal is true;
	signal V11: std_logic; attribute dont_touch of V11: signal is true;
	signal V11BAR: std_logic; attribute dont_touch of V11BAR: signal is true;
	signal V12: std_logic; attribute dont_touch of V12: signal is true;
	signal V12BAR: std_logic; attribute dont_touch of V12BAR: signal is true;
	signal V13_D_0: std_logic; attribute dont_touch of V13_D_0: signal is true;
	signal V13_D_1: std_logic; attribute dont_touch of V13_D_1: signal is true;
	signal V13_D_2: std_logic; attribute dont_touch of V13_D_2: signal is true;
	signal V13_D_3: std_logic; attribute dont_touch of V13_D_3: signal is true;
	signal V13_D_4: std_logic; attribute dont_touch of V13_D_4: signal is true;
	signal V13_D_5: std_logic; attribute dont_touch of V13_D_5: signal is true;
begin
	process(CLK)
	begin
		if(rising_edge(CLK)) then
			V7<=V13_D_0;
			V8<=V13_D_1;
			V9<=V13_D_2;
			V10<=V13_D_3;
			V11<=V13_D_4;
			V12<=V13_D_5;
		end if;
	end process;
	B14BBAR<= not B14B;
	B34BBAR<= not B34B;
	B35BBAR<= not B35B;
	I198<= not LV13_D_12;
	I201<= not LV13_D_11;
	I204<= not LV13_D_10;
	I207<= not LV13_D_9;
	I210<= not LV13_D_8;
	I213<= not LV13_D_7;
	I216<= not LV13_D_6;
	I219<= not LV13_D_5;
	I222<= not LV13_D_4;
	I225<= not LV13_D_3;
	I228<= not LV13_D_2;
	I231<= not LV13_D_1;
	I234<= not LV13_D_0;
	V0BAR<= not V0;
	V1BAR<= not V1;
	V3BAR<= not V3;
	V4BAR<= not V4;
	V5BAR<= not V5;
	V6BAR<= not V6;
	V7BAR<= not V7;
	V8BAR<= not V8;
	V9BAR<= not V9;
	V10BAR<= not V10;
	V11BAR<= not V11;
	V12BAR<= not V12;
	V13_D_0<= not I234;
	V13_D_1<= not I231;
	V13_D_2<= not I228;
	V13_D_3<= not I225;
	V13_D_4<= not I222;
	V13_D_5<= not I219;
	V13_D_6<= not I216;
	V13_D_7<= not I213;
	V13_D_8<= not I210;
	V13_D_9<= not I207;
	V13_D_10<= not I204;
	V13_D_11<= not I201;
	V13_D_12<= not I198;
	I17<=B45B and V9BAR;
	I18<=V0BAR and V10BAR and B41B;
	I21<=B19B and V12BAR;
	I22<=V7BAR and B18B;
	I24<=B24B and V1;
	I25<=V0BAR and B22B;
	I27<=B44B and V10BAR;
	I28<=V10 and V11BAR and V12BAR and I175;
	I30<=V11 and V12 and I171;
	I31<=B36B and V11BAR and V12BAR;
	I35<=B28B and V12BAR;
	I36<=V7BAR and V8BAR and B25B and B26B;
	I39<=V5 and V7 and V8BAR and V11;
	I40<=V3 and V8 and B16B;
	I41<=V4 and V11BAR and B17B;
	I43<=B30B and V12BAR;
	I44<=V8BAR and B29B;
	I47<=V4BAR and V11BAR and B34BBAR;
	I48<=B14B and V11;
	I50<=B21B and V7BAR and V8BAR;
	I51<=V9BAR and V10BAR and V12BAR;
	I53<=B27B and V1;
	I54<=V0BAR and V9BAR and V10BAR;
	I56<=V11 and V12BAR and B14BBAR;
	I57<=B32B and V7BAR;
	I59<=B43B and V8 and V12BAR;
	I60<=V1 and B42B;
	I62<=B23B and V7BAR and V8BAR;
	I63<=V9BAR and V10BAR and V12BAR;
	I64<=V0BAR and V5 and V7BAR and V8BAR;
	I65<=V9 and V10 and V11BAR and V12BAR;
	I66<=V4 and V7;
	I69<=V7 and V11BAR;
	I71<=V4BAR and V11BAR and B34BBAR;
	I73<=V4BAR and V11BAR and B34BBAR;
	I74<=V7 and V8BAR and V11;
	I76<=V1BAR and V4 and V10BAR and B34BBAR;
	I77<=V0 and V8BAR and V10;
	I79<=V11BAR and V12BAR;
	I84<=V8BAR and V11 and V12;
	I85<=V11BAR and V12BAR and I104;
	I87<=V5BAR and V9 and V11BAR and V12BAR;
	I89<=V5BAR and V7BAR and V8BAR;
	I90<=V9BAR and V10BAR;
	I91<=V0 and V11BAR and V12BAR;
	I93<=V9BAR and V10BAR;
	I94<=V10 and V11BAR and I89;
	I96<=V1 and V9BAR;
	I97<=V0 and V6BAR and V7BAR and V8BAR;
	I98<=V9BAR and V10 and V11BAR and V12BAR;
	I100<=V2 and V8BAR;
	I102<=V8BAR and V11BAR and V12;
	I103<=V8 and V11 and V12BAR;
	I104<=V2 and V3 and V8;
	I105<=V2 and V11BAR and V12BAR;
	I106<=V5BAR and V7BAR and V11 and V12;
	I108<=V7 and V11;
	I109<=V3BAR and V4BAR and V11BAR;
	I111<=V7BAR and V8BAR;
	I113<=V7BAR and V8BAR;
	I114<=V9BAR and V12BAR;
	I124<=B40B and V1 and V7BAR and V8BAR;
	I148<=B38B and V0 and V1BAR;
	I158<=B39B and V7BAR and V9BAR;
	I164<=B15B and V0 and V1BAR;
	I167<=B33B and V0 and V1BAR;
	I171<=V5 and V7BAR and V8BAR;
	I175<=V0 and V7BAR and V8BAR;
	I186<=B31B and V0 and V1BAR;
	I192<=B37B and V0 and V1BAR;
	I195<=B20B and V0 and V1BAR;
	II65<=B35B and B34B;
	II98<=V0 and V5;
	LV13_D_0<=V9BAR and V10BAR and V12BAR and I164;
	LV13_D_1<=V9BAR and V10BAR and I195;
	LV13_D_4<=V9BAR and V10BAR and I186;
	LV13_D_5<=V9BAR and V10BAR and I167;
	LV13_D_6<=V9BAR and V10BAR and I192;
	LV13_D_7<=V9BAR and V10BAR and V12BAR and I148;
	LV13_D_8<=I97 and I98;
	LV13_D_9<=V11BAR and V12BAR and I158;
	LV13_D_10<=V9 and V11BAR and V12BAR and I124;
	LV13_D_12<=I64 and I65;
	B14B<=V7BAR or V8BAR;
	B15B<=I47 or I48;
	B16B<=B35BBAR or I69;
	B17B<=V7 or I100;
	B18B<=I102 or I103;
	B19B<=I39 or I40 or I41;
	B20B<=I21 or I22;
	B21B<=V10BAR or I87;
	B22B<=I50 or I51;
	B23B<=I90 or I91;
	B24B<=I62 or I63;
	B25B<=V10BAR or I79;
	B26B<=V0BAR or I96;
	B27B<=I93 or I94;
	B28B<=I53 or I54;
	B29B<=I105 or I106;
	B30B<=I71 or V7;
	B31B<=I43 or I44;
	B32B<=I84 or I85;
	B33B<=I56 or I57;
	B34B<=V8BAR or V3;
	B35B<=V2 or V7;
	B36B<=II65 or I66;
	B37B<=I30 or I31;
	B38B<=I73 or I74;
	B39B<=I76 or I77;
	B40B<=II98 or V10BAR;
	B41B<=I113 or I114;
	B42B<=I111 or V12BAR;
	B43B<=I108 or I109;
	B44B<=I59 or I60;
	B45B<=I27 or I28;
	LV13_D_2<=I24 or I25;
	LV13_D_3<=I35 or I36;
	LV13_D_11<=I17 or I18;
end RTL;
