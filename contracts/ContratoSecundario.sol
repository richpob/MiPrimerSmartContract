// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SecondaryContract {
    uint public data;

    function addData(uint _data) external {
        data = _data;
    }

    function getData() external view returns (uint) {
        return data;
    }
}
