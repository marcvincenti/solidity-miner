'use strict';

var contract = artifacts.require("./SolidityMiner.sol");

contract('SolidityMiner', function(accounts) {

  it("should mint a new block", function() {
    return contract.deployed()
      .then(function(instance) {
        return instance.mint(0x01, 0x1d00ffff);
      }).then(function(result){
        console.log(result);
      });
  });

});
