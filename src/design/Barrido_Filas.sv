module SweptRows (
    input logic clk_div,
    input logic rst,
    output logic [3:0] row
);

    reg [2:0] state, next_state;
    localparam srow0 = 2'b00, srow1 = 2'b01, srow2 = 3'b10,  srow3 = 2'b11;
 
    always_ff @(clk_div) begin
        if (rst) begin
            state <= srow0;
        end
        else begin
            state <= next_state;
        end
    end
    
    always @(*) begin
        case (state)
            srow0: begin row = 4'b0001, next_state = srow1; end
            srow1: begin row = 4'b0010, next_state = srow2; end
            srow2: begin row = 4'b0100, next_state = srow3; end
            srow3: begin row = 4'b1000, next_state = srow0; end
            default: next_state = srow0;
        endcase
    end

endmodule