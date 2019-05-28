-- File created by Bench2VHDL
-- Name: s400
-- File: bench/s400.bench
-- Timestamp: 2019-05-21T22:08:28.063400
--
-- Original File
-- =============
--	# s400
--	# 3 inputs
--	# 6 outputs
--	# 21 D-type flipflops
--	# 56 inverters
--	# 106 gates (11 ANDs + 36 NANDs + 25 ORs + 34 NORs)
--	
--	INPUT(FM)
--	INPUT(TEST)
--	INPUT(CLR)
--	
--	OUTPUT(GRN2)
--	OUTPUT(YLW2)
--	OUTPUT(RED2)
--	OUTPUT(GRN1)
--	OUTPUT(YLW1)
--	OUTPUT(RED1)
--	
--	TESTL = DFF(TESTLVINLATCHVCDAD)
--	FML = DFF(FMLVINLATCHVCDAD)
--	OLATCH_Y2L = DFF(TCOMB_YA2)
--	OLATCHVUC_6 = DFF(Y1C)
--	OLATCHVUC_5 = DFF(R2C)
--	OLATCH_R1L = DFF(TCOMB_RA1)
--	OLATCH_G2L = DFF(TCOMB_GA2)
--	OLATCH_G1L = DFF(TCOMB_GA1)
--	OLATCH_FEL = DFF(TCOMB_FE_BF)
--	C3_Q3 = DFF(C3_Q3VD)
--	C3_Q2 = DFF(C3_Q2VD)
--	C3_Q1 = DFF(C3_Q1VD)
--	C3_Q0 = DFF(C3_Q0VD)
--	UC_16 = DFF(UC_16VD)
--	UC_17 = DFF(UC_17VD)
--	UC_18 = DFF(UC_18VD)
--	UC_19 = DFF(UC_19VD)
--	UC_8 = DFF(UC_8VD)
--	UC_9 = DFF(UC_9VD)
--	UC_10 = DFF(UC_10VD)
--	UC_11 = DFF(UC_11VD)
--	
--	TESTLVINMUXVIR1 = NOT(TESTB)
--	TESTLVINMUX = NOT(TESTLVINMUXVND1)
--	TESTLVINLATCHN = NOT(TESTL)
--	TESTLVINLATCHVCDN = NOT(CLRB)
--	FMLVINMUXVIR1 = NOT(FMB)
--	FMLVINMUX = NOT(FMLVINMUXVND1)
--	FMLVINLATCHN = NOT(FML)
--	FMLVINLATCHVCDN = NOT(CLRB)
--	YLW2 = NOT(OUTBUFVBUFY2VIR1)
--	OUTBUFVBUFY2VIR1 = NOT(OLATCH_Y2L)
--	YLW1 = NOT(OUTBUFVBUFY1VIR1)
--	OUTBUFVBUFY1VIR1 = NOT(OLATCH_Y1L)
--	RED2 = NOT(OUTBUFVBUFR2VIR1)
--	OUTBUFVBUFR2VIR1 = NOT(OLATCH_R2L)
--	RED1 = NOT(OUTBUFVBUFR1VIR1)
--	OUTBUFVBUFR1VIR1 = NOT(OLATCH_R1L)
--	GRN2 = NOT(OUTBUFVBUFG2VIR1)
--	OUTBUFVBUFG2VIR1 = NOT(OLATCH_G2L)
--	GRN1 = NOT(OUTBUFVBUFG1VIR1)
--	OUTBUFVBUFG1VIR1 = NOT(OLATCH_G1L)
--	OLATCH_Y1L = NOT(OLATCHVUC_6)
--	OLATCH_R2L = NOT(OLATCHVUC_5)
--	I84 = NOT(TCOMB_FE)
--	TCOMB_FE_BF = NOT(I84)
--	FEN = NOT(TCOMB_FE)
--	CO2 = NOT(C2_CO)
--	UC_23 = NOT(C3_Q3)
--	UC_24 = NOT(C3_Q2)
--	UC_25 = NOT(C3_Q1)
--	UC_26 = NOT(C3_Q0)
--	C3VINHN = NOT(CO2)
--	UC_20 = NOT(UC_16)
--	C2_QN2 = NOT(UC_17)
--	UC_21 = NOT(UC_18)
--	UC_22 = NOT(UC_19)
--	C2VINHN = NOT(CTST)
--	C1VCO0 = NOT(UC_15)
--	UC_12 = NOT(UC_8)
--	UC_13 = NOT(UC_9)
--	UC_14 = NOT(UC_10)
--	UC_11VZ = NOT(UC_11VUC_0)
--	UC_11VUC_0 = NOT(UC_11)
--	UC_15 = NOT(UC_11)
--	TCOMBVNQD = NOT(C3_Q3)
--	TCOMBVNQC = NOT(C3_Q2)
--	TCOMBVNQB = NOT(C3_Q1)
--	TCOMBVNQA = NOT(C3_Q0)
--	TCOMBVNFM = NOT(FML)
--	TCOMBVNFEL = NOT(OLATCH_FEL)
--	TCOMBVNCLR = NOT(CLRB)
--	TESTB = NOT(TESTBVIR1)
--	TESTBVIR1 = NOT(TEST)
--	FMB = NOT(FMBVIR1)
--	FMBVIR1 = NOT(FM)
--	CLRB = NOT(CLRBVIR1)
--	CLRBVIR1 = NOT(CLR)
--	
--	TESTLVINLATCHVCDAD = AND(TESTLVINLATCHVCDN, TESTLVINMUX)
--	FMLVINLATCHVCDAD = AND(FMLVINLATCHVCDN, FMLVINMUX)
--	TCOMB_GA2VAD4NF = AND(OLATCH_FEL, TCOMBVNCLR)
--	TCOMB_GA2VAD3NF = AND(C3_Q2, TCOMBVNCLR)
--	TCOMB_GA2VAD2NF = AND(C3_Q0, C3_Q1, TCOMBVNCLR)
--	TCOMB_GA2VAD1NF = AND(TCOMBVNQA, C3_Q3, TCOMBVNCLR)
--	TCOMB_GA1VAD1NF = AND(TCOMBVNODE6, OLATCH_FEL)
--	Y1CVAD2NF = AND(FEN, TCOMB_YA1)
--	Y1CVAD1NF = AND(TCOMB_FE, TCOMB_YA1, C2_QN2)
--	R2CVAD2NF = AND(FEN, TCOMB_RA2)
--	R2CVAD1NF = AND(TCOMB_FE, TCOMB_RA2, C2_QN2)
--	
--	TESTLVINMUXVOR2NF = OR(TESTLVINMUXVIR1, TESTLVINLATCHN)
--	TESTLVINMUXVOR1NF = OR(TESTB, TESTL)
--	FMLVINMUXVOR2NF = OR(FMLVINMUXVIR1, FMLVINLATCHN)
--	FMLVINMUXVOR1NF = OR(FMB, FML)
--	C3_Q3VZVOR1NF = OR(C3VCO2, C3_Q3)
--	C3_Q2VZVOR1NF = OR(C3VCO1, C3_Q2)
--	C3_Q1VZVOR1NF = OR(C3VCO0, C3_Q1)
--	C3_Q0VZVOR1NF = OR(C3VINHN, C3_Q0)
--	UC_16VZVOR1NF = OR(C2VCO2, UC_16)
--	UC_17VZVOR1NF = OR(C2VCO1, UC_17)
--	UC_18VZVOR1NF = OR(C2VCO0, UC_18)
--	UC_19VZVOR1NF = OR(C2VINHN, UC_19)
--	UC_8VZVOR1NF = OR(C1VCO2, UC_8)
--	UC_9VZVOR1NF = OR(C1VCO1, UC_9)
--	UC_10VZVOR1NF = OR(C1VCO0, UC_10)
--	TCOMBVNODE16VOR1NF = OR(TCOMBVNODE18, FML, C3_Q3, TCOMBVNQC)
--	TCOMB_RA2VOR3NF = OR(TCOMBVNQC, CLRB)
--	TCOMB_RA2VOR2NF = OR(TCOMBVNFEL, CLRB)
--	TCOMB_RA2VOR1NF = OR(C3_Q0, C3_Q1, TCOMBVNQD, CLRB)
--	TCOMBVNODE4VOR2NF = OR(C3_Q2, TCOMBVNQD, CLRB)
--	TCOMBVNODE4VOR1NF = OR(TCOMBVNQC, C3_Q3, TCOMBVNFM, CLRB)
--	TCOMBVNODE8VOR2NF = OR(TCOMBVNQD, TCOMBVNFM)
--	TCOMBVNODE8VOR1NF = OR(C3_Q0, C3_Q1, TCOMBVNFM)
--	TCOMB_RA1VOR2NF = OR(C3_Q2, C3_Q3, OLATCH_FEL)
--	TCOMB_RA1VOR1NF = OR(TCOMBVNQA, C3_Q1, C3_Q2, OLATCH_FEL)
--	
--	TESTLVINMUXVND1 = NAND(TESTLVINMUXVOR2NF, TESTLVINMUXVOR1NF)
--	FMLVINMUXVND1 = NAND(FMLVINMUXVOR2NF, FMLVINMUXVOR1NF)
--	C3_Q3VZ = NAND(C3_Q3VZVOR1NF, C3_Q3VUC_0)
--	C3_Q3VUC_0 = NAND(C3VCO2, C3_Q3)
--	C3_Q2VZ = NAND(C3_Q2VZVOR1NF, C3_Q2VUC_0)
--	C3_Q2VUC_0 = NAND(C3VCO1, C3_Q2)
--	C3_Q1VZ = NAND(C3_Q1VZVOR1NF, C3_Q1VUC_0)
--	C3_Q1VUC_0 = NAND(C3VCO0, C3_Q1)
--	C3_Q0VZ = NAND(C3_Q0VZVOR1NF, C3_Q0VUC_0)
--	C3_Q0VUC_0 = NAND(C3VINHN, C3_Q0)
--	UC_16VZ = NAND(UC_16VZVOR1NF, UC_16VUC_0)
--	UC_16VUC_0 = NAND(C2VCO2, UC_16)
--	UC_17VZ = NAND(UC_17VZVOR1NF, UC_17VUC_0)
--	UC_17VUC_0 = NAND(C2VCO1, UC_17)
--	UC_18VZ = NAND(UC_18VZVOR1NF, UC_18VUC_0)
--	UC_18VUC_0 = NAND(C2VCO0, UC_18)
--	UC_19VZ = NAND(UC_19VZVOR1NF, UC_19VUC_0)
--	UC_19VUC_0 = NAND(C2VINHN, UC_19)
--	UC_8VZ = NAND(UC_8VZVOR1NF, UC_8VUC_0)
--	UC_8VUC_0 = NAND(C1VCO2, UC_8)
--	UC_9VZ = NAND(UC_9VZVOR1NF, UC_9VUC_0)
--	UC_9VUC_0 = NAND(C1VCO1, UC_9)
--	UC_10VZ = NAND(UC_10VZVOR1NF, UC_10VUC_0)
--	UC_10VUC_0 = NAND(C1VCO0, UC_10)
--	TCOMBVNODE16 = NAND(TCOMBVNODE19, TCOMBVNODE16VOR1NF)
--	TCOMBVNODE18 = NAND(TCOMBVNQB, C3_Q0)
--	TCOMB_RA2 = NAND(TCOMB_RA2VOR3NF, TCOMB_RA2VOR2NF, TCOMB_RA2VOR1NF)
--	TCOMBVNODE4 = NAND(TCOMBVNODE4VOR2NF, TCOMBVNODE4VOR1NF)
--	TCOMBVNODE12 = NAND(TCOMBVNCLR, TCOMBVNFEL, TCOMBVNQC, C3_Q1)
--	TCOMBVNODE3 = NAND(TCOMBVNODE4, TCOMBVNQB, TCOMBVNQA)
--	TCOMB_YA1 = NAND(TCOMBVNODE16, TCOMBVNODE3)
--	TCOMBVNODE14 = NAND(TCOMBVNODE15, TCOMBVNQA)
--	TCOMB_FE = NAND(TCOMBVNODE16, TCOMBVNODE14)
--	TCOMBVNODE8 = NAND(TCOMBVNCLR, C3_Q2, TCOMBVNODE8VOR2NF, TCOMBVNODE8VOR1NF)
--	TCOMB_RA1 = NAND(TCOMBVNCLR, TCOMB_RA1VOR2NF, TCOMB_RA1VOR1NF)
--	TCOMBVNODE6 = NAND(TCOMBVNFM, TCOMBVNQD, TCOMBVNQB, C3_Q0)
--	
--	CTST = NOR(C1_CO, TESTL)
--	C3VCO2 = NOR(CO2, UC_24, UC_25, UC_26)
--	C3VCO1 = NOR(CO2, UC_25, UC_26)
--	UC_27 = NOR(C3VCIA, CO2, UC_23)
--	C3VCIA = NOR(C3_Q2, C3_Q1, C3_Q0)
--	C3VCO0 = NOR(CO2, UC_26)
--	C3_Q3VD = NOR(CLRB, C3_Q3VZ, UC_27)
--	C3_Q2VD = NOR(CLRB, C3_Q2VZ, UC_27)
--	C3_Q1VD = NOR(CLRB, C3_Q1VZ, UC_27)
--	C3_Q0VD = NOR(CLRB, C3_Q0VZ, UC_27)
--	C2VCO2 = NOR(CTST, C2_QN2, UC_21, UC_22)
--	C2VCO1 = NOR(CTST, UC_21, UC_22)
--	C2_CO = NOR(C2VCIA, CTST, UC_20)
--	C2VCIA = NOR(UC_17, UC_18, UC_19)
--	C2VCO0 = NOR(CTST, UC_22)
--	UC_16VD = NOR(CLRB, UC_16VZ, C2_CO)
--	UC_17VD = NOR(CLRB, UC_17VZ, C2_CO)
--	UC_18VD = NOR(CLRB, UC_18VZ, C2_CO)
--	UC_19VD = NOR(CLRB, UC_19VZ, C2_CO)
--	C1VCO2 = NOR(UC_13, UC_14, UC_15)
--	C1VCO1 = NOR(UC_14, UC_15)
--	C1_CO = NOR(C1VCIA, UC_12)
--	C1VCIA = NOR(UC_9, UC_10, UC_11)
--	UC_8VD = NOR(CLRB, UC_8VZ, C1_CO)
--	UC_9VD = NOR(CLRB, UC_9VZ, C1_CO)
--	UC_10VD = NOR(CLRB, UC_10VZ, C1_CO)
--	UC_11VD = NOR(CLRB, UC_11VZ, C1_CO)
--	TCOMBVNODE19 = NOR(CLRB, TCOMBVNFEL)
--	TCOMB_GA2 = NOR(TCOMB_GA2VAD4NF, TCOMB_GA2VAD3NF, TCOMB_GA2VAD2NF, TCOMB_GA2VAD1NF)
--	TCOMBVNODE15 = NOR(CLRB, TCOMBVNFM, TCOMBVNQC, C3_Q1)
--	TCOMB_YA2 = NOR(TCOMBVNODE12, TCOMBVNQA)
--	TCOMB_GA1 = NOR(TCOMBVNODE8, TCOMB_GA1VAD1NF)
--	Y1C = NOR(Y1CVAD2NF, Y1CVAD1NF)
--	R2C = NOR(R2CVAD2NF, R2CVAD1NF)
--
-- VHDL Output
-- =============
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity s400 is
	port (
		CLK: in std_logic;
		CLR: in std_logic;
		FM: in std_logic;
		TEST: in std_logic;
		GRN1: out std_logic;
		GRN2: out std_logic;
		RED1: out std_logic;
		RED2: out std_logic;
		YLW1: out std_logic;
		YLW2: out std_logic
	);
end entity;

architecture RTL of s400 is
	attribute dont_touch: boolean;

	signal C1VCIA: std_logic; attribute dont_touch of C1VCIA: signal is true;
	signal C1VCO0: std_logic; attribute dont_touch of C1VCO0: signal is true;
	signal C1VCO1: std_logic; attribute dont_touch of C1VCO1: signal is true;
	signal C1VCO2: std_logic; attribute dont_touch of C1VCO2: signal is true;
	signal C1_CO: std_logic; attribute dont_touch of C1_CO: signal is true;
	signal C2VCIA: std_logic; attribute dont_touch of C2VCIA: signal is true;
	signal C2VCO0: std_logic; attribute dont_touch of C2VCO0: signal is true;
	signal C2VCO1: std_logic; attribute dont_touch of C2VCO1: signal is true;
	signal C2VCO2: std_logic; attribute dont_touch of C2VCO2: signal is true;
	signal C2VINHN: std_logic; attribute dont_touch of C2VINHN: signal is true;
	signal C2_CO: std_logic; attribute dont_touch of C2_CO: signal is true;
	signal C2_QN2: std_logic; attribute dont_touch of C2_QN2: signal is true;
	signal C3VCIA: std_logic; attribute dont_touch of C3VCIA: signal is true;
	signal C3VCO0: std_logic; attribute dont_touch of C3VCO0: signal is true;
	signal C3VCO1: std_logic; attribute dont_touch of C3VCO1: signal is true;
	signal C3VCO2: std_logic; attribute dont_touch of C3VCO2: signal is true;
	signal C3VINHN: std_logic; attribute dont_touch of C3VINHN: signal is true;
	signal C3_Q0: std_logic; attribute dont_touch of C3_Q0: signal is true;
	signal C3_Q0VD: std_logic; attribute dont_touch of C3_Q0VD: signal is true;
	signal C3_Q0VUC_0: std_logic; attribute dont_touch of C3_Q0VUC_0: signal is true;
	signal C3_Q0VZ: std_logic; attribute dont_touch of C3_Q0VZ: signal is true;
	signal C3_Q0VZVOR1NF: std_logic; attribute dont_touch of C3_Q0VZVOR1NF: signal is true;
	signal C3_Q1: std_logic; attribute dont_touch of C3_Q1: signal is true;
	signal C3_Q1VD: std_logic; attribute dont_touch of C3_Q1VD: signal is true;
	signal C3_Q1VUC_0: std_logic; attribute dont_touch of C3_Q1VUC_0: signal is true;
	signal C3_Q1VZ: std_logic; attribute dont_touch of C3_Q1VZ: signal is true;
	signal C3_Q1VZVOR1NF: std_logic; attribute dont_touch of C3_Q1VZVOR1NF: signal is true;
	signal C3_Q2: std_logic; attribute dont_touch of C3_Q2: signal is true;
	signal C3_Q2VD: std_logic; attribute dont_touch of C3_Q2VD: signal is true;
	signal C3_Q2VUC_0: std_logic; attribute dont_touch of C3_Q2VUC_0: signal is true;
	signal C3_Q2VZ: std_logic; attribute dont_touch of C3_Q2VZ: signal is true;
	signal C3_Q2VZVOR1NF: std_logic; attribute dont_touch of C3_Q2VZVOR1NF: signal is true;
	signal C3_Q3: std_logic; attribute dont_touch of C3_Q3: signal is true;
	signal C3_Q3VD: std_logic; attribute dont_touch of C3_Q3VD: signal is true;
	signal C3_Q3VUC_0: std_logic; attribute dont_touch of C3_Q3VUC_0: signal is true;
	signal C3_Q3VZ: std_logic; attribute dont_touch of C3_Q3VZ: signal is true;
	signal C3_Q3VZVOR1NF: std_logic; attribute dont_touch of C3_Q3VZVOR1NF: signal is true;
	signal CLRB: std_logic; attribute dont_touch of CLRB: signal is true;
	signal CLRBVIR1: std_logic; attribute dont_touch of CLRBVIR1: signal is true;
	signal CO2: std_logic; attribute dont_touch of CO2: signal is true;
	signal CTST: std_logic; attribute dont_touch of CTST: signal is true;
	signal FEN: std_logic; attribute dont_touch of FEN: signal is true;
	signal FMB: std_logic; attribute dont_touch of FMB: signal is true;
	signal FMBVIR1: std_logic; attribute dont_touch of FMBVIR1: signal is true;
	signal FML: std_logic; attribute dont_touch of FML: signal is true;
	signal FMLVINLATCHN: std_logic; attribute dont_touch of FMLVINLATCHN: signal is true;
	signal FMLVINLATCHVCDAD: std_logic; attribute dont_touch of FMLVINLATCHVCDAD: signal is true;
	signal FMLVINLATCHVCDN: std_logic; attribute dont_touch of FMLVINLATCHVCDN: signal is true;
	signal FMLVINMUX: std_logic; attribute dont_touch of FMLVINMUX: signal is true;
	signal FMLVINMUXVIR1: std_logic; attribute dont_touch of FMLVINMUXVIR1: signal is true;
	signal FMLVINMUXVND1: std_logic; attribute dont_touch of FMLVINMUXVND1: signal is true;
	signal FMLVINMUXVOR1NF: std_logic; attribute dont_touch of FMLVINMUXVOR1NF: signal is true;
	signal FMLVINMUXVOR2NF: std_logic; attribute dont_touch of FMLVINMUXVOR2NF: signal is true;
	signal I84: std_logic; attribute dont_touch of I84: signal is true;
	signal OLATCHVUC_5: std_logic; attribute dont_touch of OLATCHVUC_5: signal is true;
	signal OLATCHVUC_6: std_logic; attribute dont_touch of OLATCHVUC_6: signal is true;
	signal OLATCH_FEL: std_logic; attribute dont_touch of OLATCH_FEL: signal is true;
	signal OLATCH_G1L: std_logic; attribute dont_touch of OLATCH_G1L: signal is true;
	signal OLATCH_G2L: std_logic; attribute dont_touch of OLATCH_G2L: signal is true;
	signal OLATCH_R1L: std_logic; attribute dont_touch of OLATCH_R1L: signal is true;
	signal OLATCH_R2L: std_logic; attribute dont_touch of OLATCH_R2L: signal is true;
	signal OLATCH_Y1L: std_logic; attribute dont_touch of OLATCH_Y1L: signal is true;
	signal OLATCH_Y2L: std_logic; attribute dont_touch of OLATCH_Y2L: signal is true;
	signal OUTBUFVBUFG1VIR1: std_logic; attribute dont_touch of OUTBUFVBUFG1VIR1: signal is true;
	signal OUTBUFVBUFG2VIR1: std_logic; attribute dont_touch of OUTBUFVBUFG2VIR1: signal is true;
	signal OUTBUFVBUFR1VIR1: std_logic; attribute dont_touch of OUTBUFVBUFR1VIR1: signal is true;
	signal OUTBUFVBUFR2VIR1: std_logic; attribute dont_touch of OUTBUFVBUFR2VIR1: signal is true;
	signal OUTBUFVBUFY1VIR1: std_logic; attribute dont_touch of OUTBUFVBUFY1VIR1: signal is true;
	signal OUTBUFVBUFY2VIR1: std_logic; attribute dont_touch of OUTBUFVBUFY2VIR1: signal is true;
	signal R2C: std_logic; attribute dont_touch of R2C: signal is true;
	signal R2CVAD1NF: std_logic; attribute dont_touch of R2CVAD1NF: signal is true;
	signal R2CVAD2NF: std_logic; attribute dont_touch of R2CVAD2NF: signal is true;
	signal TCOMBVNCLR: std_logic; attribute dont_touch of TCOMBVNCLR: signal is true;
	signal TCOMBVNFEL: std_logic; attribute dont_touch of TCOMBVNFEL: signal is true;
	signal TCOMBVNFM: std_logic; attribute dont_touch of TCOMBVNFM: signal is true;
	signal TCOMBVNODE3: std_logic; attribute dont_touch of TCOMBVNODE3: signal is true;
	signal TCOMBVNODE4: std_logic; attribute dont_touch of TCOMBVNODE4: signal is true;
	signal TCOMBVNODE4VOR1NF: std_logic; attribute dont_touch of TCOMBVNODE4VOR1NF: signal is true;
	signal TCOMBVNODE4VOR2NF: std_logic; attribute dont_touch of TCOMBVNODE4VOR2NF: signal is true;
	signal TCOMBVNODE6: std_logic; attribute dont_touch of TCOMBVNODE6: signal is true;
	signal TCOMBVNODE8: std_logic; attribute dont_touch of TCOMBVNODE8: signal is true;
	signal TCOMBVNODE8VOR1NF: std_logic; attribute dont_touch of TCOMBVNODE8VOR1NF: signal is true;
	signal TCOMBVNODE8VOR2NF: std_logic; attribute dont_touch of TCOMBVNODE8VOR2NF: signal is true;
	signal TCOMBVNODE12: std_logic; attribute dont_touch of TCOMBVNODE12: signal is true;
	signal TCOMBVNODE14: std_logic; attribute dont_touch of TCOMBVNODE14: signal is true;
	signal TCOMBVNODE15: std_logic; attribute dont_touch of TCOMBVNODE15: signal is true;
	signal TCOMBVNODE16: std_logic; attribute dont_touch of TCOMBVNODE16: signal is true;
	signal TCOMBVNODE16VOR1NF: std_logic; attribute dont_touch of TCOMBVNODE16VOR1NF: signal is true;
	signal TCOMBVNODE18: std_logic; attribute dont_touch of TCOMBVNODE18: signal is true;
	signal TCOMBVNODE19: std_logic; attribute dont_touch of TCOMBVNODE19: signal is true;
	signal TCOMBVNQA: std_logic; attribute dont_touch of TCOMBVNQA: signal is true;
	signal TCOMBVNQB: std_logic; attribute dont_touch of TCOMBVNQB: signal is true;
	signal TCOMBVNQC: std_logic; attribute dont_touch of TCOMBVNQC: signal is true;
	signal TCOMBVNQD: std_logic; attribute dont_touch of TCOMBVNQD: signal is true;
	signal TCOMB_FE: std_logic; attribute dont_touch of TCOMB_FE: signal is true;
	signal TCOMB_FE_BF: std_logic; attribute dont_touch of TCOMB_FE_BF: signal is true;
	signal TCOMB_GA1: std_logic; attribute dont_touch of TCOMB_GA1: signal is true;
	signal TCOMB_GA1VAD1NF: std_logic; attribute dont_touch of TCOMB_GA1VAD1NF: signal is true;
	signal TCOMB_GA2: std_logic; attribute dont_touch of TCOMB_GA2: signal is true;
	signal TCOMB_GA2VAD1NF: std_logic; attribute dont_touch of TCOMB_GA2VAD1NF: signal is true;
	signal TCOMB_GA2VAD2NF: std_logic; attribute dont_touch of TCOMB_GA2VAD2NF: signal is true;
	signal TCOMB_GA2VAD3NF: std_logic; attribute dont_touch of TCOMB_GA2VAD3NF: signal is true;
	signal TCOMB_GA2VAD4NF: std_logic; attribute dont_touch of TCOMB_GA2VAD4NF: signal is true;
	signal TCOMB_RA1: std_logic; attribute dont_touch of TCOMB_RA1: signal is true;
	signal TCOMB_RA1VOR1NF: std_logic; attribute dont_touch of TCOMB_RA1VOR1NF: signal is true;
	signal TCOMB_RA1VOR2NF: std_logic; attribute dont_touch of TCOMB_RA1VOR2NF: signal is true;
	signal TCOMB_RA2: std_logic; attribute dont_touch of TCOMB_RA2: signal is true;
	signal TCOMB_RA2VOR1NF: std_logic; attribute dont_touch of TCOMB_RA2VOR1NF: signal is true;
	signal TCOMB_RA2VOR2NF: std_logic; attribute dont_touch of TCOMB_RA2VOR2NF: signal is true;
	signal TCOMB_RA2VOR3NF: std_logic; attribute dont_touch of TCOMB_RA2VOR3NF: signal is true;
	signal TCOMB_YA1: std_logic; attribute dont_touch of TCOMB_YA1: signal is true;
	signal TCOMB_YA2: std_logic; attribute dont_touch of TCOMB_YA2: signal is true;
	signal TESTB: std_logic; attribute dont_touch of TESTB: signal is true;
	signal TESTBVIR1: std_logic; attribute dont_touch of TESTBVIR1: signal is true;
	signal TESTL: std_logic; attribute dont_touch of TESTL: signal is true;
	signal TESTLVINLATCHN: std_logic; attribute dont_touch of TESTLVINLATCHN: signal is true;
	signal TESTLVINLATCHVCDAD: std_logic; attribute dont_touch of TESTLVINLATCHVCDAD: signal is true;
	signal TESTLVINLATCHVCDN: std_logic; attribute dont_touch of TESTLVINLATCHVCDN: signal is true;
	signal TESTLVINMUX: std_logic; attribute dont_touch of TESTLVINMUX: signal is true;
	signal TESTLVINMUXVIR1: std_logic; attribute dont_touch of TESTLVINMUXVIR1: signal is true;
	signal TESTLVINMUXVND1: std_logic; attribute dont_touch of TESTLVINMUXVND1: signal is true;
	signal TESTLVINMUXVOR1NF: std_logic; attribute dont_touch of TESTLVINMUXVOR1NF: signal is true;
	signal TESTLVINMUXVOR2NF: std_logic; attribute dont_touch of TESTLVINMUXVOR2NF: signal is true;
	signal UC_8: std_logic; attribute dont_touch of UC_8: signal is true;
	signal UC_8VD: std_logic; attribute dont_touch of UC_8VD: signal is true;
	signal UC_8VUC_0: std_logic; attribute dont_touch of UC_8VUC_0: signal is true;
	signal UC_8VZ: std_logic; attribute dont_touch of UC_8VZ: signal is true;
	signal UC_8VZVOR1NF: std_logic; attribute dont_touch of UC_8VZVOR1NF: signal is true;
	signal UC_9: std_logic; attribute dont_touch of UC_9: signal is true;
	signal UC_9VD: std_logic; attribute dont_touch of UC_9VD: signal is true;
	signal UC_9VUC_0: std_logic; attribute dont_touch of UC_9VUC_0: signal is true;
	signal UC_9VZ: std_logic; attribute dont_touch of UC_9VZ: signal is true;
	signal UC_9VZVOR1NF: std_logic; attribute dont_touch of UC_9VZVOR1NF: signal is true;
	signal UC_10: std_logic; attribute dont_touch of UC_10: signal is true;
	signal UC_10VD: std_logic; attribute dont_touch of UC_10VD: signal is true;
	signal UC_10VUC_0: std_logic; attribute dont_touch of UC_10VUC_0: signal is true;
	signal UC_10VZ: std_logic; attribute dont_touch of UC_10VZ: signal is true;
	signal UC_10VZVOR1NF: std_logic; attribute dont_touch of UC_10VZVOR1NF: signal is true;
	signal UC_11: std_logic; attribute dont_touch of UC_11: signal is true;
	signal UC_11VD: std_logic; attribute dont_touch of UC_11VD: signal is true;
	signal UC_11VUC_0: std_logic; attribute dont_touch of UC_11VUC_0: signal is true;
	signal UC_11VZ: std_logic; attribute dont_touch of UC_11VZ: signal is true;
	signal UC_12: std_logic; attribute dont_touch of UC_12: signal is true;
	signal UC_13: std_logic; attribute dont_touch of UC_13: signal is true;
	signal UC_14: std_logic; attribute dont_touch of UC_14: signal is true;
	signal UC_15: std_logic; attribute dont_touch of UC_15: signal is true;
	signal UC_16: std_logic; attribute dont_touch of UC_16: signal is true;
	signal UC_16VD: std_logic; attribute dont_touch of UC_16VD: signal is true;
	signal UC_16VUC_0: std_logic; attribute dont_touch of UC_16VUC_0: signal is true;
	signal UC_16VZ: std_logic; attribute dont_touch of UC_16VZ: signal is true;
	signal UC_16VZVOR1NF: std_logic; attribute dont_touch of UC_16VZVOR1NF: signal is true;
	signal UC_17: std_logic; attribute dont_touch of UC_17: signal is true;
	signal UC_17VD: std_logic; attribute dont_touch of UC_17VD: signal is true;
	signal UC_17VUC_0: std_logic; attribute dont_touch of UC_17VUC_0: signal is true;
	signal UC_17VZ: std_logic; attribute dont_touch of UC_17VZ: signal is true;
	signal UC_17VZVOR1NF: std_logic; attribute dont_touch of UC_17VZVOR1NF: signal is true;
	signal UC_18: std_logic; attribute dont_touch of UC_18: signal is true;
	signal UC_18VD: std_logic; attribute dont_touch of UC_18VD: signal is true;
	signal UC_18VUC_0: std_logic; attribute dont_touch of UC_18VUC_0: signal is true;
	signal UC_18VZ: std_logic; attribute dont_touch of UC_18VZ: signal is true;
	signal UC_18VZVOR1NF: std_logic; attribute dont_touch of UC_18VZVOR1NF: signal is true;
	signal UC_19: std_logic; attribute dont_touch of UC_19: signal is true;
	signal UC_19VD: std_logic; attribute dont_touch of UC_19VD: signal is true;
	signal UC_19VUC_0: std_logic; attribute dont_touch of UC_19VUC_0: signal is true;
	signal UC_19VZ: std_logic; attribute dont_touch of UC_19VZ: signal is true;
	signal UC_19VZVOR1NF: std_logic; attribute dont_touch of UC_19VZVOR1NF: signal is true;
	signal UC_20: std_logic; attribute dont_touch of UC_20: signal is true;
	signal UC_21: std_logic; attribute dont_touch of UC_21: signal is true;
	signal UC_22: std_logic; attribute dont_touch of UC_22: signal is true;
	signal UC_23: std_logic; attribute dont_touch of UC_23: signal is true;
	signal UC_24: std_logic; attribute dont_touch of UC_24: signal is true;
	signal UC_25: std_logic; attribute dont_touch of UC_25: signal is true;
	signal UC_26: std_logic; attribute dont_touch of UC_26: signal is true;
	signal UC_27: std_logic; attribute dont_touch of UC_27: signal is true;
	signal Y1C: std_logic; attribute dont_touch of Y1C: signal is true;
	signal Y1CVAD1NF: std_logic; attribute dont_touch of Y1CVAD1NF: signal is true;
	signal Y1CVAD2NF: std_logic; attribute dont_touch of Y1CVAD2NF: signal is true;
begin
	process(CLK)
	begin
		if(rising_edge(CLK)) then
			C3_Q0<=C3_Q0VD;
			C3_Q1<=C3_Q1VD;
			C3_Q2<=C3_Q2VD;
			C3_Q3<=C3_Q3VD;
			FML<=FMLVINLATCHVCDAD;
			OLATCHVUC_5<=R2C;
			OLATCHVUC_6<=Y1C;
			OLATCH_FEL<=TCOMB_FE_BF;
			OLATCH_G1L<=TCOMB_GA1;
			OLATCH_G2L<=TCOMB_GA2;
			OLATCH_R1L<=TCOMB_RA1;
			OLATCH_Y2L<=TCOMB_YA2;
			TESTL<=TESTLVINLATCHVCDAD;
			UC_8<=UC_8VD;
			UC_9<=UC_9VD;
			UC_10<=UC_10VD;
			UC_11<=UC_11VD;
			UC_16<=UC_16VD;
			UC_17<=UC_17VD;
			UC_18<=UC_18VD;
			UC_19<=UC_19VD;
		end if;
	end process;
	C1VCO0<= not UC_15;
	C2VINHN<= not CTST;
	C2_QN2<= not UC_17;
	C3VINHN<= not CO2;
	CLRB<= not CLRBVIR1;
	CLRBVIR1<= not CLR;
	CO2<= not C2_CO;
	FEN<= not TCOMB_FE;
	FMB<= not FMBVIR1;
	FMBVIR1<= not FM;
	FMLVINLATCHN<= not FML;
	FMLVINLATCHVCDN<= not CLRB;
	FMLVINMUX<= not FMLVINMUXVND1;
	FMLVINMUXVIR1<= not FMB;
	GRN1<= not OUTBUFVBUFG1VIR1;
	GRN2<= not OUTBUFVBUFG2VIR1;
	I84<= not TCOMB_FE;
	OLATCH_R2L<= not OLATCHVUC_5;
	OLATCH_Y1L<= not OLATCHVUC_6;
	OUTBUFVBUFG1VIR1<= not OLATCH_G1L;
	OUTBUFVBUFG2VIR1<= not OLATCH_G2L;
	OUTBUFVBUFR1VIR1<= not OLATCH_R1L;
	OUTBUFVBUFR2VIR1<= not OLATCH_R2L;
	OUTBUFVBUFY1VIR1<= not OLATCH_Y1L;
	OUTBUFVBUFY2VIR1<= not OLATCH_Y2L;
	RED1<= not OUTBUFVBUFR1VIR1;
	RED2<= not OUTBUFVBUFR2VIR1;
	TCOMBVNCLR<= not CLRB;
	TCOMBVNFEL<= not OLATCH_FEL;
	TCOMBVNFM<= not FML;
	TCOMBVNQA<= not C3_Q0;
	TCOMBVNQB<= not C3_Q1;
	TCOMBVNQC<= not C3_Q2;
	TCOMBVNQD<= not C3_Q3;
	TCOMB_FE_BF<= not I84;
	TESTB<= not TESTBVIR1;
	TESTBVIR1<= not TEST;
	TESTLVINLATCHN<= not TESTL;
	TESTLVINLATCHVCDN<= not CLRB;
	TESTLVINMUX<= not TESTLVINMUXVND1;
	TESTLVINMUXVIR1<= not TESTB;
	UC_11VUC_0<= not UC_11;
	UC_11VZ<= not UC_11VUC_0;
	UC_12<= not UC_8;
	UC_13<= not UC_9;
	UC_14<= not UC_10;
	UC_15<= not UC_11;
	UC_20<= not UC_16;
	UC_21<= not UC_18;
	UC_22<= not UC_19;
	UC_23<= not C3_Q3;
	UC_24<= not C3_Q2;
	UC_25<= not C3_Q1;
	UC_26<= not C3_Q0;
	YLW1<= not OUTBUFVBUFY1VIR1;
	YLW2<= not OUTBUFVBUFY2VIR1;
	FMLVINLATCHVCDAD<=FMLVINLATCHVCDN and FMLVINMUX;
	R2CVAD1NF<=TCOMB_FE and TCOMB_RA2 and C2_QN2;
	R2CVAD2NF<=FEN and TCOMB_RA2;
	TCOMB_GA1VAD1NF<=TCOMBVNODE6 and OLATCH_FEL;
	TCOMB_GA2VAD1NF<=TCOMBVNQA and C3_Q3 and TCOMBVNCLR;
	TCOMB_GA2VAD2NF<=C3_Q0 and C3_Q1 and TCOMBVNCLR;
	TCOMB_GA2VAD3NF<=C3_Q2 and TCOMBVNCLR;
	TCOMB_GA2VAD4NF<=OLATCH_FEL and TCOMBVNCLR;
	TESTLVINLATCHVCDAD<=TESTLVINLATCHVCDN and TESTLVINMUX;
	Y1CVAD1NF<=TCOMB_FE and TCOMB_YA1 and C2_QN2;
	Y1CVAD2NF<=FEN and TCOMB_YA1;
	C3_Q0VUC_0<= not (C3VINHN and C3_Q0);
	C3_Q0VZ<= not (C3_Q0VZVOR1NF and C3_Q0VUC_0);
	C3_Q1VUC_0<= not (C3VCO0 and C3_Q1);
	C3_Q1VZ<= not (C3_Q1VZVOR1NF and C3_Q1VUC_0);
	C3_Q2VUC_0<= not (C3VCO1 and C3_Q2);
	C3_Q2VZ<= not (C3_Q2VZVOR1NF and C3_Q2VUC_0);
	C3_Q3VUC_0<= not (C3VCO2 and C3_Q3);
	C3_Q3VZ<= not (C3_Q3VZVOR1NF and C3_Q3VUC_0);
	FMLVINMUXVND1<= not (FMLVINMUXVOR2NF and FMLVINMUXVOR1NF);
	TCOMBVNODE3<= not (TCOMBVNODE4 and TCOMBVNQB and TCOMBVNQA);
	TCOMBVNODE4<= not (TCOMBVNODE4VOR2NF and TCOMBVNODE4VOR1NF);
	TCOMBVNODE6<= not (TCOMBVNFM and TCOMBVNQD and TCOMBVNQB and C3_Q0);
	TCOMBVNODE8<= not (TCOMBVNCLR and C3_Q2 and TCOMBVNODE8VOR2NF and TCOMBVNODE8VOR1NF);
	TCOMBVNODE12<= not (TCOMBVNCLR and TCOMBVNFEL and TCOMBVNQC and C3_Q1);
	TCOMBVNODE14<= not (TCOMBVNODE15 and TCOMBVNQA);
	TCOMBVNODE16<= not (TCOMBVNODE19 and TCOMBVNODE16VOR1NF);
	TCOMBVNODE18<= not (TCOMBVNQB and C3_Q0);
	TCOMB_FE<= not (TCOMBVNODE16 and TCOMBVNODE14);
	TCOMB_RA1<= not (TCOMBVNCLR and TCOMB_RA1VOR2NF and TCOMB_RA1VOR1NF);
	TCOMB_RA2<= not (TCOMB_RA2VOR3NF and TCOMB_RA2VOR2NF and TCOMB_RA2VOR1NF);
	TCOMB_YA1<= not (TCOMBVNODE16 and TCOMBVNODE3);
	TESTLVINMUXVND1<= not (TESTLVINMUXVOR2NF and TESTLVINMUXVOR1NF);
	UC_8VUC_0<= not (C1VCO2 and UC_8);
	UC_8VZ<= not (UC_8VZVOR1NF and UC_8VUC_0);
	UC_9VUC_0<= not (C1VCO1 and UC_9);
	UC_9VZ<= not (UC_9VZVOR1NF and UC_9VUC_0);
	UC_10VUC_0<= not (C1VCO0 and UC_10);
	UC_10VZ<= not (UC_10VZVOR1NF and UC_10VUC_0);
	UC_16VUC_0<= not (C2VCO2 and UC_16);
	UC_16VZ<= not (UC_16VZVOR1NF and UC_16VUC_0);
	UC_17VUC_0<= not (C2VCO1 and UC_17);
	UC_17VZ<= not (UC_17VZVOR1NF and UC_17VUC_0);
	UC_18VUC_0<= not (C2VCO0 and UC_18);
	UC_18VZ<= not (UC_18VZVOR1NF and UC_18VUC_0);
	UC_19VUC_0<= not (C2VINHN and UC_19);
	UC_19VZ<= not (UC_19VZVOR1NF and UC_19VUC_0);
	C3_Q0VZVOR1NF<=C3VINHN or C3_Q0;
	C3_Q1VZVOR1NF<=C3VCO0 or C3_Q1;
	C3_Q2VZVOR1NF<=C3VCO1 or C3_Q2;
	C3_Q3VZVOR1NF<=C3VCO2 or C3_Q3;
	FMLVINMUXVOR1NF<=FMB or FML;
	FMLVINMUXVOR2NF<=FMLVINMUXVIR1 or FMLVINLATCHN;
	TCOMBVNODE4VOR1NF<=TCOMBVNQC or C3_Q3 or TCOMBVNFM or CLRB;
	TCOMBVNODE4VOR2NF<=C3_Q2 or TCOMBVNQD or CLRB;
	TCOMBVNODE8VOR1NF<=C3_Q0 or C3_Q1 or TCOMBVNFM;
	TCOMBVNODE8VOR2NF<=TCOMBVNQD or TCOMBVNFM;
	TCOMBVNODE16VOR1NF<=TCOMBVNODE18 or FML or C3_Q3 or TCOMBVNQC;
	TCOMB_RA1VOR1NF<=TCOMBVNQA or C3_Q1 or C3_Q2 or OLATCH_FEL;
	TCOMB_RA1VOR2NF<=C3_Q2 or C3_Q3 or OLATCH_FEL;
	TCOMB_RA2VOR1NF<=C3_Q0 or C3_Q1 or TCOMBVNQD or CLRB;
	TCOMB_RA2VOR2NF<=TCOMBVNFEL or CLRB;
	TCOMB_RA2VOR3NF<=TCOMBVNQC or CLRB;
	TESTLVINMUXVOR1NF<=TESTB or TESTL;
	TESTLVINMUXVOR2NF<=TESTLVINMUXVIR1 or TESTLVINLATCHN;
	UC_8VZVOR1NF<=C1VCO2 or UC_8;
	UC_9VZVOR1NF<=C1VCO1 or UC_9;
	UC_10VZVOR1NF<=C1VCO0 or UC_10;
	UC_16VZVOR1NF<=C2VCO2 or UC_16;
	UC_17VZVOR1NF<=C2VCO1 or UC_17;
	UC_18VZVOR1NF<=C2VCO0 or UC_18;
	UC_19VZVOR1NF<=C2VINHN or UC_19;
	C1VCIA<= not (UC_9 or UC_10 or UC_11);
	C1VCO1<= not (UC_14 or UC_15);
	C1VCO2<= not (UC_13 or UC_14 or UC_15);
	C1_CO<= not (C1VCIA or UC_12);
	C2VCIA<= not (UC_17 or UC_18 or UC_19);
	C2VCO0<= not (CTST or UC_22);
	C2VCO1<= not (CTST or UC_21 or UC_22);
	C2VCO2<= not (CTST or C2_QN2 or UC_21 or UC_22);
	C2_CO<= not (C2VCIA or CTST or UC_20);
	C3VCIA<= not (C3_Q2 or C3_Q1 or C3_Q0);
	C3VCO0<= not (CO2 or UC_26);
	C3VCO1<= not (CO2 or UC_25 or UC_26);
	C3VCO2<= not (CO2 or UC_24 or UC_25 or UC_26);
	C3_Q0VD<= not (CLRB or C3_Q0VZ or UC_27);
	C3_Q1VD<= not (CLRB or C3_Q1VZ or UC_27);
	C3_Q2VD<= not (CLRB or C3_Q2VZ or UC_27);
	C3_Q3VD<= not (CLRB or C3_Q3VZ or UC_27);
	CTST<= not (C1_CO or TESTL);
	R2C<= not (R2CVAD2NF or R2CVAD1NF);
	TCOMBVNODE15<= not (CLRB or TCOMBVNFM or TCOMBVNQC or C3_Q1);
	TCOMBVNODE19<= not (CLRB or TCOMBVNFEL);
	TCOMB_GA1<= not (TCOMBVNODE8 or TCOMB_GA1VAD1NF);
	TCOMB_GA2<= not (TCOMB_GA2VAD4NF or TCOMB_GA2VAD3NF or TCOMB_GA2VAD2NF or TCOMB_GA2VAD1NF);
	TCOMB_YA2<= not (TCOMBVNODE12 or TCOMBVNQA);
	UC_8VD<= not (CLRB or UC_8VZ or C1_CO);
	UC_9VD<= not (CLRB or UC_9VZ or C1_CO);
	UC_10VD<= not (CLRB or UC_10VZ or C1_CO);
	UC_11VD<= not (CLRB or UC_11VZ or C1_CO);
	UC_16VD<= not (CLRB or UC_16VZ or C2_CO);
	UC_17VD<= not (CLRB or UC_17VZ or C2_CO);
	UC_18VD<= not (CLRB or UC_18VZ or C2_CO);
	UC_19VD<= not (CLRB or UC_19VZ or C2_CO);
	UC_27<= not (C3VCIA or CO2 or UC_23);
	Y1C<= not (Y1CVAD2NF or Y1CVAD1NF);
end RTL;
