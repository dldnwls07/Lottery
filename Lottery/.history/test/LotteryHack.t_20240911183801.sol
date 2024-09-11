// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Lottery} from "src/Lottery.sol";
import {LotteryHack} from "src/LotteryHack.sol";

contract LotteryHackTest is Test{
    Lottery public lottery;
    LotteryHack public lotteryHack; //Lottery 지갑 주소

    address public user;
    function setUp() public {
        user = vm.addr(0x1234);
        lottery = new Lottery();
        lotteryHack = new LotteryHack(address(lottery));
        vm.deal(address(lottery), 10000 ether);
        vm.deal(user, 1 ether); 
    }

    function test_play() public {
        console.log("user.balance:", user.balance);
        bool result;
        for (uint8 i = 1;  i < 15; i++) {
            vm.warp(i);
            vm.startPrank(user); 
            result = lotteryHack.playhack();
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