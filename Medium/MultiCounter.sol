pragma solidity ^0.8.20;

contract MultiCounter {
    mapping(address => uint256) counters;

    function getCounter() public view returns (uint256) {
        return counters[msg.sender];
    }

    function increment() public {
        counters[msg.sender] += 1;
    }
}