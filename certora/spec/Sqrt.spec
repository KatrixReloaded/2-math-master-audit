methods {
    function mathMastersSqrtTopHalf(uint256 x) external returns uint256 envfree;
    function solmateSqrtTopHalf(uint256 x) external returns uint256 envfree;
}

rule uniSqrtMatchesMathMastersSqrt(uint256 x) {
    require(x != 0xffff2b000000000000000000000001);
    assert(solmateSqrtTopHalf(x) == mathMastersSqrtTopHalf(x));
}