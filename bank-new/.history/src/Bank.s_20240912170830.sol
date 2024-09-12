// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Bank {
    mapping (address => uint256) public balances;

    function deposit() public payable {
        // msg.sender 의 balances 를 전송한 이더만큼 증가시킵니다.
    }

    function withdraw(uint256 _amount) public {
        // msg.sender 의 balances 가 _amount 보다 작으면 revert 합니다.
        // msg.sender 의 balances 를 _amount 만큼 감소시킵니다.
        // msg.sender 에게 _amount 만큼의 이더를 전송합니다.
    }

    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    function balanceOf(address _address) public view returns (uint256) {
        return balances[_address];
    }
}
