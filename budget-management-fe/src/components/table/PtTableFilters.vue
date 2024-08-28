<script setup>

import {ref, toRaw} from "vue";

const emit = defineEmits(['filters-updated'])

defineProps({
  filterableColumns: Array,
  searchable: Boolean
})

defineExpose({
  initializeState
})

let showSideMenu = ref(false)
let fulltextSearch = ref("")
const filtersInputsData = ref({});


function initializeState(searchParams) {
  const imported = JSON.parse(JSON.stringify(searchParams))
  if (imported._fulltextSearch || imported._fulltextSearch === "") {
    fulltextSearch.value = imported._fulltextSearch
  }
  if (imported._filtersInputsData !== undefined && imported._filtersInputsData !== null) {
    filtersInputsData.value = imported._filtersInputsData
  }
}

function exportSearchParams() {
  const result = JSON.parse(JSON.stringify({
    '_fulltextSearch': toRaw(fulltextSearch.value),
    '_filtersInputsData': toRaw(filtersInputsData.value)
  }));
  return result
}

function resetSearchInputs() {
  fulltextSearch.value = ''
  for (let key in filtersInputsData.value) {
    delete filtersInputsData.value[key];
  }
  emit('filters-updated', exportSearchParams())
}

function applySearch() {
  emit('filters-updated', exportSearchParams())
}
</script>

<template>
  <v-navigation-drawer v-model="showSideMenu" location="right" :width="600" temporary >
    <v-list>

      <v-list-item v-if="searchable" title="Fulltext search"></v-list-item>
      <v-list-item v-if="searchable">
        <v-text-field v-model="fulltextSearch" label="Fulltext search" variant="filled" density="compact"></v-text-field>
      </v-list-item>

      <v-list-item title="Filters"></v-list-item>
      <v-divider></v-divider>
      <v-list-item v-for="(column, index) in filterableColumns" :key="index">
        <v-text-field v-model="filtersInputsData[column.displayName]" :label="column.displayName"></v-text-field>
      </v-list-item>
      <v-container>
        <v-btn @click="resetSearchInputs">Reset</v-btn>
        <v-btn @click="applySearch">Apply</v-btn>
      </v-container>
    </v-list>
  </v-navigation-drawer>
</template>

<style scoped>
</style>