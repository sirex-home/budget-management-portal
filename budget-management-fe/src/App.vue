<script setup>
import HomeIcon from "@/components/icons/HomeIcon.vue";
import BudgetsIcon from "@/components/icons/BudgetsIcon.vue";
</script>

<template>
  <div class="app column">
    <div class="top-bar">
      <div>Accounting portal</div>
    </div>
    <div class="app-main-field row">
      <div class="menu-column">
        <RouterLink to="/home" class="menu-button"><HomeIcon class="menu-icon" /><div>Home</div></RouterLink>
        <RouterLink to="/budgets" class="menu-button"><BudgetsIcon class="menu-icon" />Budgets</RouterLink>
      </div>
      <main class="main-container">
        <RouterView/>
      </main>
    </div>
  </div>
</template>

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
