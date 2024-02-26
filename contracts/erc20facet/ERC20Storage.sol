
pragma solidity ^0.8.0;

library ERC20Storage {
    struct Layout {
        uint256 totalSupply;
        mapping(address => uint256) balances;
        mapping(address => mapping(address => uint256) ) allowed;
    }

    bytes32 constant STORAGE_SLOT = keccak256(abi.encode(uint256(keccak256("company.storage.ERC20")) -  1)) & ~bytes32(uint256(0xff));
    // bytes32 constant STORAGE_SLOT = keccak256("facet.erc20.diamond.storage");

    function layout() internal pure returns (Layout storage l) {
        bytes32 slot = STORAGE_SLOT;
        assembly {
            l.slot := slot
        }
    }
}