pragma solidity ^0.4.0;

contract AirCoin {
   address public owner;
   mapping (address => uint) public balances;

   event SentEvent(address from, address to, uint amount);

   constructor () public {
      owner = msg.sender;
   }

   function createCoin(address receiver, uint amount) public {
      if (msg.sender != owner) return;
      balances[receiver] += amount;
   }

   function send(address receiver, uint amount) public {
      if (balances[msg.sender] < amount) return;
      balances[msg.sender] -= amount;
      balances[receiver] += amount;
      emit SentEvent(msg.sender, receiver, amount);
   }
}
