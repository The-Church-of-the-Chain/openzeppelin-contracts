// // SPDX-License-Identifier: AGPL-3.0-or-later
// pragma solidity 0.7.4;

// import "../../dataTypes/collections/AddressSet.sol";
// import "../../dataTypes/collections/Bytes32Set.sol";

// TODO: Documentation
// TODO: RoleData - approved bool should be a struct containing data about who approved etc. for more information .
library RoleData {

    using AddressSet for AddressSet.Set;
    using Bytes32Set for Bytes32Set.Set;

    struct Role {
        bytes32 admin;
        bytes32 approver;
        AddressSet.Set members;
        Bytes32Set.Set restrictedRoles;    // TODO: Loops are evil. Change data struct to some form of mapping?
        mapping(address => bool) approved;
    }

    struct ContractRoles {
        bytes32 root;
        mapping(bytes32 => Role) roles;
    }
    
    function registerRole( Role storage self_, bytes32 role_, address rootAccount_ ) internal {
        self_.admin = role_;
        self_.members.add( rootAccount_ );
        self_.approved[rootAccount_] = true;
    }
    
    // TODO: This shit is retarded. Why can I not just access the (add etc.) function directly in the Datastore contract even if it is public in the AddressSet library?
    function grantRole( Role storage self_, address member_ ) internal {
        self_.members.add( member_ );
    }
    
    function removeRole( Role storage self_, address member_ ) internal {
        self_.members.remove( member_ );
    }
    
    function addRestrictedRole( Role storage self_, bytes32 role_ ) internal {
        self_.restrictedRoles.add( role_ );
    }
    
    function removeRestrictedRole( Role storage self_, bytes32 role_ ) internal {
        self_.restrictedRoles.remove( role_ );
    }
    
    function memberCount( Role storage self_ ) internal view returns ( uint256 ) {
        return self_.members.length();
    }
    
    function restrictedCount( Role storage self_ ) internal view returns ( uint256 ) {
        return self_.restrictedRoles.length();
    }
    
    function getMember( Role storage self_, uint256 index_ ) internal view returns ( address ) {
        return self_.members.at( index_ );
    }
    
    function getRestrictedRole( Role storage self_, uint256 index_ ) internal view returns ( bytes32 ) {
        return self_.restrictedRoles.at( index_ );
    }
    
    function isMember( Role storage self_, address member_ ) internal view returns ( bool ) {
        return self_.members.contains( member_ );
    }
    
    function createRole( Role storage self_, bytes32 admin_, bytes32 approver_ ) internal {
        self_.admin = admin_;
        self_.approver = approver_;
    }

}
