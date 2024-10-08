// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.9;

import "./NilCurrencyBase.sol";

contract Wallet is NilCurrencyBase {

    bytes pubkey;

    receive() external payable {}

    function bounce(string calldata err) external payable {}

    constructor(bytes memory _pubkey) payable {
        pubkey = _pubkey;
    }

    function send(bytes calldata message) onlyExternal public {
        Nil.sendMessage(gasleft(), message);
    }

    function asyncCall(address dst, address refundTo, uint gas, bool deploy, uint value, bytes calldata callData) onlyExternal public {
        // TODO: add bounceTo
        Nil.asyncCall(dst, refundTo, refundTo, gas, deploy, value, callData);
    }

    function asyncCall(
        address dst,
        address refundTo,
        address bounceTo,
        uint gas,
        bool deploy,
        Nil.Token[] memory tokens,
        uint value,
        bytes calldata callData) onlyExternal public {
        Nil.asyncCall(dst, refundTo, bounceTo, gas, deploy, value, tokens, callData);
    }

    function syncCall(address dst, uint gas, uint value, bytes memory call_data) onlyExternal public {
        (bool success,) = dst.call{value: value, gas: gas}(call_data);
        require(success, "Call failed");
    }

    function verifyExternal(uint256 hash, bytes calldata signature) external view returns (bool) {
        return Nil.validateSignature(pubkey, hash, signature);
    }
}
