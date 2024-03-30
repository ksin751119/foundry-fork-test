// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {ForkUtils} from "../../src/forkUtils.sol"; // Importing the ForkUtils library from the specified path

// BaseFork contract inheriting from ForkUtils
contract BaseFork is ForkUtils {
    // 1. Define the structure representing the environment specific configurations for a chain fork
    struct Fork {
        address usdc; // Address of the token on the fork
        address usdt; // Address of the token on the fork
        address aaveV3Provider; // Address of the external service on the fork
        address wrappedNative; // Address of the token on the fork
        // Note: Additional custom variables for different chains can be added, such as liquidation ratios
    }

    // 2. Add the state variable of type Fork to store fork-specific configurations
    Fork public fork;

    // 3. Constructor that initializes the contract by passing the chain identifier to the parent ForkUtils contract
    constructor(
        string memory chain,
        uint256 forkedBlock
    ) ForkUtils(chain, forkedBlock) {}
}
