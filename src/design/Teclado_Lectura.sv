module KB_Read (
    input logic clk,
    input logic rst,
    input logic [3:0] col,
    input logic [3:0] row,
    output logic [3:0] num);

    always @(row) begin
        if (row == 4'b1000) begin
            case (col)
                4'b1000: num <= 4'b0001;
                4'b0100: num <= 4'b0010;
                4'b0010: num <= 4'b0011;
                4'b0001: num <= 4'b1010;
                default: num <= 4'b1111; 
            endcase 
        end

        else if (row == 4'b0100) begin
            case (col)
                4'b1000: num <= 4'b0100;
                4'b0100: num <= 4'b0101;
                4'b0010: num <= 4'b0110;
                4'b0001: num <= 4'b1011;
                default: num <= 4'b1111; 
            endcase 
        end

        else if (row == 4'b0010) begin
            case (col)
                4'b1000: num <= 4'b0111;
                4'b0100: num <= 4'b1000;
                4'b0010: num <= 4'b1001;
                4'b0001: num <= 4'b1100;
                default: num <= 4'b1111; 
            endcase 
        end

        else if (row == 4'b0001) begin
            case (col)
                4'b1000: num <= 4'b1110;
                4'b0100: num <= 4'b0000;
                4'b0010: num <= 4'b1111;
                4'b0001: num <= 4'b1101;
                default: num <= 4'b1111;
            endcase 
        end
    end

endmodule