/**
 * 
 * HelloWorldContract
 * 
 * En esta nueva versión del contrato HelloWorldContract limitaremos la ejecución de la 
 * función setter setWord(), pero lo haremos de una manera más limpia empleando un
 * modificador, lo que nos permitirá reutilizar el código en otras funciones
 *
 * Ver modificadores ya incluidos: http://solidity.readthedocs.io/en/develop/miscellaneous.html#modifiers
 * 
**/

pragma solidity ^0.4.0;

contract HelloWorldContract {
    string word = 'Hello World!';
	address owner;
	
	// Inicializador. Solo se llama una vez en la creación del contrato!
	function HelloWorldContract() {
	    owner = msg.sender;
	}
	
	// Modificador. Permite reutilizar este código en otras funciones
	modifier onlyOwner {
	    if (owner != msg.sender) {
			// Si la dirección que llama a la función no es la del propietario revertir la transacción
	        revert();
	    } else {
			// Si es la dirección del propietario continua con la ejecución del código
	        _;
	    }
	}

    function getWord() constant returns(string) {
        return word;
    }
    
    function setWord(string newWord) onlyOwner returns(string) {
        word = newWord;
        return 'Sí eres el creador del contrato!';
    }
}