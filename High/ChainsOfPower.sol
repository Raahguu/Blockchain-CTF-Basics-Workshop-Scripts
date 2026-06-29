// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Receivable {
    function receiveDetails(string memory data) external;
}

contract VotingChallenge {
    mapping(address => bool) public isCandidate;
    string private voteDetails;

    constructor(address[5] memory candidates, string memory _voteDetails) {
        voteDetails = _voteDetails;
        for (uint i = 0; i < 5; i++) {
            isCandidate[candidates[i]] = true;
        }
    }

    function viewVotes() public {
        require(isCandidate[tx.origin], "Not a candidate");

        (bool ok, ) = msg.sender.call(
            abi.encodeWithSelector(
                Receivable.receiveDetails.selector,
                voteDetails
            )
        );

        require(ok, "Call to receiveDetails() failed");
    }
}