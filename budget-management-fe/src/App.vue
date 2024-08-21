<script setup>
import HomeIcon from "@/components/icons/HomeIcon.vue";
import BudgetsIcon from "@/components/icons/BudgetsIcon.vue";
</script>

<template>
  <div class="full-height column">
    <div class="top-bar">
      <div>Accounting portal</div>
    </div>
    <div class="full-height row">
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
.menu-button {
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

.full-height {
  height: 100vh;
}

.top-bar {
  height: var(--top-bar-height);
  background-color: var(--top-menu-color);
  color: var(--top-menu-text-color);
  display: flex;
  flex-direction: row;
  align-items: center;
  padding: 5px 15px;
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
}

.main-container {
  width: 100%;
  background: #ccaccc;
}

</style>
