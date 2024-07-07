# Lesson 01: Wallets

## Goal

By the end of this lesson, you will understand how wallets work in `=nil;` and be able to create and manage wallets

## What You Will Learn

- The definition and role of wallets in the `=nil;` platform
- Differences between `=nil;` wallets and Ethereum's `externally-owned accounts` (EOA)
- Creating `pre-built` and `custom wallets`
- Basic wallet operations using the `=nil; CLI`

## Miro Board: [Wallets](https://miro.com/app/board/uXjVK2qLHgs=/?share_link_id=796809756836)

## Theory

**In Ethereum**, externally-owned accounts (EOAs) are used as user accounts. These accounts are essentially key/value pairs of private/public keys (ECDSA). When a user interacts with the network, every message is signed with their private key, and the user pays for the transaction from their account. The signature serves as proof of the user's identity.

**In =nil;**, we have redefined the concept of user accounts to offer greater flexibility and security. Instead of EOAs, =nil; exclusively uses smart contracts for wallets. This allows for more complex logic, such as multi-signature operations and custom authentication mechanisms. Smart contract wallets can include enhanced security features and are fully customizable to meet specific user needs. By using only smart contracts for wallets, =nil; simplifies the account model and enables more versatile and powerful interactions on the network.

### Practical Implications:
**Default Wallets:** =nil; provides pre-built wallets with essential functionalities out of the box. These are ready to use and include predefined constructor bytecode.

**Custom Wallets:** Developers can create their own smart contract wallets, defining the logic and operations they need. This can include anything from basic transaction management to sophisticated financial instruments.

## Let's Try It Out

### Creating a Wallet via the =nil; CLI

1. **Create a New Private Key:**

   ```bash
   nil_cli -c ./config.ini keygen new
   ```

1. **Create a New Wallet:**

   Use the following command to create a new wallet. This command deploys a default wallet, and you can see the contract code in `./assets/wallet.sol`:
   ```bash
   ./nil_cli wallet new
   ```

   Example response:
   ```bash
   Contract NEW_WALLET_ADDRESS balance is topped up by 10000000
   New wallet address: NEW_WALLET_ADDRESS
   ```

2. **Fetch Code of the Contract:**

   To check what is deployed on a specific address, use the following command:

   ```bash
   ./nil_cli contract code <contract address>
   ```
   
3. **Add Wallet Address in CLI:**

   Add the wallet address inside `config.yaml` -> `address`. This address will be used whenever you interact with the `nil_cli` wallet.

4. **Check Wallet Balance:**

   To check the balance of your wallet, use the following command:
   ```bash
   ./nil_cli wallet balance
   ```

5. **Top Up Wallet:**

   To top up your wallet with a specific amount, use the following command:
   ```bash
   ./nil_cli wallet top-up AMOUNT
   ```

### Creating a Custom Wallet

Beyond the predefined wallet, you can implement your own custom wallet. Follow the template of the default wallet and adapt it as needed. Creating external wallets will be covered in a separate lesson, as we first need to understand other aspects of the protocol.

