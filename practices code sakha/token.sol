// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract StepUpToken {

    address owner;
    uint totalNumofToken;
    string name = "StepUpToken";
    string symbol = "SU";
    
    
    mapping(address=>uint) balances;

    constructor(uint _total) {
        totalNumofToken = _total;
        balances[msg.sender] = _total;
    }

    function getBalance(address someone) public view returns (uint) {
        return balances[someone];
    }

    function transfer(address receiver, uint tokens) public {
        require(balances[msg.sender] >= tokens,"Not enough tokens");

        balances[msg.sender] = balances[msg.sender] - tokens;
        balances[receiver] = balances[receiver] + tokens;

    }

    //burn -> 0x00 / 
    //update-> totalNumofToken
    function burn(uint256_value)public returns(bool success){
        require(balanceof[msg.sender]>=_value);
        balanceof[msg.sender]-=_value;
        totaltoken-=_value;
    }
    
    //update token
    function updateBal(uint tokens) public {
       
       balances[msg.sender]=balances[msg.sender]+tokens;

    }
}
