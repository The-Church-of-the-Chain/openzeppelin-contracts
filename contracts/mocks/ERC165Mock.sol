// SPDX-License-Identifier: MIT
pragma solidity 0.7.4;

import "hardhat/console.sol";

import "../introspection/ERC165.sol";

contract ERC165Mock is ERC165 {
    function registerInterface(bytes4 interfaceId) public {
        _registerInterface(interfaceId);
    }
}
