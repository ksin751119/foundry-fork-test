// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {ForkUtils} from "../../../utils/forkUtils.sol";

contract PolygonFork is ForkUtils {
    constructor() ForkUtils("polygon") {
        fork.usdc = 0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174;
        fork.aaveV3Provider = 0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb;
    }
}
