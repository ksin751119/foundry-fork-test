// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {BaseFork} from "../../baseFork.sol";

contract PolygonFork is BaseFork {
    constructor() BaseFork("polygon") {
        fork.usdc = 0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174;
        fork.aaveV3Provider = 0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb;
    }
}
