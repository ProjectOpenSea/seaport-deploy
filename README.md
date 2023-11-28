## seaport-deploy

A utility for deploying Seaport v1.5 and related contracts to new chains.

Include this repo as a submodule in your forge project:

```shell
$ git submodule add https://github.com/ProjectOpenSea/seaport-deploy lib/seaport-deploy
$ forge install
```

Then, you can use it like so:
```solidity
pragma solidity ^0.8.13;

import {Vm} from "forge-std/Vm.sol";
import {Test} from "forge-std/Test.sol";
import {SeaportDeployer} from "seaport-deployer/SeaportDeployer.sol";

contract MyTest is Test {
    using SeaportDeployer for Vm;

    function setUp() public {
        // To just deploy Seaport + related contracts:
        vm.deploySeaport();

        // Or, to also deploy and configure the OpenSea canonical conduit:
        vm.deploySeaportAndConfigureConduit();
    }

    // tests here... they can now utilize Seaport 1.5 + related contracts locally
}
```
