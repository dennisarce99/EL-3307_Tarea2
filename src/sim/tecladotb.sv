`timescale 1ns/1ps

module kb_tb;
    logic clock;
    logic reset;
    logic [3:0] columna;
    wire [3:0] fila;

    wire num;

    moduleTop kb_top(
        .clk(clock),
        .rst(reset),
        .col(columna),
        .row(fila)
    );

    initial begin
        clock = 1'b0;
        forever #5 clock = ~clock;
    end

    initial begin
        #10
        columna = 4'b0001;
        $display("Tecla: fila=%b", fila);
        
        #2346
        columna = 4'b0010;
        $display("Tecla: fila=%b", fila);
        
        #157
        columna = 4'b0100;
        $display("Tecla: fila=%b", fila);
        
        #270
        columna = 4'b1000;
        $display("Tecla: fila=%b", fila);
        $finish;
    end

    initial begin
        $dumpfile("kb_tb.vcd");
        $dumpvars(0, kb_tb);
    end

endmodule