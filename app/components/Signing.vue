<template lang="html">
  <div class="container">
    <div class="columns is-mobile is-multiline is-centered">
      
    </div>
  </div>
</template>

<script>
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
    console.log('dispatching registerWeb3')
    this.$store.dispatch('web3/registerWeb3').then(() => {
      JunoToken.setProvider(web3.currentProvider)
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