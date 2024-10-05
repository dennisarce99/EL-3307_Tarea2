module LectorDigitos (
    input logic clk,
    input logic operador,
    input logic [3:0] col,
    output logic [15:0] num
);

    reg [1:0] cont = 0;
    reg [15:0] next_num = 0;

    always_ff @(posedge clk) begin
        if (operador) begin
           cont <= cont + 1'b1;
           next_num <= {next_num[11:0], col};
        end
        else begin
            case (cont)
            2'b00: begin num = 16'b0; next_num = 0; end
            2'b01: begin
                num = next_num;
            end
            2'b10: begin
                num = next_num;
            end
            2'b11: begin 
                num = next_num;
                next_num = 0; 
                end
            default: begin num = 0; next_num = 0; end
        endcase
        end
    end

    /*always_comb begin
        case (cont)
            2'b00: begin num = 16'b0; next_num = 0; end
            2'b01: begin
                num = next_num;
            end
            2'b10: begin
                num = next_num;
            end
            2'b11: begin 
                num = next_num;
                next_num = 0; 
                end
            default: begin num = 0; next_num = 0; end
        endcase
    end*/

endmodule