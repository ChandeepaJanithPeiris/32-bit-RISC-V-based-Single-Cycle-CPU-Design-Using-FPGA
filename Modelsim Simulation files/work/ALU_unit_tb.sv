module ALU_unit_tb;

    // Inputs
    logic [31:0] A, B;
    logic [3:0] Control_in;
    
    // Outputs
    logic [31:0] ALU_Result;
    logic zero;
    
    // Instantiate the ALU unit
    ALU_unit uut (
        .A(A),
        .B(B),
        .Control_in(Control_in),
        .ALU_Result(ALU_Result),
        .zero(zero)
    );
    
    initial begin
        // Initialize Inputs
        A = 32'd10;
        B = 32'd5;
    
        // Test AND operation
        Control_in = 4'b0000;
        #10;
        $display("AND: ALU_Result = %d, zero = %b", ALU_Result, zero);
    
        // Test OR operation
        Control_in = 4'b0001;
        #10;
        $display("OR: ALU_Result = %d, zero = %b", ALU_Result, zero);
    
        // Test ADD operation
        Control_in = 4'b0010;
        #10;
        $display("ADD: ALU_Result = %d, zero = %b", ALU_Result, zero);
    
        // Test SUBTRACT operation (A != B)
        Control_in = 4'b0110;
        A = 32'd10;
        B = 32'd5;
        #10;
        $display("SUB: ALU_Result = %d, zero = %b", ALU_Result, zero);
    
        // Test SUBTRACT operation (A == B)
        A = 32'd5;
        B = 32'd5;
        Control_in = 4'b0110;
        #10;
        $display("SUB (A == B): ALU_Result = %d, zero = %b", ALU_Result, zero);
    
        $finish;
    end
    
    endmodule
    