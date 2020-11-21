// SPDX-License-Identifier: MIT
pragma solidity 0.7.4;

import "hardhat/console.sol";

import "../access/AccessControl.sol";

contract AccessControlMock is AccessControl {
    constructor() {
        _setupRole(DEFAULT_ADMIN_ROLE, Context._msgSender());
    }

    function setRoleAdmin(bytes32 roleId, bytes32 adminRoleId) public {
        _setRoleAdmin(roleId, adminRoleId);
    }
}
