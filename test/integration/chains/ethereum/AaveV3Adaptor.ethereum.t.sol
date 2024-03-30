// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {EthereumFork} from "./ethereumFork.sol";
import {AaveV3AdaptorTest} from "../../logics/AaveV3Adaptor.t.sol";

contract AaveV3AdaptorTestOnEthereum is EthereumFork, AaveV3AdaptorTest {}
