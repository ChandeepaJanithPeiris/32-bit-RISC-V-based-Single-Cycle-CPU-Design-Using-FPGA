// Multiplexers
module Mux(
    input logic sel1,          // Select signal
    input logic [31:0] A,     // Input A1 (32 bits)
    input logic [31:0] B,     // Input B1 (32 bits)
    output logic [31:0] Mux_out  // Output (32 bits)
);

    // Multiplexer logic
    assign Mux_out = (sel == 1'b0) ? A : B;

endmodule
