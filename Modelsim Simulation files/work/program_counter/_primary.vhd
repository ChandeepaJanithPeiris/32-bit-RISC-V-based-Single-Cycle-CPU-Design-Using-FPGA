library verilog;
use verilog.vl_types.all;
entity program_counter is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        pc_in           : in     vl_logic_vector(31 downto 0);
        pc_out          : out    vl_logic_vector(31 downto 0)
    );
end program_counter;
