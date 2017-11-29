/**
 * 
 * String Utils
 * 
 * Ejemplo de uso de la librería externa solidity-stringutils alojada en GitHub. 
 * Solidity carece de funciones básicas para el tratamiento de cadenas que podemos 
 * solventar utilizando esta librería.
 *
 * Doc: https://github.com/Arachnid/solidity-stringutils
 * 
 * Ejecutar en https://remix.ethereum.org/
 * 
**/

import "github.com/Arachnid/solidity-stringutils/strings.sol";

contract StringUtils {
    using strings for *;
    
	string str = "Unicode snowman ☃";
    uint len;
    
    event Event(string _msg, uint num);
	
    function setWord() returns(uint) {
	    len = str.toSlice().len(); // 17
	    Event(str, len);
	    return len;
    }
    
    function getWord() constant returns(uint) {
        Event(str, len);
        return len;
    }
}