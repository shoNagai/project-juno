var JunoToken = artifacts.require("./JunoToken.sol");

module.exports = function(deployer) {
  deployer.deploy(JunoToken, {
    gas:5000000
  });
};
