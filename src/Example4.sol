// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract Example4 {
    uint8 locked;

    function isLocked() public view returns (bool) {
        return locked == 0;
    }

    function unLock() external {
        locked = 1;
    }
}