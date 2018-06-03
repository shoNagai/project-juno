<template>
  <div class="container">
    <div class="column is-8 is-offset-2">
      <Signing class="column is-narrow is-9" />
    </div>
  </div>
</template>

<script>
import Signing from '~/components/Signing.vue'

export default {
  components: {
    Signing
  },
  fetch ({store}) {
    store.commit('menu/resetMenu')
  },
}
</script>
