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
