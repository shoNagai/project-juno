<template>
  <div class="container">
    <MyCouples class="column is-narrow is-12" />
  </div>
</template>

<script>
import MyCouples from '~/components/MyCouples.vue'

export default {
  components: {
    MyCouples
  },
  fetch ({store}) {
    store.commit('menu/resetMenu')
  },
}
</script>
