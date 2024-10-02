module moduleTop (
    input logic clk,
    input logic rst,
    input logic [3:0] col,
    output logic [3:0] row
);
    
    //wire clk_div;
    //wire row;
    /*wire [3:0] num_o;
    wire [3:0] digit;*/

    /*Debounce Div(
        .num(num),
        .clk(clk),
        .num_o(num_o)
    );*/

    /*FrecDivider Divisor(
        .clk(clk),
        .clk_div(clk_div);
    )*/

    SweptRows Filas(
        .clk(clk),
        .rst(rst),
        .row(row)
    );

    /*KB_Read Teclado(
        .clk(clk),
        .rst(rst),
        .col(col),
        .row(row),
        .num(num)
    );*/
    
endmodule