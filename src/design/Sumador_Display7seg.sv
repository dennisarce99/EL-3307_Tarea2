module display (
    input logic clk,
    output logic [3:0] anodos,
    output logic [6:0] segmentos,
);

    reg [1:0] select;
    always_ff @(posedge clk) begin : 
        select <= select + 1;        
    end
    always_comb begin : case (select) // traduce c/d numero BCD al 7seg correspondiente
        2'b00: anodos = 4'b1110; // Activar display 1
        2'b01: anodos = 4'b1101; // Activar display 2
        2'b10: anodos = 4'b1011; // Activar display 3
        2'b11: anodos = 4'b0111; // Activar display 4
    endcase
        
    end

endmodule