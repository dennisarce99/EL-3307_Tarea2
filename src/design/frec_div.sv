module FrecDivider (
  input clk,
  input rst,
  clk_div
);

    output clk_div
    reg [27:0] cont;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            cont  <= 0;
            clk_div <= 0;
            end
        else begin
            cont <= cont + 28'd1;
            if (cont == 28'd27) begin
                cont  <= 0;
                clk_div <= ~clk_div;
                end
        end
    end

endmodule