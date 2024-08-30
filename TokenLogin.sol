// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Variables{
    string public name;
    uint public age;

    function setName(string memory userName) public{
        name = userName;
    } 

    function setAge(uint userAge) public {
        age = userAge;
    }

    function getAge() public view returns(uint){
        return age;
    }

    function getName() public view returns(string memory){
        return name;
    } 

}