pragma solidity ^0.8.20;

contract CommunityChest {
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function deposit(uint256 amount) public payable {
        require(amount == msg.value);
    }
}