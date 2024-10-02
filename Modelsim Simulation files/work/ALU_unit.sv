module ALU_unit(
    input  logic [31:0] A, B,         // 32-bit inputs
    input  logic [3:0] Control_in,    // 4-bit control input
    output logic [31:0] ALU_Result,   // 32-bit result
    output logic zero                 // Zero flag
);

always_comb begin
    case (Control_in)
        4'b0000: begin 
            zero <= 0; 
            ALU_Result <= A & B;     // AND operation
        end
        4'b0001: begin 
            zero <= 0; 
            ALU_Result <= A | B;     // OR operation
        end
        4'b0010: begin 
            zero <= 0; 
            ALU_Result <= A + B;     // ADD operation
        end
        4'b0110: begin 
            if (A == B) zero <= 1; 
            else zero <= 0; 
            ALU_Result <= A - B;     // SUBTRACT operation
        end
        default: begin
            zero <= 0; 
            ALU_Result <= 0;         // Default case
        end
    endcase
end

endmodule
