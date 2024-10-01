<script setup>
import {watchEffect, ref, watch} from 'vue';
import { useRoute } from 'vue-router'
import auth from '@/auth.js'
import AuthorizedUserPage from '@/components/core/AuthorizedUserPage.vue'

const route = useRoute()

watchEffect(async () => {
  console.log("App.vue: route path:", route.path, location.pathname)
  if (location.pathname !== "/login") {
    try {
      console.log("auth check")
      if (!auth.isAuthenticated.value) {
        await auth.openLoginPage();
      }
    } catch (error) {
      console.error('Authentication error:', error);
    }
  }
});

import AnonymousUserPage from "@/components/core/AnonymousUserPage.vue";
</script>

<template>
  <v-app>
    <AuthorizedUserPage v-if="auth.isAuthenticated"></AuthorizedUserPage>
    <AnonymousUserPage v-else></AnonymousUserPage>
  </v-app>
</template>

<script setup>
</script>

<style>
</style>


<style scoped>
</style>
