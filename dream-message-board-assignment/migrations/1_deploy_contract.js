const DreamMessageBoard = artifacts.require("DreamMessageBoard");

module.exports = function(deployer) {
  deployer.deploy(DreamMessageBoard);
};