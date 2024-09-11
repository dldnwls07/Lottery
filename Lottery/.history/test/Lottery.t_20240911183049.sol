// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Lottery} from "../src/Lottery.sol";

contract LotteryTest is Test {
    Lottery public lottery;
    address public user; //Lottery 지갑 주소

    function setUp() public {
        user = vm.addr(0x1234);
        lottery = new Lottery();
        vm.deal(address(lottery), 10000 ether);
        vm.deal(user, 1 ether); 
    }

    function test_play() public {
    console.log("user.balance:", user.balance);
    bool result;
    for (uint8 i = 1;  i < 15; i++) {
        vm.warp(i);
        vm.prank(user); result = lottery.play{value: 0.1 ether}();
        console.log("block.timestamp: ", block.timestamp);
        console.log("block.timestamp % 7: ", block.timestamp % 7);
        console.log("result:", result);
        console.log("user.balance:", user.balance);
    }
    assertEq(block.timestamp % 7 == 0, result);   
    }
    function test_withdraw() public {
    }
}
    
