// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract BuyMeACoffe {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    event Tip (address indexed from, uint256 amount);
    event Withdraw (address indexed owner, uint256 amount);

    function tipToBuyCoffee() public payable {
        require(msg.value > 0, "You need to send some ether to buy a coffee for the owner");
        emit Tip(msg.sender, msg.value);
    }

    function withdraw() public onlyOwner  {
        uint256 balance = address(this).balance;
        require(balance > 0, "There is no balance to withdraw");
        emit Withdraw(owner, balance);
        payable(owner).transfer(balance);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}