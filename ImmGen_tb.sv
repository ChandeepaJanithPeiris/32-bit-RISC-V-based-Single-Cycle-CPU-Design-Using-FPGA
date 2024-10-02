module tb_ImmGen;

    // Inputs
    logic [6:0] Opcode;
    logic [31:0] instruction;
    
    // Outputs
    logic [31:0] ImmExt;
    
    // Instantiate the ImmGen module
    ImmGen uut (
        .Opcode(Opcode),
        .instruction(instruction),
        .ImmExt(ImmExt)
    );
    
    initial begin
        // Initialize Inputs
        $display("Starting Immediate Generator test...");
    
        // Test case 1: I-Type
        Opcode = 7'b0000011;
        instruction = 32'b10000000000000000001000000010011; // Example instruction
        #10;
        $display("I-Type: ImmExt = %h", ImmExt);
    
        // Test case 2: S-Type
        Opcode = 7'b0100011;
        instruction = 32'b10101000000000110001010010100011; // Example instruction
        #10;
        $display("S-Type: ImmExt = %h", ImmExt);
    
        // Test case 3: B-Type
        Opcode = 7'b1100011;
        instruction = 32'b00000010000100011000001011100011; // Example instruction
        #10;
        $display("B-Type: ImmExt = %h", ImmExt);
    
        // Test case 4: Default case
        Opcode = 7'b1111111;
        instruction = 32'b11111111111111111111111111111111;
        #10;
        $display("Default case: ImmExt = %h", ImmExt);
    
        $finish;
    end
    
    endmodule
    