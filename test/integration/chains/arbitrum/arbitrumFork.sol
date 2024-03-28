// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {BaseFork} from "../../baseFork.sol";

contract ArbitrumFork is BaseFork {
    constructor() BaseFork("arbitrum") {
        fork.usdc = 0xFF970A61A04b1cA14834A43f5dE4533eBDDB5CC8;
        fork.aaveV3Provider = 0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb;
    }
}
