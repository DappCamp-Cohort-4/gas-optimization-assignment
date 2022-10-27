pragma solidity ^0.8.13;

contract Example2 {
    uint256 public counter;

    function incrementBy(uint256[] memory arr) public {
        for (uint256 idx = 0; idx < arr.length; idx++) {
            counter += arr[idx];
        }
    }
}
