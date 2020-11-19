// SPDX-License-Identifier: MIT
pragma solidity 0.7.4;

import "hardhat/console.sol";

import "../token/ERC20/ERC20Burnable.sol";

contract ERC20BurnableMock is ERC20Burnable {
    constructor (
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) public ERC20(name, symbol) {
        _mint(initialAccount, initialBalance);
    }
}
