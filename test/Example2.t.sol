// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Example2.sol";

contract Example2Test is Test {
    uint256 immutable BASE_GAS_COST = 44100;
    uint256[] arr = [3, 5, 7, 9, 12, 31]; //SUM = 67

    Example2 ex;

    function setUp() public {
        ex = new Example2();
    }

    function testShouldHaveCorrectValues() public {
        uint256 prevCounter = ex.counter();
        ex.incrementBy(arr);
        uint256 currentCounter = ex.counter();
        assertEq(currentCounter, prevCounter + 67);
    }

    function testShouldPassGasTest() public {
        uint256 checkPoint1 = gasleft();
        ex.incrementBy(arr);
        uint256 gasUsed = checkPoint1 - gasleft();

        if (gasUsed >= BASE_GAS_COST){
            console.log("Gas used is %d, should be less than %d", gasUsed, BASE_GAS_COST);
        }
        assertLe(gasUsed, BASE_GAS_COST);
    }
}
