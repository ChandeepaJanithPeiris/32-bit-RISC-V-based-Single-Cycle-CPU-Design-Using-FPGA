module ImmGen(
    input  logic [6:0]  Opcode,
    input  logic [31:0] instruction,
    output logic [31:0] ImmExt
);

always_comb begin
    case (Opcode)
        7'b0000011:  ImmExt = {{20{instruction[31]}}, instruction[31:20]};                      // I-Type
        7'b0100011:  ImmExt = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};    // S-Type
        7'b1100011:  ImmExt = {{19{instruction[31]}}, instruction[31], instruction[30:25], instruction[11:8], 1'b0}; // B-Type
        default:     ImmExt = 32'd0; // Default case for unsupported opcodes
    endcase
end

endmodule
