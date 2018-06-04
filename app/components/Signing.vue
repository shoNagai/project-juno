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
      <center>
        <h4 class="title is-4">Sign</h4>
      </center>
      <br/>
      <div v-if="message">
        <div>・{{message}}</div>
        <div v-if="txHash"><a v-bind:href="txUrl">{{txHash}}</a></div>
      </div>
      <div v-if="errormessage">
        <div class="notification is-danger">・{{errormessage}}</div>
        <br/>
      </div>
      <div class="field is-horizontal">
          <div class="field-body">
            <div class="field">
              <p class="control">
                <input class="input" type="text" maxlength="10" placeholder="groom" v-model="groom">
              </p>
            </div>
            <div class="field">
              <p class="control">
                <input class="input" type="text" maxlength="10" placeholder="bride" v-model="bride">
              </p>
            </div>
          </div>
        </div>
        <div class="field is-horizontal">
          <div class="field-body">
            <div class="field">
              <div class="control">
                <textarea class="textarea" maxlength="60" placeholder="Message...60 characters" v-model="content"></textarea>
              </div>
            </div>
          </div>
        </div>
        <div class="field is-horizontal">
          <div class="field-body">
            <div class="field">
              <div class="control">
                <button v-bind:disabled="!isNetwork" class="button" @click="signConfirm">
                  Sign
                </button>
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
  name: 'Signing',
  components: {
  },
  data() {
    return {
      isNetwork: false,
      groom: "",
      bride: "",
      content:"",
      txHash: null,
      txUrl: null,
      message: null,
      errormessage: null,
      account: null,
      contractAddress: null,
      isActive: false,
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
        })
    })
  },
  methods: {
    async sign() {
      this.message = "Transaction started";
      await JunoToken.deployed()
      .then((instance) => instance.mint(
        this.groom, this.bride, this.content, {
        from: this.account
      })).then((result) => {
        this.message = "Transaction result"
        this.txHash = result.tx
        this.txUrl = process.env.TXURL + result.tx
        this.groom = null
        this.bride = null
        this.content = null
      }).catch((e) => {
        console.error(e)
        this.errormessage = "Transaction failed"
      })
    },
    signConfirm() {
      if(this.groom !== "" && this.groom !== null
        && this.bride !== "" && this.bride !== null
        && this.content !== "" && this.content !== null) {
        this.errormessage = ""
        this.sign();
      }else {
        this.errormessage = "You must fill in all of the fields."
      }
    },
  }
}
</script>