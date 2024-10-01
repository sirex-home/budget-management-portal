<script setup>

import eventBus from '@/eventBuss.js'
import {ref, watch} from "vue";
import colors, {green, grey} from 'vuetify/util/colors'
import { useRoute } from 'vue-router'

const route = useRoute()

const contextualActions = ref([])
const updateContextualPanel = () => {
  if (route.meta && route.meta.actions) {
    contextualActions.value = route.meta.actions
  } else {
    contextualActions.value = []
  }
}

watch(route, updateContextualPanel, { immediate: false })

const menu = ref(false);

</script>

<template>
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

</template>

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