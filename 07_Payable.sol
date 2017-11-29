/**
 * 
 * PayableContract
 * 
 * En este ejemplo veremos el modificador payable que podemos asignar a una función
 * para que esta pueda recibir fondos, así de fácil.
 * 
**/

pragma solidity ^0.4.0;

contract PayableContract {
    function PayableContract() {
        
    }
    
	// La función tiene el modificador payable, que la hace capaz de recibir fondos.
	// En Remix especificar la cantidad de ethers a enviar con el parámetro Value.
    function receiveFunds() payable {
        
    }
    
	// Devuelve el balance del contrato en WEIs. Más información sobre las unidades del ether en http://ethdocs.org/en/latest/ether.html)
    function getBalance() constant returns(uint) {
        return this.balance;
    }
}