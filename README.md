# Juno

> juno is a form of new marriage using blockchains

# technology
ERC721 (Solidity + web3.js + truffle + nuxt.js)

## Build Setup

``` bash
# install dependencies
$ npm install # Or yarn

# serve with hot reload at localhost:3000
$ npm run dev

# build for production and launch server
$ npm run build
$ npm start

# generate static project
$ npm run generate
```

## Setup firebase environment

``` bash

$ direnv edit .

# Please edit the deploy env
export TXURL=export TXURL=https://rinkeby.etherscan.io/tx/
export NETWORKID=4
```

## Truffle Setup

``` bash
# deploy ganache localhost
truffle migrate --network dev

```

For detailed explanation on how things work, checkout the [Nuxt.js docs](https://github.com/nuxt/nuxt.js).
