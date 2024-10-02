module Instruction_Mem(
    input logic clk,
    input logic reset,
    input logic [31:0] read_address,
    output logic [31:0] instruction_out
);

    logic [31:0] I_Mem [63:0]; // Instruction memory array of 64 entries, each 32-bit

    // Always block triggered by clock or reset
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            for (int k = 0; k < 64; k++) begin
                I_Mem[k] <= 32'b0; // Clear memory on reset
            end
        end else begin
            instruction_out <= I_Mem[read_address]; // Output instruction based on read_address
        end
    end

endmodule
