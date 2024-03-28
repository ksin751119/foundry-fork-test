// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {AaveV3Adaptor, IERC20} from "../../../src/example/AaveV3Adaptor.sol";
import {DataTypes} from "../../../src/example/libraries/DataTypes.sol";
import {IPoolAddressesProvider} from "../../../src/example/IPoolAddressesProvider.sol";
import {IPool} from "../../../src/example/IPool.sol";
import {BaseFork} from "../baseFork.sol";

abstract contract AaveV3AdaptorTest is BaseFork {
    AaveV3Adaptor public adapter;
    IERC20 public usdc;
    IERC20 public aUsdc;
    IPoolAddressesProvider provider;
    address user;

    function setUp() public {
        user = makeAddr("user");
        // Get AaveV3 Provider address from fork structure
        provider = IPoolAddressesProvider(fork.aaveV3Provider);
        adapter = new AaveV3Adaptor(address(provider));

        // Get USDC address from fork structure
        usdc = IERC20(fork.usdc);

        // mint usdc token
        deal(address(usdc), user, 10 ether);

        // Get aToken
        DataTypes.ReserveData memory data = IPool(address(provider.getPool()))
            .getReserveData(address(usdc));
        aUsdc = IERC20(data.aTokenAddress);
    }

    function testSupply(uint256 amount) public testSkip {
        amount = bound(amount, 1e8, 2e8);
        vm.startPrank(user);
        usdc.approve(address(adapter), amount);
        uint256 supplyAmount = adapter.supply(address(usdc), amount);
        vm.stopPrank();
        assertEq(aUsdc.balanceOf(user), supplyAmount);
    }
}
