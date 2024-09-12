// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Bank} from "../src/Bank.sol";

contract BankTest is Test {
    Bank public bank;
    address public user;

    function setUp() public {
        bank = new Bank();
    }
    function test_Deposit() public {
       
    }
    function test_Withdraw() public {
        consol.log("test_Withdraw");
    }
    }
