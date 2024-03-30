// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {BaseFork} from "../../baseFork.sol";

contract OptimismFork is BaseFork {
    constructor() BaseFork("optimism", 0) {
        fork.usdc = 0x7F5c764cBc14f9669B88837ca1490cCa17c31607;
        fork.usdt = 0x94b008aA00579c1307B0EF2c499aD98a8ce58e58;
        fork.aaveV3Provider = 0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb;
        fork.wrappedNative = 0x4200000000000000000000000000000000000006;
    }
}
