/**
 * 
 * Seminar
 * 
 * En este ejemplo de código crearemos un sistema de registro para un seminario. El
 * propietario del contrato podrá introducir la tasa de asistencia (¡en WEIs!), mientras
 * que los asistentes podrán registrarte pagando esa tasa. En el caso de que algún
 * asistente cambie de idea, podrá cancelar el registro recuperando el 80% del dinero.
 * 
**/

pragma solidity ^0.4.0;

contract Seminar {
	address owner;

    struct Person {
        string name;
        uint age;
        bool active;
    }
    
    uint public fee;
    uint loss = 80;
	
	mapping(address => Person) public attendants;
	
	//event Log(string _msg, address _address);
    
	function Seminar() payable{
		owner = msg.sender;
	}
	
	modifier onlyOwner() {
        if (owner != msg.sender) {
            revert();
        } else {
            _;
        }
    }
    
    function Register(string _name, uint _age) payable {
        if(msg.value >= fee) {
            attendants[msg.sender] = Person({
                name: _name,
                age: _age,
                active: true
            });
			//Log('User Registered!', msg.sender);
        } else {
		//Log('User Register Error!', msg.sender);
            revert();
        }
    }
    function setRegistrationFee(uint256 _fee) {
        fee = _fee;
		//Log('Registration Fee Changed!', msg.sender);
    }
    
    function cancelRegistration() {
        attendants[msg.sender].active = false;
        msg.sender.transfer(fee * loss / 100);
		//Log('User Registration Cancelled!', msg.sender);
    }
	
	function kill() onlyOwner {
		//Log('Contract Killed!', msg.sender);
        selfdestruct(owner);
    }
}