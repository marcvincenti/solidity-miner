'use strict';

var SolidityMiner = artifacts.require("../contracts/SolidityMiner.sol");

contract('SolidityMiner', function(accounts) {

  it("should mint a new block", function() {
    return SolidityMiner.deployed()
      .then(function(instance) {
        return instance.mint.call(0x01, 0x1d00ffff);
      }).then(function(result){
        assert(result.toNumber()===15);
      });
  });

});
