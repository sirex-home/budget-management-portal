<template>
  <div>
    Redirecting...
  </div>
</template>

<script setup>
import {onMounted} from "vue";
import {useRoute, useRouter} from "vue-router";
import auth from "@/auth.js";
const route = useRoute()

onMounted(async () => {
  console.log('watchEffect LoginRedirect.vue');
  if (route.query.code) {
    await auth.registerTokens()
  }
});

</script>