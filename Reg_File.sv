module Reg_File(
    input logic clk,
    input logic reset,
    input logic RegWrite,
    input logic [4:0] Rs1, Rs2, Rd,
    input logic [31:0] Write_data,
    output logic [31:0] read_data1, read_data2
);

    logic [31:0] Registers [31:0]; // 32 Registers of 32-bit each

    // Always block triggered by clock or reset
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset all registers to zero
            for (int k = 0; k < 32; k++) begin
                Registers[k] <= 32'b0;
            end
        end else if (RegWrite) begin
            // Write data to the register if RegWrite is enabled
            Registers[Rd] <= Write_data;
        end
    end

    // Read from register Rs1 and Rs2
    assign read_data1 = Registers[Rs1];
    assign read_data2 = Registers[Rs2];

endmodule
