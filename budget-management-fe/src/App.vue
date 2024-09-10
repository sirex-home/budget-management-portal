<script setup>
import {onMounted, watchEffect, ref, watch} from 'vue';
import { useRoute } from 'vue-router'
import colors, {green, grey} from 'vuetify/util/colors'
import oidcClient from '@/oidc.js'

const route = useRoute()

async function delay(millis) {
  return new Promise((resolve, reject) => {
    setTimeout(() => resolve(42), millis)
  })
}

watchEffect(async () => {
  console.log('route.path', route.path);
  console.log('route.query', route.query);
  console.log('watchEffect App.vue');

  await delay(3000)

  if (route.path !== '/login') {
    console.log("Triggering oauth login")

    let user = await oidcClient.getUser();
    if (!user || user.expired) {
      console.log("Initiating signinRedirect")
      await oidcClient.signinRedirect(); // Редирект на страницу авторизации Keycloak
    }
  }

});

onMounted( () => {
  console.log("route name: ", route.path)
})


const menu = ref(false);

function logout() {
  // Добавьте логику для выхода из системы
  console.log('Logging out...');
}

const contextualActions = ref([])
const updateContextualPanel = () => {
  if (route.meta && route.meta.actions) {
    contextualActions.value = route.meta.actions
  } else {
    contextualActions.value = []
  }
}

watch(route, updateContextualPanel, { immediate: false })

import eventBus from '@/eventBuss.js'
import {getBudgetDetails, getBudgetEvents} from "@/services/client.js";
</script>

<template>
  <v-app>
    <v-app-bar app color="primary" density="compact">
      <v-toolbar-title>Management Portal</v-toolbar-title>
      <div v-if="contextualActions.length > 0" class="contextual-app-bar-menu">
        <div class="app-bar-btn app-bar-contextual-btn">
          <v-icon @click="() => eventBus.emit(act.event, null)" v-for="(act, index) in contextualActions" :key="index" >{{ act.icon }}</v-icon>
        </div>
      </div>
<!--      <v-spacer/>-->
      <v-menu offset-y>
        <template v-slot:activator="{ props }">
          <div class="app-bar-btn app-bar-core-btn" v-bind="props">
            <v-icon>mdi-account</v-icon>
          </div>
        </template>
        <v-list>
          <v-list-item @click="logout">
            <v-list-item-title>Logout</v-list-item-title>
          </v-list-item>
        </v-list>
      </v-menu>
    </v-app-bar>

    <v-navigation-drawer app>
      <v-list>
        <v-list-item :to="{ name: 'home' }">
          <v-list-item-title>
            <v-icon>mdi-home</v-icon>
            Home
          </v-list-item-title>
        </v-list-item>

        <v-list-item :to="{ name: 'budgets' }">
          <v-list-item-title>
            <v-icon>mdi-cash</v-icon>
            Budgets
          </v-list-item-title>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-main>
      <router-view/>
    </v-main>
  </v-app>
</template>

<script setup>
</script>

<style>
</style>


<style scoped>
.contextual-app-bar-menu {
  margin-right: 15px;
  background-color: rgba(255, 255, 255, 0.1);
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: center;
  border-radius: 20px;
  gap: 10px;
  padding: 2px;
}

.app-bar-btn {
  aspect-ratio: 1 / 1;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 20px;
  cursor: pointer;
}

.app-bar-btn:hover {
  background-color: rgba(0,0,0,0.1);
}

.app-bar-core-btn {
  margin-right: 15px;
  background-color: rgba(255, 255, 255, 0.1);
  height: 40px;
}

.app-bar-contextual-btn {
  height: 30px;
}

</style>
