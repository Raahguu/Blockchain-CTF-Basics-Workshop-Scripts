pragma solidity ^0.8.20;

contract Trivial {
    uint256 value = 12;

    function getValue() public view returns (uint256) {
        return value;
    }
}