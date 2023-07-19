// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Donation {
    struct DonationInfo {
        string name;
        string message;
        uint256 timestamp;
        address from;
    }

    DonationInfo[] public donations;
    address payable public owner;

    event DonationMade(address indexed donor, string name, string message, uint256 timestamp);

    constructor() {
        owner = payable(msg.sender);
    }

    function makeDonation(string memory name, string memory message) public payable {
        require(msg.value > 0, "Please donate more than 0 ether");
        owner.transfer(msg.value);
        donations.push(DonationInfo(name, message, block.timestamp, msg.sender));
        emit DonationMade(msg.sender, name, message, block.timestamp);
    }

    function getDonations() public view returns (DonationInfo[] memory) {
        return donations;
    }
}
