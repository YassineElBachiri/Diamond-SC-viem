// ERC20Internal.sol
pragma solidity ^0.8.0;

import "./IERC20Internal.sol";
import "./ERC20Storage.sol";

abstract contract ERC20Internal is IERC20Internal {
    using ERC20Storage for ERC20Storage.Layout;

    function _transfer(address sender, address recipient, uint256 amount) internal {
        ERC20Storage.Layout storage l = ERC20Storage.layout();
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        // Check that the sender has enough balance
        uint256 senderBalance = l.balances[sender];
        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");

        // Subtract the amount from the sender's balance
        unchecked {
            l.balances[sender] = senderBalance - amount;
        }

        // Add the amount to the recipient's balance
        l.balances[recipient] += amount;

        // Emit the Transfer event
        emit Transfer(sender, recipient, amount);
    }

    function _approve(address owner, address spender, uint256 amount) internal {
        ERC20Storage.Layout storage l = ERC20Storage.layout();
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        // Set the allowance for the spender
        l.allowed[owner][spender] = amount;

        // Emit the Approval event
        emit Approval(owner, spender, amount);
    }

}