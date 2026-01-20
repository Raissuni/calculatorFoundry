Solidity Calculator (Foundry)

This repository contains a basic calculator smart contract written in Solidity, with arithmetic operations, access control, and a full test suite using Foundry.

The project demonstrates:

Smart contract development in Solidity

Access control using modifiers

Event-driven architecture

Unit testing and fuzz testing

Continuous Integration ready

📁 Project Structure
├── src/
│   └── Calculadora.sol
├── test/
│   └── CalculadoraTest.t.sol
├── foundry.toml
└── README.md

🚀 Overview

The Calculadora contract provides basic arithmetic operations over unsigned integers (uint256).

Each operation:

Computes the result

Stores it in the state variable resultado

Emits an event with the operation details

The division function is protected by access control: only the admin address can execute it.

🛠️ Main Variables
Variable	Type	Description
resultado	uint256	Stores the last calculated result
admin	address	Address allowed to execute divisions
🔐 Access Control

The contract uses the onlyAdmin modifier to restrict access to the division function:

Only the admin address can call division

Any other caller will cause the transaction to revert

📌 Contract Functions
➕ addition

Adds two numbers and stores the result.

function addition(uint256 num1_, uint256 num2_) external returns (uint256)

➖ substraction

Subtracts two numbers and stores the result.

function substraction(uint256 num1_, uint256 num2_) external returns (uint256)

✖️ multipler

Multiplies two numbers and stores the result.
Solidity 0.8.x automatically reverts on overflow.

function multipler(uint256 num1_, uint256 num2_) external returns (uint256)

➗ division (admin only)

Divides two numbers and stores the result.

Can only be executed by the admin

If the divisor is 0, the function returns 0

function division(uint256 num1_, uint256 num2_) external onlyAdmin returns (uint256)

📣 Events

Each operation emits an event with operands and result:

Addition(uint256 num1_, uint256 num2_, uint256 resultado_)

Substraction(uint256 num1_, uint256 num2_, uint256 resultado_)

Multipler(uint256 num1_, uint256 num2_, uint256 resultado_)

Division(uint256 num1_, uint256 num2_, uint256 resultado_)

These events allow tracking all operations on-chain.

🧪 Testing with Foundry

The file CalculadoraTest.t.sol includes unit tests and fuzz tests.

Included Unit Tests

Check initial value of resultado

Correct addition

Correct subtraction

Correct multiplication

Revert when multiplying very large numbers (overflow)

Revert when a non-admin user tries to divide

Correct division executed by the admin

Revert when dividing by zero

Fuzz Testing

A fuzz test is included for the division function:

Generates random values for num1_ and num2_

Executes the function under admin context

Helps detect edge cases automatically

▶️ Running Locally
Build the project
forge build

Run the tests
forge test


With verbose output:

forge test -vv

🧩 Requirements

Foundry installed

Solidity version ^0.8.30

Foundry installation guide:
https://book.getfoundry.sh/

📜 License

This project is licensed under the MIT License.

🔥 Portfolio Note

This project demonstrates:

Solidity smart contract development

Access control and modifiers

Event-based design

Unit testing and fuzzing with Foundry

GitHub-ready professional structure