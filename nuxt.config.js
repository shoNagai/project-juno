const webpack = require('webpack')

module.exports = {
  /*
  ** Headers of the page
  */
  head: {
    title: 'Juno',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: 'juno is a form of new marriage using blockchains' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },
  // mode: 'spa',
  /*
  ** Customize the progress bar color
  */
  loading: { color: '#3B8070' },
  srcDir: 'app',
  /*
  ** Plugins to load before mounting the App
  */
  router: {
    // middleware: 'authenticated'
  },
  plugins: [
  ],
  /*
  ** Nuxt.js modules
  */
  modules: [,
  ],
  /*
  ** Include css not in components
  */
  css: [
    // node.js module but we specify the pre-processor
    { src: '~assets/main.scss', lang: 'scss' }
  ],
  /*
  ** Build configuration
  */
  build: {
    /*
    ** Run ESLint on save
    */
    extend (config, { isDev, isClient }) {
      if (isDev && isClient) {
        config.module.rules.push({
          enforce: 'pre',
          test: /\.(js|vue)$/,
          loader: 'eslint-loader',
          exclude: /(node_modules)/
        })
      }
      config.plugins.push(
        new webpack.EnvironmentPlugin([
        , 'TXURL', 'NETWORKID'])
      )
    }
  }
}
