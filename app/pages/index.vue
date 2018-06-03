<template>
  <div class="container">
    <Home/>
  </div>
</template>

<script>
import Home from '~/components/Home.vue'

export default {
  components: {
    Home
  },
  fetch ({store}) {
    store.commit('menu/resetMenu')
  },
}
</script>
