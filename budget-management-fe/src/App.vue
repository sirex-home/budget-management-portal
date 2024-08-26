<script setup>
import {ref} from 'vue';
import colors from 'vuetify/util/colors'

const menu = ref(false);

function logout() {
  // Добавьте логику для выхода из системы
  console.log('Logging out...');
}
</script>

<template>
  <v-app>
    <v-app-bar app color="primary" density="compact">
      <v-toolbar-title>Management Portal</v-toolbar-title>
      <v-spacer/>
      <v-menu offset-y>
        <template v-slot:activator="{ props }">
          <v-hover v-slot="{ isHovering }">
            <v-avatar v-bind="props" size="35" class="mr-6" variant="flat"
                      :color="isHovering ? colors.blue.lighten5 : colors.blue.lighten4">
              <v-icon>mdi-account</v-icon>
            </v-avatar>
          </v-hover>

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
.app {
  --top-bar-height: 40px;
  --menu-icon-width: 30px;
  --menu-icon-height: 30px;
  --side-menu-width: 170px;

  height: 100%;
}

.menu-button {
  color: var(--neutral-bg-text-color);
  padding: 5px 10px;
  display: flex;
  flex-direction: row;
  gap: 10px;
  align-items: center;
  justify-content: flex-start;
}

.menu-icon {
  width: var(--menu-icon-width);
  height: var(--menu-icon-height);
}

.top-bar {
  height: var(--top-bar-height);
  background-color: var(--dark-bg-color);
  color: var(--dark-bg-text-color);
  display: flex;
  flex-direction: row;
  align-items: center;
  padding: 5px 15px;
}

.app-main-field {
  height: calc(100% - var(--top-bar-height));
}

.column {
  display: flex;
  flex-direction: column;
}

.row {
  display: flex;
  flex-direction: row;
}

.menu-column {
  width: var(--side-menu-width);
  display: flex;
  flex-direction: column;
  background-color: var(--neutral-bg-color);
}

.main-container {
  width: calc(100% - var(--side-menu-width));
  height: 100%;
  background: var(--light-bg-color);
}

</style>
