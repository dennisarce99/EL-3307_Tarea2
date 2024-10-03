module SumaTop (
    input logic clk,
    input logic rst,
    input logic operador,
    input logic [3:0] col,
    output logic [3:0] anodos,
    output logic [6:0] segmentos
);
    
    reg [1:0] contador;
    reg [15:0] numero;
    logic [15:0] num1;
    logic [15:0] num2;
    logic [15:0] resultado;

    display Sevens(
        .clk(clk),
        .bcd(numero),
        .anodos(anodos),
        .segmentos(segmentos)
        );
    
    LectorDigitos Entradas(
        .clk(clk),
        .operador(operador),
        .col(col),
        .num(resultado)
        );
        
    suma Adder(
        .clk(clk),
        .num1(num1),
        .num2(num2),
        .resultado(numero)
        );

    always_ff @(posedge clk) begin
        if (contador == 0) begin
            contador <= 0;
        end
        else if (contador == 2'b01) begin
            num1 <= resultado;
        end
        else if (contador == 2'b10) begin
            num2 <= resultado;
        end
        else if (contador == 2'b11) begin
            resultado <= numero;
        end        
    end

    always @(rst) begin
        contador <= contador + 1'b1;
    end

endmodule