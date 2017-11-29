/**
 * 
 * HelloWorldContract
 * 
 * En este ejercicio veremos el inicializador o constructor, una función que tiene
 * el mismo nombre que el contrato y que solo se ejecuta una vez en la creación del
 * mismo. Usaremos esta función para asignar la propiedad del contrato a la dirección
 * desde la que se desplegó. Para obtener esta dirección usaremos la variable global
 * msg, que contiene los datos de la transacción actual. A continuación aprenderemos 
 * como limitar la ejecución de la función setter setWord() para que solo el propietario
 * del contrato pueda llamarla.
 * 
 * Ver: http://solidity.readthedocs.io/en/develop/miscellaneous.html#global-variables
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
	
	// Función getter para obtener el valor de la variable word
    function getWord() constant returns(string) {
        return word;
    }
    
	// Función setter para modificar el valor de la variable word
    function setWord(string newWord) returns(string) {
		if (owner != msg.sender) {
		    return 'No eres el creador del contrato!';
		}
        word = newWord;
        return 'Si eres el creador del contrato!';
    }
}