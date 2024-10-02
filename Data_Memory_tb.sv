module Data_Memory_tb;
    // Testbench variables
    logic clk;
    logic reset;
    logic MemWrite;
    logic MemRead;
    logic [31:0] read_address;
    logic [31:0] Write_data;
    logic [31:0] MemData_out;

    // Instantiate Data_Memory module
    Data_Memory uut (
        .clk(clk),
        .reset(reset),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .read_address(read_address),
        .Write_data(Write_data),
        .MemData_out(MemData_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Testbench logic
    initial begin
        // Initialize
        clk = 0;
        reset = 1;
        MemWrite = 0;
        MemRead = 0;
        read_address = 0;
        Write_data = 0;
        #10;

        // Release reset
        reset = 0;
        #10;

        // Write data to address 0
        MemWrite = 1;
        read_address = 0;
        Write_data = 32'hDEADBEEF;  // Write value
        #10;

        // Read data from address 0
        MemWrite = 0;
        MemRead = 1;
        #10;
        assert(MemData_out == 32'hDEADBEEF) else $error("Read test failed!");

        // Write data to address 5
        MemRead = 0;
        MemWrite = 1;
        read_address = 5;
        Write_data = 32'hCAFEBABE;
        #10;

        // Read data from address 5
        MemWrite = 0;
        MemRead = 1;
        read_address = 5;
        #10;
        assert(MemData_out == 32'hCAFEBABE) else $error("Read test failed!");

        // Complete simulation
        $display("All tests passed.");
        $finish;
    end
endmodule
