<template>
  <div>
    Redirecting...
  </div>
</template>

<script setup>
import oidcClient from '@/oidc.js';
import {watchEffect} from "vue";
import {useRoute} from "vue-router";
const route = useRoute()

async function delay(millis) {
  return new Promise((resolve, reject) => {
    setTimeout(() => resolve(42), millis)
  })
}

watchEffect(async () => {
  console.log('watchEffect LoginRedirect.vue');

  if (route.path === '/login' && route.query['code'] && route.query['state'] && route.query['session_state']) {
    console.log("Proceeding /login")
    await delay(3000)

    try {
      let result = await oidcClient.signinRedirectCallback();
      console.log("oidcClient.signinRedirectCallback:", result);
      let user = await oidcClient.getUser()
      console.log("oidcClient.getUser:", user);
      // this.$router.push('/'); // Перенаправляем на главную страницу после успешной авторизации
    } catch (error) {
      console.error("Error during signinRedirectCallback", error);
    }
  }

});


</script>