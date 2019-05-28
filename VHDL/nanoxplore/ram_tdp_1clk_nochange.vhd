-- From the Xilinx Language Template library. INIT_FILE removed, top added.

-- Generics:
-- RAM_WIDTH: natural := 18;
-- RAM_DEPTH: natural := 1024;
-- RAM_PERFORMANCE: string := "HIGH_PERFORMANCE"
--                             OR: "LOW_LATENCY" 

--  Xilinx Simple Dual Port Single Clock RAM
--  This code implements a parameterizable SDP single clock memory.
--  If a reset or enable is not necessary, it may be tied off or removed from the code.


--  Xilinx True Dual Port RAM No Change Single Clock
--  This code implements a parameterizable true dual port memory (both ports can read and write).
--  This is a no change RAM which retains the last read value on the output during writes
--  which is the most power efficient mode.
--  If a reset or enable is not necessary, it may be tied off or removed from the code.
--  Modify the parameters for the desired RAM characteristics.
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

entity xilinx_true_dual_port_no_change_1_clock_ram is
generic (
    RAM_WIDTH : integer := 18;                      -- Specify RAM data width
    RAM_DEPTH : integer := 1024;                    -- Specify RAM depth (number of entries)
    RAM_PERFORMANCE : string := "LOW_LATENCY"       -- Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
    );

port (
        addra : in std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0);     -- Port A Address bus, width determined from RAM_DEPTH
        addrb : in std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0);     -- Port B Address bus, width determined from RAM_DEPTH
        dina  : in std_logic_vector(RAM_WIDTH-1 downto 0);        -- Port A RAM input data
        dinb  : in std_logic_vector(RAM_WIDTH-1 downto 0);        -- Port B RAM input data
        clka  : in std_logic;                                     -- Clock
        wea   : in std_logic;                                     -- Port A Write enable
        web   : in std_logic;                                     -- Port B Write enable
        ena   : in std_logic;                                     -- Port A RAM Enable, for additional power savings, disable port when not in use
        enb   : in std_logic;                                     -- Port B RAM Enable, for additional power savings, disable port when not in use
        rsta  : in std_logic;                                     -- Port A Output reset (does not affect memory contents)
        rstb  : in std_logic;                                     -- Port B Output reset (does not affect memory contents)
        regcea: in std_logic;                                     -- Port A Output register enable
        regceb: in std_logic;                                     -- Port B Output register enable
        douta : out std_logic_vector(RAM_WIDTH-1 downto 0);               --  Port A RAM output data
        doutb : out std_logic_vector(RAM_WIDTH-1 downto 0)                --  Port B RAM output data
    );

end xilinx_true_dual_port_no_change_1_clock_ram;

architecture rtl of xilinx_true_dual_port_no_change_1_clock_ram is

constant C_RAM_WIDTH : integer := RAM_WIDTH;
constant C_RAM_DEPTH : integer := RAM_DEPTH;
constant C_RAM_PERFORMANCE : string := RAM_PERFORMANCE;


signal douta_reg : std_logic_vector(C_RAM_WIDTH-1 downto 0) := (others => '0');
signal doutb_reg : std_logic_vector(C_RAM_WIDTH-1 downto 0) := (others => '0');

type ram_type is array (C_RAM_DEPTH-1 downto 0) of std_logic_vector (C_RAM_WIDTH-1 downto 0);          -- 2D Array Declaration for RAM signal

signal ram_data_a : std_logic_vector(C_RAM_WIDTH-1 downto 0) ;
signal ram_data_b : std_logic_vector(C_RAM_WIDTH-1 downto 0) ;

-- Following code defines RAM

shared variable ram_name : ram_type := (others => (others => '0'));

begin

process(clka)
begin
    if(clka'event and clka = '1') then
        if(ena = '1') then
            if(wea = '1') then
                ram_name(to_integer(unsigned(addra))) := dina;
            else
                ram_data_a <= ram_name(to_integer(unsigned(addra)));
            end if;
        end if;
    end if;
end process;

process(clka)
begin
    if(clka'event and clka = '1') then
        if(enb = '1') then
            if(web = '1') then
                ram_name(to_integer(unsigned(addrb))) := dinb;
            else
                ram_data_b <= ram_name(to_integer(unsigned(addrb)));
            end if;
        end if;
    end if;
end process;

--  Following code generates LOW_LATENCY (no output register)
--  Following is a 1 clock cycle read latency at the cost of a longer clock-to-out timing

no_output_register : if C_RAM_PERFORMANCE = "LOW_LATENCY" generate
    douta <= ram_data_a;
    doutb <= ram_data_b;
end generate;

--  Following code generates HIGH_PERFORMANCE (use output register)
--  Following is a 2 clock cycle read latency with improved clock-to-out timing

output_register : if C_RAM_PERFORMANCE = "HIGH_PERFORMANCE"  generate
process(clka)
begin
    if(clka'event and clka = '1') then
        if(rsta = '1') then
            douta_reg <= (others => '0');
        elsif(regcea = '1') then
            douta_reg <= ram_data_a;
        end if;
    end if;
end process;
douta <= douta_reg;

process(clka)
begin
    if(clka'event and clka = '1') then
        if(rstb = '1') then
            doutb_reg <= (others => '0');
        elsif(regceb = '1') then
            doutb_reg <= ram_data_b;
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

    signal addra : std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0);     -- Port A Address bus, width determined from RAM_DEPTH
    signal addrb : std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0);     -- Port B Address bus, width determined from RAM_DEPTH
    signal dina  : std_logic_vector(RAM_WIDTH-1 downto 0);        -- Port A RAM input data
    signal dinb  : std_logic_vector(RAM_WIDTH-1 downto 0);        -- Port B RAM input data
    signal wea   : std_logic;                                     -- Port A Write enable
    signal web   : std_logic;                                     -- Port B Write enable
    signal ena   : std_logic;                                     -- Port A RAM Enable, for additional power savings, disable port when not in use
    signal enb   : std_logic;                                     -- Port B RAM Enable, for additional power savings, disable port when not in use
    signal rsta  : std_logic;                                     -- Port A Output reset (does not affect memory contents)
    signal rstb  : std_logic;                                     -- Port B Output reset (does not affect memory contents)
    signal regcea: std_logic;                                     -- Port A Output register enable
    signal regceb: std_logic;                                     -- Port B Output register enable
    signal douta, douta_o : std_logic_vector(RAM_WIDTH-1 downto 0);               --  Port A RAM output data
    signal doutb, doutb_o : std_logic_vector(RAM_WIDTH-1 downto 0);               --  Port B RAM output data

    attribute syn_preserve of addra      : signal is true;
    attribute syn_noprune  of addra      : signal is true;
    attribute syn_preserve of addrb      : signal is true;
    attribute syn_noprune  of addrb      : signal is true;
    attribute syn_preserve of dina       : signal is true;
    attribute syn_noprune  of dina       : signal is true;
    attribute syn_preserve of dinb       : signal is true;
    attribute syn_noprune  of dinb       : signal is true;
    attribute syn_preserve of wea    : signal is true;
    attribute syn_noprune  of wea    : signal is true;
    attribute syn_preserve of web    : signal is true;
    attribute syn_noprune  of web    : signal is true;
    attribute syn_preserve of ena    : signal is true;
    attribute syn_noprune  of ena    : signal is true;
    attribute syn_preserve of enb    : signal is true;
    attribute syn_noprune  of enb    : signal is true;
    attribute syn_preserve of rsta       : signal is true;
    attribute syn_noprune  of rsta       : signal is true;
    attribute syn_preserve of rstb       : signal is true;
    attribute syn_noprune  of rstb       : signal is true;
    attribute syn_preserve of regcea     : signal is true;
    attribute syn_noprune  of regcea     : signal is true;
    attribute syn_preserve of regceb     : signal is true;
    attribute syn_noprune  of regceb     : signal is true;
    attribute syn_preserve of douta      : signal is true;
    attribute syn_noprune  of douta      : signal is true;
    attribute syn_preserve of doutb      : signal is true;
    attribute syn_noprune  of doutb      : signal is true;

    component xilinx_true_dual_port_no_change_1_clock_ram is
    generic (
        RAM_WIDTH : integer;
        RAM_DEPTH : integer;
        RAM_PERFORMANCE : string
    );
    port
    (
        addra : in std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0);     -- Port A Address bus, width determined from RAM_DEPTH
        addrb : in std_logic_vector((clogb2(RAM_DEPTH)-1) downto 0);     -- Port B Address bus, width determined from RAM_DEPTH
        dina  : in std_logic_vector(RAM_WIDTH-1 downto 0);        -- Port A RAM input data
        dinb  : in std_logic_vector(RAM_WIDTH-1 downto 0);        -- Port B RAM input data
        clka  : in std_logic;                                     -- Clock
        wea   : in std_logic;                                     -- Port A Write enable
        web   : in std_logic;                                     -- Port B Write enable
        ena   : in std_logic;                                     -- Port A RAM Enable, for additional power savings, disable port when not in use
        enb   : in std_logic;                                     -- Port B RAM Enable, for additional power savings, disable port when not in use
        rsta  : in std_logic;                                     -- Port A Output reset (does not affect memory contents)
        rstb  : in std_logic;                                     -- Port B Output reset (does not affect memory contents)
        regcea: in std_logic;                                     -- Port A Output register enable
        regceb: in std_logic;                                     -- Port B Output register enable
        douta : out std_logic_vector(RAM_WIDTH-1 downto 0);               --  Port A RAM output data
        doutb : out std_logic_vector(RAM_WIDTH-1 downto 0)                --  Port B RAM output data
    );
    end component;

begin

    process (CLK)
    begin
        if rising_edge(CLK) then
            addra <= addra(clogb2(RAM_DEPTH)-2 downto 0) & addra(clogb2(RAM_DEPTH)-1);
            addrb <= addrb(clogb2(RAM_DEPTH)-2 downto 0) & addrb(clogb2(RAM_DEPTH)-1);
            dina <= dina(RAM_WIDTH-2 downto 0) & dina(RAM_WIDTH-1);
            dinb <= dinb(RAM_WIDTH-2 downto 0) & dinb(RAM_WIDTH-1);
            wea <= not wea;
            web <= not web;
            ena <= not ena;
            enb <= not enb;
            rsta <= not rsta;
            rstb <= not rstb;
            regcea <= not regcea;
            regceb <= not regceb;
            douta <= douta_o;
            doutb <= doutb_o;
        end if;
    end process;

    ram_instance : xilinx_true_dual_port_no_change_1_clock_ram
    generic map (
        RAM_WIDTH => RAM_WIDTH,
        RAM_DEPTH => RAM_DEPTH,
        RAM_PERFORMANCE => RAM_PERFORMANCE
    )
    port map  (
        addra => addra,
        addrb => addrb,
        dina => dina,
        dinb => dinb,
        clka => CLK,
        wea => wea,
        web => web,
        ena => ena,
        enb => enb,
        rsta => rsta,
        rstb => rstb,
        regcea => regcea,
        regceb => regceb,
        douta => douta_o,
        doutb => doutb_o
    );
    
end Behavioral;
