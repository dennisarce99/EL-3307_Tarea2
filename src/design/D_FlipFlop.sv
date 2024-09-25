module D_FF (
    input dff_clk, clk_en, d,
    output reg q = 0
);

    always @ (posedge dff_clk) begin
        if (clk_en == 1) begin
            q <= d;
        end
    end
    
endmodule