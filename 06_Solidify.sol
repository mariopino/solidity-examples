/**
 * 
 * SolidifyKnowledge
 * 
 * En este ejercicio veremos el uso de la palabra require y los eventos
 * 
 * Más información sobre control de errores en:
 * 
 * http://solidity.readthedocs.io/en/develop/control-structures.html#error-handling-assert-require-revert-and-exceptions
 * 
 * 
**/

pragma solidity ^0.4.0;

contract SolidifyKnowledge {
    
    string word;
    uint number;
    address owner;
    
    function SolidifyKnowledge(string _word) {
        word =_word;
        number = 42;
        owner = msg.sender;
    }
    
    // Eventos. Sirven para escribir en el log de la transacción
    event Changed (string _msg, address a);
    
    modifier onlyOwner {
        // Permite definir condiciones (como un if)
        require(msg.sender == owner);
        _;
    }
    
    function getWord() constant returns (string) {
        return word;
    }
    
    function setWord(string w) onlyOwner {       
        word = w;
        Changed('Variable word changed!', msg.sender);
    }
}

