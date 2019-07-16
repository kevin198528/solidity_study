pragma solidity ^0.4.0;

contract Ballot {
   struct Voter {
      uint weight; // weight is accumulated by delegation
      bool voted;  // if true, that person already voted
      address delegate; // person delegated to
      uint vote;   // index of the voted proposal
   }
                                            
   struct Proposal {
      bytes32 name;   // short name (up to 32 bytes)
      uint voteCount; // number of accumulated votes
   }
                                                                        
   address public chairperson;
   mapping(address => Voter) public voters;

   Proposal[] public proposals;

   constructor (bytes32[] proposalNames) public {
      chairperson = msg.sender;
      voters[chairperson].weight = 1;

      for (uint i = 0; i < proposalNames.length; i++) {
         proposals.push(Proposal({
            name: proposalNames[i],
            voteCount: 1
            }));
      }                                                                                                                                                  }
}
