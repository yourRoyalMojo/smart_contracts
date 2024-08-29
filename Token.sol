//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Token{

    address public owner;
    uint public currentAmount;

    constructor(){
        owner = msg.sender;
    }

    function getOwner() public view returns(address){
        return owner;
    } 

    function receiveTokens() public payable {
        require(msg.value>1,"Value must be greater than 1.");
    }

    function sendTokens(address payable  _to) public payable {
        require(msg.value>1,"value must be greater than 1.");
        (bool sent,bytes memory data) = _to.call{value: msg.value}("");
        require(sent,"Failed to send");
    }

    function getBalance(address account) public view returns(uint){
        return account.balance;
    } 



}