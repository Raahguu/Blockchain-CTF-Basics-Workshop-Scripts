pragma solidity ^0.8.20;

contract CommunityChest {
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function deposit(uint256 amount) public payable {
        require(amount * 1 ether == msg.value, "Incorrect Amount");
    }
}