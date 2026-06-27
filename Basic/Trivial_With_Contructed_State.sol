pragma solidity ^0.8.20;

contract Trivial {
    uint256 state;

    constructor(uint256 _state) {
        state = _state;
    }

    function getState() public view returns (uint256) {
        return state;
    }
}