/**
 * 
 * Communications 2
 * 
 * Otro ejemplo de comunicación entre contratos. En este caso se usa el contrato Math 
 * para definir una librería de funciones matemáticas que serán la base de la funcionalidad 
 * del contrato Calculator.
 *
 * En este ejemplo en lugar de instanciar un nuevo contrato de tipo Math usaremos la 
 * dirección de un contrato Math ya creado.
 * 
**/

pragma solidity ^0.4.0;

contract Calculator {
    Math math = Math(0x692a70d2e424a56d2c6c27aa97d1a86395877b3a);
    
    function twoPlusFour() constant returns(int) {
        return math.add(2, 4);
    }
    
    function twoTimesFour() constant returns(int) {
        return math.multiply(2, 4);
    }
}


contract Math {
    function add(int a, int b) returns(int) {
        return a + b;
    }
    function multiply(int a, int b) returns(int) {
        return a * b;
    }
}