# Lesson 02: Smart Contracts

## Goal

Learn how to work with smart contracts within a single execution shard.

## What You Will Learn

1. How to deploy and interact with smart contracts within a single execution shard.
2. Ethereum compatibility.

## Miro Board: [=nil; Architecture](https://miro.com/app/board/uXjVK2tT-H8=/?share_link_id=223437132735)

## Overview

Each execution shard acts as a separate blockchain that starts from a genesis block and continues until a possible last block. Each execution shard has its own EVM, message pool, and state. Users can decide on which shard they want to use. When creating wallets using the CLI, we can specify the shard ID:
```bash
nil_cli -c ./config.ini wallet new --shard-id <shard num>
```

### Smart Contracts

As we are using the same underlying VM (EVM), any smart contract deployed in Ethereum-compatible networks and written in Solidity can be redeployed to =nil;.

Although we are not fully Ethereum-compatible, we use different encoding (SSZ) and our RPC methods do not fully match with Ethereum. We created the `nil.js` TypeScript library, which abstracts the complexities of communicating with =nil;. As UX is extremely important to us, we've started adapting well-known libraries and tools to make onboarding as easy as possible. Currently, we have extended Hardhat with our plugin.

In the future, we plan to create a MetaMask snap as well as other tools based on community needs.

## Let's Try It Out

1. **Deploy the Contract Using Hardhat:**

   Deploy the contract with the following command:
   ```bash
   npx hardhat ignition deploy ./ignition/modules/Incrementer.ts --network nil
   ```

2. **Get the Contract Code Using CLI:**

   Retrieve the contract code with the following command:
   ```bash
   nil_cli -c ./config.ini contract code <contract address>
   ```

3. **Interact with the Contract Using Hardhat:**

   Interact with the deployed contract:
   ```bash
   npx hardhat increment --network nil --contract <Contract Address>
   ```

4. **Get Value from Contract Using CLI:**

   Get the value from the contract with the following command:
   ```bash
   nil_cli -c ./config.ini contract call-readonly <contract address> getValue --abi ./artifacts/Incrementer.abi
   ```
