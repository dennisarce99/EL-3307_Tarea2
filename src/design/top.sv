module moduleTop (
    input clk,
    input rst,
    input [3:0] col,
    output [3:0] row
);
    
    wire clk_div;
    wire [3:0] row;
    wire [3:0] num;
    wire [3:0] num_o;
    wire [3:0] digit;

    Debounce Div(
        .num(num),
        .clk(clk),
        .num_o(num_o)
    );

    SweptRows Filas(
        .clk_div(clk_div),
        .rst(rst),
        .row(row)
    );

    KB_Read Teclado(
        .clk_div(clk_div),
        .rst(rst),
        .col(col),
        .row(row),
        .num(num)
    );
    
endmodule