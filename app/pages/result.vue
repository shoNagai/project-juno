<template>
  <div class="container has-text-centered">
    <h1 class="title is-size-2">
      Please waiting a transaction..
    </h1>
    <h2 class="subtitle is-size-4">
      You can contact to our.
    </h2>
  </div>
</template>

<script>
export default {
  components: {
  },
  fetch ({store}) {
    store.commit('menu/resetMenu')
  },
}
</script>
