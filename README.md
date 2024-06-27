# SMART CONTRACT USING ERROR HANDLING
# Overview
This Solidity program demonstrates error handling using require(), revert(), and assert() statements. The contract allows incrementing a counter with built-in checks and emits events for debugging purposes.

# Description
This program showcases error handling mechanisms in Solidity, a language used for developing smart contracts on the Ethereum blockchain. It includes events to track increment attempts, successes, failures, and specific conditions triggering a revert.

# Executing Program
To run this program, you can use Remix, an online Solidity IDE. Follow these steps:

Go to the Remix website at https://remix.ethereum.org/
Create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension .
Copy and paste the following code into the file:
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandlingExample {
    uint public count;

    // Events for debugging
    event IncrementAttempt(uint value);
    event IncrementSuccess(uint newCount);
    event IncrementFailure(string reason);
    event RevertTrigger(uint value);

    function increment(uint value) public {
        // Emit event to track increment attempts
        emit IncrementAttempt(value);

        // require statement
        if (value <= 0) {
            emit IncrementFailure("Value must be greater than zero");
            require(value > 0, "Value must be greater than zero");
        }

        // revert statement
        if (value == 50) {
            emit RevertTrigger(value);
            revert("Value cannot be 50");
        }

        // assert statement
        uint oldCount = count;
        count += value;
        assert(count > oldCount);

        // Emit event for successful increment
        emit IncrementSuccess(count);
    }
}
Compile the code by clicking on the "Solidity Compiler" tab in the left-hand sidebar. Set the "Compiler" option to "0.8.0" (or another compatible version), then click "Compile ErrorHandlingExample.sol".

Deploy the contract by clicking on the "Deploy & Run Transactions" tab. Select the "ErrorHandlingExample" contract from the dropdown menu and click "Deploy".

Interact with the deployed contract by calling the increment function. Click on the deployed contract in the left-hand sidebar, then click on the increment function and click "transact" to execute the function and trigger the appropriate events.

# Authors
Shikha Jumta
jumtashikha000@gmail.com

# License
This project is licensed under the MIT License - see the LICENSE file for details
