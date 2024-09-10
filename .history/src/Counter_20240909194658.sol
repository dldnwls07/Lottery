// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        if (newNumber < 1000000000000000) {
            number = newNumber - 1;
        }else{
            number = newNumber;
        }
    }

    function increment() public {
        number++;
    }
}
