<template>
  <div class="container">
    <AllCouples class="column is-narrow is-12" />
  </div>
</template>

<script>
import AllCouples from '~/components/AllCouples.vue'

export default {
  components: {
    AllCouples
  },
  fetch ({store}) {
    store.commit('menu/resetMenu')
  },
}
</script>
