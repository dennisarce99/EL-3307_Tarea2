module LectorDigitos (
    input logic clk,
    input logic operador,
    input logic [3:0] col,
    output logic [15:0] num
);

    reg [1:0] cont = 0;

    always_ff @(posedge clk) begin
        if (operador) begin
           cont <= cont + 1'b1; 
        end
    end

    always_comb begin
        case (cont)
            2'b00: begin num = 0; end
            2'b01: begin
                num = {num[12:0],col};
            end
            2'b10: begin
                num = {num[12:0],col};
            end
            2'b11: begin num = {num[12:0],col}; end
            default: num = 0;
        endcase
    end

endmodule