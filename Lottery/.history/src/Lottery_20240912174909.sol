// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Lottery {
    address public manager;
   
    constructor() {
        manager = msg.sender;
    }
   
    function play() public payable returns (bool) {
        require(msg.value == 0.1 ether);
        if (block.timestamp % 7 == 0) {
            (bool success, ) = payable(msg.sender).call{value: 1 ether}("");
            require(success);
            return true;
        }else {
            return false;
        }
        
    }
    function withdraw(uint256 _value) public {
        require(msg.sender == manager);
        (bool success, ) = payable(manager).call{value: _value}("");
        require(success);
    }
}
