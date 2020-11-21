// SPDX-License-Identifier: MIT
pragma solidity 0.7.4;

import "hardhat/console.sol";

import "../security/Context.sol";

contract ContextMock {
    event Sender(address sender);

    function msgSender() public {
        emit Sender(Context._msgSender());
    }

    event Data(bytes data, uint256 integerValue, string stringValue);

    function msgData(uint256 integerValue, string memory stringValue) public {
        emit Data(Context._msgData(), integerValue, stringValue);
    }
}

contract ContextMockCaller {
    function callSender(ContextMock context) public {
        context.msgSender();
    }

    function callData(ContextMock context, uint256 integerValue, string memory stringValue) public {
        context.msgData(integerValue, stringValue);
    }
}
