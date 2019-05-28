-- From the Xilinx Language Template library. INIT_FILE removed, top added.

-- Generics:
-- RAM_WIDTH: natural := 18;
-- RAM_DEPTH: natural := 1024;
-- RAM_PERFORMANCE: string := "HIGH_PERFORMANCE"
--                             OR: "LOW_LATENCY" 

--  Xilinx Simple Dual Port Single Clock RAM
--  This code implements a parameterizable SDP single clock memory.
--  If a reset or enable is not necessary, it may be tied off or removed from the code.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

package ram_pkg is
    function clogb2 (depth: in natural) return integer;
end ram_pkg;

package body ram_pkg is

function clogb2( depth : natural) return integer is
variable temp    : integer := depth;
variable ret_val : integer := 0;
begin
    while temp > 1 loop
        ret_val := ret_val + 1;
        temp    := temp / 2;
    end loop;
return ret_val;
end function;

end package body ram_pkg;

library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ram_pkg.all;
USE std.textio.all;

entity xilinx_simple_dual_port_1_clock_ram is
generic (
    RAM_WIDTH : integer := 64;                      -- Specify RAM data width
    RAM_DEPTH : integer := 512;                    -- Specify RAM depth (number of entries)
    RAM_PERFORMANCE : string := "LOW_LATENCY"      -- Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
    );

port (
        addra : in std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0);     -- Write address bus, width determined from RAM_DEPTH
        addrb : in std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0);     -- Read address bus, width determined from RAM_DEPTH
        dina  : in std_logic_vector(RAM_WIDTH-1 downto 0);        -- RAM input data
        clka  : in std_logic;                                     -- Clock
        wea   : in std_logic;                                     -- Write enable
        enb   : in std_logic;                                     -- RAM Enable, for additional power savings, disable port when not in use
        rstb  : in std_logic;                                     -- Output reset (does not affect memory contents)
        regceb: in std_logic;                                     -- Output register enable
        doutb : out std_logic_vector(RAM_WIDTH-1 downto 0)                -- RAM output data
    );

end xilinx_simple_dual_port_1_clock_ram;

architecture rtl of xilinx_simple_dual_port_1_clock_ram is

constant C_RAM_WIDTH : integer := RAM_WIDTH;
constant C_RAM_DEPTH : integer := RAM_DEPTH;
constant C_RAM_PERFORMANCE : string := RAM_PERFORMANCE;

signal doutb_reg : std_logic_vector(C_RAM_WIDTH-1 downto 0) := (others => '0');
type ram_type is array (C_RAM_DEPTH-1 downto 0) of std_logic_vector (C_RAM_WIDTH-1 downto 0);          -- 2D Array Declaration for RAM signal
signal ram_data : std_logic_vector(C_RAM_WIDTH-1 downto 0) ;


signal ram_name : ram_type := (others => (others => '0'));

begin

process(clka)
begin
    if(clka'event and clka = '1') then
        if(wea = '1') then
            ram_name(to_integer(unsigned(addra))) <= dina;
        end if;
        if(enb = '1') then
            ram_data <= ram_name(to_integer(unsigned(addrb)));
        end if;
    end if;
end process;

--  Following code generates LOW_LATENCY (no output register)
--  Following is a 1 clock cycle read latency at the cost of a longer clock-to-out timing

no_output_register : if C_RAM_PERFORMANCE = "LOW_LATENCY" generate
    doutb <= ram_data;
end generate;

--  Following code generates HIGH_PERFORMANCE (use output register)
--  Following is a 2 clock cycle read latency with improved clock-to-out timing

output_register : if C_RAM_PERFORMANCE = "HIGH_PERFORMANCE"  generate
process(clka)
begin
    if(clka'event and clka = '1') then
        if(rstb = '1') then
            doutb_reg <= (others => '0');
        elsif(regceb = '1') then
            doutb_reg <= ram_data;
        end if;
    end if;
end process;

doutb <= doutb_reg;

end generate;

end rtl;

------------------------------------------------------------------------------------------------------------------------

library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ram_pkg.all;
USE std.textio.all;

entity top is
    generic (
        RAM_WIDTH: natural := 18;
        RAM_DEPTH: natural := 1024;
        RAM_PERFORMANCE: string := "HIGH_PERFORMANCE"
    );
    port (
        CLK: in std_logic
    );
end top;

architecture Behavioral of top is
    
    attribute syn_preserve: boolean;
    attribute syn_noprune: boolean;

    signal addra : std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0);
    signal addrb : std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0);
    signal dina  : std_logic_vector(RAM_WIDTH-1 downto 0);
    signal wea   : std_logic;
    signal enb   : std_logic;
    signal rstb  : std_logic;
    signal regceb: std_logic;
    signal doutb, doutb_o : std_logic_vector(RAM_WIDTH-1 downto 0);

    attribute syn_preserve of addra   : signal is true;
    attribute syn_noprune  of addra   : signal is true;
    attribute syn_preserve of addrb   : signal is true;
    attribute syn_noprune  of addrb   : signal is true;
    attribute syn_preserve of dina    : signal is true;
    attribute syn_noprune  of dina    : signal is true;
    attribute syn_preserve of wea     : signal is true;
    attribute syn_noprune  of wea     : signal is true;
    attribute syn_preserve of enb     : signal is true;
    attribute syn_noprune  of enb     : signal is true;
    attribute syn_preserve of rstb    : signal is true;
    attribute syn_noprune  of rstb    : signal is true;
    attribute syn_preserve of regceb  : signal is true;
    attribute syn_noprune  of regceb  : signal is true;
    attribute syn_preserve of doutb_o : signal is true;
    attribute syn_noprune  of doutb_o : signal is true;

    component xilinx_simple_dual_port_1_clock_ram is
    generic (
        RAM_WIDTH : integer;
        RAM_DEPTH : integer;
        RAM_PERFORMANCE : string
    );
    port
    (
        addra : in std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0);
        addrb : in std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0);
        dina  : in std_logic_vector(RAM_WIDTH-1 downto 0);
        clka  : in std_logic;
        wea   : in std_logic;
        enb   : in std_logic;
        rstb  : in std_logic;
        regceb: in std_logic;
        doutb : out std_logic_vector(RAM_WIDTH-1 downto 0)
    );
    end component;

begin

    process (CLK)
    begin
        if rising_edge(CLK) then
            addra <= addra(clogb2(RAM_DEPTH)-2 downto 0) & addra(clogb2(RAM_DEPTH)-1);
            addrb <= addrb(clogb2(RAM_DEPTH)-2 downto 0) & addrb(clogb2(RAM_DEPTH)-1);
            dina <= dina(RAM_WIDTH-2 downto 0) & dina(RAM_WIDTH-1);
            wea <= not wea;
            enb <= not enb;
            rstb <= not rstb;
            regceb <= not regceb;
            doutb <= doutb_o;
        end if;
    end process;

    ram_instance : xilinx_simple_dual_port_1_clock_ram
    generic map (
        RAM_WIDTH => RAM_WIDTH,
        RAM_DEPTH => RAM_DEPTH,
        RAM_PERFORMANCE => RAM_PERFORMANCE
    )
    port map  (
        addra  => addra,
        addrb  => addrb,
        dina   => dina,
        clka   => CLK,
        wea    => wea,
        enb    => enb,
        rstb   => rstb,
        regceb => regceb,
        doutb  => doutb_o
    );
    
end Behavioral;
