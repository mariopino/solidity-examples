/**
 * 
 * PayCheck
 *
 * En este ejemplo se permite retirar fondos a una lista de direcciones de empleados.
 * Los ether del contrato se dividirán en partes iguales y cada empleado solo podrá 
 * retirar su parte con la función withdraw.
 * 
**/

pragma solidity ^0.4.0;

contract PayCheck {
    
    address[] employees = [
        0xca35b7d915458ef540ade6068dfe2f44e8fa733c,
        0x14723a09acff6d2a60dcdf7aa4aff308fddc160c,
        0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db,
        0x583031d1113ad414f02576bd6afabfb302140225
    ];
    
    uint totalReceived = 0;
    
    mapping (address => uint) withdrawnAmounts;
	
	modifier canWithDrawn() {
        bool contains = false;
        for(uint i = 0; i < employees.length; i++) {
            if (employees[i] == msg.sender) {
                contains = true;
            }
        }
        require(contains);
        _;
    }
    
    function withdraw() canWithDrawn {
        uint amountAllocated = totalReceived/employees.length;
        uint amountWithdrawn = withdrawnAmounts[msg.sender];
        uint amount = amountAllocated - amountWithdrawn;
        withdrawnAmounts[msg.sender] = amountWithdrawn + amount;
        if (amount> 0) {
            msg.sender.transfer(amount);
        }
    }
    
    function PayCheck() payable {
        updateTotal();
    }
	
    function updateTotal() internal {
        totalReceived += msg.value;
    }   
}