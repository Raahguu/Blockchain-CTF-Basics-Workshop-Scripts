pragma solidity ^0.8.20;

interface CommunityChest {
    function getBalance() external view returns (uint256);
    function withdraw(uint256 amount) external;
}

contract ChestSkimmer {
    function skim(address chest_addr, uint256 target) public {
        // Get current situation
        CommunityChest chest = CommunityChest(chest_addr);
        uint256 current_balance = chest.getBalance();

        // How much to skim
        int256 amount_to_skim = int256(current_balance) - int256(target);
        require(amount_to_skim >= 0, "No money to skim");
        
        // Skim
        chest.withdraw(uint256(amount_to_skim));

        // Transfer to caller
        (bool success,) = msg.sender.call{value: uint256(amount_to_skim)}("");
        require(success, "Could not transfer back to caller");
    }

    receive() external payable {}
}