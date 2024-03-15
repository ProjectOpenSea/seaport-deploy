// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Vm} from "forge-std/Vm.sol";
import {Test, console2} from "forge-std/Test.sol";
import {SeaportDeployer} from "../src/SeaportDeployer.sol";

contract SeaportDeployerTest is Test {
    using SeaportDeployer for Vm;

    function test_deploy() public {
        vm.deploySeaport();
    }

    function test_deployAndConfigure() public {
        vm.deploySeaportAndConfigureConduit();
    }
}
