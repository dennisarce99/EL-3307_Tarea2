`timescale 1ns/1ps

module main_tb;
    // Declaración de señales
    logic clk;
    logic [11:0] num1, num2;
    logic [12:0] resultado;

    // Instancia del módulo sumador que queremos probar
    suma plus(
        .clk(clk),
        .num1(num1),
        .num2(num2),
        .resultado(resultado)
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
        #10;
        num1 = 12'd123;
        num2 = 12'd456;
        #10;
        $display("Prueba 1: num1 = %d, num2 = %d, resultado = %d", num1, num2, resultado);

        // Prueba 2: Suma de 789 + 210
        #10;
        num1 = 12'd789;
        num2 = 12'd210;
        #10;
        $display("Prueba 2: num1 = %d, num2 = %d, resultado = %d", num1, num2, resultado);

        // Prueba 3: Suma de 999 + 999 (debería dar un resultado con acarreo)
        #10;
        num1 = 12'd999;
        num2 = 12'd999;
        #10;
        $display("Prueba 3: num1 = %d, num2 = %d, resultado = %d", num1, num2, resultado);

        // Termina la simulación
        #10;
        $finish;
    end
endmodule
