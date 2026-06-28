pragma solidity ^0.8.20;

contract ResistantFund {
    // mapping of how much Wei each user has stored here
    mapping(address => uint256) shares;

    function withdraw() public {
        // Check
        require(shares[msg.sender] > 0, "No Shares to withdraw");

        // Effects
        uint256 old_shares = shares[msg.sender];
        shares[msg.sender] = 0;

        // Interactions
        (bool success,) = msg.sender.call{value: old_shares}("");
        require(success, "Could not send money");
    }

    function buyShares() public payable {
        require(msg.value > 0, "Cannot buy 0 shares");

        shares[msg.sender] += msg.value;
    }
}