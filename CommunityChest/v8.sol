pragma solidity ^0.8.20;

contract CommunityChest {
    event Deposited(address indexed who, uint256 amount);
    event Withdrawed(address indexed who, uint256 amount);
    event Recieved(address indexed who, uint256 amount);
    event Fallbacked(address indexed who);

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function deposit(uint256 amount) public payable {
        require(amount == msg.value, "Incorrect Amount");
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) public {
        require(amount <= address(this).balance, "Not Enough Money");
        (bool success,) = msg.sender.call{value: amount}("");
        require(success, "Transfer Failed");
        emit Withdrawed(msg.sender, amount);
    }

    receive() external payable {
        emit Recieved(msg.sender, msg.value);
    }

    fallback() external payable {
        emit Fallbacked(msg.sender);
    }
}