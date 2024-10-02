module Control_Unit (
    input  logic [6:0] instruction,    // Opcode from instruction
    output logic Branch,
    output logic MemRead,
    output logic MemtoReg,
    output logic ALUSrc,
    output logic MemWrite,
    output logic RegWrite,
    output logic [1:0] ALUOp
);

always_comb begin
    case (instruction)
        7'b0110011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b001000_10;  // R-Type
        7'b0000011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b111100_00;  // I-Type (Load)
        7'b0100011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b100010_00;  // S-Type (Store)
        7'b1100011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b000001_01;  // B-Type (Branch)
        default:    {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b000000_00;  // Default case
    endcase
end

endmodule
