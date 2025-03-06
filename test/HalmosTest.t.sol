// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
import {Test} from "forge-std/Test.sol";
import {MathMasters} from "../src/MathMasters.sol";
import {SymTest} from "halmos-cheatcodes/SymTest.sol";

contract HalmosTest is SymTest, Test {
    /// @dev command required to run this function -> halmos --function check_mulWadUpDoesntRevert --solver-timeout-assertion 0
    function check_mulWadUpDoesntRevert() public pure {
        uint256 x = svm.createUint256("x");
	uint256 y = svm.createUint256("y");
	require(x == 0 || y == 0 || y <= type(uint256).max / x);
        uint256 result = MathMasters.mulWadUp(x, y);
        uint256 expected = x * y == 0 ? 0 : (x * y - 1) / 1e18 + 1;
        assert(result == expected);
        
    }
    // function check_mulWadUpDoesntRevert(uint256 x, uint256 y) public pure {
        // require(x == 0 || y == 0 || y <= type(uint256).max / x);
        //     uint256 result = MathMasters.mulWadUp(x, y);
        //     uint256 expected = x * y == 0 ? 0 :` (x * y - 1) / 1e18 + 1;
        //     assert(result == expected);
    // }
}
