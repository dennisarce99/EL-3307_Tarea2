module module_Rows(
    input rst,
    clk_div,
    row
);
    
    input clk_div;
    output logic [3:0] row;

    logic [1:0] cont;

    always_ff @(posedge(clk_div) or posedge(rst)) begin:
        if (rst) begin
            cont <= 0;
        end
        else if (cont == 2'd4) begin
            cont <= 0;
        end
        else begin
            cont <= cont + 2'd1;
        end
    end

    always_comb begin
        case (cont)
            2'b00: row = 4'b1000; //MSB pin 1 kb (1 2 3 A)
            2'b01: row = 4'b0100; //pin 2 kb (4 5 6 B)
            2'b10: row = 4'b0010; //pin 3 kb (7 8 9 C)
            2'b11: row = 4'b0001; //LSB pin 4 kb (* 0 # D)
            default: row = 4'b0000;
        endcase
    end

endmodule