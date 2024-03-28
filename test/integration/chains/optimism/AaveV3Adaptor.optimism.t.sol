// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {OptimismFork} from "./optimismFork.sol";
import {AaveV3AdaptorTest} from "../../testLogics/AaveV3Adaptor.t.sol";

contract AaveV3AdaptorTestOnOptimism is OptimismFork, AaveV3AdaptorTest {}
