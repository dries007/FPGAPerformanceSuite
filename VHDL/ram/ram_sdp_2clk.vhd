-- From the Xilinx Language Template library. INIT_FILE removed, top added.

-- Generics:
-- RAM_WIDTH: natural := 18;
-- RAM_DEPTH: natural := 1024;
-- RAM_PERFORMANCE: string := "HIGH_PERFORMANCE"
--                             OR: "LOW_LATENCY" 

--  Xilinx Simple Dual Port 2 Clock RAM
--  This code implements a parameterizable SDP dual clock memory.
--  If a reset or enable is not necessary, it may be tied off or removed from the code.

library ieee;
use ieee.std_logic_1164.all;

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

entity xilinx_simple_dual_port_2_clock_ram is
generic (
    RAM_WIDTH : integer := 64;                      -- Specify RAM data width
    RAM_DEPTH : integer := 512;                    -- Specify RAM depth (number of entries)
    RAM_PERFORMANCE : string := "LOW_LATENCY"      -- Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
    );

port (
        addra : in std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0);     -- Write address bus, width determined from RAM_DEPTH
        addrb : in std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0);     -- Read address bus, width determined from RAM_DEPTH
        dina  : in std_logic_vector(RAM_WIDTH-1 downto 0);        -- RAM input data
        clka  : in std_logic;                                     -- Write Clock
        clkb  : in std_logic;                                     -- Read Clock
        wea   : in std_logic;                                     -- Write enable
        enb   : in std_logic;                                     -- RAM Enable, for additional power savings, disable port when not in use
        rstb  : in std_logic;                                     -- Output reset (does not affect memory contents)
        regceb: in std_logic;                                     -- Output register enable
        doutb : out std_logic_vector(RAM_WIDTH-1 downto 0)                -- RAM output data
     );

end xilinx_simple_dual_port_2_clock_ram;

architecture rtl of xilinx_simple_dual_port_2_clock_ram is

constant C_RAM_WIDTH : integer := RAM_WIDTH;
constant C_RAM_DEPTH : integer := RAM_DEPTH;
constant C_RAM_PERFORMANCE : string := RAM_PERFORMANCE;


signal doutb_reg : std_logic_vector(C_RAM_WIDTH-1 downto 0) := (others => '0');

type ram_type is array (C_RAM_DEPTH-1 downto 0) of std_logic_vector (C_RAM_WIDTH-1 downto 0);          -- 2D Array Declaration for RAM signal

signal ram_data : std_logic_vector(C_RAM_WIDTH-1 downto 0) ;

-- Following code defines RAM

signal ram_name : ram_type := (others => (others => '0'));

begin

process(clka)
begin
    if(clka'event and clka = '1') then
        if(wea = '1') then
            ram_name(to_integer(unsigned(addra))) <= dina;
        end if;
    end if;
end process;

process(clkb)
begin
    if(clkb'event and clkb = '1') then
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
        CLKA: in std_logic;
        CLKB: in std_logic
    );
end top;

architecture Behavioral of top is
    
    attribute dont_touch: boolean;

    signal addra : std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0);     -- Write address bus, width determined from RAM_DEPTH
    signal addrb : std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0);     -- Read address bus, width determined from RAM_DEPTH
    signal dina  : std_logic_vector(RAM_WIDTH-1 downto 0);        -- RAM input data
    signal wea   : std_logic;                                     -- Write enable
    signal enb   : std_logic;                                     -- RAM Enable, for additional power savings, disable port when not in use
    signal rstb  : std_logic;                                     -- Output reset (does not affect memory contents)
    signal regceb: std_logic;                                     -- Output register enable
    signal doutb, doutb_o : std_logic_vector(RAM_WIDTH-1 downto 0);                -- RAM output data;

    attribute dont_touch of addra   : signal is true;
    attribute dont_touch of addrb   : signal is true;
    attribute dont_touch of dina    : signal is true;
    attribute dont_touch of wea     : signal is true;
    attribute dont_touch of enb     : signal is true;
    attribute dont_touch of rstb    : signal is true;
    attribute dont_touch of regceb  : signal is true;
    attribute dont_touch of doutb_o : signal is true;

    component xilinx_simple_dual_port_2_clock_ram is
    generic (
        RAM_WIDTH : integer;
        RAM_DEPTH : integer;
        RAM_PERFORMANCE : string
    );
    port
    (
        addra : in std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0);     -- Write address bus, width determined from RAM_DEPTH
        addrb : in std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0);     -- Read address bus, width determined from RAM_DEPTH
        dina  : in std_logic_vector(RAM_WIDTH-1 downto 0);        -- RAM input data
        clka  : in std_logic;                                     -- Write Clock
        clkb  : in std_logic;                                     -- Read Clock
        wea   : in std_logic;                                     -- Write enable
        enb   : in std_logic;                                     -- RAM Enable, for additional power savings, disable port when not in use
        rstb  : in std_logic;                                     -- Output reset (does not affect memory contents)
        regceb: in std_logic;                                     -- Output register enable
        doutb : out std_logic_vector(RAM_WIDTH-1 downto 0)                -- RAM output data
    );
    end component;

begin

    process (CLKA)
    begin
        if rising_edge(CLKA) then
            addra <= addra;
            dina <= dina;
            wea <= wea;
        end if;
    end process;

    process (CLKB)
    begin
        if rising_edge(CLKB) then
            addrb <= addrb;
            enb <= enb;
            rstb <= rstb;
            regceb <= regceb;
            doutb <= doutb_o;
        end if;
    end process;

    ram_instance : xilinx_simple_dual_port_2_clock_ram
    generic map (
        RAM_WIDTH => RAM_WIDTH,
        RAM_DEPTH => RAM_DEPTH,
        RAM_PERFORMANCE => RAM_PERFORMANCE
    )
    port map  (
        addra  => addra,
        addrb  => addrb,
        dina   => dina,
        clka   => CLKA,
        clkb   => CLKB,
        wea    => wea,
        enb    => enb,
        rstb   => rstb,
        regceb => regceb,
        doutb  => doutb_o
    );
    
end Behavioral;
