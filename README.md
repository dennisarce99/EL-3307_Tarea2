# Tarea 2: Diseño digital sincrónico en HDL

## 1. Introducción
En esta tarea se implementa un sistema digital que permite realizar la suma de dos números binarios y desplegar el resultado en un conjunto de displays de 7 segmentos. El diseño incluye varios módulos que trabajan de manera conjunta para lograr el objetivo de hacer la suma de dos números de 12 bits, convertir el resultado de la suma a un formato adecuado para su visualización y poder controlar los displays de forma sincronizada. A partir del diseño, se asegura que el resultado de la suma sea correctamente mostrado en los displays, garantizando la sincronización con el reloj del sistema y una correcta decodificación de los números.

## 2. Objetivos
- Elaborar una implementación de un diseño digital sincrónico en una FPGA.
- Implementar una sencilla función de suma aritmética en un HDL.
- Implementar un algoritmo de despliegue de datos en tres dispositivos de 7 segmentos.

## 3. Propuesta de Solución
### 3.1. Abreviaturas y definiciones
- **FPGA**: Field Programmable Gate Arrays
- **FSM**: Máquinas de estados finitos

### 3.2 Descripción general del sistema
Se desarrolló un sistema para mostrar el resultado de la suma de dos números binarios en displays de 7 segmentos, utilizando varios módulos interconectados. El diseño incluye un módulo de lector del número que lee los dígitos de entrada y construye el número de 16 bits para después poder realizar la suma. Luego el módulo de suma se encarga de realizar la operación de ambos números. El resultado de la suma se convierte a BCD (Binary Coded Decimal) mediante el módulo del despliegue de 7 segmentos, donde se gestiona la multiplexación de los 4 displays de 7 segmentos, mostrando los dígitos en formato BCD uno a la vez, controlando tanto los ánodos como los segmentos. El sistema es sincrónico, operando bajo un reloj que asegura que la suma, la conversión y el despliegue se realicen de manera coordinada y eficiente.

### 3.3 Subsistema de lectura del teclado mecánico hexadecimal
Al diseño final no se pudo implementar el teclado hexadecimal funcional, así que se decidió utilizar un DIP switch como reemplazo para las entradas del subsistema de lectura de datos.

#### 3.3.1 Módulo 1 (Lector de número)
##### 1. Encabezado del módulo
```SystemVerilog
module LectorDigitos (
    input logic clk,
    input logic operador,
    input logic [3:0] col,
    output logic [15:0] num
    );
```
##### 2. Parámetros
- Este módulo no utilza parámetros.

##### 3. Entradas y salidas:
- `clk`: entrada de señal de que sincroniza las operaciones secuenciales del módulo.
- `operador`: entrada de señal control que indica cuándo se debe capturar un nuevo dígito.
- `col`: entrada de 4 bits que representa el código del dígito leído.
- `num`: salida de registro de 16 bits que contiene el número construido a partir de los dígitos ingresados.

##### 4. Criterios de diseño
Para poder capturar un número y así poder realizar la suma, se realizó el siguiente diseño para leer una secuencia de dígitos de entrada y construir un número de 16 bits a partir de ellos. Este módulo es útil en sistemas digitales donde se requiere capturar múltiples dígitos ingresados, por ejemplo, desde un teclado matricial o una interfaz similar, y combinarlos para formar un número completo que pueda ser procesado o visualizado posteriormente.

Diagramas...

##### 5. Testbench
El testbench recibe números en codificación binaria y simula que los botones se presionen para ingresar los dígitos y realizar la suma aritmética de ambos.

### 3.4 Subsistema de suma aritmética de los dos datos 
#### 3.4.1 Módulo 2 (Suma de dos datos binarios)
##### 1. Encabezado del módulo
```SystemVerilog
module suma (
    input logic clk,   
    input logic [11:0] num1,
    input logic [11:0] num2,
    output logic [12:0] resultado
    );
```
##### 2. Entradas y salidas:
- `num1`: entrada de primer dato en binario. 
- `num2`: entrada de segundo dato en binario.
- `resultado`: salida que transporta la suma de los dos datos en binario.

##### 3. Criterios de diseño
Este módulo se encarga de tomar dos números binarios de 12 bits (num1 y num2) y realizar la suma de ambos. El resultado (resultado) es un valor binario de 13 bits para manejar el acarreo que podría generarse al sumar números grandes. La suma se realiza en el flanco positivo del reloj para garantizar que el proceso sea sincrónico.

Diagramas

##### 4. Testbench
El testbench probó que los dos números binarios si realizan la suma entre ambos y que estuviera correcta. Además de verificar que el resultado si sea el correcto, también es lo suficientemente grande para manejar el acarreo que podría generarse al sumar números grandes.

### 3.5 Subsistema de despliegue de código decodificado en display de 7 segmentos
#### 3.5.1 Módulo 3 (Despliegue del número decimal en 7 segmentos)
##### 1. Encabezado del módulo
```SystemVerilog
module display (
    input logic clk,
    input logic [15:0] bcd,
    output logic [3:0] anodos,
    output logic [6:0] segmentos
    );
```

##### 3. Entradas y salidas:
- `clk`: entrada de reloj
- `bcd`: entrada de dato en BCD 
- `anodos`: salida del display que se tiene que encender
- `segmentos`: salida del numero que va mostrar el 7 segmentos

##### 4. Criterios de diseño
El módulo se encarga de mostrar un número de 4 dígitos en BCD en 4 displays de 7 segmentos, integrando la suma y la conversión a BCD que se realizaron en los módulos anteriores. Utiliza multiplexación para controlar cada display de manera secuencial, activando solo uno a la vez mediante la señal de reloj. También incluye un decodificador para traducir cada dígito BCD al código correspondiente para los 7 segmentos.
Diagramas...

##### 5. Testbench
El testbench mostró que los displays enciendan uno a la vez y que ewstos cambien cada flanco de reloj.

## 4. Análisis simulación funcional
La simulación general del sistema genera una señal de reloj que cambia cada 5 ns, durante estos cambios se introducen números en bianrio que simulan la entrada de datos del DIP switch y también se simula el presionar el botón que cambia el dígito para ingresar y el botón que cambia el número y hace la suma, y al final e muestran en la consola el valor del primer y segundo número, y el resultado de la suma. Además, también en la se muestra cada cierta cantidad de tiempo el valor de los displays encendidos y los segmentos encendidos de los displays.

## 5. Análisis consumo de recursos
```SystemVerilog
=== SumaTop ===

   Number of wires:                 63
   Number of wire bits:            176
   Number of public wires:          63
   Number of public wire bits:     176
   Number of memories:               0
   Number of memory bits:            0
   Number of processes:              0
   Number of cells:                 99
     DFF                             2
     DFFE                            2
     DFFRE                          24
     IBUF                            7
     LUT1                           14
     LUT2                           23
     LUT3                            5
     LUT4                            7
     MUX2_LUT5                       4
     OBUF                           11
```
```SystemVerilog
Info: Device utilisation:
Info: 	                 VCC:     1/    1   100%
Info: 	               SLICE:    74/ 8640     0%
Info: 	                 IOB:    18/  274     6%
Info: 	                ODDR:     0/  274     0%
Info: 	           MUX2_LUT5:     4/ 4320     0%
Info: 	           MUX2_LUT6:     0/ 2160     0%
Info: 	           MUX2_LUT7:     0/ 1080     0%
Info: 	           MUX2_LUT8:     0/ 1056     0%
Info: 	                 GND:     1/    1   100%
Info: 	                RAMW:     0/  270     0%
Info: 	                 GSR:     1/    1   100%
Info: 	                 OSC:     0/    1     0%
Info: 	                rPLL:     0/    2     0%
```

## 6. Reporte de velocidades máximas de reloj


## 7. Conclusiones
Para sistemas que necesitan mantener un dato por cada ciclo de operación las FSM son una gran respuesta para esta situación. En este caso, se planteó una FSM para guardar los números ingresados para luego realizar la suma. Los números se ingresaron por medio de DIP switch ya que no se pudo implementar el teclado matricial. Los FSM deben estar bien definidas sus siguientes estados para que no provoquen problemas y no se pierdan los datos o se tomen datos incorrectos. Se realizó la decodificación de los números en binario para los  displays 7 segmentos con el uso de la función case. Los displays 7 segmentos encienden uno a la vez, esto por medio de FSM controlados por flancos positivosdel reloj interno de la FPGA.

## 8. Problemas encontrados durante el proyecto
- Hubo problemas al definir las FSM que se utilizaron.
- Al realizar las FSM, se creaban latches de manera accidental, con variables no definidas correctamente.
- No se pudieron tomar correctamente las teclas presionadas del teclado hexadecimal.

## 9. Referencias
[0] David Harris y Sarah Harris. *Digital Design and Computer Architecture. RISC-V Edition.* Morgan Kaufmann, 2022. ISBN: 978-0-12-820064-3

## Apendices:
### Apendice 1:
texto, imágen, etc
