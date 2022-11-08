// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;
pragma abicoder v2;

import '../libraries/OracleLibrary.sol';

contract OracleTest {
    function consult(address pool, uint32 secondsAgo)
        public
        view
        returns (int24 arithmeticMeanTick, uint128 harmonicMeanLiquidity)
    {
        return OracleLibrary.consult(pool, secondsAgo);
    }

    function getQuoteAtTick(
        int24 tick,
        uint128 baseAmount,
        address baseToken,
        address quoteToken
    ) public pure returns (uint256 quoteAmount) {
        quoteAmount = OracleLibrary.getQuoteAtTick(tick, baseAmount, baseToken, quoteToken);
    }

    function getOldestObservationSecondsAgo(address pool)
        public
        view
        returns (uint32 secondsAgo, uint32 currentTimestamp)
    {
        secondsAgo = OracleLibrary.getOldestObservationSecondsAgo(pool);
        currentTimestamp = uint32(block.timestamp);
    }

    function getBlockStartingTickAndLiquidity(address pool) public view returns (int24, uint128) {
        return OracleLibrary.getBlockStartingTickAndLiquidity(pool);
    }

    function getWeightedArithmeticMeanTick(OracleLibrary.WeightedTickData[] memory observations)
        public
        pure
        returns (int24 arithmeticMeanWeightedTick)
    {
        return OracleLibrary.getWeightedArithmeticMeanTick(observations);
    }

    function getChainedPrice(address[] memory tokens, int24[] memory ticks) public view returns (int256 syntheticTick) {
        return OracleLibrary.getChainedPrice(tokens, ticks);
    }
}
