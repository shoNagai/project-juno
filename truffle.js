var config = require('./config');
var HDWalletProvider = require("truffle-hdwallet-provider");
var mnemonic = config.mnemonic;
var accessToken = config.infuraAccessToken;

module.exports = {
  networks: {
    dev: {
      host: "localhost",
      port: 8545,
      network_id: "*"
    },
    gana: {
      host: "localhost",
      port: 7545,
      network_id: "*"
    },
    ropsten: {
      provider:function(){
        return new HDWalletProvider(
          mnemonic,
          "https://ropsten.infura.io/" + accessToken
        );
      },
      network_id:3,
      gas:500000
    }
  }
};
