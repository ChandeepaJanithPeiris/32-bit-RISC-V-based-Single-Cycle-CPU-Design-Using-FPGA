module adder (
    input logic [31:0] pc_out,
    output logic [31:0] pc_in,
);
    assign pc_in = pc_out + 4;
    
endmodule