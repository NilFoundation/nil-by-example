# Lesson 04: Multi-Currency

## Goal

Learn about multi-currency in =nil;.

## What You Will Learn

1. How multi-currency works
2. How to create a new currency and send it to any account

## Overview

=nil; supplies a basic 'default' currency that is distributed by the Faucet contract.

The network also has a multi-currency mechanism. All accounts (smart contracts) can be paid in any number of arbitrary currencies created either by the account owner or other accounts. Currency creation is dedicated to a special precompiled contract (Minter), and anyone can request the creation, minting, and withdrawal of new currencies.

**Note**: While custom currencies can be transferred between accounts, they cannot be used for paying for essential functionalities of =nil; such as deploying contracts or sending async calls.

## Let's Try It Out

1. **Creating a New Currency:**

   Creating a new currency is as simple as:
   ```bash
   nil -c ./config.ini minter create-currency <owner_contract address> 50000 <token_name> --withdraw
   ```

2. **Check All Currencies from a Contract:**

   You can check all currencies from a contract using:
   ```bash
   nil -c ./config.ini contract currencies <owner-contract_address>
   ```

3. **Check Wallet Balance:**

   To check the balance of the wallet, you can do:
   ```bash
   nil -c ./config.ini wallet balance
   ```

4. **Send Native Currency to Another Contract:**

   Sending native currency to another contract can be done with:
   ```bash
   nil -c ./config.ini wallet send-tokens <Destination contract address> 100
   ```

5. **Check Balance (Change Wallet Address in Config):**

   ```bash
   nil -c ./config.ini wallet balance
   ```

6. **Send Non-Native Currency:**

   To send non-native currency, you can do:
   ```bash
   nil -c ./config.ini wallet send-tokens <Destination contract address> <native currency> --token <id>=value
   ```
