module Mux_tb;
    // Testbench variables
    logic sel;
    logic [31:0] A, B;
    logic [31:0] Mux_out;

    // Instantiate the Mux1 module
    Mux1 uut (
        .sel(sel),
        .A(A),
        .B(B),
        .Mux_out(Mux_out)
    );

    // Testbench logic
    initial begin
        // Test case 1: sel1 = 0, select A
        A = 32'hAAAAAAAA;  // Test value for A
        B = 32'h55555555;  // Test value for B
        sel = 1'b0;  // Select A
        #10;
        assert(Mux_out == A) else $error("Test case 1 failed!");

        // Test case 2: sel = 1, select B
        sel1 = 1'b1;  // Select B
        #10;
        assert(Mux_out == B) else $error("Test case 2 failed!");

        // Complete simulation
        $display("All tests passed.");
        $finish;
    end
endmodule
