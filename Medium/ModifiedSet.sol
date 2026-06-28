pragma solidity ^0.8.20;

contract ModifiedSet {
    uint256 value = 0;

    event BeforeCall(address who);
    event AfterCall(address who);

    modifier closer {
        // Code before the function runs
        emit BeforeCall(msg.sender);
        _; //The function runs
        // Code after the function runs
        emit AfterCall(msg.sender);
    }

    function getValue() public view returns (uint256) {
        return value;
    }

    function setValue(uint256 new_value) public closer {
        value = new_value;
    }
}