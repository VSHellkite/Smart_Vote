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
}
