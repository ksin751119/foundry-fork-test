// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {ForkUtils} from "../../../utils/forkUtils.sol";

contract EthereumFork is ForkUtils {
    constructor() ForkUtils("ethereum") {
        fork.usdc = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
        fork.aaveV3Provider = 0x2f39d218133AFaB8F2B819B1066c7E434Ad94E9e;
    }
}
