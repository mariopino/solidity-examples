/**
 * 
 * Communications 2
 * 
 * Otro ejemplo de comunicación entre contratos. En este caso se usa el contrato Math 
 * para definir una librería de funciones matemáticas que serán la base de la funcionalidad 
 * del contrato Calculator.
 *
 * En este ejemplo usaremos la palabra reservada new para crear una instancia del contrato Math. 
 * 
**/

pragma solidity ^0.4.0;

contract Calculator {
    Math math = new Math();
    
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