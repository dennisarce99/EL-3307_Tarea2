module FrecDivider (
  input clk,
  output clk_div
);

    reg [26:0] cont = 0;

    always @(posedge clk) begin
        cont <= (cont >= 269999) ? 0:(cont+1);
    end

    assign clk_div = (cont == 269999) ? 1'b1:1'b0;

endmodule