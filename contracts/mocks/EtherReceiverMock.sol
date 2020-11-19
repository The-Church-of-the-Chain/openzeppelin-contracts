// SPDX-License-Identifier: MIT
pragma solidity 0.7.4;

import "hardhat/console.sol";

contract EtherReceiverMock {
    bool private _acceptEther;

    function setAcceptEther(bool acceptEther) public {
        _acceptEther = acceptEther;
    }

    receive () external payable {
        if (!_acceptEther) {
            revert();
        }
    }
}
