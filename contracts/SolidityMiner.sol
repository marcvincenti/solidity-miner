pragma solidity ^0.4.18;

contract SolidityMiner {

  uint32 constant max_block_nonce = 2 ** 32 - 1;

  function mint(bytes header, bytes4 target) external pure returns (uint32 nonce) {

    for (nonce = 0; nonce <= max_block_nonce; nonce++) {
      bytes32 hash = sha256(header, target, nonce);
      if (hash < target) {
        return nonce;
      }
    }

    // No valid nonce found
    revert();

  }

}
