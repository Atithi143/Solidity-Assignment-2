// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Election2022 {
    //defining structure with mutliple candidate variables
    struct Candidate{
        bool approved;
        address id;
        uint voteCount;
        string candidateName;
    }
    
    //Giving references using mapping
    mapping (address=>bool) public voters;

    mapping (uint=> Candidate)public candidates;

    address ecadmin;
    address ec;

    uint public candidatesCount;
    uint256 public startTime;
    uint256 public stopTime;


    constructor( address _admin) {
        ecadmin = _admin;
    }

    modifier ecOnly() {
        require(msg.sender == address(ec),"EC only operation");
        _;
    }

    modifier ecAdminOnly() {
        require(msg.sender == ecadmin,"EC admin only operation");
        _;
    }

    function setEC(address _ec) public ecAdminOnly {
        ec = _ec;
    }

    function addCandidate(string memory _name) public payable  {
        require(msg.value >= 0.1 ether,"Appropraite ether not next");
        // is the candidate already registered.
        candidatesCount++;
        candidates[candidatesCount]=Candidate(false,msg.sender,0,_name);

        (bool success, ) = payable(ec).call{value: msg.value}("");
        // bool success = payable(ec).send(msg.value);
        // payable(ec).transfer(msg.value);
        require(success, "Failed to send Ether");
    }   

    function approveCandidiate(uint256 num) external ecOnly {
        require(candidates[num].id != address(0x00), "Not registered" );
        require(candidates[num].approved == false, "Already approved" );
        candidates[num].approved = true;
    }

    function setStart(uint256 num) external ecOnly {
        require(num > block.timestamp,"Start at later time" );
        startTime = num;
    }

    function setStop(uint256 num) external ecOnly {
        require(num > block.timestamp && num > startTime,"Stop at later time" );
        stopTime = num;
    }
   
    
    function getResults() public view returns (Candidate memory candidate) {
        require(block.timestamp >= stopTime,"Election yet to finish" );
        uint256 c;
        uint256 max=0;
        for( uint i =1; i<=candidatesCount; i++) {
            if ( candidates[i].voteCount > max ) {
                max = candidates[i].voteCount;
                c = i;
            }
        }

        return candidates[c];
    }

    //SELF DESTRUCT : 
    function selfDestruct() public  {
        selfdestruct(payable(msg.sender));
    }

}
