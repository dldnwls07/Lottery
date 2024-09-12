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
        uint256 newBalance = bank.getBalance();
        assertEq(newBalance, depositAmount);
          vm.stopPrank();
    }
    function test_Withdraw() public {
          vm.startPrank(user);

        // Deposit 1 ether to set up for withdrawal
        uint256 depositAmount = 1 ether;
        bank.deposit{value: depositAmount}();

        // Check balance after deposit
        uint256 balanceAfterDeposit = bank.getBalance();
        assertEq(balanceAfterDeposit, depositAmount, "Balance should match deposited amount");

        // Withdraw the deposited amount
        uint256 withdrawAmount = 0.5 ether;
        bank.withdraw(withdrawAmount);

        // Check balance after withdrawal
        uint256 balanceAfterWithdrawal = bank.getBalance();
        assertEq(balanceAfterWithdrawal, depositAmount - withdrawAmount, "Balance should be correct after withdrawal");

        // Check user's ether balance
        uint256 userBalance = address(user).balance;
        assertEq(userBalance, 1 ether - depositAmount + withdrawAmount, "User balance should reflect withdrawal");

        // Attempt to withdraw more than balance to test revert
        vm.expectRevert();
        bank.withdraw(depositAmount);

        vm.stopPrank();
    }
    }

