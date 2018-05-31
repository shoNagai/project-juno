<template lang="html">
  <div class="container">
      <div class="columns is-mobile is-multiline is-centered">
        <div class="column is-narrow" v-for="couple in allCouples" :key="couple.id">
          <figure class="image" style="width: 200px;height: 300px">
            <div class="content article-body">
              <p>{{ couple.groom }}</p>
            </div>
          </figure>
        </div>
      </div>
    </div>
</template>

<script>
import Web3 from 'web3'
import contract from 'truffle-contract'
import artifacts from '../../build/contracts/JunoToken.json'
const JunoToken = contract(artifacts)

export default {
  name: 'AllCouples',
  data() {
    return {
      isNetwork: true,
      allCouples: [],
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
      JunoToken.deployed()
        .then((instance) => instance.address)
        .then((address) => {
          this.contractAddress = address
          this.getAllCouples();
        })
    })
  },
  methods: {
    getAllCouples() {
      JunoToken.deployed().then((instance) => instance.getAllCouples()).then((result) => {
        for (var i = 0; i < result.length; i++) {
          this.getCouple(result[i])
        }
      })
    },
    getCouple(tokenId) {
      JunoToken.deployed()
      .then((instance) => instance.getCouple(tokenId, { from: this.account }))
      .then((result) => {
        var couple = {
          "groom": null,
          "bride": null,
          "junoPoint": null,
          "mintTime": null,
        }
        couple.tokenId = tokenId
        couple.groom = result[0].toString()
        couple.bride = result[1].toString()
        couple.junoPoint = result[2].toString()
        couple.mintTime = result[3].toString()
        this.allCouples.push(couple)
      })
    },
  }
}
</script>
