`timescale 1ns/1ps

module pruebatb;
    // Declaración de señales
    logic clock;
    logic reset;
    logic btn_digits;
    logic [3:0] num_ent;
    logic [15:0] num1, num2;
    logic [15:0] resultado;
    logic [3:0] anode;
    logic [6:0] seg;

    // Instancia del módulo sumador que queremos probar
    SumaTop tsumador (
        .clk(clock),
        .rst(reset),
        .operador(btn_digits),
        .col(num_ent),
        .anodos(anode),
        .segmentos(seg)
    );

    // Generación del reloj (un ciclo cada 10 unidades de tiempo)
    always #10 clock = ~clock;

    // Bloque inicial que define el comportamiento del test
    initial begin
        // Inicializar señales
        clock = 0;
        
        num_ent = 4'b0110;
        btn_digits = 1'b1;
        btn_digits = 1'b0;
        num_ent = 4'b0001;
        btn_digits = 1'b1;
        btn_digits = 1'b0;
        num_ent = 4'b0000;
        btn_digits = 1'b1;
        btn_digits = 1'b0;
        num_ent = 4'b0000;
        reset = 1'b1;
        reset = 1'b0;
         
        $display("Prueba 1: num1 = %d, num2 = %d, resultado = %d | %b", num1, num2, resultado, resultado);
        #250;

        $finish;
    end

    // Monitoreo de señales
    initial begin
        $monitor("Tiempo: %0t | Anodos = %b | Segmentos = %b", $time, anode, seg);
    end

    initial begin
        $dumpfile("pruebatb.vcd");
        $dumpvars(0, pruebatb);
    end
endmodule