/**
 * CoinFlip
 * 
 * Juego de casino para apostar a cara o cruz. Se usa el timestamp del bloque de la blockchain
 * para simular un número random entre 0 y 1. Si el timestamp del bloque es un número par el
 * usuario gana el 190% del dinero invertido, si es un número impar pierde los ethers jugados.
 *
 * Al desplegar el contrato es necesario transferirle fondos para que pueda pagar el premio si
 * el usuario gana.
 * 
**/

pragma solidity ^0.4.0;

contract CoinFlip {
    address owner;
    uint payPercentage = 90;
    
    event Status(string _msg, address user, uint amount);
    
    function CoinFlip() payable {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        if (owner != msg.sender) {
            revert();
        } else {
            _;
        }
    }
    
    function FlipCoin() payable {
        if ((block.timestamp % 2) == 0) {
			
            if (this.balance < (msg.value * ((100 + payPercentage) / 100))) {
				// No tenemos suficientes fondos para pagar el premio, así que transferimos todo lo que tenemos
                Status('Congratulations, you win! Sorry, we didn\'t have enought money, we will deposit everything we have!', msg.sender, msg.value);
                msg.sender.transfer(this.balance);
            } else {
                Status('Congratulations, you win!', msg.sender, msg.value * (100 + payPercentage) / 100);
                msg.sender.transfer(msg.value * (100 + payPercentage) / 100);
            }
        } else {
			Status('Sorry, you loose!', msg.sender, msg.value);
		}
    }
    
    function kill() onlyOwner {
        Status('Contract was killed, contract balance will be send to the owner!', msg.sender, this.balance);
        suicide(owner);
    }
}