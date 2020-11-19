// SPDX-License-Identifier: MIT
pragma solidity 0.7.4;

import "hardhat/console.sol";

import "../utils/Strings.sol";

contract StringsMock {
    function fromUint256(uint256 value) public pure returns (string memory) {
        return Strings.toString(value);
    }
}
