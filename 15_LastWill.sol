/**
 * 
 * Last Will
 *
 * En este ejemplo implementaremos el pago de una herencia. Por una parte tenemos al
 * padre, que para demostrar que está vivo deberá apretar un botón cada cierto tiempo 
 * (en este caso será cada 5 minutos o 300 segundos).
 * 
 * El padre puede añadir las direcciones de sus hijos y sus hijos pueden pulsar un botón 
 * para comprobar si el padre está vivo y cobrar su herencia. Si en ese momento se 
 * comprueba que el padre ha muerto los fondos de la herencia se repartirán en partes 
 * iguales entre sus hijos.
 * 
 * Los fondos de la herencia se asignarán en el momento de la creación del contrato o 
 * bien desde la función depositFunds.
 * 
**/

pragma solidity ^0.4.0;

contract LastWill {
    address owner;
    
    uint256 public lastTouch;
    
    address[] public childs;
    
    event Status(string _msg, address user, uint256 time);
    
    function LastWill() payable {
        owner = msg.sender;
        lastTouch = block.timestamp;
        Status('Last Will Was Created!', msg.sender, block.timestamp);
    }
    
    modifier onlyOwner() {
        if (owner != msg.sender) {
            revert();
        } else {
            _;
        }
    }
    
    function depositFunds() payable {
        Status('Funds Were Deposited!', msg.sender, block.timestamp);
        
    }
    
    function stillAlive() onlyOwner {
        lastTouch = block.timestamp;
        Status('I Am Still Alive!', msg.sender, block.timestamp);   
    }
    
    function isDead() {
        
        Status('Asking If Dead!', msg.sender, block.timestamp);
        if (block.timestamp >(lastTouch + 120)) {
            giveMoneyToChilds();
        } else {
            Status('I Am Not Dead You Bastard!', msg.sender, block.timestamp);
        }
    }
    
    function addChild(address _address) onlyOwner {
        Status('New Child Added', msg.sender, block.timestamp);
        childs.push(_address);
        
    }
    
    function giveMoneyToChilds() {
        Status('I Am Dead, Hope You Cried, Take My Money!', msg.sender, block.timestamp);
        uint amountPerChild = this.balance / childs.length;
        
        for(uint i = 0; i < childs.length; i++) {
            childs[i].transfer(amountPerChild);
        }
    }
}