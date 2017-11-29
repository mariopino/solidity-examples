/**
 * 
 * Savings
 * 
 * Este contrato sirve para crear una cuenta de ahorros en la que solo el propietario puede
 * consultar el balance, añadir o retirar fondos.
 * 
**/

pragma solidity ^0.4.0;

contract Savings {
    address owner;
    
    event UpdateStatus(string _msg);
    event UserStatus(string _msg, address user, uint amount);
    
    function Savings() {
        owner = msg.sender;
    }
    
	modifier onlyOwner() {
        if (owner != msg.sender) {
            revert();
        } else {
            _;
        }
    }
    
    function kill() onlyOwner {
        suicide(owner);
    }
    
    function depositFunds(uint amount) payable {
        if (owner.send(amount)) {
            UserStatus('User has deposit some money!', msg.sender, msg.value);
        }
    }
    
	function withdrawFunds(uint amount) onlyOwner {
        if (owner.send(amount)) {
            UpdateStatus('User withdraw some money!');
        }
    }
    
	function getFunds() onlyOwner constant returns(uint) {
        return this.balance;
    }
    
}