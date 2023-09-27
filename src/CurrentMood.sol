// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@thirdweb-dev/contracts/extension/ContractMetadata.sol";

contract CurrentMood is ContractMetadata {
    address public owner;

    constructor() {
        owner = msg.sender;
    }
    
    struct Mood {
        string currentMood;
        bool exists;
    }

    mapping(address => Mood) public userMood;

    event MoodCreated(address indexed wallet, string mood);
    event MoodUpdated(address indexed wallet, string newMood);

    function createMood(string memory initialMood) public {
        require(!userMood[msg.sender].exists, "Mood already exists.");

        userMood[msg.sender] = Mood({
            currentMood: initialMood,
            exists: true
        });

        emit MoodCreated(msg.sender, initialMood);
    }

    function updateMood(string memory newMood) public {
        require(userMood[msg.sender].exists, "Mood does not exist.");

        userMood[msg.sender].currentMood = newMood;

        emit MoodUpdated(msg.sender, newMood);
    }

    function getMood(address wallet) public view returns (string memory) {
        require(userMood[wallet].exists, "Mood does not exist.");

        return userMood[wallet].currentMood;
    }

    function _canSetContractURI() internal view virtual override returns (bool){
        return msg.sender == owner;
    }
}