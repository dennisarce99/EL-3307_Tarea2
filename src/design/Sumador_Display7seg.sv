module display (
    input logic clk,
    input logic [15:0] bcd,
    output logic [3:0] anodos,
    output logic [6:0] segmentos
);
    logic [3:0] a;
    logic [3:0] b;
    logic [3:0] c;
    reg [3:0] digit;
    reg [1:0] select=0;

    assign a = bcd[11:8];
    assign b = bcd[7:4];
    assign c = bcd[3:0];

    always_ff @(posedge clk) begin
        select <= select + 1'b1; 
    end

    //controla activar un display a la vez
    always_comb begin
        case (select) // traduce c/d numero BCD al 7seg correspondiente
            2'b00: begin
                anodos = 4'b0001; // Activar display 1
                digit = 4'b0000;
            end
            2'b01: begin
                anodos = 4'b0010; // Activar display 2
                digit = a;
            end
            2'b10: begin
                anodos = 4'b0100; // Activar display 3
                digit = b;
            end
            2'b11: begin 
                anodos = 4'b1000; // Activar display 4
                digit = c;
            end
            default: begin
                anodos = 4'b0001;
                digit = 4'b1111;
            end
        endcase  
    end

    // controla el segmentos de acuerdo con el digito BCD
    always_comb begin
        case(digit)
            4'd0: segmentos = 7'b0111111; // 0
            4'd1: segmentos = 7'b0000110; // 1
            4'd2: segmentos = 7'b1011011; // 2
            4'd3: segmentos = 7'b1001111; // 3
            4'd4: segmentos = 7'b1100110; // 4
            4'd5: segmentos = 7'b1101101; // 5
            4'd6: segmentos = 7'b1111101; // 6
            4'd7: segmentos = 7'b0000111; // 7
            4'd8: segmentos = 7'b1111111; // 8
            4'd9: segmentos = 7'b1101111; // 9
            default: segmentos = 7'b1111111; // Desactiva los segmentos
        endcase
    end

endmodule