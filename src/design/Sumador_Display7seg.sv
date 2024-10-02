module display (
    input logic clk,
    input logic [15:0] bcd,
    output logic [3:0] anodos,
    output logic [6:0] segmentos
);

    reg [1:0] select=0;

    always_ff @(posedge clk) begin 
        select <= select + 1'b1;        
    end

    //controla activar un display a la vez
    always_comb begin
        case (select) // traduce c/d numero BCD al 7seg correspondiente
            2'b00: anodos = 4'b1110; // Activar display 1
            2'b01: anodos = 4'b1101; // Activar display 2
            2'b10: anodos = 4'b1011; // Activar display 3
            2'b11: anodos = 4'b0111; // Activar display 4
        endcase  
    end

    // controla el segmentos de acuerdo con el digito BCD
    always_comb begin
        case(select)
            2'b00: segmentos = decodificador(bcd[3:0]);    // Dígito menos significativo
            2'b01: segmentos = decodificador(bcd[7:4]);    // Segundo dígito
            2'b10: segmentos = decodificador(bcd[11:8]);   // Tercer dígito
            2'b11: segmentos = decodificador(bcd[15:12]);  // Dígito más significativo
        endcase
    end

    // decodificador de BCD a 7seg
    function logic [6:0] decodificador(input logic [3:0] bcd_digit);
        case(bcd_digit)
            4'd0: decodificador = 7'b1000000; // 0
            4'd1: decodificador = 7'b1111001; // 1
            4'd2: decodificador = 7'b0100100; // 2
            4'd3: decodificador = 7'b0110000; // 3
            4'd4: decodificador = 7'b0011001; // 4
            4'd5: decodificador = 7'b0010010; // 5
            4'd6: decodificador = 7'b0000010; // 6
            4'd7: decodificador = 7'b1111000; // 7
            4'd8: decodificador = 7'b0000000; // 8
            4'd9: decodificador = 7'b0010000; // 9
            default: decodificador = 7'b1111111; // Desactiva los segmentos
        endcase
    endfunction

endmodule