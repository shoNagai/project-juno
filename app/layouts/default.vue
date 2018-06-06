<template>
  <section class="hero is-fullheight">
    <div id="top" class="hero-head">
      <navbar/>
    </div>
    <div class="hero-body">
      <nuxt/>
      <div v-if="250 < scrollY">
        <transition name="fade">
          <a href="#" id="return-top" v-scroll-to="'#top'">Top</a>
        </transition>
      </div>
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
  },
  data () {
    return {
      scrollY: 0
    }
  },
  mounted () {
    window.addEventListener('scroll', this.handleScroll)
  },
  methods: {
    handleScroll() {
      this.scrollY = window.scrollY
    },
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
#return-top {
    background-color: #363636;
    border-radius: 50%;
    bottom: 50px;
    color: #fff;
    font-size: 14px;
    height: 50px;
    line-height: 50px;
    outline: 0;
    position: fixed;
    right: 30px;
    text-align: center;
    width: 50px;
}
</style>