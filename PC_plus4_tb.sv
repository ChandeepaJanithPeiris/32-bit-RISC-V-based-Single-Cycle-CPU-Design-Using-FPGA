module PCplus4_tb();
    // Testbench variables
    logic [31:0] fromPC;
    logic [31:0] NextoPC;

    // Instantiate the PCplus4 module
    PCplus4 uut (
        .fromPC(fromPC),
        .NextoPC(NextoPC)
    );

    // Testbench logic
    initial begin
        // Test case 1: fromPC = 0
        fromPC = 32'd0;  // Initial PC value
        #10;  // Wait for a small delay
        assert(NextoPC == 32'd4) else $error("Test case 1 failed!");

        // Test case 2: fromPC = 4
        fromPC = 32'd4;  // Next PC value
        #10;
        assert(NextoPC == 32'd8) else $error("Test case 2 failed!");

        // Test case 3: fromPC = 32'hFFFFFFFC (largest 32-bit number minus 4)
        fromPC = 32'hFFFFFFFC;  // Maximum PC value close to overflow
        #10;
        assert(NextoPC == 32'h00000000) else $error("Test case 3 failed!");

        // Complete simulation
        $display("All test cases passed.");
        $finish;
    end
endmodule
