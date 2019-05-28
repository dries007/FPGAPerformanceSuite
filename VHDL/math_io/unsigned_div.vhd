-- Plain NxN bit unsigned divider
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top is
    generic (
        N : natural := 128
    );
    port (
        CLK    : in  std_logic;
        RST    : in  std_logic;
        IO_A   : in  std_logic_vector(N-1 downto 0);
        IO_B   : in  std_logic_vector(N-1 downto 0);
        IO_O   : out std_logic_vector(N-1 downto 0)
    );
end top;

architecture Behavioral of top is
    
    signal a: std_logic_vector(N-1 downto 0);
    signal b: std_logic_vector(N-1 downto 0);
    signal o_next : std_logic_vector(N-1 downto 0);
    
begin

    process (CLK)
    begin
        if rising_edge(CLK) then
            if RST = '1' then
                a <= (others => '0');
                b <= (others => '0');
                IO_O <= (others => '0');
            else
                a <= IO_A;
                b <= IO_B;
                IO_O <= o_next;
            end if;
        end if;
    end process;

    process(a, b)
    begin
        o_next <= std_logic_vector(unsigned(a) / unsigned(b));
    end process;

end Behavioral;
