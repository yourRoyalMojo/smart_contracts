// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenLogin{
    string public name;
    uint public age;
    address userAddress;

    constructor(uint userAge, string memory userName){
        name = userName;
        age = userAge;
        userAddress = msg.sender;
    }

    function getAge() public view returns(uint){
        return age;
    }

    function getName() public view returns(string memory){
        return name;
    }

    function getAddress() public view returns(address){
        return userAddress;
    }

}
