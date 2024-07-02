// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./Nil.sol";

contract Caller{
    using Nil for address;

    receive() external payable {}

    function call(address dst) public payable{
        Nil.asyncCall(
            dst,
            msg.sender,
            msg.sender,
            100000,
            false,
            100000 * 10,
            abi.encodeWithSignature("increment()")
        );
    }

    function verifyExternal(
        uint256,
        bytes calldata
    ) external pure returns (bool) {
        return true;
    }
}

