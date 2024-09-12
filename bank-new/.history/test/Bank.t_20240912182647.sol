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
        bank.deposit(address(bank) 100 ether);
        vm.stopPrank();
        
        uint256 bankBalance = address(bank).balance;
        uint256 userBalance = bank.balanceOf(user);

        console.log("Bank balance:", bankBalance);
        console.log("User balance:", userBalance);

        assertEq(bankBalance, 10000.5 ether);
        assertEq(userBalance, depositAmount);
    }
    
    function test_Withdraw() public {
        uint256 depositAmount = 0.5 ether;
        uint256 withdrawAmount = 0.3 ether;

        vm.startPrank(user);
        bank.deposit{value: depositAmount}();
        bank.withdraw(withdrawAmount);
        vm.stopPrank();
        
        uint256 bankBalance = address(bank).balance;
        uint256 userBalance = bank.balanceOf(user);

        console.log("Bank balance:", bankBalance);
        console.log("User balance:", userBalance);

        assertEq(bankBalance, 10000.2 ether);
        assertEq(userBalance, depositAmount - withdrawAmount);
    }
}