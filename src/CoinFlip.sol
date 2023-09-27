// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract CoinFlip {
    enum CoinSide {Heads, Tails}
    enum FlipResult {Win, Lose}

    event Result (address indexed player, CoinSide side, FlipResult result);

    function flipCoin(CoinSide chosenSide) public {
        uint256 randomNumber = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % 2;

        CoinSide result = CoinSide(randomNumber);

        FlipResult flipResult = (chosenSide == result) ? FlipResult.Win : FlipResult.Lose;

        emit Result(msg.sender, chosenSide, flipResult);
    }
}
