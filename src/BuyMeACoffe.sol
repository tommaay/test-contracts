// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract BuyMeACoffe {
    event CoffeeBought (address indexed tipper, uint256 amount);

    function buyMeACoffe() public payable {
        emit CoffeeBought(msg.sender, msg.value);
    }
}