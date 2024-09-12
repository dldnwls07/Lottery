// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Bank {
    mapping (address => uint256) public balances;

    function deposit() public payable {
        // msg.sender 의 balances 를 전송한 이더만큼 증가시킵니다.
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) public {
        if (balances[msg.sender] < _amount) {
            revert();
        }
        balances[msg.sender] -= _amount; 
        payable(msg.sender).call(_amount);
    }

    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    function balanceOf(address _address) public view returns (uint256) {
        return balances[_address];
    }
}
