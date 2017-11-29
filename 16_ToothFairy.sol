/**
 * 
 * Tooth Fairy
 * 
 * El hada de los dientes es el equivalente de nuestro ratoncito Pérez. En este ejemplo 
 * tendremos tres roles: un padre, una madre y un hijo. El hijo puede informar de que el 
 * diente se le ha caido, la madre tiene que confirmar que es cierto y finalmente el 
 * padre (el hada :-)) le transferirá el regalo al hijo.
 * 
 * Como novedad usaremos un nuevo tipo de dato llamado enum, que nos servirá para controlar 
 * el estado del diente.
 * 
**/

pragma solidity ^0.4.0;

contract ToothFairy {
    address child;
    address mother;
    address toothFairy;
    
    bool toothPaid = false;
    
    enum ToothState{Mouth, WaitingFallenAproval, Fallen}
    
    ToothState public toothState = ToothState.Mouth;
    
    function ToothFairy(address _child, address _mother) payable {
		child = _child;
		mother = _mother;
        toothFairy = msg.sender;
    }
    
    modifier onlyChild {
        if(msg.sender != child) {
            revert();
        } else {
            _;
        }
    }
    
    modifier onlyFairy {
        if(msg.sender != toothFairy) {
            revert();
        } else {
            _;
        }
    }
    
    modifier onlyMother {
        if(msg.sender != mother) {
            revert();
        } else {
            _;
        }
    }    
    
    function toothFall() onlyChild {
        if (toothState == ToothState.Mouth) {
            toothState = ToothState.WaitingFallenAproval;
        } else {
            revert();
        }
    }
    
    function motherAproves() onlyMother {
        if (toothState == ToothState.WaitingFallenAproval) {
            payToChild();
            toothState = ToothState.Fallen;
        }
    }
    
    function payToChild() {
        if (toothState == ToothState.WaitingFallenAproval && toothPaid == false) {
            child.transfer(this.balance);
            toothPaid = true;
        } else {
            revert();
        }
    }
	
	function kill() {
		selfdestruct(toothFairy);
	}
}