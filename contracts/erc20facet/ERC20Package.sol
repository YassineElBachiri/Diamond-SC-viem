pragma solidity ^0.8.0;

import "./IERC20.sol";
import "./ERC20Internal.sol";

contract ERC20Package is IERC20, ERC20Internal {
    function totalSupply() external view override returns (uint256) {
        ERC20Storage.Layout storage l = ERC20Storage.layout();
        return l.totalSupply;
    }

    function balanceOf(address account) external view override returns (uint256) {
        ERC20Storage.Layout storage l = ERC20Storage.layout();
        return l.balances[account];
    }


    function transfer(address recipient, uint256 amount) external override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function allowance(address owner, address spender) external view override returns (uint256) {
        ERC20Storage.Layout storage l = ERC20Storage.layout();
        return l.allowed[owner][spender];
    }

    function approve(address spender, uint256 amount) external override returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) external override returns (bool) {
        ERC20Storage.Layout storage l = ERC20Storage.layout();
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        // Check the allowance of the sender
        uint256 senderAllowance = l.allowed[sender][msg.sender];
        require(senderAllowance >= amount, "ERC20: transfer amount exceeds allowance");

        // Transfer the tokens
        _transfer(sender, recipient, amount);

        // Update the allowance
        unchecked {
            l.allowed[sender][msg.sender] = senderAllowance - amount;
        }

        emit Transfer(sender, recipient, amount);
        return true;
    }
}