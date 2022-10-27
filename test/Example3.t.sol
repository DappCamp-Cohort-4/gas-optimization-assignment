// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Example3.sol";

contract Example3Test is Test {
    uint256 immutable BASE_GAS_COST = 6000;
    uint256 immutable AMOUNT = 100;

    Example3 ex;

    function setUp() public {
        ex = new Example3();
    }

    function testShouldHaveCorrectValues() public {
        (uint256 amtForSender, uint256 amtForOwner) = ex.getOwnerMargin(AMOUNT);
        assertEq(amtForSender, 70);
        assertEq(amtForOwner, 30);
    }

    function testShouldPassGasTest() public {
        uint256 checkPoint1 = gasleft();
        ex.getOwnerMargin(AMOUNT);
        uint256 gasUsed = checkPoint1 - gasleft();
        
        if (gasUsed >= BASE_GAS_COST){
            console.log("Gas used is %d, expected usage was less than %d", gasUsed, BASE_GAS_COST);
        }
        assertLe(gasUsed, BASE_GAS_COST);
    }
}