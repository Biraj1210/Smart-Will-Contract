// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract SmartWill {
    address public owner;
    string public willContent;
    bool public isExecuted;

    event WillCreated(address indexed creator, string content);
    event WillExecuted(address indexed executor);

    constructor(string memory _content) {
        owner = msg.sender;
        willContent = _content;
        isExecuted = false;
        emit WillCreated(owner, _content);
    }

    function executeWill() public {
        require(msg.sender == owner, "Only the owner can execute the will");
        require(!isExecuted, "Will has already been executed");
        isExecuted = true;
        emit WillExecuted(msg.sender);
    }

    function getWillContent() public view returns (string memory) {
        return willContent;
    }
}

