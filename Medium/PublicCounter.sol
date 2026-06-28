pragma solidity ^0.8.20;

contract PublicCounter {
    uint256 public count;

    constructor(uint256 _count) {
        count = _count;
    }

    function increment() public {
        count += 1;
    }
}