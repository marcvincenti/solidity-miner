pragma solidity ^0.4.18;

contract SolidityMiner {

  uint32 constant max_block_nonce = 2 ** 32 - 1;

  function mint(bytes header, uint32 diff) external pure returns (uint32 nonce) {
    bytes32 b_target;
    uint256 target = (0xffff * 2**208) / diff;

    assembly {
      mstore(add(b_target, 32), target)
    }

    for (nonce = 0; nonce <= max_block_nonce; nonce++) {
      bytes32 hash = sha256(header, target, nonce);
      if (hash < b_target) {
        return nonce;
      }
    }

    // No valid nonce found
    revert();

  }

}
