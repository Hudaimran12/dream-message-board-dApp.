// SPDX-License-Identifier: MIT
pragma solidity ^0.5.16;

contract DreamMessageBoard {
    string private message;
    uint256 private updateCount;
    address private owner;
    uint256 private lastUpdate;
    
    event MessageUpdated(string newMessage, address updatedBy, uint256 timestamp);
    
    constructor() public {
        owner = msg.sender;
        message = "Welcome to Dream Message Board!";
        updateCount = 0;
        lastUpdate = now;
    }
    
    function setMessage(string memory _message) public {
        require(bytes(_message).length > 0, "Message cannot be empty");
        message = _message;
        updateCount++;
        lastUpdate = now;
        emit MessageUpdated(_message, msg.sender, now);
    }
    
    function getMessage() public view returns (string memory) {
        return message;
    }
    
    function getUpdateCount() public view returns (uint256) {
        return updateCount;
    }
    
    function getContractInfo() public view returns (address, uint256, uint256) {
        return (owner, updateCount, lastUpdate);
    }
    
    function getOwner() public view returns (address) {
        return owner;
    }
}