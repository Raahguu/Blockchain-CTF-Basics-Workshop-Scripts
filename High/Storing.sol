pragma solidity ^0.8.20;

contract Storing {
    uint256 private value;
    bool private maybe;
    uint256[3] private no;
    string private secret;

    constructor(uint256 v, bool m, uint256 n1, uint256 n2, uint256 n3, string memory s) {
        value = v;
        maybe = m;
        no[0] = n1;
        no[1] = n2;
        no[2] = n3;
        secret = s;
    }
}