// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Bank} from "../src/Bank.sol";
import {BankHack} from "../src/BankHack.sol";

contract BankHackTest is Test {
    address public user;
    Bank public bank;
    BankHack public bankHack;

    function setUp() public {
        user = vm.addr(0x1234); // Generate a test address
        bank = new Bank(); // Deploy the Bank contract
        bankHack = new BankHack(address(bank)); // Deploy the BankHack contract with the Bank address
        vm.deal(address(bank), 100 ether); 
        vm.deal(user, 1 ether); 
    }

    function testWithdraw() public {
        vm.startPrank(user); 
        bankHack.deposit{value: 1 ether}(); 
        vm.stopPrank(); 
        assertEq(address(bank).balance, 0);
    }
}
