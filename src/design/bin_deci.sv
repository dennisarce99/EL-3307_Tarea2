module bin_decimal ( //usando el algoritmo de doble dabble
    input [11:0] binario,
    output reg [15:0] // salida BCD 4 digitos
    
);
integer i;
    always @ (binario) begin
        bcd = 0;  // Inicializar BCD a 0
        for (i = 0; i < 12; i = i + 1) begin
            bcd = {bcd[14:0], binario[11-i]}; // Shift left
            // Si cualquier grupo de 4 bits en BCD es mayor o igual a 5, suma 3
            if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;
            if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
            if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
            if (bcd[15:12] >= 5) bcd[15:12] = bcd[15:12] + 3;
        end
    end


    
endmodule