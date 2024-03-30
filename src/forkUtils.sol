// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {Test, console} from "forge-std/Test.sol";

contract ForkUtils is Test {
    mapping(bytes4 => bool) skipTests;
    modifier testSkip() {
        vm.skip(skipTests[msg.sig]);
        _;
    }

    constructor(string memory chain, uint256 forkedBlock) {
        if (forkedBlock > 0) {
            console.log("fork chain:", chain, "on ", forkedBlock);
            vm.createSelectFork(vm.rpcUrl(chain), forkedBlock);
        } else {
            console.log("fork chain:", chain);
            vm.createSelectFork(vm.rpcUrl(chain));
        }
    }
}
