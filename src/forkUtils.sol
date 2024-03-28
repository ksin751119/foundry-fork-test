// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {Test, console} from "forge-std/Test.sol";

contract ForkUtils is Test {
    mapping(bytes4 => bool) skipTests;
    modifier testSkip() {
        vm.skip(skipTests[msg.sig]);
        _;
    }

    constructor(string memory chain) {
        vm.createSelectFork(vm.rpcUrl(chain));
        console.log("fork chain:", chain);
    }
}
