// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {PolygonFork} from "./polygonFork.sol";
import {AaveV3AdaptorTest} from "../../logics/AaveV3Adaptor.t.sol";

contract AaveV3AdaptorTestOnPolygon is PolygonFork, AaveV3AdaptorTest {
    constructor() {
        skipTests[AaveV3AdaptorTest.testSupplyETH.selector] = true;
    }
}
