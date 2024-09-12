// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Bank} from "../src/Bank.sol";

contract BankTest is Test {
    Bank public bank;

    function setUp() public {
        bank = new Bank();
    }
    function test_Deposit() public {
        bank.deposit{value: 100}();
        assert(bank.getBalance() == 100);
    }
    function test_Withdraw() public {
        bank.deposit{value: 100}();
        bank.withdraw(50);
        assert(bank.getBalance() == 50);
    }
}
