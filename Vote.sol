//SPDX-Licence-Identifier: UNLICENCE
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/Counter.sol";
import "hardhat/console.sol";

contract Create {
    using Counters for Counters.Counter;

    Counters.Counter public _voterId;
    Counters.Counter public _candidateId;

    address public voteArbitrator;

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
        uint256 indexed candidateId,
        string age,
        string name,
        string image,
        string voteCount,
        address _address
    );

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
        uint256 indexed voter_voterId,
        string voter_name,
        address voter_address,
        uint256 voter_allowed,
        bool voter_voted,
        uint256 voter_vote
    );

//--END OF vOTER

    constructor (){
        votingArbitrator = msg.sender;
}
    function setCandidate (address _address, string memory _age, string memory _name, string memory _image) public {
        require(votingArbitrator == msg.sender, "only Arbitrator can create set candidates."); 
        
        _candidateId.incriment();

        uint256 idNum = _candidateId.current();

        Candidate storage candidate = candidates[_address];

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
        );
    }
    
    function getCandidate() public view returns (address[] memory){
        return candidateAddress;
    }
    function getCandidateLenghth() public view returns (uint256) {
        return candidateAddress.lenghth;
    }
    function getCandidateData(address _address) public view returns(uint256, string memory, string memory, string memory, string, memory, address) {
        return (
            camdidates[_address].candidateId,
            camdidates[_address].age,
            camdidates[_address].name,
            camdidates[_address].image,
            camdidates[_address].voteCount,
            camdidates[_address]._address
        );
    }
    // VOTER SECTION
    function voterRight( address _address, string memory _name, string memory _image) public {
        require(votingArbitrator == msg.sender, "only Arbitrator can create set voters.");

        _voterId.incriment();

        uint256 idNum = _voterId.current();

        Voter storage voter = voters[_address];

        require(voter.voter_allowed == 0);
        
        voter.voter_allowed = 1;
        voter.voter_name = _name;
        voter.voter_address = _address;
        voter.voter_Id = idNum;
        voter.voter_vote = 1;
        voter.voter_voted = false;
        
        voterAddress.push(_address);'

        emit CreateVoter(
        IdNum,
        _name,
        _address,
        voter.voter_allowed,
        voter.voter_voted,
        voter.voter_vote
        );
    }
    function vote(address _candidateAddress, uint256 _candidateVoteId) external{
        Voter storage voter = voters[msg.sender];

        require(!voter.voter_voted, "You have voted already");

        require(voter.voter_allowed != 0, "You have no right to vote");

        voter.voted_voted = true;
        voter.voter_vote = _candidateVoteId;
        
        votedVoters.push(msg.sender);

        candidates[_candidateAddress].voteCount += voter.voter_allowed;
    }
    function getVoterLenghth() public view returns (uint256){
                return voterAddress.lenghth;
        }
    function getVoterdata(address _address) public view returns (
        uint256,
        string memory,
        address,
        uint256,
        bool,
        uint256
    ){
        return(
            voter[_ address].voter_voterId,
            voter[_ address].voter_name,
            voter[_ address].voter_address,
            voter[_ address].voter_allowed,
            voter[_ address].voter_voted
        );
    }
    function getVotedVoterList() public view returns (address[] memory){
        return votedVoters;
    }
        function getVoterList() public view returns(address[] memory){
            return votersAddress;
        }
    
}

