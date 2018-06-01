import Vue from 'vue'
import Vuex from 'vuex'
import menu from './modules/menu'
import web3 from './modules/web3'

Vue.use(Vuex)

export default () =>
  new Vuex.Store({
    modules: {
      menu,
      web3
    }
  })