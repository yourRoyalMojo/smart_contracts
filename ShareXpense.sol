// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ShareXpense{

    ERC20 public avengers_token;
    uint public billid = 0;

    // address public merchant;
    struct Merchant {
    address _merchantAddress;
    string _businessName;
    }

    struct Bill {
        uint billID;
        address payable billMerchant;
        uint256 billAmount;
        bool isPaid;
    }


    address public owner;
    Merchant[] public merchants;
    Bill[] public bills;


    constructor(ERC20 _aToken) {
        owner = msg.sender;
        avengers_token = _aToken;
    }

    function registerMerchant(string memory businessName) public {
        require(!merchantExists(msg.sender), "You are already registered");
        merchants.push(Merchant(msg.sender,businessName));
    }

    function merchantExists(address _merchant) public view returns (bool) {
    for (uint i = 0; i < merchants.length; i++) {
        if (merchants[i]._merchantAddress == _merchant) {
            return true;
        }
    }

    // Add functionality to remove merchant

    return false;
    }
    function billExists(uint _billId) public view returns (bool) {
    for (uint i = 0; i < merchants.length; i++) {
        if (bills[i].billID == _billId) {
            return true;
        }
    }

    return false;
    }



    function generateBill(uint _amount) public {
        require(merchantExists(msg.sender),"User not register");
        bills.push(Bill(billid,payable(msg.sender), _amount, false));
        billid++;
    }

    function sendViaCall(address payable _to) public payable {
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

    function payBill(uint _billIdentifier, uint _amount) public payable {
        // require(msg.sender.balance >= bills[_billIdentifier].billAmount, "Get more money my guy");//
        // require(avengers_token.balanceOf(msg.sender) >= bills[_billIdentifier].billAmount, "Insufficient Avengers Available");
        require(!merchantExists(msg.sender), "You cannot pay your own bill");
        require(!bills[_billIdentifier].isPaid, "Bill already paid");
        // _amount = msg.value;
        require(billExists(_billIdentifier), "No such a bill");
        require(_amount > 0, "No Avengers assigned to the mission");
        require(_amount <= bills[_billIdentifier].billAmount, "You are overpaying my brother");
        // sendViaCall(bills[_billIdentifier].billMerchant);
        require(avengers_token.transferFrom(msg.sender, bills[_billIdentifier].billMerchant, _amount), "CollateralManager: Transfer failed");
        bills[_billIdentifier].billAmount -= _amount;
        if(bills[_billIdentifier].billAmount == 0) {
            bills[_billIdentifier].isPaid = true;
        }



        // Send the amount to the merchant

    }


    
    // function receiveBillTokens() public payable {
    //     require(msg.value>1,"Value must be greater than one.");
    // }

}