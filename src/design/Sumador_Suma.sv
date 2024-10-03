module suma (
    input logic clk,    // senal de reloj
    input logic [15:0] num1,
    input logic [15:0] num2,
    output logic [15:0] resultado
);

    reg [15:0] num;

    // asegura que suma solo se realice al inicio de cada ciclo de reloj
    always_ff @( posedge clk ) begin
        if (num1 != 0 && num2 != 0) begin
           num <= num1+num2; 
        end
    end

    assign resultado = num;

endmodule