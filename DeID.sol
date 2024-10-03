// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedIdentification {
    
    uint public shortID = 0;

    struct User {

        uint256 shortID;
        address DeID;
        bool isVerified;

    }

    User[] public users;

    function registerUser() public {


        address userAddress = msg.sender;
        require(!userExists(userAddress), "You are already registered");
        users.push(User(shortID, msg.sender, false));
        shortID++;

    }

    function userExists(address _user) public view returns(bool){

        for (uint i = 0; i < users.length; i++){
            if (users[i].DeID == _user){
                return true;
            }
        }

        return false;
    }

    function useDeID(uint _shortID) public {
        
        
        users[_shortID].isVerified = false;
    
        if (userExists(msg.sender)){
            for (uint i = 0; i < users.length; i++){
                require(users[i].shortID == _shortID, "Fraud Alert.");
            }
            
        }

    }

    


}