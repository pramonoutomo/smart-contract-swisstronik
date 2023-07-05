// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Register {
    string public github;
    address public owner;
    Referral[] public referrals;

    struct Referral {
        address referralAddress;
        string referralString;
    }

    constructor() {
        github = "pramonoutomo";
        owner = 0x3a9Fbef0c5A2712aCf48d5b07730a584A8Af028A;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }

    function addReferral(address _referralAddress, string memory _referralString) external onlyOwner {
        Referral memory newReferral = Referral(_referralAddress, _referralString);
        referrals.push(newReferral);
    }

    function totalReferrals() public view returns (uint256) {
        return referrals.length;
    }
}

