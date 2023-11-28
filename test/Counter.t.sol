// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Vm} from "forge-std/Vm.sol";
import {Test, console2} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";
import {SeaportDeployer} from "../src/SeaportDeployer.sol";

contract CounterTest is Test {
    using SeaportDeployer for Vm;
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);

        vm.deploySeaportAndConfigureConduit();
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
}
