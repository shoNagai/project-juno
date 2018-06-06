<template>
  <div class="faq">
    <center>
      <h4 class="title is-4">How to use</h4>
    </center>
    <br/>
    <div class="install metamask">
      <h4 class="subtitle is-4">Use MetaMask</h4>
      <h5 class="subtitle is-5">1. Install MetaMask</h5>
      <ul>
        <p>まず、Google Chromeの拡張機能である<a href="https://metamask.io/" target="_blank">MetaMask</a>をインストールします。</p>
        <p>インストールが完了したら、ネットワークをRopsten Test Networkに設定します。</p>
        <img src="../assets/network_select.png" style="width: 200px; height: auto; box-shadow: 2px 2px 5px 2px #ddd;"/>
      </ul>
    </div>
    <br/>
    <div class="get eth">
      <h5 class="subtitle is-5">2. Get ETH</h5>
      <ul>
        <p>Junoを利用するためのETHを取得します。</p>
        <p><a href="https://faucet.metamask.io/" target="_blank">MetaMask Ether Faucet</a>へアクセスします。</p>
        <p>緑色のボタン[request 1 ether from faucet]をクリックすると、テスト用のETHを取得できます。</p>
        <p>（取得したETHは、MetaMaskから確認できます。反映に少し時間がかかる場合があります。）</p>
        <img src="../assets/metamask_ether_faucet.png" style="width: 400px; height: auto; box-shadow: 2px 2px 5px 2px #ddd;"/>
      </ul>
    </div>
    <br/>
    <div class="go sign">
      <h5 class="subtitle is-5">3. Go Sign</h5>
      <ul>
        <p>メニューよりSignをクリックします。</p>
      </ul>
    </div>
    <br/>
    <br/>
    <br/>
    <div class="install trustwallet">
      <h4 class="subtitle is-4">Use Trust Wallet</h4>
      <h5 class="subtitle is-5">1. Install Trust Wallet</h5>
      <ul>
        <p>まず、スマートフォン用アプリである<a href="https://trustwalletapp.com/" target="_blank">Trust Wallet</a>をインストールします。</p>
        <p>インストールが完了したら、Trust Wallet内のsettingsメニューからNetworkをRopsten Test Networkに設定します。</p>
        <img src="../assets/network_select_trust1.png" style="width: 200px; height: auto; box-shadow: 2px 2px 5px 2px #ddd;"/>
        <img src="../assets/network_select_trust2.png" style="width: 200px; height: auto; box-shadow: 2px 2px 5px 2px #ddd;"/>
      </ul>
    </div>
    <br/>
    <div class="get eth">
      <h5 class="subtitle is-5">2. Get ETH</h5>
      <ul>
        <p>Junoを利用するためのETHを取得します。</p>
        <p>Trust Wallet内のBrowserへアクセスします。</p>
        <p>Browser内に存在するGet ETHより、テスト用のETHを取得できます。</p>
        <p>（取得したETHは、Trust Wallet内のWalletから確認できます。反映に少し時間がかかる場合があります。）</p>
        <img src="../assets/get_eth_trust1.png" style="width: 200px; height: auto; box-shadow: 2px 2px 5px 2px #ddd;"/>
        <img src="../assets/get_eth_trust2.png" style="width: 200px; height: auto; box-shadow: 2px 2px 5px 2px #ddd;"/>
        <img src="../assets/get_eth_trust3.png" style="width: 200px; height: auto; box-shadow: 2px 2px 5px 2px #ddd;"/>
      </ul>
    </div>
    <br/>
    <div class="go sign">
      <h5 class="subtitle is-5">3. Go Sign</h5>
      <ul>
        <p>Trust Wallet内のBrowserへアクセスします。</p>
        <p>Browser内のアドレス欄へ、https://juno-project.herokuapp.com/を入力し、Junoへアクセスします。</p>
        <p>あとはMetaMask同様にメニューよりSignをクリックしてお使い頂けます。</p>
        <img src="../assets/access_juno_trust.png" style="width: 200px; height: auto; box-shadow: 2px 2px 5px 2px #ddd;"/>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: 'howToUse',
  components: {
  }
}
</script>

<style>
.faq {
  padding: 20px;
  margin-top: 20px;
}
</style>