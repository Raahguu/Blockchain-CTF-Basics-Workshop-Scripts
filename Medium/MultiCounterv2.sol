pragma solidity ^0.8.20;

contract MultiCounter {
    uint256[] counters;

    function getCounter(uint256 index) public view returns (uint256) {
        return counters[index];
    }

    function increment(uint256 index) public {
        counters[index] += 1;
    }
}