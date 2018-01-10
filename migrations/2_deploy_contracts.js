var SolidityMiner = artifacts.require("./SolidityMiner.sol");

module.exports = function(deployer) {
  deployer.deploy(SolidityMiner);
};
