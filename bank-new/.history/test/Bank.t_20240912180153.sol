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
        vm.startPrank(user);
         uint256 initialBalance = bank.getBalance();
        assertEq(initialBalance, 0);
          uint256 depositAmount = 1 ether;
        bank.deposit{value: depositAmount}();
    }
    function test_Withdraw() public {
        
    }
}
