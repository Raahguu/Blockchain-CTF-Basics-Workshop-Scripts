pragma solidity ^0.8.20;

contract CommunityChest {
    event Deposit(address who, uint256 amount);
    event Withdraw(address who, uint256 amount);

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function deposit(uint256 amount) public payable {
        require(amount == msg.value, "Incorrect Amount");
        emit Deposit(msg.sender, amount);
    }

    function withdraw(uint256 amount) public {
        require(amount <= address(this).balance, "Not Enough Money");
        (bool success,) = msg.sender.call{value: amount}("");
        require(success, "Transfer Failed");
        emit Withdraw(msg.sender, amount);
    }
}