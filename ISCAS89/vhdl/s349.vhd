-- File created by Bench2VHDL
-- Name: s349
-- File: bench/s349.bench
-- Timestamp: 2019-05-21T22:08:29.044093
--
-- Original File
-- =============
--	# s349
--	# 9 inputs
--	# 11 outputs
--	# 15 D-type flipflops
--	# 57 inverters
--	# 104 gates (44 ANDs + 19 NANDs + 10 ORs + 31 NORs)
--	
--	INPUT(START)
--	INPUT(B0)
--	INPUT(B1)
--	INPUT(B2)
--	INPUT(B3)
--	INPUT(A0)
--	INPUT(A1)
--	INPUT(A2)
--	INPUT(A3)
--	
--	OUTPUT(CNTVCO2)
--	OUTPUT(CNTVCON2)
--	OUTPUT(READY)
--	OUTPUT(P0)
--	OUTPUT(P1)
--	OUTPUT(P2)
--	OUTPUT(P3)
--	OUTPUT(P4)
--	OUTPUT(P5)
--	OUTPUT(P6)
--	OUTPUT(P7)
--	
--	CT2 = DFF(CNTVG3VD)
--	CT1 = DFF(CNTVG2VD)
--	CT0 = DFF(CNTVG1VD)
--	ACVQN3 = DFF(ACVG4VD1)
--	ACVQN2 = DFF(ACVG3VD1)
--	ACVQN1 = DFF(ACVG2VD1)
--	ACVQN0 = DFF(ACVG1VD1)
--	MRVQN3 = DFF(MRVG4VD)
--	MRVQN2 = DFF(MRVG3VD)
--	MRVQN1 = DFF(MRVG2VD)
--	MRVQN0 = DFF(MRVG1VD)
--	AX3 = DFF(AM3)
--	AX2 = DFF(AM2)
--	AX1 = DFF(AM1)
--	AX0 = DFF(AM0)
--	
--	READY = NOT(READYN)
--	CT1N = NOT(CT1)
--	CNTVG3VQN = NOT(CT2)
--	CNTVG2VQN = NOT(CT1)
--	CNTVCO0 = NOT(CNTVG1VQN)
--	CNTVCON0 = NOT(CT0)
--	CNTVG1VQN = NOT(CT0)
--	CNTVG1VD1 = NOT(READY)
--	S3 = NOT(ADDVG4VSN)
--	CO = NOT(ADDVG4VCN)
--	S2 = NOT(ADDVG3VSN)
--	ADDVC3 = NOT(ADDVG3VCN)
--	S1 = NOT(ADDVG2VSN)
--	ADDVC2 = NOT(ADDVG2VCN)
--	ADDVC1 = NOT(ADDVG1VCN)
--	S0 = NOT(ADDVG1VP)
--	AD0 = NOT(AD0N)
--	AD1 = NOT(AD1N)
--	AD2 = NOT(AD2N)
--	AD3 = NOT(AD3N)
--	ACVPCN = NOT(START)
--	P7 = NOT(ACVQN3)
--	P6 = NOT(ACVQN2)
--	P5 = NOT(ACVQN1)
--	P4 = NOT(ACVQN0)
--	SMVG5VS0P = NOT(SMVS0N)
--	SM3 = NOT(SMVG5VX)
--	SMVG4VS0P = NOT(SMVS0N)
--	SM2 = NOT(SMVG4VX)
--	SMVG3VS0P = NOT(SMVS0N)
--	SM1 = NOT(SMVG3VX)
--	SMVG2VS0P = NOT(SMVS0N)
--	SM0 = NOT(SMVG2VX)
--	SMVS0N = NOT(ADSH)
--	MRVSHLDN = NOT(ADSH)
--	P3 = NOT(MRVQN3)
--	P2 = NOT(MRVQN2)
--	P1 = NOT(MRVQN1)
--	P0 = NOT(MRVQN0)
--	BMVG5VS0P = NOT(BMVS0N)
--	BM3 = NOT(BMVG5VX)
--	BMVG4VS0P = NOT(BMVS0N)
--	BM2 = NOT(BMVG4VX)
--	BMVG3VS0P = NOT(BMVS0N)
--	BM1 = NOT(BMVG3VX)
--	BMVG2VS0P = NOT(BMVS0N)
--	BM0 = NOT(BMVG2VX)
--	BMVS0N = NOT(READYN)
--	AMVG5VS0P = NOT(AMVS0N)
--	AM3 = NOT(AMVG5VX)
--	AMVG4VS0P = NOT(AMVS0N)
--	AM2 = NOT(AMVG4VX)
--	AMVG3VS0P = NOT(AMVS0N)
--	AM1 = NOT(AMVG3VX)
--	AMVG2VS0P = NOT(AMVS0N)
--	AM0 = NOT(AMVG2VX)
--	AMVS0N = NOT(INIT)
--	
--	ADDVG4VCNVAD4NF = AND(ADDVC3, AD3, P7)
--	ADDVG4VCNVAD3NF = AND(ADDVG4VCNVOR2NF, ADDVG4VCN)
--	ADDVG4VCNVAD2NF = AND(ADDVC3, ADDVG4VCNVOR1NF)
--	ADDVG4VCNVAD1NF = AND(AD3, P7)
--	ADDVG3VCNVAD4NF = AND(ADDVC2, AD2, P6)
--	ADDVG3VCNVAD3NF = AND(ADDVG3VCNVOR2NF, ADDVG3VCN)
--	ADDVG3VCNVAD2NF = AND(ADDVC2, ADDVG3VCNVOR1NF)
--	ADDVG3VCNVAD1NF = AND(AD2, P6)
--	ADDVG2VCNVAD4NF = AND(ADDVC1, AD1, P5)
--	ADDVG2VCNVAD3NF = AND(ADDVG2VCNVOR2NF, ADDVG2VCN)
--	ADDVG2VCNVAD2NF = AND(ADDVC1, ADDVG2VCNVOR1NF)
--	ADDVG2VCNVAD1NF = AND(AD1, P5)
--	SMVG5VG1VAD2NF = AND(SMVG5VS0P, CO)
--	SMVG5VG1VAD1NF = AND(SMVS0N, P7)
--	SMVG4VG1VAD2NF = AND(SMVG4VS0P, S3)
--	SMVG4VG1VAD1NF = AND(SMVS0N, P6)
--	SMVG3VG1VAD2NF = AND(SMVG3VS0P, S2)
--	SMVG3VG1VAD1NF = AND(SMVS0N, P5)
--	SMVG2VG1VAD2NF = AND(SMVG2VS0P, S1)
--	SMVG2VG1VAD1NF = AND(SMVS0N, P4)
--	MRVG4VDVAD2NF = AND(MRVSHLDN, BM3)
--	MRVG4VDVAD1NF = AND(ADSH, S0)
--	MRVG3VDVAD2NF = AND(MRVSHLDN, BM2)
--	MRVG3VDVAD1NF = AND(ADSH, P3)
--	MRVG2VDVAD2NF = AND(MRVSHLDN, BM1)
--	MRVG2VDVAD1NF = AND(ADSH, P2)
--	MRVG1VDVAD2NF = AND(MRVSHLDN, BM0)
--	MRVG1VDVAD1NF = AND(ADSH, P1)
--	BMVG5VG1VAD2NF = AND(BMVG5VS0P, B3)
--	BMVG5VG1VAD1NF = AND(BMVS0N, P3)
--	BMVG4VG1VAD2NF = AND(BMVG4VS0P, B2)
--	BMVG4VG1VAD1NF = AND(BMVS0N, P2)
--	BMVG3VG1VAD2NF = AND(BMVG3VS0P, B1)
--	BMVG3VG1VAD1NF = AND(BMVS0N, P1)
--	BMVG2VG1VAD2NF = AND(BMVG2VS0P, B0)
--	BMVG2VG1VAD1NF = AND(BMVS0N, P0)
--	AMVG5VG1VAD2NF = AND(AMVG5VS0P, A3)
--	AMVG5VG1VAD1NF = AND(AMVS0N, AX3)
--	AMVG4VG1VAD2NF = AND(AMVG4VS0P, A2)
--	AMVG4VG1VAD1NF = AND(AMVS0N, AX2)
--	AMVG3VG1VAD2NF = AND(AMVG3VS0P, A1)
--	AMVG3VG1VAD1NF = AND(AMVS0N, AX1)
--	AMVG2VG1VAD2NF = AND(AMVG2VS0P, A0)
--	AMVG2VG1VAD1NF = AND(AMVS0N, AX0)
--	
--	CNTVG3VG2VOR1NF = OR(CT2, CNTVG3VD1)
--	CNTVG2VG2VOR1NF = OR(CT1, CNTVG2VD1)
--	CNTVG1VG2VOR1NF = OR(CT0, CNTVG1VD1)
--	ADDVG4VCNVOR2NF = OR(ADDVC3, AD3, P7)
--	ADDVG4VCNVOR1NF = OR(AD3, P7)
--	ADDVG3VCNVOR2NF = OR(ADDVC2, AD2, P6)
--	ADDVG3VCNVOR1NF = OR(AD2, P6)
--	ADDVG2VCNVOR2NF = OR(ADDVC1, AD1, P5)
--	ADDVG2VCNVOR1NF = OR(AD1, P5)
--	ADDVG1VPVOR1NF = OR(AD0, P4)
--	
--	READYN = NAND(CT0, CT1N, CT2)
--	CNTVCON2 = NAND(CT2, CNTVCO1)
--	CNTVG3VZ = NAND(CNTVG3VG2VOR1NF, CNTVG3VZ1)
--	CNTVG3VZ1 = NAND(CT2, CNTVG3VD1)
--	CNTVCON1 = NAND(CT1, CNTVCO0)
--	CNTVG2VZ = NAND(CNTVG2VG2VOR1NF, CNTVG2VZ1)
--	CNTVG2VZ1 = NAND(CT1, CNTVG2VD1)
--	CNTVG1VZ = NAND(CNTVG1VG2VOR1NF, CNTVG1VZ1)
--	CNTVG1VZ1 = NAND(CT0, CNTVG1VD1)
--	ADDVG1VP = NAND(ADDVG1VPVOR1NF, ADDVG1VCN)
--	ADDVG1VCN = NAND(AD0, P4)
--	AD0N = NAND(P0, AX0)
--	AD1N = NAND(P0, AX1)
--	AD2N = NAND(P0, AX2)
--	AD3N = NAND(P0, AX3)
--	ACVG4VD1 = NAND(ACVPCN, SM3)
--	ACVG3VD1 = NAND(ACVPCN, SM2)
--	ACVG2VD1 = NAND(ACVPCN, SM1)
--	ACVG1VD1 = NAND(ACVPCN, SM0)
--	
--	ADSH = NOR(READY, INIT)
--	INIT = NOR(CT0, CT1, CT2)
--	CNTVCO2 = NOR(CNTVG3VQN, CNTVCON1)
--	CNTVG3VD = NOR(CNTVG3VZ, START)
--	CNTVG3VD1 = NOR(READY, CNTVCON1)
--	CNTVCO1 = NOR(CNTVG2VQN, CNTVCON0)
--	CNTVG2VD = NOR(CNTVG2VZ, START)
--	CNTVG2VD1 = NOR(READY, CNTVCON0)
--	CNTVG1VD = NOR(CNTVG1VZ, START)
--	ADDVG4VSN = NOR(ADDVG4VCNVAD4NF, ADDVG4VCNVAD3NF)
--	ADDVG4VCN = NOR(ADDVG4VCNVAD2NF, ADDVG4VCNVAD1NF)
--	ADDVG3VSN = NOR(ADDVG3VCNVAD4NF, ADDVG3VCNVAD3NF)
--	ADDVG3VCN = NOR(ADDVG3VCNVAD2NF, ADDVG3VCNVAD1NF)
--	ADDVG2VSN = NOR(ADDVG2VCNVAD4NF, ADDVG2VCNVAD3NF)
--	ADDVG2VCN = NOR(ADDVG2VCNVAD2NF, ADDVG2VCNVAD1NF)
--	SMVG5VX = NOR(SMVG5VG1VAD2NF, SMVG5VG1VAD1NF)
--	SMVG4VX = NOR(SMVG4VG1VAD2NF, SMVG4VG1VAD1NF)
--	SMVG3VX = NOR(SMVG3VG1VAD2NF, SMVG3VG1VAD1NF)
--	SMVG2VX = NOR(SMVG2VG1VAD2NF, SMVG2VG1VAD1NF)
--	MRVG4VD = NOR(MRVG4VDVAD2NF, MRVG4VDVAD1NF)
--	MRVG3VD = NOR(MRVG3VDVAD2NF, MRVG3VDVAD1NF)
--	MRVG2VD = NOR(MRVG2VDVAD2NF, MRVG2VDVAD1NF)
--	MRVG1VD = NOR(MRVG1VDVAD2NF, MRVG1VDVAD1NF)
--	BMVG5VX = NOR(BMVG5VG1VAD2NF, BMVG5VG1VAD1NF)
--	BMVG4VX = NOR(BMVG4VG1VAD2NF, BMVG4VG1VAD1NF)
--	BMVG3VX = NOR(BMVG3VG1VAD2NF, BMVG3VG1VAD1NF)
--	BMVG2VX = NOR(BMVG2VG1VAD2NF, BMVG2VG1VAD1NF)
--	AMVG5VX = NOR(AMVG5VG1VAD2NF, AMVG5VG1VAD1NF)
--	AMVG4VX = NOR(AMVG4VG1VAD2NF, AMVG4VG1VAD1NF)
--	AMVG3VX = NOR(AMVG3VG1VAD2NF, AMVG3VG1VAD1NF)
--	AMVG2VX = NOR(AMVG2VG1VAD2NF, AMVG2VG1VAD1NF)
--
-- VHDL Output
-- =============
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity s349 is
	port (
		A0: in std_logic;
		A1: in std_logic;
		A2: in std_logic;
		A3: in std_logic;
		B0: in std_logic;
		B1: in std_logic;
		B2: in std_logic;
		B3: in std_logic;
		CLK: in std_logic;
		START: in std_logic;
		CNTVCO2: out std_logic;
		CNTVCON2: out std_logic;
		P0: out std_logic;
		P1: out std_logic;
		P2: out std_logic;
		P3: out std_logic;
		P4: out std_logic;
		P5: out std_logic;
		P6: out std_logic;
		P7: out std_logic;
		READY: out std_logic
	);
end entity;

architecture RTL of s349 is
	attribute dont_touch: boolean;

	signal ACVG1VD1: std_logic; attribute dont_touch of ACVG1VD1: signal is true;
	signal ACVG2VD1: std_logic; attribute dont_touch of ACVG2VD1: signal is true;
	signal ACVG3VD1: std_logic; attribute dont_touch of ACVG3VD1: signal is true;
	signal ACVG4VD1: std_logic; attribute dont_touch of ACVG4VD1: signal is true;
	signal ACVPCN: std_logic; attribute dont_touch of ACVPCN: signal is true;
	signal ACVQN0: std_logic; attribute dont_touch of ACVQN0: signal is true;
	signal ACVQN1: std_logic; attribute dont_touch of ACVQN1: signal is true;
	signal ACVQN2: std_logic; attribute dont_touch of ACVQN2: signal is true;
	signal ACVQN3: std_logic; attribute dont_touch of ACVQN3: signal is true;
	signal AD0: std_logic; attribute dont_touch of AD0: signal is true;
	signal AD0N: std_logic; attribute dont_touch of AD0N: signal is true;
	signal AD1: std_logic; attribute dont_touch of AD1: signal is true;
	signal AD1N: std_logic; attribute dont_touch of AD1N: signal is true;
	signal AD2: std_logic; attribute dont_touch of AD2: signal is true;
	signal AD2N: std_logic; attribute dont_touch of AD2N: signal is true;
	signal AD3: std_logic; attribute dont_touch of AD3: signal is true;
	signal AD3N: std_logic; attribute dont_touch of AD3N: signal is true;
	signal ADDVC1: std_logic; attribute dont_touch of ADDVC1: signal is true;
	signal ADDVC2: std_logic; attribute dont_touch of ADDVC2: signal is true;
	signal ADDVC3: std_logic; attribute dont_touch of ADDVC3: signal is true;
	signal ADDVG1VCN: std_logic; attribute dont_touch of ADDVG1VCN: signal is true;
	signal ADDVG1VP: std_logic; attribute dont_touch of ADDVG1VP: signal is true;
	signal ADDVG1VPVOR1NF: std_logic; attribute dont_touch of ADDVG1VPVOR1NF: signal is true;
	signal ADDVG2VCN: std_logic; attribute dont_touch of ADDVG2VCN: signal is true;
	signal ADDVG2VCNVAD1NF: std_logic; attribute dont_touch of ADDVG2VCNVAD1NF: signal is true;
	signal ADDVG2VCNVAD2NF: std_logic; attribute dont_touch of ADDVG2VCNVAD2NF: signal is true;
	signal ADDVG2VCNVAD3NF: std_logic; attribute dont_touch of ADDVG2VCNVAD3NF: signal is true;
	signal ADDVG2VCNVAD4NF: std_logic; attribute dont_touch of ADDVG2VCNVAD4NF: signal is true;
	signal ADDVG2VCNVOR1NF: std_logic; attribute dont_touch of ADDVG2VCNVOR1NF: signal is true;
	signal ADDVG2VCNVOR2NF: std_logic; attribute dont_touch of ADDVG2VCNVOR2NF: signal is true;
	signal ADDVG2VSN: std_logic; attribute dont_touch of ADDVG2VSN: signal is true;
	signal ADDVG3VCN: std_logic; attribute dont_touch of ADDVG3VCN: signal is true;
	signal ADDVG3VCNVAD1NF: std_logic; attribute dont_touch of ADDVG3VCNVAD1NF: signal is true;
	signal ADDVG3VCNVAD2NF: std_logic; attribute dont_touch of ADDVG3VCNVAD2NF: signal is true;
	signal ADDVG3VCNVAD3NF: std_logic; attribute dont_touch of ADDVG3VCNVAD3NF: signal is true;
	signal ADDVG3VCNVAD4NF: std_logic; attribute dont_touch of ADDVG3VCNVAD4NF: signal is true;
	signal ADDVG3VCNVOR1NF: std_logic; attribute dont_touch of ADDVG3VCNVOR1NF: signal is true;
	signal ADDVG3VCNVOR2NF: std_logic; attribute dont_touch of ADDVG3VCNVOR2NF: signal is true;
	signal ADDVG3VSN: std_logic; attribute dont_touch of ADDVG3VSN: signal is true;
	signal ADDVG4VCN: std_logic; attribute dont_touch of ADDVG4VCN: signal is true;
	signal ADDVG4VCNVAD1NF: std_logic; attribute dont_touch of ADDVG4VCNVAD1NF: signal is true;
	signal ADDVG4VCNVAD2NF: std_logic; attribute dont_touch of ADDVG4VCNVAD2NF: signal is true;
	signal ADDVG4VCNVAD3NF: std_logic; attribute dont_touch of ADDVG4VCNVAD3NF: signal is true;
	signal ADDVG4VCNVAD4NF: std_logic; attribute dont_touch of ADDVG4VCNVAD4NF: signal is true;
	signal ADDVG4VCNVOR1NF: std_logic; attribute dont_touch of ADDVG4VCNVOR1NF: signal is true;
	signal ADDVG4VCNVOR2NF: std_logic; attribute dont_touch of ADDVG4VCNVOR2NF: signal is true;
	signal ADDVG4VSN: std_logic; attribute dont_touch of ADDVG4VSN: signal is true;
	signal ADSH: std_logic; attribute dont_touch of ADSH: signal is true;
	signal AM0: std_logic; attribute dont_touch of AM0: signal is true;
	signal AM1: std_logic; attribute dont_touch of AM1: signal is true;
	signal AM2: std_logic; attribute dont_touch of AM2: signal is true;
	signal AM3: std_logic; attribute dont_touch of AM3: signal is true;
	signal AMVG2VG1VAD1NF: std_logic; attribute dont_touch of AMVG2VG1VAD1NF: signal is true;
	signal AMVG2VG1VAD2NF: std_logic; attribute dont_touch of AMVG2VG1VAD2NF: signal is true;
	signal AMVG2VS0P: std_logic; attribute dont_touch of AMVG2VS0P: signal is true;
	signal AMVG2VX: std_logic; attribute dont_touch of AMVG2VX: signal is true;
	signal AMVG3VG1VAD1NF: std_logic; attribute dont_touch of AMVG3VG1VAD1NF: signal is true;
	signal AMVG3VG1VAD2NF: std_logic; attribute dont_touch of AMVG3VG1VAD2NF: signal is true;
	signal AMVG3VS0P: std_logic; attribute dont_touch of AMVG3VS0P: signal is true;
	signal AMVG3VX: std_logic; attribute dont_touch of AMVG3VX: signal is true;
	signal AMVG4VG1VAD1NF: std_logic; attribute dont_touch of AMVG4VG1VAD1NF: signal is true;
	signal AMVG4VG1VAD2NF: std_logic; attribute dont_touch of AMVG4VG1VAD2NF: signal is true;
	signal AMVG4VS0P: std_logic; attribute dont_touch of AMVG4VS0P: signal is true;
	signal AMVG4VX: std_logic; attribute dont_touch of AMVG4VX: signal is true;
	signal AMVG5VG1VAD1NF: std_logic; attribute dont_touch of AMVG5VG1VAD1NF: signal is true;
	signal AMVG5VG1VAD2NF: std_logic; attribute dont_touch of AMVG5VG1VAD2NF: signal is true;
	signal AMVG5VS0P: std_logic; attribute dont_touch of AMVG5VS0P: signal is true;
	signal AMVG5VX: std_logic; attribute dont_touch of AMVG5VX: signal is true;
	signal AMVS0N: std_logic; attribute dont_touch of AMVS0N: signal is true;
	signal AX0: std_logic; attribute dont_touch of AX0: signal is true;
	signal AX1: std_logic; attribute dont_touch of AX1: signal is true;
	signal AX2: std_logic; attribute dont_touch of AX2: signal is true;
	signal AX3: std_logic; attribute dont_touch of AX3: signal is true;
	signal BM0: std_logic; attribute dont_touch of BM0: signal is true;
	signal BM1: std_logic; attribute dont_touch of BM1: signal is true;
	signal BM2: std_logic; attribute dont_touch of BM2: signal is true;
	signal BM3: std_logic; attribute dont_touch of BM3: signal is true;
	signal BMVG2VG1VAD1NF: std_logic; attribute dont_touch of BMVG2VG1VAD1NF: signal is true;
	signal BMVG2VG1VAD2NF: std_logic; attribute dont_touch of BMVG2VG1VAD2NF: signal is true;
	signal BMVG2VS0P: std_logic; attribute dont_touch of BMVG2VS0P: signal is true;
	signal BMVG2VX: std_logic; attribute dont_touch of BMVG2VX: signal is true;
	signal BMVG3VG1VAD1NF: std_logic; attribute dont_touch of BMVG3VG1VAD1NF: signal is true;
	signal BMVG3VG1VAD2NF: std_logic; attribute dont_touch of BMVG3VG1VAD2NF: signal is true;
	signal BMVG3VS0P: std_logic; attribute dont_touch of BMVG3VS0P: signal is true;
	signal BMVG3VX: std_logic; attribute dont_touch of BMVG3VX: signal is true;
	signal BMVG4VG1VAD1NF: std_logic; attribute dont_touch of BMVG4VG1VAD1NF: signal is true;
	signal BMVG4VG1VAD2NF: std_logic; attribute dont_touch of BMVG4VG1VAD2NF: signal is true;
	signal BMVG4VS0P: std_logic; attribute dont_touch of BMVG4VS0P: signal is true;
	signal BMVG4VX: std_logic; attribute dont_touch of BMVG4VX: signal is true;
	signal BMVG5VG1VAD1NF: std_logic; attribute dont_touch of BMVG5VG1VAD1NF: signal is true;
	signal BMVG5VG1VAD2NF: std_logic; attribute dont_touch of BMVG5VG1VAD2NF: signal is true;
	signal BMVG5VS0P: std_logic; attribute dont_touch of BMVG5VS0P: signal is true;
	signal BMVG5VX: std_logic; attribute dont_touch of BMVG5VX: signal is true;
	signal BMVS0N: std_logic; attribute dont_touch of BMVS0N: signal is true;
	signal CNTVCO0: std_logic; attribute dont_touch of CNTVCO0: signal is true;
	signal CNTVCO1: std_logic; attribute dont_touch of CNTVCO1: signal is true;
	signal CNTVCON0: std_logic; attribute dont_touch of CNTVCON0: signal is true;
	signal CNTVCON1: std_logic; attribute dont_touch of CNTVCON1: signal is true;
	signal CNTVG1VD: std_logic; attribute dont_touch of CNTVG1VD: signal is true;
	signal CNTVG1VD1: std_logic; attribute dont_touch of CNTVG1VD1: signal is true;
	signal CNTVG1VG2VOR1NF: std_logic; attribute dont_touch of CNTVG1VG2VOR1NF: signal is true;
	signal CNTVG1VQN: std_logic; attribute dont_touch of CNTVG1VQN: signal is true;
	signal CNTVG1VZ: std_logic; attribute dont_touch of CNTVG1VZ: signal is true;
	signal CNTVG1VZ1: std_logic; attribute dont_touch of CNTVG1VZ1: signal is true;
	signal CNTVG2VD: std_logic; attribute dont_touch of CNTVG2VD: signal is true;
	signal CNTVG2VD1: std_logic; attribute dont_touch of CNTVG2VD1: signal is true;
	signal CNTVG2VG2VOR1NF: std_logic; attribute dont_touch of CNTVG2VG2VOR1NF: signal is true;
	signal CNTVG2VQN: std_logic; attribute dont_touch of CNTVG2VQN: signal is true;
	signal CNTVG2VZ: std_logic; attribute dont_touch of CNTVG2VZ: signal is true;
	signal CNTVG2VZ1: std_logic; attribute dont_touch of CNTVG2VZ1: signal is true;
	signal CNTVG3VD: std_logic; attribute dont_touch of CNTVG3VD: signal is true;
	signal CNTVG3VD1: std_logic; attribute dont_touch of CNTVG3VD1: signal is true;
	signal CNTVG3VG2VOR1NF: std_logic; attribute dont_touch of CNTVG3VG2VOR1NF: signal is true;
	signal CNTVG3VQN: std_logic; attribute dont_touch of CNTVG3VQN: signal is true;
	signal CNTVG3VZ: std_logic; attribute dont_touch of CNTVG3VZ: signal is true;
	signal CNTVG3VZ1: std_logic; attribute dont_touch of CNTVG3VZ1: signal is true;
	signal CO: std_logic; attribute dont_touch of CO: signal is true;
	signal CT0: std_logic; attribute dont_touch of CT0: signal is true;
	signal CT1: std_logic; attribute dont_touch of CT1: signal is true;
	signal CT1N: std_logic; attribute dont_touch of CT1N: signal is true;
	signal CT2: std_logic; attribute dont_touch of CT2: signal is true;
	signal INIT: std_logic; attribute dont_touch of INIT: signal is true;
	signal MRVG1VD: std_logic; attribute dont_touch of MRVG1VD: signal is true;
	signal MRVG1VDVAD1NF: std_logic; attribute dont_touch of MRVG1VDVAD1NF: signal is true;
	signal MRVG1VDVAD2NF: std_logic; attribute dont_touch of MRVG1VDVAD2NF: signal is true;
	signal MRVG2VD: std_logic; attribute dont_touch of MRVG2VD: signal is true;
	signal MRVG2VDVAD1NF: std_logic; attribute dont_touch of MRVG2VDVAD1NF: signal is true;
	signal MRVG2VDVAD2NF: std_logic; attribute dont_touch of MRVG2VDVAD2NF: signal is true;
	signal MRVG3VD: std_logic; attribute dont_touch of MRVG3VD: signal is true;
	signal MRVG3VDVAD1NF: std_logic; attribute dont_touch of MRVG3VDVAD1NF: signal is true;
	signal MRVG3VDVAD2NF: std_logic; attribute dont_touch of MRVG3VDVAD2NF: signal is true;
	signal MRVG4VD: std_logic; attribute dont_touch of MRVG4VD: signal is true;
	signal MRVG4VDVAD1NF: std_logic; attribute dont_touch of MRVG4VDVAD1NF: signal is true;
	signal MRVG4VDVAD2NF: std_logic; attribute dont_touch of MRVG4VDVAD2NF: signal is true;
	signal MRVQN0: std_logic; attribute dont_touch of MRVQN0: signal is true;
	signal MRVQN1: std_logic; attribute dont_touch of MRVQN1: signal is true;
	signal MRVQN2: std_logic; attribute dont_touch of MRVQN2: signal is true;
	signal MRVQN3: std_logic; attribute dont_touch of MRVQN3: signal is true;
	signal MRVSHLDN: std_logic; attribute dont_touch of MRVSHLDN: signal is true;
	signal READYN: std_logic; attribute dont_touch of READYN: signal is true;
	signal S0: std_logic; attribute dont_touch of S0: signal is true;
	signal S1: std_logic; attribute dont_touch of S1: signal is true;
	signal S2: std_logic; attribute dont_touch of S2: signal is true;
	signal S3: std_logic; attribute dont_touch of S3: signal is true;
	signal SM0: std_logic; attribute dont_touch of SM0: signal is true;
	signal SM1: std_logic; attribute dont_touch of SM1: signal is true;
	signal SM2: std_logic; attribute dont_touch of SM2: signal is true;
	signal SM3: std_logic; attribute dont_touch of SM3: signal is true;
	signal SMVG2VG1VAD1NF: std_logic; attribute dont_touch of SMVG2VG1VAD1NF: signal is true;
	signal SMVG2VG1VAD2NF: std_logic; attribute dont_touch of SMVG2VG1VAD2NF: signal is true;
	signal SMVG2VS0P: std_logic; attribute dont_touch of SMVG2VS0P: signal is true;
	signal SMVG2VX: std_logic; attribute dont_touch of SMVG2VX: signal is true;
	signal SMVG3VG1VAD1NF: std_logic; attribute dont_touch of SMVG3VG1VAD1NF: signal is true;
	signal SMVG3VG1VAD2NF: std_logic; attribute dont_touch of SMVG3VG1VAD2NF: signal is true;
	signal SMVG3VS0P: std_logic; attribute dont_touch of SMVG3VS0P: signal is true;
	signal SMVG3VX: std_logic; attribute dont_touch of SMVG3VX: signal is true;
	signal SMVG4VG1VAD1NF: std_logic; attribute dont_touch of SMVG4VG1VAD1NF: signal is true;
	signal SMVG4VG1VAD2NF: std_logic; attribute dont_touch of SMVG4VG1VAD2NF: signal is true;
	signal SMVG4VS0P: std_logic; attribute dont_touch of SMVG4VS0P: signal is true;
	signal SMVG4VX: std_logic; attribute dont_touch of SMVG4VX: signal is true;
	signal SMVG5VG1VAD1NF: std_logic; attribute dont_touch of SMVG5VG1VAD1NF: signal is true;
	signal SMVG5VG1VAD2NF: std_logic; attribute dont_touch of SMVG5VG1VAD2NF: signal is true;
	signal SMVG5VS0P: std_logic; attribute dont_touch of SMVG5VS0P: signal is true;
	signal SMVG5VX: std_logic; attribute dont_touch of SMVG5VX: signal is true;
	signal SMVS0N: std_logic; attribute dont_touch of SMVS0N: signal is true;
begin
	process(CLK)
	begin
		if(rising_edge(CLK)) then
			ACVQN0<=ACVG1VD1;
			ACVQN1<=ACVG2VD1;
			ACVQN2<=ACVG3VD1;
			ACVQN3<=ACVG4VD1;
			AX0<=AM0;
			AX1<=AM1;
			AX2<=AM2;
			AX3<=AM3;
			CT0<=CNTVG1VD;
			CT1<=CNTVG2VD;
			CT2<=CNTVG3VD;
			MRVQN0<=MRVG1VD;
			MRVQN1<=MRVG2VD;
			MRVQN2<=MRVG3VD;
			MRVQN3<=MRVG4VD;
		end if;
	end process;
	ACVPCN<= not START;
	AD0<= not AD0N;
	AD1<= not AD1N;
	AD2<= not AD2N;
	AD3<= not AD3N;
	ADDVC1<= not ADDVG1VCN;
	ADDVC2<= not ADDVG2VCN;
	ADDVC3<= not ADDVG3VCN;
	AM0<= not AMVG2VX;
	AM1<= not AMVG3VX;
	AM2<= not AMVG4VX;
	AM3<= not AMVG5VX;
	AMVG2VS0P<= not AMVS0N;
	AMVG3VS0P<= not AMVS0N;
	AMVG4VS0P<= not AMVS0N;
	AMVG5VS0P<= not AMVS0N;
	AMVS0N<= not INIT;
	BM0<= not BMVG2VX;
	BM1<= not BMVG3VX;
	BM2<= not BMVG4VX;
	BM3<= not BMVG5VX;
	BMVG2VS0P<= not BMVS0N;
	BMVG3VS0P<= not BMVS0N;
	BMVG4VS0P<= not BMVS0N;
	BMVG5VS0P<= not BMVS0N;
	BMVS0N<= not READYN;
	CNTVCO0<= not CNTVG1VQN;
	CNTVCON0<= not CT0;
	CNTVG1VD1<= not READY;
	CNTVG1VQN<= not CT0;
	CNTVG2VQN<= not CT1;
	CNTVG3VQN<= not CT2;
	CO<= not ADDVG4VCN;
	CT1N<= not CT1;
	MRVSHLDN<= not ADSH;
	P0<= not MRVQN0;
	P1<= not MRVQN1;
	P2<= not MRVQN2;
	P3<= not MRVQN3;
	P4<= not ACVQN0;
	P5<= not ACVQN1;
	P6<= not ACVQN2;
	P7<= not ACVQN3;
	READY<= not READYN;
	S0<= not ADDVG1VP;
	S1<= not ADDVG2VSN;
	S2<= not ADDVG3VSN;
	S3<= not ADDVG4VSN;
	SM0<= not SMVG2VX;
	SM1<= not SMVG3VX;
	SM2<= not SMVG4VX;
	SM3<= not SMVG5VX;
	SMVG2VS0P<= not SMVS0N;
	SMVG3VS0P<= not SMVS0N;
	SMVG4VS0P<= not SMVS0N;
	SMVG5VS0P<= not SMVS0N;
	SMVS0N<= not ADSH;
	ADDVG2VCNVAD1NF<=AD1 and P5;
	ADDVG2VCNVAD2NF<=ADDVC1 and ADDVG2VCNVOR1NF;
	ADDVG2VCNVAD3NF<=ADDVG2VCNVOR2NF and ADDVG2VCN;
	ADDVG2VCNVAD4NF<=ADDVC1 and AD1 and P5;
	ADDVG3VCNVAD1NF<=AD2 and P6;
	ADDVG3VCNVAD2NF<=ADDVC2 and ADDVG3VCNVOR1NF;
	ADDVG3VCNVAD3NF<=ADDVG3VCNVOR2NF and ADDVG3VCN;
	ADDVG3VCNVAD4NF<=ADDVC2 and AD2 and P6;
	ADDVG4VCNVAD1NF<=AD3 and P7;
	ADDVG4VCNVAD2NF<=ADDVC3 and ADDVG4VCNVOR1NF;
	ADDVG4VCNVAD3NF<=ADDVG4VCNVOR2NF and ADDVG4VCN;
	ADDVG4VCNVAD4NF<=ADDVC3 and AD3 and P7;
	AMVG2VG1VAD1NF<=AMVS0N and AX0;
	AMVG2VG1VAD2NF<=AMVG2VS0P and A0;
	AMVG3VG1VAD1NF<=AMVS0N and AX1;
	AMVG3VG1VAD2NF<=AMVG3VS0P and A1;
	AMVG4VG1VAD1NF<=AMVS0N and AX2;
	AMVG4VG1VAD2NF<=AMVG4VS0P and A2;
	AMVG5VG1VAD1NF<=AMVS0N and AX3;
	AMVG5VG1VAD2NF<=AMVG5VS0P and A3;
	BMVG2VG1VAD1NF<=BMVS0N and P0;
	BMVG2VG1VAD2NF<=BMVG2VS0P and B0;
	BMVG3VG1VAD1NF<=BMVS0N and P1;
	BMVG3VG1VAD2NF<=BMVG3VS0P and B1;
	BMVG4VG1VAD1NF<=BMVS0N and P2;
	BMVG4VG1VAD2NF<=BMVG4VS0P and B2;
	BMVG5VG1VAD1NF<=BMVS0N and P3;
	BMVG5VG1VAD2NF<=BMVG5VS0P and B3;
	MRVG1VDVAD1NF<=ADSH and P1;
	MRVG1VDVAD2NF<=MRVSHLDN and BM0;
	MRVG2VDVAD1NF<=ADSH and P2;
	MRVG2VDVAD2NF<=MRVSHLDN and BM1;
	MRVG3VDVAD1NF<=ADSH and P3;
	MRVG3VDVAD2NF<=MRVSHLDN and BM2;
	MRVG4VDVAD1NF<=ADSH and S0;
	MRVG4VDVAD2NF<=MRVSHLDN and BM3;
	SMVG2VG1VAD1NF<=SMVS0N and P4;
	SMVG2VG1VAD2NF<=SMVG2VS0P and S1;
	SMVG3VG1VAD1NF<=SMVS0N and P5;
	SMVG3VG1VAD2NF<=SMVG3VS0P and S2;
	SMVG4VG1VAD1NF<=SMVS0N and P6;
	SMVG4VG1VAD2NF<=SMVG4VS0P and S3;
	SMVG5VG1VAD1NF<=SMVS0N and P7;
	SMVG5VG1VAD2NF<=SMVG5VS0P and CO;
	ACVG1VD1<= not (ACVPCN and SM0);
	ACVG2VD1<= not (ACVPCN and SM1);
	ACVG3VD1<= not (ACVPCN and SM2);
	ACVG4VD1<= not (ACVPCN and SM3);
	AD0N<= not (P0 and AX0);
	AD1N<= not (P0 and AX1);
	AD2N<= not (P0 and AX2);
	AD3N<= not (P0 and AX3);
	ADDVG1VCN<= not (AD0 and P4);
	ADDVG1VP<= not (ADDVG1VPVOR1NF and ADDVG1VCN);
	CNTVCON1<= not (CT1 and CNTVCO0);
	CNTVCON2<= not (CT2 and CNTVCO1);
	CNTVG1VZ1<= not (CT0 and CNTVG1VD1);
	CNTVG1VZ<= not (CNTVG1VG2VOR1NF and CNTVG1VZ1);
	CNTVG2VZ1<= not (CT1 and CNTVG2VD1);
	CNTVG2VZ<= not (CNTVG2VG2VOR1NF and CNTVG2VZ1);
	CNTVG3VZ1<= not (CT2 and CNTVG3VD1);
	CNTVG3VZ<= not (CNTVG3VG2VOR1NF and CNTVG3VZ1);
	READYN<= not (CT0 and CT1N and CT2);
	ADDVG1VPVOR1NF<=AD0 or P4;
	ADDVG2VCNVOR1NF<=AD1 or P5;
	ADDVG2VCNVOR2NF<=ADDVC1 or AD1 or P5;
	ADDVG3VCNVOR1NF<=AD2 or P6;
	ADDVG3VCNVOR2NF<=ADDVC2 or AD2 or P6;
	ADDVG4VCNVOR1NF<=AD3 or P7;
	ADDVG4VCNVOR2NF<=ADDVC3 or AD3 or P7;
	CNTVG1VG2VOR1NF<=CT0 or CNTVG1VD1;
	CNTVG2VG2VOR1NF<=CT1 or CNTVG2VD1;
	CNTVG3VG2VOR1NF<=CT2 or CNTVG3VD1;
	ADDVG2VCN<= not (ADDVG2VCNVAD2NF or ADDVG2VCNVAD1NF);
	ADDVG2VSN<= not (ADDVG2VCNVAD4NF or ADDVG2VCNVAD3NF);
	ADDVG3VCN<= not (ADDVG3VCNVAD2NF or ADDVG3VCNVAD1NF);
	ADDVG3VSN<= not (ADDVG3VCNVAD4NF or ADDVG3VCNVAD3NF);
	ADDVG4VCN<= not (ADDVG4VCNVAD2NF or ADDVG4VCNVAD1NF);
	ADDVG4VSN<= not (ADDVG4VCNVAD4NF or ADDVG4VCNVAD3NF);
	ADSH<= not (READY or INIT);
	AMVG2VX<= not (AMVG2VG1VAD2NF or AMVG2VG1VAD1NF);
	AMVG3VX<= not (AMVG3VG1VAD2NF or AMVG3VG1VAD1NF);
	AMVG4VX<= not (AMVG4VG1VAD2NF or AMVG4VG1VAD1NF);
	AMVG5VX<= not (AMVG5VG1VAD2NF or AMVG5VG1VAD1NF);
	BMVG2VX<= not (BMVG2VG1VAD2NF or BMVG2VG1VAD1NF);
	BMVG3VX<= not (BMVG3VG1VAD2NF or BMVG3VG1VAD1NF);
	BMVG4VX<= not (BMVG4VG1VAD2NF or BMVG4VG1VAD1NF);
	BMVG5VX<= not (BMVG5VG1VAD2NF or BMVG5VG1VAD1NF);
	CNTVCO1<= not (CNTVG2VQN or CNTVCON0);
	CNTVCO2<= not (CNTVG3VQN or CNTVCON1);
	CNTVG1VD<= not (CNTVG1VZ or START);
	CNTVG2VD1<= not (READY or CNTVCON0);
	CNTVG2VD<= not (CNTVG2VZ or START);
	CNTVG3VD1<= not (READY or CNTVCON1);
	CNTVG3VD<= not (CNTVG3VZ or START);
	INIT<= not (CT0 or CT1 or CT2);
	MRVG1VD<= not (MRVG1VDVAD2NF or MRVG1VDVAD1NF);
	MRVG2VD<= not (MRVG2VDVAD2NF or MRVG2VDVAD1NF);
	MRVG3VD<= not (MRVG3VDVAD2NF or MRVG3VDVAD1NF);
	MRVG4VD<= not (MRVG4VDVAD2NF or MRVG4VDVAD1NF);
	SMVG2VX<= not (SMVG2VG1VAD2NF or SMVG2VG1VAD1NF);
	SMVG3VX<= not (SMVG3VG1VAD2NF or SMVG3VG1VAD1NF);
	SMVG4VX<= not (SMVG4VG1VAD2NF or SMVG4VG1VAD1NF);
	SMVG5VX<= not (SMVG5VG1VAD2NF or SMVG5VG1VAD1NF);
end RTL;
