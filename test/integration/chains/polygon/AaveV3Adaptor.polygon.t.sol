// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {PolygonFork} from "./polygonFork.sol";
import {AaveV3AdaptorTest} from "../../testLogics/AaveV3Adaptor.t.sol";

contract AaveV3AdaptorTestOnPolygon is PolygonFork, AaveV3AdaptorTest {}
