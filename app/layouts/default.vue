<template>
  <section class="hero is-fullheight">
    <div class="hero-head">
      <navbar/>
    </div>
    <div class="hero-body">
      <nuxt/>
    </div>
    <div class="hero-foot">
      <footer-bar/>
    </div>
  </section>
</template>

<script>
import Navbar from '~/components/NavigationBar.vue'
import FooterBar from '~/components/FooterBar.vue'

export default {
  head() {
    return {
      title: 'Juno'
    }
  },
  components: {
    Navbar,
    FooterBar
  }
}
</script>

<style>
.sf-site-all {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}
.sf-site-content {
  flex: 1;
}
</style>
