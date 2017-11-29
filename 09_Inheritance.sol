/**
 * 
 * Inheritance
 * 
 * Ejemplo de herencia en solidity. Los contratos User y Provider heredan el inicializador y las funciones del contrato mortal.
 * 
 * 
**/

pragma solidity ^0.4.0;

contract mortal {
    address public owner;
    
    function mortal() {
        owner = msg.sender;
    }
	
    modifier onlyOwner {
        if (msg.sender != owner) {
            revert();
        } else {
            _;
        }
    }
    
	function kill() onlyOwner {
		// Transfiere los fondos del contrato al creador y detiene la ejecución del contrato.
        selfdestruct(owner);
    }
}

contract User is mortal {
    string public userName;
    
    function User(string _name) {
        userName = _name;
    }
}

contract Provider is mortal {
    string public providerName;
    
    function Provider(string _name) {
        providerName = _name;
    }
}