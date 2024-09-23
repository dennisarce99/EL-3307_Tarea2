module moduleTop (
    input clk,
    input rst,
    input [3:0] col,
    output [3:0] row
);
    
    wire clk_div;
    wire [3:0] row;
    wire [3:0] num;

    FrecDivider Div(
        .clk(clk),
        .rst(rst),
        .clk_div(clk_div)
    );

    module_Rows Rows(
        .rst(rst),
        .clk_div(clk_div),
        .row(row)
    );

    module_Cols Cols(
        .rst(rst),
        .clk_div(clk_div),
        .row(row),
        .col(col),
        .num(num)
    );
    
endmodule