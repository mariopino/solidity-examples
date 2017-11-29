// Añadir eventos para hacerlo más interesante
pragma solidity ^0.4.0;

contract SalesContract {
    address public owner;
    bool public isSold = false;
    string public salesDescription = 'VW California';
    uint public price = 1 ether;
    
    function SalesContract() {
        owner = msg.sender;
    }
    
    function buy() payable {
        if (msg.value >= price) {
            owner.transfer(this.balance);
            owner = msg.sender;
            isSold = true;
        } else {
            revert();
        }
    }
}