// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {IERC20} from "./IERC20.sol";
import {IPool} from "./IPool.sol";
import {DataTypes} from "./libraries/DataTypes.sol";
import {IPoolAddressesProvider} from "./IPoolAddressesProvider.sol";

contract AaveV3Adaptor {
    address public immutable provider;

    constructor(address provider_) {
        provider = provider_;
    }

    function supply(
        address asset,
        uint256 amount
    ) external payable returns (uint256 supplyAmount) {
        // Get pool and aToken
        (address pool, address aToken) = _getPoolAndAToken(asset);

        IERC20(asset).transferFrom(msg.sender, address(this), amount);

        // supply
        IERC20(asset).approve(pool, amount);
        uint256 beforeATokenAmount = IERC20(aToken).balanceOf(address(this));
        IPool(pool).supply(asset, amount, address(this), 0);
        supplyAmount =
            IERC20(aToken).balanceOf(address(this)) -
            beforeATokenAmount;

        // Send back to sender
        IERC20(asset).approve(pool, 0);
        IERC20(aToken).transfer(msg.sender, supplyAmount);
    }

    function _getPoolAndAToken(
        address underlying
    ) internal view returns (address pool, address aToken) {
        pool = IPoolAddressesProvider(provider).getPool();
        DataTypes.ReserveData memory data = IPool(pool).getReserveData(
            underlying
        );
        aToken = data.aTokenAddress;
        require(aToken != address(0), "aToken should not be zero address");
    }
}
