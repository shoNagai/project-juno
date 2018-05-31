<template lang="html">
  <div class="container">
    <div class="columns is-mobile is-multiline is-centered">
      
    </div>
  </div>
</template>

<script>
import Web3 from 'web3'
import contract from 'truffle-contract'
import artifacts from '../../build/contracts/JunoToken.json'
const JunoToken = contract(artifacts)

export default {
  name: 'Signing',
  data() {
    return {
      isNetwork: true,
      groom: null,
      bride: null,
      groomAddr: null,
      brideAddr: null,
      txHash: null,
      txUrl: null,
      message: null,
      account: null,
      contractAddress: null,
    }
  },
  created() {
    if (typeof web3 !== 'undefined') {
      // Use Mist/MetaMask's provider
      web3 = new Web3(web3.currentProvider)
    } else {
      // fallback - use your fallback strategy (local node / hosted node + in-dapp id mgmt / fail)
      web3 = new Web3(new Web3.providers.HttpProvider("http://127.0.0.1:8545"))
    }
    JunoToken.setProvider(web3.currentProvider)
    web3.eth.getAccounts((err, accs) => {
      if (web3.currentProvider.publicConfigStore._state.networkVersion !== process.env.NETWORKID) {
        this.isNetwork = false
      } else {
        this.isNetwork = true
      }
      if (err != null) {
        console.log(err)
        this.message = "There was an error fetching your accounts. Do you have Metamask, Mist installed or an Ethereum node running? If not, you might want to look into that"
        return
      }
      if (accs.length == 0) {
        this.message = "Couldn't get any accounts! Make sure your Ethereum client is configured correctly."
        return
      }
      this.account = accs[0];
      JunoToken.deployed().then((instance) => instance.address).then((address) => {
        this.contractAddress = address
      })
    })
  },
  methods: {
    async haikuCompose() {
      this.message = "Transaction started";
      await JunoToken.deployed()
      .then((instance) => instance.mint(
        this.groom, this.bride, this.groomAddr, this.brideAddr, {
        from: this.account
      })).then((result) => {
        this.message = "Transaction result"
        this.txHash = result.tx
        this.txUrl = process.env.TXURL + result.tx
        this.content = null
      }).catch((e) => {
        // console.error(e)
        this.message = "Transaction failed"
      })
    },
  }
}
</script>