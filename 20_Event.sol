pragma solidity ^0.4.0;

contract Event {
    address owner;
    uint public tickets;
    uint constant public price = 1 ether;
    string public description;
    string public website;
    
    mapping(address => uint) public purchasers;
    
    function Event(uint _tickets, string _description, string _website) {
        owner = msg.sender;
        tickets = _tickets;
        description = _description;
        website = _website;
    }
    
    function buyTickets(uint amount) payable {
        if (msg.value != (amount * price) || amount > tickets) {
            revert();
        } else {
            purchasers[msg.sender] += amount;
            tickets -= amount;
            if (tickets == 0) {
                owner.transfer(this.balance);
            }
        }
    }
    
    function refund(uint numTickets) {
        if (purchasers[msg.sender] < numTickets) {
            revert();
        } else {
            msg.sender.transfer(numTickets * price);
            purchasers[msg.sender] -= numTickets;
            tickets += numTickets;
        }
    }
}