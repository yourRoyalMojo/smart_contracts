// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedIdentification {

    string public lastName;
    uint24 public birthDate;
    uint16 public idNumber;
    string public idString;


    constructor(string memory _lastName,uint24 _birthDate) {
        
        lastName = _lastName;
        birthDate = _birthDate;

    }

    function setUserID() public {

        bytes memory byteString = bytes(lastName);
        bytes32 firstByte = byteString[0];
        bytes32 secondByte = byteString[2];
        bytes32 thirdByte = byteString[4];
        string memory firstLetter = string(abi.encodePacked(firstByte));
        string memory secondLetter = string(abi.encodePacked(secondByte));
        string memory thirdLetter = string(abi.encodePacked(thirdByte));
        string memory toAdd = string(abi.encodePacked(firstLetter,secondLetter));
        idString = string(abi.encodePacked(toAdd,thirdLetter));
    

    }

    function getUserID() public view returns(string memory){
        return idString;
    }

}