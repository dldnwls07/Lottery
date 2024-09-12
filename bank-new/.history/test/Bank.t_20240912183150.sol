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
        vm.deal(address(bank), 100 ether);
        vm.deal(user, 1 ether); 
    }

    function test_Deposit() public {
        vm.startPrank(user);
        bank.deposit{value: 1 ether}();
        assertEq(bank.getBalance(), 1 ether);
        assertEq(bank.balanceOf(user), 1 ether);
        assertEq(bank.balances(user), 1 ether);
    }
    
    function test_Withdraw() public {
        vm.startPrank(user);
        bank.deposit{value: 1 ether}();
        bank.withdraw(1 ether);
        assertEq(bank.getBalance(), 0);
        assertEq(bank.balanceOf(user), 0);
        assertEq(bank.balances(user), 0);
        assertEq(user.balance, 1 ether);
    }
    function test_Withdraw_negative() public {
        vm.startPrank(user);
        bank.deposit{value: 0}();
        bank.withdraw(2 ether);
        assertEq(bank.getBalance(), 1 ether);
        assertEq(bank.balanceOf(user), 1 ether);
        assertEq(bank.balances(user), 1 ether);
        assertEq(user.balance, 1 ether);
    }
}