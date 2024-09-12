// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Bank} from "../src/Bank.t.sol";

contract BankTest is Test {
    Bank public bank;

    function setUp() public {
        bank = new Bank();
        bank.setNumber(0);
    }

    function test_Increment() public {
        bank.increment();
        assertEq(bank.number(), 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        bank.setNumber(x);
        assertEq(bank.number(), x);
    }
}
