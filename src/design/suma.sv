module suma (
    input logic clk,    // senal de reloj
    input logic [11:0] num1,
    input logic [11:0] num2,
    output logic [12:0] resultado
);
    // asegura que suma solo se realice al inicio de cada ciclo de reloj
    always_ff @( posedge clk ) begin 
        resultado <= num1 + num2;
        
    end
    
endmodule