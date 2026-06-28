pragma solidity ^0.8.20;

contract Set {
    uint256 value;

    constructor(uint256 _value) {
        value = _value;
    }

    function getValue() public view returns (uint256) {
        return value;
    }

    function setValue(uint256 new_value) public {
        value = new_value;
    }
}