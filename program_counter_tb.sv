`timescale 1ns/1ns

module program_counter_tb;
    logic clk, reset;
    logic [31:0] pc_in;
    logic [31:0] pc_out;

    // Instantiate the program_counter module
    program_counter pc(
        .clk(clk),
        .reset(reset),
        .pc_in(pc_in),
        .pc_out(pc_out)
    );

    // Clock generation (50 MHz -> 20 ns period)
    initial clk = 0;
    always #10 clk = ~clk;

    // Test cases
    initial begin
        // Initialize signals
        reset = 1'b1; // Assert reset
        pc_in = 32'd0; // Initialize pc_in to 0
        
        // Hold reset for some time, then release it
        #15 reset = 1'b0; // Deassert reset
        #10; // Wait for the clock edge

        // Test Case 1: Load a value into pc_in
        pc_in = 32'd50;
        #20; // Wait for 2 clock cycles

        // Test Case 2: Load another value
        pc_in = 32'd100;
        #20;

        // Test Case 3: Reset the PC and load a new value
        reset = 1'b1; // Assert reset
        #15;
        reset = 1'b0; // Deassert reset
        pc_in = 32'd200;
        #20;

        // Test Case 4: Increment the PC by some value
        pc_in = pc_out + 32'd4;
        #20;

        // End simulation
        //$finish;
    end

    // Monitor output
    initial begin
        $monitor("Time: %0t | clk: %b | reset: %b | pc_in: %h | pc_out: %h", 
                 $time, clk, reset, pc_in, pc_out);
    end

endmodule
