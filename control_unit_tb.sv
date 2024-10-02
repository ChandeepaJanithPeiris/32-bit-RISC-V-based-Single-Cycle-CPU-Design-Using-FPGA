module Control_Unit_tb;

    // Inputs
    logic [6:0] instruction;
    
    // Outputs
    logic Branch;
    logic MemRead;
    logic MemtoReg;
    logic ALUSrc;
    logic MemWrite;
    logic RegWrite;
    logic [1:0] ALUOp;
    
    // Instantiate the Control Unit
    Control_Unit uut (
        .instruction(instruction),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemtoReg(MemtoReg),
        .ALUSrc(ALUSrc),
        .MemWrite(MemWrite),
        .RegWrite(RegWrite),
        .ALUOp(ALUOp)
    );
    
    initial begin
        // Test R-Type Instruction (7'b0110011)
        instruction = 7'b0110011;
        #10;
        $display("R-Type: ALUSrc=%b, MemtoReg=%b, RegWrite=%b, MemRead=%b, MemWrite=%b, Branch=%b, ALUOp=%b",
                 ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
    
        // Test I-Type Load Instruction (7'b0000011)
        instruction = 7'b0000011;
        #10;
        $display("I-Type Load: ALUSrc=%b, MemtoReg=%b, RegWrite=%b, MemRead=%b, MemWrite=%b, Branch=%b, ALUOp=%b",
                 ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
    
        // Test S-Type Store Instruction (7'b0100011)
        instruction = 7'b0100011;
        #10;
        $display("S-Type Store: ALUSrc=%b, MemtoReg=%b, RegWrite=%b, MemRead=%b, MemWrite=%b, Branch=%b, ALUOp=%b",
                 ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
    
        // Test B-Type Branch Instruction (7'b1100011)
        instruction = 7'b1100011;
        #10;
        $display("B-Type Branch: ALUSrc=%b, MemtoReg=%b, RegWrite=%b, MemRead=%b, MemWrite=%b, Branch=%b, ALUOp=%b",
                 ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
    
        // Default Case (Undefined Opcode)
        instruction = 7'b1111111;
        #10;
        $display("Default: ALUSrc=%b, MemtoReg=%b, RegWrite=%b, MemRead=%b, MemWrite=%b, Branch=%b, ALUOp=%b",
                 ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
    
        $finish;
    end
    
    endmodule
    