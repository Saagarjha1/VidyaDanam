// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Chai {
    struct Memo {
        string name;
        string message;
        uint256 timestamp;
        address from;
    }

    Memo[] public memos;
    address payable public owner;

    event ChaiPurchased(address indexed buyer, string name, string message, uint256 timestamp);

    constructor() {
        owner = payable(msg.sender);
    }

    function buyChai(string memory name, string memory message) public payable {
        require(msg.value > 0, "Please pay greater than 0 ether");
        owner.transfer(msg.value);
        memos.push(Memo(name, message, block.timestamp, msg.sender));
        emit ChaiPurchased(msg.sender, name, message, block.timestamp);
    }

    function getMemos() public view returns (Memo[] memory) {
        return memos;
    }
}
