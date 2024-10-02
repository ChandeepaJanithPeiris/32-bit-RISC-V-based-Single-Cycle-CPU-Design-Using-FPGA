module Reg_File_tb;

    // Signals
    logic clk;
    logic reset;
    logic RegWrite;
    logic [4:0] Rs1, Rs2, Rd;
    logic [31:0] Write_data;
    logic [31:0] read_data1, read_data2;

    // Instantiate the DUT (Design Under Test)
    Reg_File dut (
        .clk(clk),
        .reset(reset),
        .RegWrite(RegWrite),
        .Rs1(Rs1),
        .Rs2(Rs2),
        .Rd(Rd),
        .Write_data(Write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period of 10 time units
    end

    // Test procedure
    initial begin
        // Reset the system
        reset = 1;
        RegWrite = 0;
        Rs1 = 5'd0;
        Rs2 = 5'd1;
        Rd = 5'd2;
        Write_data = 32'd0;
        #10;

        // Deassert reset and start writing data
        reset = 0;
        #10;

        // Write data to register 2
        RegWrite = 1;
        Write_data = 32'd1234;
        Rd = 5'd2; // Writing to register 2
        #10;

        // Read from register 2
        RegWrite = 0;
        Rs1 = 5'd2; // Reading from register 2
        #10;

        // Write data to register 3
        RegWrite = 1;
        Write_data = 32'd5678;
        Rd = 5'd3; // Writing to register 3
        #10;

        // Read from register 3 and check both Rs1 and Rs2
        RegWrite = 0;
        Rs1 = 5'd3; // Reading from register 3
        Rs2 = 5'd2; // Also read from register 2
        #10;

        // End simulation
        $stop;
    end

    // Monitor signals
    initial begin
        $monitor("Time: %0t, Rs1: %0d, Rs2: %0d, Rd: %0d, Write Data: %0d, Read Data1: %0d, Read Data2: %0d", 
                 $time, Rs1, Rs2, Rd, Write_data, read_data1, read_data2);
    end

endmodule
