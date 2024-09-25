module Debounce(
    input num,
    input clk,
    output num_o, digit
);

    wire clk_div;
    wire q1, q2, nq2, q0;
    wire num;

    FrecDivider ClkDiv(.clk(clk), .clk_div(clk_div));

    D_FF KB_i (.dff_clk(clk), .clk_en(clk_div), .d(num), .q(q0));
    D_FF KB_FF1(.dff_clk(clk), .clk_en(clk_div), .d(q0), .q(q1));
    D_FF KB_FF1(.dff_clk(clk), .clk_en(clk_div), .d(q1), .q(q2));

    assign nq2 = ~q2;
    assign num_o = q1 & nq2;
    
    always @(posedge clk_div) begin
        if (num_o = q1 & nq2) begin
            digit = q2;
        end
    end

endmodule