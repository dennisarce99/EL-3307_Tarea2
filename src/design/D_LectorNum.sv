module LectorDigitos (
    input logic clk,
    input logic operador,
    input logic [3:0] col,
    output logic [15:0] num
);

    reg [1:0] cont = 0;

    always_ff @(posedge operador) begin
        if (cont == 0) begin
            cont <= 0;
        end
        else begin
            cont <= 1'b1;
        end
    end

    always_comb begin
        case (cont)
            2'b00: begin num = {num[12:0],col}; end
            2'b01: begin
                num = {num[12:0],col};
            end
            2'b10: begin
                num = {num[12:0],col};
            end
            2'b11: begin num = 0; end
            default: num = 0;
        endcase
    end

endmodule