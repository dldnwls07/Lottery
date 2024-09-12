// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Bank {
    mapping (address => uint256) public balances;

    function deposit() public payable {
        // msg.sender 의 balances 를 전송한 이더만큼 증가시킵니다.
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance"); // check if the sender has enough balance
        balances[msg.sender] -= _amount; // decrease the sender's balance by the specified amount
        payable(msg.sender).transfer(_amount); // transfer the specified amount of ether to the sender
    }

    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    function balanceOf(address _address) public view returns (uint256) {
        return balances[_address];
    }
}
