// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {Test, console} from "forge-std/Test.sol";

contract ForkUtils is Test {
    struct Fork {
        // Tokens
        address usdc;
        // External Services
        address aaveV3Provider;
    }

    Fork fork;
    mapping(bytes4 => bool) skipTests;

    modifier testSkip() {
        vm.skip(skipTests[msg.sig]);
        _;
    }

    constructor(string memory chain) {
        console.log("chain", chain);
        vm.createSelectFork(vm.rpcUrl(chain));
    }
}
