# Lesson 04: Cross-Shard Communication

## Goal

Get an understanding of how the cross-shard protocol works and learn how to build cross-shard dApps.

## What You Will Learn

1. How the cross-shard protocol works.
2. Callback pattern for async communication.
3. Deploying and interacting between shards.

## Miro Board: [Cross-shard protocol](https://miro.com/app/board/uXjVK24kkGU=/?share_link_id=182080314865)

## Overview

In =nil;, the cross-shard protocol is achieved with a set of precompiles. We have a precompile for async communication at the address `0xfd`. Besides precompiles, we also created a library called `nil` (can be found in `assets/Nil.sol`) which abstracts the logic for interacting with our precompiles. In this library, you will find:

```solidity
// asyncCall is a function that makes an asynchronous call to `dst` contract.
function asyncCall(
    address dst,
    address refundTo,
    address bounceTo,
    uint gas,
    bool deploy,
    uint value,
    bytes memory callData
) internal returns(bool) {
    Token[] memory tokens;
    return asyncCall(dst, refundTo, bounceTo, gas, deploy, value, tokens, callData);
}
```

This function is used for sending cross-shard messages.

## Let's Try It Out

1. **Deploying Contracts**

   As we already have the `Incrementer` contract deployed on shard 1, let's deploy the `Caller` contract on shard 2. To do this, we need to add `shardId` in the Hardhat config with the value of the desired shard (2 in this case).

   Once added, we can deploy the contract as usual:
   ```bash
   npx hardhat ignition deploy ./ignition/modules/Caller.ts --network nil  
   ```
   We should return shardId to default:
   ```bash
   shardId=1
   ```


2. **Check the Contract Deployment**

   To verify that the contract is deployed, we can check the contract code using the CLI:
   ```bash
   nil_cli -c ./config.ini contract code <caller address> 
   ```

3. **Trigger the Call Method from the Caller Contract**

   To trigger the `call` method from the `Caller` contract, we use a task for it. Make sure to set the shard ID back to 1 as we are interacting over the wallet which is in shard 1:
   ```bash
   npx hardhat async-call --network nil --contract <caller address> --incrementer <incrementer address>
   ```

4. **Verify the Incrementer Contract**

   To ensure that the `Incrementer` contract was incremented, we can fetch the value using the CLI:
   ```bash
   nil_cli -c ./config.ini contract call-readonly <Incrementer address> getValue --abi ./Incrementer.abi
   ```

