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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity top is
    generic (
        -- <<A circuit parameters>>
        -- <<B circuit parameters>>
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
    constant A_IN : integer := 5; -- Number of inputs for A
    constant A_OUT : integer := 4; -- Number of outputs for A
    -- Must be updated with changes to B circuit.
    constant B_IN : integer := 18; -- Number of inputs for B
    constant B_OUT : integer := 19; -- Number of outputs for B
    -- << component definition for A >>
    -- << component definition for B >>
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
                    -- << A instantiation >>
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
                    -- << B instantiation >>
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
