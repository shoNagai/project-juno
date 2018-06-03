<template>
  <div class="home">
    <section class="hero is-dark is-medium">
      <div class="hero-body">
        <div class="container has-text-centered">
          <h1 class="title">
            Juno
          </h1>
          <h2 class="subtitle">
            Juno is a form of new marriage using blockchains
          </h2>
        </div>
      </div>
    </section>
    <div class="about">
      <center>
        <h4 class="title is-4">About</h4>
        <p>２人のメッセージはJunoを通してブロックチェーン上に記録されます。</p>
        <p>２人の気持ちはERC721トークンとして生成され、これまでに感じたこともない体験が待っています。</p>
        <p>（現在、テストネットの一つであるRopsten Test Networkでご利用いただけます。）</p>
      </center>
    </div>
    <div class="about">
      <center>
        <h4 class="title is-4">How to use</h4>
      </center>
      <div class="install metamask">
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
    </div>
  </div>
</template>

<script>
export default {
  name: 'home',
  components: {
  }
}
</script>

<style>
.about {
  padding: 20px;
  margin-top: 20px;
}
</style>