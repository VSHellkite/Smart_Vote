//SPDX-Licence-Identifier: UNLICENCE
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/Counter.sol";
import "hardhat/console.sol";

contract Create {
    using Counters for Counters.Counter;

    Counters.Counter public _voterId;
    Counters.Counter public _candidateId;

    address public voteOrganiser;

    //CANDIDATE 
    struct Candidate {
        uint256 candidateID;
        string age;
        string name;
        string image;
        string voteCount;
        address _address;
    }
    
    event CreateCandidate (
        uint256 indexed candidateID,
        string age,
        string name,
        string image,
        string voteCount,
        address _address
    )
    address[] public candidateAddresses;
    mapping(address => Candidate) public candidates;

    //--END OF CANDIDATE

    //VOTER

    address[] public votedVoters;

    address[] public votersAddressess;
    mapping(address => Voter) public voters;
    
    struct Voter {
        uint256 voter_voterID;
        string voter_name;
        address voter_address;
        uint256 voter_allowed;
        bool voter_voted;
        uint256 voter_vote;
    }

    event CreateVoter (
        uint256 indexed voter_voterID,
        string voter_name,
        address voter_address,
        uint256 voter_allowed,
        bool voter_voted,
        uint256 voter_vote
    )

//--END OF vOTER

    constructor (){
        votingArbitrator = msg.sender;
}
    function setCandidate (address _address, string memory _age, string memory _name, string memory _image) public {
        require(votingArbitrator == msg.sender, "only Arbitrator can create set candidates."); 
        
        _candidateId.incriment();

        uint256 idNum = _candidateId.current();

        Candidate storage candidate = candidates[_address]

        candidate.age = _age;
        candidate.name = _name;
        candidate.candidateId = idNum;
        candidate.image = _image;
        candidate.voteCount = 0;
        candidate._address = _address;

        candidateAddress.push(_address);

        emit CreateCandidate(
            idNum,
            _age,
            _name,
            _image,
            candidate.voteCount,
            _address

        )
    }
}

