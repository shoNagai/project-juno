var JunoContract = artifacts.require("./JunoContract.sol");

module.exports = function(deployer) {
  deployer.deploy(JunoContract, {
    gas:5000000
  });
};
