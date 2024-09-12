// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import{Test,console} from "forge-std/Test.sol";
import{Bank} from "../src/Bank.sol";
import {BankHack} from "../src/BankHack.sol";
import{Test,console} from "forge-std/Test.sol";

contract BackHack { 
    address public user;
    Bank public bank;
    BankHack public bankHack

    constructor(address _bank) {
        bank = Bank(_bank);
    }
     function setUp() public {
        user = vm.addr(0x1234);
        bank = new Bank();
        bankHack = new BankHack(address(bank));
        vm.deal(address(bank), 100 ether);
        vm.deal(user, 1 ether); 
    }
    function test_Withdraw() public {
        bank.deposit{value: 1 ether}();
        bank.withdraw(1 ether);

        assertEq(address(bank).balance, 0);
    }
}