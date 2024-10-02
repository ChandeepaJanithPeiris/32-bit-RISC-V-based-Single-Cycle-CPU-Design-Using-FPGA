// ALU Control
module ALU_Control(
    input logic [1:0] ALUOp,
    input logic [6:0] fun7,
    input logic [2:0] fun3,
    output logic [3:0] Control_out
);
    always_comb begin
        case ({ALUOp, fun7, fun3})
            12'b00_0000000_000: Control_out = 4'b0010;  // ADD
            12'b01_0000000_000: Control_out = 4'b0110;  // SUB
            12'b00_0000000_001: Control_out = 4'b0110;  // AND
            12'b10_0000000_000: Control_out = 4'b0000;  // OR
            12'b10_0000000_110: Control_out = 4'b0001;  // XOR
            default:            Control_out = 4'b0000;  // Default case (Security: Default reset)
        endcase
    end
endmodule
