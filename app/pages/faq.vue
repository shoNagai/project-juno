<template>
  <div class="container">
    <f-a-q class="column is-narrow is-12" />
  </div>
</template>

<script>
import FAQ from '~/components/FAQ.vue'

export default {
  components: {
    FAQ
  },
  fetch ({store}) {
    store.commit('menu/resetMenu')
  },
}
</script>
