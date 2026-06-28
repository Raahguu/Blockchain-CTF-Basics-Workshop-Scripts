pragma solidity ^0.8.20;

contract DonationChest {
    address owner;

    event Deposited(address indexed who, uint256 amount);
    event Withdrawed(uint256 amount);

    constructor(address _owner) {
        owner = _owner;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function deposit(uint256 amount) public payable {
        require(amount == msg.value, "Incorrect Amount");
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) public {
        require(msg.sender == owner, "Only the Owner can withdraw");
        require(amount <= address(this).balance, "Not Enough Money");

        (bool success,) = msg.sender.call{value: amount}("");
        require(success, "Transfer Failed");

        emit Withdrawed(amount);
    }

    receive() external payable {}
    fallback() external payable {}
}