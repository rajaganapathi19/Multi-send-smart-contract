// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiSend {

    function sendEther(address[] calldata recipients) public payable {
        require(recipients.length > 0, "No recipients");

        uint256 amountPerUser = msg.value / recipients.length;
        require(amountPerUser > 0, "Insufficient Ether");

        for (uint256 i = 0; i < recipients.length; i++) {
            (bool success, ) = recipients[i].call{value: amountPerUser}("");
            require(success, "Transfer failed");
        }
    }
}