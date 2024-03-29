
pragma solidity ^0.8.0;

interface IERC20Internal {
    
    // Events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}