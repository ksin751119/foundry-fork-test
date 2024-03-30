// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ArbitrumFork} from "./arbitrumFork.sol";
import {AaveV3AdaptorTest} from "../../logics/AaveV3Adaptor.t.sol";

contract AaveV3AdaptorTestOnArbitrum is ArbitrumFork, AaveV3AdaptorTest {}
