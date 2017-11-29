/**
 * 
 * CallerContract y CalledContract
 * 
 * En este ejemplo aprenderemos como podemos llamar a funciones de un contrato desde
 * otro contrato distinto, tanto si los hemos desplegado a la vez como si los hemos
 * desplegado en distinto momento. Esto nos permite programar contratos para usarlos 
 * como una librería de funciones y que nuestro código sea más modular.
 *
 * En este caso los dos contratos están en el mismo fichero.
 * 
**/

pragma solidity ^0.4.0;

contract CallerContract {
    CalledContract toBeCalled = new CalledContract();
    
    function getNumber() constant returns(uint) {
        return toBeCalled.getNumber();
    }
}

contract CalledContract {
    
    uint number = 300;
    
    function getNumber()constant returns(uint) {
        return number;
    }
}