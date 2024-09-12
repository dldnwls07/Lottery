// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Bank} from "../src/Bank.sol";

contract BankTest is Test {
    Bank public bank;
    address public user;

    function setUp() public {
         user = vm.addr(0x1234);
        bank = new Bank();
        vm.deal(address(bank), 10000 ether);
        vm.deal(user, 1 ether); 
    }
    function test_Deposit() public {
           console.log("user.balance:", user.balance);
        bool result;
        for (uint8 i = 1;  i < 15; i++) {
            vm.warp(i);
            vm.prank(user); result = bank.getBalance{value: 0.1 ether}();
            console.log("block.timestamp: ", block.timestamp);
            console.log("block.timestamp % 7: ", block.timestamp % 7);
            console.log("result:", result);
            console.log("user.balance:", user.balance);
    }
    assertEq(block.timestamp % 7 == 0, result);   
    }
    function test_Withdraw() public {
        console.log("user.blance", user.balance);
        bool result;
        
    }
    }


