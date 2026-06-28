pragma solidity ^0.8.20;

contract VulnerableFund {
    // mapping of how much Wei each user has stored here
    mapping(address => uint256) shares;

    function withdraw() public {
        // Check
        require(shares[msg.sender] > 0, "No Shares to withdraw");
        // Interactions
        (bool success,) = msg.sender.call{value: shares[msg.sender]}("");
        require(success, "Could not send money");
        
        // Effects
        shares[msg.sender] = 0;
    }

    function buyShares() public payable {
        require(msg.value > 0, "Cannot buy 0 shares");

        shares[msg.sender] += msg.value;
    }
}