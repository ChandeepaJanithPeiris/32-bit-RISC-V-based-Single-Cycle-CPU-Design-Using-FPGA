module PCplus4 (
    input logic [31:0] fromPC,    // 32-bit input from the PC
    output logic [31:0] NextoPC   // 32-bit output for the next PC
);
    // Add 4 to the input PC value
    assign NextoPC = fromPC + 32'd4;

endmodule
