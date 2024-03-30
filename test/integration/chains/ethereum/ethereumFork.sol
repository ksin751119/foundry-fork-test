// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {BaseFork} from "../../baseFork.sol";

contract EthereumFork is BaseFork {
    constructor() BaseFork("ethereum", 0) {
        fork.usdc = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
        fork.aaveV3Provider = 0x2f39d218133AFaB8F2B819B1066c7E434Ad94E9e;
        fork.wrappedNative = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    }
}
