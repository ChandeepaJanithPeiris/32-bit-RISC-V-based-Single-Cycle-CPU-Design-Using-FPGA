module tb_Instruction_Mem();

    // Signals
    logic clk;
    logic reset;
    logic [31:0] read_address;
    logic [31:0] instruction_out;

    // Instantiate the DUT (Design Under Test)
    Instruction_Mem dut (
        .clk(clk),
        .reset(reset),
        .read_address(read_address),
        .instruction_out(instruction_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time units period
    end

    // Test procedure
    initial begin
        // Initial state
        reset = 1;      // Assert reset
        read_address = 32'd0;  // Initial read address
        #10;

        reset = 0;      // Deassert reset
        #10;

        // Read instruction from address 0
        read_address = 32'd0;
        #10;

        // Read instruction from address 1
        read_address = 32'd1;
        #10;

        // Further tests
        read_address = 32'd5;
        #10;

        // End of simulation
        $stop;
    end

    // Monitor signals
    initial begin
        $monitor("Time: %0t, Reset: %b, Read Address: %0d, Instruction Out: %0h", 
                 $time, reset, read_address, instruction_out);
    end

endmodule
