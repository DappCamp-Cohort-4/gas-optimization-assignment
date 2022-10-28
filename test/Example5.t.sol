// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Example5.sol";

contract Example5Test is Test {
    uint256 immutable BASE_GAS_COST = 27250;

    Example5 ex;

    function setUp() public {
        ex = new Example5();
    }

    function testIsLocked() public {
        assertEq(ex.isLocked(), true);
    }

    function testUnLock() public {
        ex.unLock();
        assertEq(ex.isLocked(), false);
    }

    function testShouldPassGasTest() public {
        uint256 checkPoint1 = gasleft();
        ex.unLock();
        uint256 gasUsed = checkPoint1 - gasleft();

        if (gasUsed >= BASE_GAS_COST){
            console.log("Gas used is %d, should be less than %d", gasUsed, BASE_GAS_COST);
        }
        assertLe(gasUsed, BASE_GAS_COST);
    }
}
