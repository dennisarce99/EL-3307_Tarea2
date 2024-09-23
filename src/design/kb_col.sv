module module_Cols (
    input rst,
    clk_div,
    row,
    col,
    num
);
    
    input clk_div;
    input [3:0] col;
    output [3:0] row;
    output logic [3:0] num;

    always_ff @(posegde clk_div) begin
        if (rst) begin
            num <= 4'b1111;
        end
        if (row == 4'b1000) begin //1 2 3 A
            case (col)
                4'b1000: num <= 4'b0001; //1
                4'b0100: num <= 4'b0010; //2
                4'b0010: num <= 4'b0011; //3
                4'b0001: num <= 4'b1010; //A
                default: num <= 4'b1111; 
            endcase 
        end

        else if (row == 4'b0100) begin //4 5 6 B
            case (col)
                4'b1000: num <= 4'b0100; //4
                4'b0100: num <= 4'b0101; //5
                4'b0010: num <= 4'b0110; //6
                4'b0001: num <= 4'b1011; //B
                default: num <= 4'b1111; 
            endcase 
        end

        else if (row == 4'b0010) begin //7 8 9 C
            case (col)
                4'b1000: num <= 4'b0111; //7
                4'b0100: num <= 4'b1000; //8
                4'b0010: num <= 4'b1001; //9
                4'b0001: num <= 4'b1100; //C
                default: num <= 4'b1111; 
            endcase 
        end

        else if (row == 4'b0001) begin //* 0 # D
            case (col)
                4'b1000: num <= 4'b1110; //*
                4'b0100: num <= 4'b0000; //0
                4'b0010: num <= 4'b1111; //#
                4'b0001: num <= 4'b1101; //D
                default: num <= 4'b1111;
            endcase 
        end

        else begin
            num <= 4'b1111;
        end
    end

endmodule