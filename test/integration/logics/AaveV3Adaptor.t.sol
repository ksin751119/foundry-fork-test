// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {AaveV3Adaptor, IERC20} from "../../../src/example/AaveV3Adaptor.sol";
import {DataTypes} from "../../../src/example/libraries/DataTypes.sol";
import {IPoolAddressesProvider} from "../../../src/example/IPoolAddressesProvider.sol";
import {IPool} from "../../../src/example/IPool.sol";
import {BaseFork} from "../baseFork.sol";

// NOTE: Declaring AaveV3AdaptorTest as an abstract contract that inherits from BaseFork
abstract contract AaveV3AdaptorTest is BaseFork {
    AaveV3Adaptor public adapter;
    IERC20 public token;
    IERC20 public aToken;
    IERC20 public aWrappedNative;
    IPoolAddressesProvider provider;
    address user;

    function setUp() public {
        user = makeAddr("user");

        // NOTE: Initializes the provider with AaveV3's address provider from the fork setup
        provider = IPoolAddressesProvider(fork.aaveV3Provider);

        // NOTE: Creating an instance of AaveV3Adaptor using wrapped native token and the provider's address from the fork setup
        adapter = new AaveV3Adaptor(fork.wrappedNative, address(provider));

        // NOTE: Getting the USDC token interface from the fork setup
        token = IERC20(fork.usdc);

        vm.deal(user, 10 ether);
        deal(address(token), user, 10 ether);

        // Retrieves the reserve data for USDC from Aave's pool and stores the aToken address
        aToken = IERC20(
            IPool(address(provider.getPool()))
                .getReserveData(address(token))
                .aTokenAddress
        );

        aWrappedNative = IERC20(
            IPool(address(provider.getPool()))
                .getReserveData(address(fork.wrappedNative))
                .aTokenAddress
        );
    }

    // NOTE: Ensure this test case is marked to be conditionally skipped using testSkip modifier
    function testSupply(uint256 amount) public virtual testSkip {
        // Write your testing logic here
        amount = bound(amount, 1e8, 2e8);
        vm.startPrank(user);
        token.approve(address(adapter), amount);
        uint256 supplyAmount = adapter.supply(address(token), amount);
        vm.stopPrank();
        assertEq(aToken.balanceOf(user), supplyAmount);
    }

    function testSupplyETH(uint256 amount) public virtual testSkip {
        // Write your testing logic here
        amount = bound(amount, 1e8, 10 ether);
        vm.startPrank(user);
        token.approve(address(adapter), amount);
        uint256 supplyAmount = adapter.supplyETH{value: amount}(amount);
        vm.stopPrank();
        assertEq(aWrappedNative.balanceOf(user), supplyAmount);
    }
}
