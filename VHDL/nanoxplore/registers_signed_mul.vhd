
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
    
    attribute syn_preserve: boolean;
    attribute syn_noprune: boolean;

    signal a: std_logic_vector(N-1 downto 0);
    signal b: std_logic_vector(N-1 downto 0);
    signal o, o_s: std_logic_vector(2*N-1 downto 0);

    attribute syn_preserve of a: signal is true;
    attribute syn_preserve of b: signal is true;
    attribute syn_preserve of o: signal is true;
    attribute syn_noprune of a: signal is true;
    attribute syn_noprune of b: signal is true;
    attribute syn_noprune of o: signal is true;
    
begin

    process (CLK)
    begin
        if rising_edge(CLK) then
            o <= o_s;
            a <= a(N-2 downto 0) & a(N-1);
            b <= b(N-2 downto 0) & b(N-1);
        end if;
    end process;
    
    process(a, b)
    begin
        o_s <= std_logic_vector(signed(a) * signed(b));
    end process;
    
end Behavioral;
