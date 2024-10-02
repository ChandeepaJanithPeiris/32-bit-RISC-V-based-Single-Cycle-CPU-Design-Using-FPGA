module ALU_Control_tb;
    // Declare testbench variables
    logic [1:0] ALUOp;
    logic [6:0] fun7;
    logic [2:0] fun3;
    logic [3:0] Control_out;

    // Instantiate the ALU_Control module
    ALU_Control uut (
        .ALUOp(ALUOp),
        .fun7(fun7),
        .fun3(fun3),
        .Control_out(Control_out)
    );

    // Testbench logic
    initial begin
        // Test case 1: ADD operation
        ALUOp = 2'b00;
        fun7 = 7'b0000000;
        fun3 = 3'b000;
        #10;
        assert(Control_out == 4'b0010) else $error("Test case 1 failed");

        // Test case 2: SUB operation
        ALUOp = 2'b01;
        fun7 = 7'b0000000;
        fun3 = 3'b000;
        #10;
        assert(Control_out == 4'b0110) else $error("Test case 2 failed");

        // Test case 3: AND operation
        ALUOp = 2'b00;
        fun7 = 7'b0000000;
        fun3 = 3'b001;
        #10;
        assert(Control_out == 4'b0110) else $error("Test case 3 failed");

        // Test case 4: OR operation
        ALUOp = 2'b10;
        fun7 = 7'b0000000;
        fun3 = 3'b000;
        #10;
        assert(Control_out == 4'b0000) else $error("Test case 4 failed");

        // Test case 5: XOR operation
        ALUOp = 2'b10;
        fun7 = 7'b0000000;
        fun3 = 3'b110;
        #10;
        assert(Control_out == 4'b0001) else $error("Test case 5 failed");

        // Complete simulation
        $display("All test cases passed.");
        $finish;
    end
endmodule
