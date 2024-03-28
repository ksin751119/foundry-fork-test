// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {BaseFork} from "../../baseFork.sol";

contract OptimismFork is BaseFork {
    constructor() BaseFork("optimism") {
        fork.usdc = 0x7F5c764cBc14f9669B88837ca1490cCa17c31607;
        fork.aaveV3Provider = 0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb;
    }
}
