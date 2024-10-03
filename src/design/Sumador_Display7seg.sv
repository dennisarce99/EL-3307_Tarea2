module display (
    input logic clk,
    input logic [15:0] bcd,
    output logic [3:0] anodos,
    output logic [6:0] segmentos
);
    logic [3:0] a;
    logic [3:0] b;
    logic [3:0] c;
    logic [3:0] d;
    reg [3:0] digit = 0;
    reg [1:0] select=0;

    assign a = bcd[15:12];
    assign b = bcd[11:8];
    assign c = bcd[7:4];
    assign d = bcd[3:0];

    always_ff @(posedge clk) begin
        select <= select + 1'b1; 
    end

    //controla activar un display a la vez
    always_comb begin
        case (select) // traduce c/d numero BCD al 7seg correspondiente
            2'b00: begin
                anodos = 4'b1110; // Activar display 1
                digit = a;
            end
            2'b01: begin
                anodos = 4'b1101; // Activar display 2
                digit = b;
            end
            2'b10: begin
                anodos = 4'b1011; // Activar display 3
                digit = c;
            end
            2'b11: begin 
                anodos = 4'b0111; // Activar display 4
                digit = d;
            end
            default: begin
                anodos = 4'b0000;
                digit = 4'b0000;
            end
        endcase  
    end

    // controla el segmentos de acuerdo con el digito BCD
    always_comb begin
        case(digit)
            4'd0: segmentos = 7'b1000000; // 0
            4'd1: segmentos = 7'b1111001; // 1
            4'd2: segmentos = 7'b0100100; // 2
            4'd3: segmentos = 7'b0110000; // 3
            4'd4: segmentos = 7'b0011001; // 4
            4'd5: segmentos = 7'b0010010; // 5
            4'd6: segmentos = 7'b0000010; // 6
            4'd7: segmentos = 7'b1111000; // 7
            4'd8: segmentos = 7'b0000000; // 8
            4'd9: segmentos = 7'b0010000; // 9
            default: segmentos = 7'b1111111; // Desactiva los segmentos
        endcase
    end

endmodule