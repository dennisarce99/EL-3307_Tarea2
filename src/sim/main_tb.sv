`timescale 1ns/1ps

module main_tb;
    // Declaración de señales
    logic clk;
    logic [11:0] num1, num2;
    logic [12:0] resultado;
    logic [15:0] bcd;
    logic [3:0] anodos;
    logic [6:0] segmentos;

    // Instancia del módulo sumador que queremos probar
    moduleTop top_sumador (
        .clk(clk),
        .num1(num1),
        .num2(num2),
        .resultado(resultado),
        .bcd(bcd),
        .anodos(anodos),
        .segmentos(segmentos)
    );

    // Generación del reloj (un ciclo cada 10 unidades de tiempo)
    always #5 clk = ~clk;

    // Bloque inicial que define el comportamiento del test
    initial begin
        // Inicializar señales
        clk = 0;
        num1 = 12'd0;
        num2 = 12'd0;

        // Prueba 1: Suma de 123 + 456
        num1 = 12'd123;
        num2 = 12'd456;
        $display("Prueba 1: num1 = %d, num2 = %d, resultado = %d | %b", num1, num2, resultado, resultado);
        #40;

        // Prueba 2: Suma de 789 + 210
        num1 = 12'd789;
        num2 = 12'd210;
        $display("Prueba 2: num1 = %d, num2 = %d, resultado = %d", num1, num2, resultado);
         #40;

        // Prueba 3: Suma de 999 + 999 (debería dar un resultado con acarreo)
        num1 = 12'd999;
        num2 = 12'd999;
        $display("Prueba 3: num1 = %d, num2 = %d, resultado = %d", num1, num2, resultado);
        #40;

        // Termina la simulación
        $finish;
    end

    // Monitoreo de señales
    initial begin
        $monitor("Tiempo: %0t | Anodos = %b | Segmentos = %b | BCD = %h", 
                 $time, anodos, segmentos, bcd);
    end
endmodule
