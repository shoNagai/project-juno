<template>
  <div class="container has-text-centered">
    <div v-if="!isNetwork">
      <h4 class="title is-4">Network Infomation</h4>
      <p v-if="!isNetwork">This Network is Not Ropsten!</p>
      <p v-if="!isNetwork">Please check your MetaMask!</p>
      <p v-if="contractAddress && isNetwork">This contract is deployed at {{contractAddress}}</p>
      <p v-if="account && isNetwork">Current address: {{account}}</p>
      <p v-if="!account && isNetwork">No accounts found</p>
    </div>
    <div v-if="isNetwork" class="container has-text-centered column is-10 is-offset-1">
      <h4 class="title is-4">My Cauples</h4>
      <div class="columns is-mobile is-multiline is-centered">
        <div v-for="(couple, key, index) in allCouples" :key="index" >
          <div class="card couple-card">
            <div class="message-header">
              <p>#{{couple.tokenId}}</p>
              <button class="delete" aria-label="delete" @click="deleteCouple(couple.tokenId)"></button>
            </div>
            <div class="card-content">
              <h4 class="title">{{ couple.content }}</h4>
              <h4 class="subtitle">{{ couple.groom }} × {{ couple.bride }}</h4>
            </div>
          </div>
        </div>
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
  name: 'MyCouples',
  data() {
    return {
      isNetwork: false,
      allCouples: [],
      message: null,
      account: null,
      contractAddress: null,
    }
  },
  async mounted() {
    web3 = new Web3(Web3.givenProvider || "ws://localhost:8545");
    JunoToken.setProvider(web3.currentProvider)
    const networkId = await web3.eth.net.getId();
    web3.eth.getAccounts((err, accs) => {
      if (networkId !== Number(process.env.NETWORKID)) {
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
      JunoToken.deployed().then((instance) => instance.getCouples(this.account, { from: this.account })).then((result) => {
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
          "content":null,
          "junoPoint": null,
          "mintTime": null,
        }
        couple.tokenId = Number(tokenId)
        couple.groom = result[0].toString()
        couple.bride = result[1].toString()
        couple.content = result[2].toString()
        couple.junoPoint = result[3].toString()
        couple.mintTime = result[4].toString()
        this.allCouples.push(couple)
      })
    },
    async deleteCouple(tokenId) {
      this.message = "Transaction started";
      await JunoToken.deployed()
      .then((instance) => instance.burn(tokenId, { from: this.account }))
      .then((result) => {
        this.message = "Transaction result"
      }).catch((e) => {
        console.error(e)
        this.message = "Transaction failed"
      })
    },
  }
}
</script>

<style>
.allcauples.list {
  border-bottom: solid 1px rgba(0,0,0,0.42);
  margin-left: 300px;
  margin-right: 300px;
  margin-top: 50px;
}
.couple-card {
  width: 285px;
  height: 200px;
  margin: 5px;
}
.couple-card:hover { 	
  box-shadow: 0 15px 10px -5px rgba(0,0,0,.15),0 0 5px rgba(0,0,0,.1);
  transform: translateY(-4px);
  transition: 0.2s;
  background: #fff;
}
</style>