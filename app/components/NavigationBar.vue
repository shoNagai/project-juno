<template>
  <section class="hero is-dark is-large">
    <div class="hero-head">
      <nav class="navbar">
        <div class="container">
          <div class="navbar-brand">
            <nuxt-link to="/" class="navbar-item">
              <!-- <img src="https://bulma.io/images/bulma-type-white.png" alt="Logo"> -->
              Juno
            </nuxt-link>
            <span class="navbar-burger burger" data-target="navbarMenuHeroB" @click="$store.commit('menu/toggleMenu')" :class="{'is-active': $store.state.menu.isMenuActive}">
              <span></span>
              <span></span>
              <span></span>
            </span>
          </div>
          <div id="navbarMenuHeroB" class="navbar-menu"  :class="{'is-active': $store.state.menu.isMenuActive}">
            <div class="navbar-end">
              <nuxt-link to="/sign" class="navbar-item ">Sign</nuxt-link>          
              <nuxt-link to="/allList" class="navbar-item ">Couples</nuxt-link>
              <nuxt-link to="/myPage" class="navbar-item ">MyPage</nuxt-link>
              <nuxt-link to="/faq" class="navbar-item ">FAQs</nuxt-link>
            </div>
          </div>
        </div>
      </nav>
    </div>
  </section>
</template>

<script>
export default {
  methods: {
    setActive(){
      Vue.set(this.$data, 'isActive', true)
    }
  },
}
</script>