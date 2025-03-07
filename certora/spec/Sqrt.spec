methods {
    function mathMastersSqrtTopHalf(uint256 x) external returns uint256 envfree;
    function solmateSqrtTopHalf(uint256 x) external returns uint256 envfree;
}

rule uniSqrtMatchesMathMastersSqrt(uint256 x) {
    assert(solmateSqrtTopHalf(x) == mathMastersSqrtTopHalf(x));
}