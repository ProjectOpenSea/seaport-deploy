> [!NOTE]
> This repository is archived and no longer maintained. To deploy Seaport 1.6 and the ConduitController to a local chain, follow [Deploying](https://github.com/ProjectOpenSea/seaport/blob/main/docs/Deploying.md) in the seaport repo. Existing `forge install` pins keep working.

## seaport-deploy

A utility for deploying Seaport v1.6 and related contracts to local chains for use in testing.

Include this repo as a submodule in your forge project:

```shell
$ forge install ProjectOpenSea/seaport-deploy
```

Then, you can use it like so:
```solidity
pragma solidity ^0.8.24;

import {Vm} from "forge-std/Vm.sol";
import {Test} from "forge-std/Test.sol";
import {SeaportDeployer} from "seaport-deploy/src/SeaportDeployer.sol";

contract MyTest is Test {
    using SeaportDeployer for Vm;

    function setUp() public {
        // To just deploy Seaport + related contracts:
        vm.deploySeaport();

        // Or, to also deploy and configure the OpenSea canonical conduit:
        vm.deploySeaportAndConfigureConduit();
    }

    // tests here... they can now utilize Seaport 1.6 + related contracts locally
}
```

> Be advised that you may need to manually set `evm_version='cancun'` or `evm_version='shanghai'` in your `foundry.toml` as Seaport v1.6 requires `PUSH0` support.
