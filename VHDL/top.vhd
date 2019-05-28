-- Copyright (c) Dries Kennes 2019. Released under terms of the MIT license.
-- Project: FPGA Benchmarking MSc thesis at KULeuven & Antwerp Space.
-- Use case: Combine 2 designs to be tested into 1 data path.
--
-- It cannot be made 100% generic, but I did my best to make it easy to adapt.
--------------------------------------------------------------------------------
-- This file creates a chain architecture to make sure the data path of the A
-- and B circuits cannot be easily split by the synthesis toolchain. Multiple
-- instances of the A and B circuits can be placed in parallel to reduce
-- overhead. Normally the bus width is a whole multiple of the maximum number of
-- required pins (I or O on circuit A or B). The design will create a given
-- number of A or B instances. This does not have to nicely line up with the
-- number of A or B circuits per segment. To make sure no parts of the design
-- can be easily segregated, a rotate is done after every segment. At the end of
-- the chain the bits are also inverted.
--
-- The chain logic handles bypasses for the part of the bus that doesn't enter
-- the segment in any way. (In the example: signals 6,7 in A.)
-- The segment logic must make sure there are an equal number of in and outputs.
-- This is done by adding bypass signals. (In the example: signals 3,4,5 in A.)
--------------------------------------------------------------------------------
--           A SEGMENT        | CHAIN |          B SECTION           | CHAIN END
--
--           A---------A                          B---------B
--         /-I         O-\                   /----I         O-\
--        //-I         O-\\                 //----I    B    |  \
--       ///-I    A    O-\\\       /-\     ///----I CIRCUIT |   \         /-\
--      ////-I CIRCUIT |  \\\      v |    ////----I         |    \        v |
--     /////-I         |   \\\       |   ////     B---------B     \         |
-- 0>-//////-I         |    \\\-[FF]-//-////                       \--![FF]-//->
-- 1>-// ||| A---------A     \\-[FF]-//-+||---------------------------![FF]-//->
-- 2>-/  |||                  \-[FF]-//--+|---------------------------![FF]-//->
-- 3>----+||--------------------[FF]-//---+---------------------------![FF]-//->
-- 4>-----+|--------------------[FF]-//----\                    /-----![FF]-//->
-- 5>------+--------------------[FF]-//---\ \     B---------B  /    /-![FF]-//->
-- 6>---------------------------[FF]-//---\\ \----I         O-/    //-![FF]-//->
-- 7>---------------------------[FF]-//---\\\---+-I    B    |     ///-![FF]-//->
--                                    |    \\--+--I CIRCUIT |    ///         |
--  This example diagram has:      v  |     \-+---I         |   ///       v  |
--  - A: 6 input to 3 output       \--/       ||| B---------B  ///        \--/
--  - B: 4 input to 1 output                  |||             ///
--  - 1x A and 2x B.                          \\\------------///
--    This isn't realistic.                    \\------------//
--                                              \------------/
--
--------------------------------------------------------------------------------
-- Global parameters:
--  N_A: Number of A designs to generate.
--  N_B: Number of B designs to generate.
--  MIN_BUS_WIDTH: Minimal bus width. Recommended to be set at on 1 (automatic)
--             max(#I or #O on circuit A or B) or a multiple of that number.
--
-- There are only 3 user editable sections:
--  1. Configurable values
--  2. A circuit instantiation
--  3. B circuit instantiation
--------------------------------------------------------------------------------
-- This version of the top file has the following designs A - B circuits:
--  A: FIR filter (Parameters: TAPS, DATA_BW, COEF_BW)
--  B: ISCAS'89 design s27 (No parameters)
-- 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;


entity top is
    generic (
        -- A circuit parameters
        TAPS: integer := 33;
        DATA_BW: integer := 16;
        COEF_BW: integer := 16;
        -- B circuit parameters
        -- Global parameters
        N_A: integer := 2;
        N_B: integer := 4;
        MIN_BUS_WIDTH: integer := 1
    );
    port (
        CLK: in std_logic;
        RST: in std_logic
    );
end top;

architecture Behavioral of top is
    ----------------------------------------------------------------------------
    -- User editable section: Configurable values
    ----------------------------------------------------------------------------
    -- Must be updated with changes to A circuit.
    constant A_IN : integer := DATA_BW; -- Number of inputs for A
    constant A_OUT : integer := DATA_BW; -- Number of outputs for A
    -- Must be updated with changes to B circuit.
    constant B_IN : integer := 18; -- Number of inputs for B
    constant B_OUT : integer := 19; -- Number of outputs for B
    -- A
    component fir is
        generic (
            TAPS: positive := 7;
            DATA_BW: positive := 8;
            COEF_BW: positive := 8
        );
        port (
            CLK: in std_logic;
            RST: in std_logic;
            D_IN: in std_logic_vector(DATA_BW-1 downto 0);
            D_OUT: out std_logic_vector(DATA_BW-1 downto 0)
        );
    end component;
    -- B
    component s832 is
        port (
            --  # 18 inputs
            --  # 19 outputs
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
    end component;
    ----------------------------------------------------------------------------
    -- End of user editable section.
    ----------------------------------------------------------------------------
    function max(a, b: integer) return integer is
    begin
        if a > b then return a;
        else return b;
        end if;
    end;
    function min(a, b: integer) return integer is
    begin
        if a < b then return a;
        else return b;
        end if;
    end;
    constant A_IO : integer := max(A_IN, A_OUT); -- Max IO Per A segment
    constant B_IO : integer := max(B_IN, B_OUT); -- Max IO Per B segment
    -- Bus width
    constant BW : integer := max(MIN_BUS_WIDTH, max(A_IO, B_IO));
    -- Maximum circuits per segment
    constant A_PER_SEG : integer := BW / A_IO;
    constant B_PER_SEG : integer := BW / B_IO;
    -- Number of segments needed = ceil(N/PER_SEG)
    constant A_SEGMENTS : integer := integer(ceil(real(N_A)/real(A_PER_SEG)));
    constant B_SEGMENTS : integer := integer(ceil(real(N_B)/real(B_PER_SEG)));
    constant BUS_SEGMENTS : integer := A_SEGMENTS + B_SEGMENTS;
    -- 2D std_logic, for segment IO
    type vector_array IS array(integer range<>) of std_logic_vector;
    -- Every segment has an in and output. In = input to a segment.
    -- They are linked by a register and a shift. The loop-around is special.
    signal data_in: vector_array(BUS_SEGMENTS-1 downto 0)(BW-1 downto 0);
    signal data_out: vector_array(BUS_SEGMENTS-1 downto 0)(BW-1 downto 0);
    -- Important! Cannot be optimized away.
    attribute dont_touch: boolean;
    attribute dont_touch of data_in: signal is true;
    attribute dont_touch of data_out: signal is true;    
begin
    -- Generate segments.
    ----------------------------------------------------------------------------
    a_segment_generator: for i in 0 to A_SEGMENTS-1 generate
        constant used_io : integer := A_PER_SEG * A_IO;
        signal sin : std_logic_vector(BW-1 downto 0) := data_in(i);
        signal sout : std_logic_vector(BW-1 downto 0);
    begin
        -- 1 segment = x_PER_SEG times circuit + bypass wires
        a_circuit_generator: for j in 0 to A_PER_SEG-1 generate
            constant n : integer := i * A_PER_SEG + j;
            constant s : integer := A_IO * j;
            -- Circuit in & out. (so indexing math becomes less complex)
            signal cin : std_logic_vector(A_IO-1 downto 0) := sin(s+A_IO-1 downto s);
            signal cout : std_logic_vector(A_IO-1 downto 0);
        begin
            -- Generate circuit.
            a_circuit: if n < N_A generate
                    -- Reduce circuit IO bit width to final dimentions. Use this
                    signal inp : std_logic_vector := cin(A_IN-1 downto 0);
                    signal outp : std_logic_vector(A_OUT-1 downto 0);
                begin
                    ------------------------------------------------------------
                    -- User editable section: A circuit instantiation
                    ------------------------------------------------------------
                    A_circuit_impl: fir generic map (
                        TAPS => TAPS,
                        DATA_BW => DATA_BW,
                        COEF_BW => COEF_BW
                    ) port map (
                        CLK => CLK,
                        RST => RST,
                        D_IN => inp,
                        D_OUT => outp
                    );
                    --outp <= not inp;
                    ------------------------------------------------------------
                    -- End of user editable section.
                    ------------------------------------------------------------
                    cout(A_OUT-1 downto 0) <= outp;
                -- Bypass some signals if there are more inputs than outputs
                a_circuit_bypass: if A_IN > A_OUT generate
                    cout(A_IO-1 downto A_OUT) <= cin(A_IO-1 downto A_OUT);
                end generate;
            end generate;
            -- Reached target circuit count, bypass all.
            a_circuit_done: if n >= N_A generate
                cout <= cin;
            end generate;
        sout(s + A_IO - 1 downto s) <= cout;
        end generate;
        -- Bypass any wires not taken by any circuit
        a_segment_bypass: if used_io < BW generate
            sout(BW-1 downto used_io) <= sin(BW-1 downto used_io);
        end generate;
        data_out(i) <= sout;
    end generate;
    ----------------------------------------------------------------------------
    b_segment_generator: for i in 0 to B_SEGMENTS-1 generate
        constant used_io : integer := B_PER_SEG * B_IO;
        signal sin : std_logic_vector(BW-1 downto 0) := data_in(i+A_SEGMENTS);
        signal sout : std_logic_vector(BW-1 downto 0);
    begin
        -- 1 segment = x_PER_SEG times circuit + bypass wires
        b_circuit_generator: for j in 0 to B_PER_SEG-1 generate
            constant n : integer := i * B_PER_SEG + j;
            constant s : integer := B_IO * j;
            -- Circuit in & out. (so indexing math becomes less complex)
            signal cin : std_logic_vector(B_IO-1 downto 0) := sin(s + B_IO - 1 downto s);
            signal cout : std_logic_vector(B_IO-1 downto 0);
        begin      
            -- Generate circuit.
            b_circuit: if n < N_B generate
                    -- Reduce circuit IO bit width to final dimentions. Use this
                    signal inp : std_logic_vector := cin(B_IN-1 downto 0);
                    signal outp : std_logic_vector(B_OUT-1 downto 0);
                begin
                    ------------------------------------------------------------
                    -- User editable section: B Circuit instantiation
                    ------------------------------------------------------------
                    B_circuit_impl: s832 port map (
                        CLK => CLK,
                        G0 => inp(0),
                        G1 => inp(1),
                        G2 => inp(2),
                        G3 => inp(3),
                        G4 => inp(4),
                        G5 => inp(5),
                        G6 => inp(6),
                        G7 => inp(7),
                        G8 => inp(8),
                        G9 => inp(9),
                        G10 => inp(10),
                        G11 => inp(11),
                        G12 => inp(12),
                        G13 => inp(13),
                        G14 => inp(14),
                        G15 => inp(15),
                        G16 => inp(16),
                        G18 => inp(17),

                        G43 => outp(0),
                        G45 => outp(1),
                        G47 => outp(2),
                        G49 => outp(3),
                        G53 => outp(4),
                        G55 => outp(5),
                        G288 => outp(6),
                        G290 => outp(7),
                        G292 => outp(8),
                        G296 => outp(9),
                        G298 => outp(10),
                        G300 => outp(11),
                        G302 => outp(12),
                        G310 => outp(13),
                        G312 => outp(14),
                        G315 => outp(15),
                        G322 => outp(16),
                        G325 => outp(17),
                        G327 => outp(18)
                    );
                    --outp(0) <= (inp(0) and inp(1)) xor (inp(2) and inp(3));
                    ------------------------------------------------------------
                    -- End of user editable section.
                    ------------------------------------------------------------
                    cout(B_OUT-1 downto 0) <= outp;
                -- Bypass some signals if there are more inputs than outputs
                b_circuit_bypass: if B_IO > B_OUT generate
                    cout(B_IO-1 downto B_OUT) <= cin(B_IO-1 downto B_OUT);
                end generate;
            end generate;
            -- Reached target circuit count, bypass all.
            b_circuit_done: if n >= N_B generate
                cout <= cin;
            end generate;
            sout(s + B_IO - 1 downto s) <= cout;
        end generate;
        -- Bypass any wires not taken by any circuit
        b_segment_bypass: if used_io < BW generate
            sout(BW-1 downto used_io) <= sin(BW-1 downto used_io);
        end generate;
        data_out(i+A_SEGMENTS) <= sout;
    end generate;
    ----------------------------------------------------------------------------
    -- Chain link bits. The final/first link is special.
    -- WARNING: Here data_out is the input and vice versa!
    link_generator: for i in 0 to BUS_SEGMENTS-2 generate
    begin
        process(RST, CLK)
        begin
            if RST = '1' then
                data_in(i+1) <= (others => '0');
            elsif rising_edge(CLK) then
                data_in(i+1) <= data_out(i) rol 1;
            end if;
        end process;
    end generate;
    -- Last link: Invert & rotate.
    process(RST, CLK)
    begin
        if RST = '1' then
            data_in(0) <= (others => '0');
        elsif rising_edge(CLK) then
            data_in(0) <= not data_out(BUS_SEGMENTS-1) rol 1;
        end if;
    end process;
end architecture Behavioral;
