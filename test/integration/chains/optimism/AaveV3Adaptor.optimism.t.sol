// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {OptimismFork} from "./optimismFork.sol";
import {AaveV3AdaptorTest, IERC20, IPool} from "../../logics/AaveV3Adaptor.t.sol";

contract AaveV3AdaptorTestOnOptimism is OptimismFork, AaveV3AdaptorTest {
    function testSupply(uint256 amount) public override {
        // Replace usdc with usdt
        token = IERC20(fork.usdt);
        aToken = IERC20(
            IPool(address(provider.getPool()))
                .getReserveData(address(token))
                .aTokenAddress
        );
        deal(address(token), user, 10 ether);

        // Execute the same test logic but use different token
        super.testSupply(amount);
    }
}
