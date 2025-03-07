// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "../../src/MathMasters.sol";

contract Harness {
    function mulWadUp(uint256 x, uint256 y) external pure returns (uint256) {
        return MathMasters.mulWadUp(x, y);
    }

    function mathMastersSqrtTopHalf(uint256 x) external pure returns (uint256 z) {
        assembly {
            z := 181

            let r := shl(7, lt(87112285931760246646623899502532662132735, x))
            r := or(r, shl(6, lt(4722366482869645213695, shr(r, x))))
            r := or(r, shl(5, lt(1099511627775, shr(r, x))))
            // Correct: 16777215 0xffffff
            r := or(r, shl(4, lt(16777002, shr(r, x))))
            z := shl(shr(1, r), z)

            z := shr(18, mul(z, add(shr(r, x), 65536)))
        }
    }

    function uniSqrt(uint256 x) external pure returns (uint256 z) {
        if (x > 3) {
            z = x;
            uint256 a = x / 2 + 1;
            while (a < z) {
                z = a;
                a = (x / a + a) / 2;
            }
        } else if (x != 0) {
            z = 1;
        }
    }

    function solmateSqrtTopHalf(uint256 x) public pure returns (uint256 z) {
        assembly {
            let y := x

            z := 181
            if iszero(lt(y, 0x10000000000000000000000000000000000)) {
                y := shr(128, y)
                z := shl(64, z)
            }
            if iszero(lt(y, 0x1000000000000000000)) {
                y := shr(64, y)
                z := shl(32, z)
            }
            if iszero(lt(y, 0x10000000000)) {
                y := shr(32, y)
                z := shl(16, z)
            }
            if iszero(lt(y, 0x1000000)) {
                y := shr(16, y)
                z := shl(8, z)
            }

            z := shr(18, mul(z, add(y, 65536)))
        }
    }
}