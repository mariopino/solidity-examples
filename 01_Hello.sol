/*
 * 
 * Ejemplo de contrato inteligente más sencillo posible. En el definimos una variable,
 * una función getter getWord() que nos va a mostrar el contenido de la variable, y una
 * función setter setWord() que nos va a hacer posible modificar esta variable.
 * 
 * Ver: http://solidity.readthedocs.io/en/develop/structure-of-a-contract.html
 * 
**/

pragma solidity ^0.4.0;

contract HelloWorldContract {
    string word = 'Hello World!';
	
	// Función getter para obtener el valor de la variable word
    function getWord() constant returns(string) {
        return word;
    }
    
	// Función setter para modificar el valor de la variable word
    function setWord(string newWord) returns(string) {
        word = newWord;
        return word;
    }
}