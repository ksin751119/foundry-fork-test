// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {BaseFork} from "../../baseFork.sol";

contract PolygonFork is BaseFork {
    constructor() BaseFork("polygon", 55239312) {
        fork.usdc = 0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174;
        fork.aaveV3Provider = 0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb;
        fork.wrappedNative = 0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270;
    }
}
