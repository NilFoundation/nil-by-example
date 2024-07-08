# Lesson 05: Messages

## Goal

Understand how messages work in =nil;

## What You Will Learn

- Differences between messages and Ethereum transactions
- Differences between internal and external messages
- Basic flows within =nil;

## Miro Board: [Messages](https://miro.com/app/board/uXjVK2vPUMI=/?share_link_id=861766110405)

## Theory

In Ethereum, transactions have multiple attributes and can be classified into different types based on their purpose:

1. EOA to EOA (externally-owned account to externally-owned account)
2. Contract deployment
3. Contract interaction

### Messages in =nil;

In =nil;, we use a different concept called messages, which replace the traditional transactions used in Ethereum. There are two types of messages:

1. **External Messages**: Sent by the end user
2. **Internal Messages**: Created within the system

#### Key Differences

The main difference between external and internal messages is who pays for the message:

- **External Messages**: These are sent by the user. Since there are no externally-owned accounts (EOAs) in =nil;, the user cannot directly pay for the message. Instead, the destination contract pays for the transaction.
- **Internal Messages**: These are created within the system and are paid for by the contract that generates the message.

### Message Structures

Here are the basic structures of external and internal messages in =nil;:

#### External Message

```go
type ExternalMessage struct {
    Kind     MessageKind `json:"kind,omitempty" ch:"kind"`
    To       Address     `json:"to,omitempty" ch:"to"`
    ChainId  ChainId     `json:"chainId" ch:"chainId"`
    Seqno    Seqno       `json:"seqno,omitempty" ch:"seqno"`
    Data     Code        `json:"data,omitempty" ch:"data" ssz-max:"24576"`
    AuthData Signature   `json:"authData,omitempty" ch:"auth_data" ssz-max:"256"`
}
```

#### Internal Message Payload

```go
type InternalMessagePayload struct {
    Kind     MessageKind       `json:"kind,omitempty" ch:"kind"`
    GasLimit Uint256           `json:"gasLimit,omitempty" ch:"gas_limit" ssz-size:"32"`
    To       Address           `json:"to,omitempty" ch:"to"`
    RefundTo Address           `json:"refundTo,omitempty" ch:"refundTo"`
    BounceTo Address           `json:"bounceTo,omitempty" ch:"bounceTo"`
    Currency []CurrencyBalance `json:"currency,omitempty" ch:"currency" ssz-max:"256"`
    Value    Uint256           `json:"value,omitempty" ch:"value" ssz-size:"32"`
    Data     Code              `json:"data,omitempty" ch:"data" ssz-max:"24576"`
}
```

### Solidity Modifiers for Messages

To provide finer control over message handling, =nil; offers Solidity modifiers:

- `onlyInternal()`: Marks functions to support only internal messages.
- `onlyExternal()`: Marks functions to support only external messages. If a contract has any `onlyExternal()` functions, it must also implement `verifyExternal()`.

### `verifyExternal()`

The contract receiving an external message must implement an additional function to process these calls. This function ensures that only valid external messages are accepted:

```solidity
function verifyExternal(
        uint256 messageHash,
        bytes calldata authData
    ) external view returns (bool)
```

This function checks the message signature and limits who can call the contract via an external message, preventing unauthorized or malicious use that could drain the contract's balance.
