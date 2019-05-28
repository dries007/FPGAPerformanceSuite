
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity top is
    generic (
        N: natural := 128
    );
    port (
        CLK: in std_logic
    );
end top;

architecture Behavioral of top is
    
    attribute dont_touch: boolean;

    signal a: std_logic_vector(N-1 downto 0);
    signal b: std_logic_vector(integer(ceil(log2(real(N))))-1 downto 0);
    signal o, o_s: std_logic_vector(N-1 downto 0);

    attribute dont_touch of a: signal is true;
    attribute dont_touch of b: signal is true;
    attribute dont_touch of o: signal is true;
    
begin

    process (CLK)
    begin
        if rising_edge(CLK) then
            o <= o_s;
            a <= a;
            b <= b;
        end if;
    end process;
    
    process(a, b)
    begin
        o_s <= std_logic_vector(ROTATE_RIGHT(signed(a), TO_INTEGER(signed(b))));
    end process;
    
end Behavioral;
