<script setup>
import { ref, watch, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import {getBudgets, getBudgets2} from '../services/client.js'
import PtTable from "@/components/table/PtTable.vue";

const route = useRoute()

let loading = ref(false)
const budgets = ref([])
const error = ref(null)

async function fetchBudgets(page) {
  loading.value = true
  // budgets.value = []
  budgets.value = await getBudgets(page)
  loading.value = false
  return
}

onMounted(async () => {
  console.log("Hook!")
  await fetchBudgets(0)
})

const columns = ref([
    {'field': 'id',              'displayName': 'Id',                'width': '50px',  'type': String },
    {'field': 'title',           'displayName': 'Title',             'width': '200px', 'type': String },
    {'field': 'status',          'displayName': 'Status',            'width': '100px', 'type': String },
    {'field': 'amount',          'displayName': 'Amount',            'width': '120px', 'type': String },
    {'field': 'description',     'displayName': 'Description',       'width': '380px', 'type': String },
    {'field': 'lastEventNumber', 'displayName': 'Last event number', 'width': '100px', 'type': String },
    {'field': 'createdAt',       'displayName': 'Created at',        'width': '200px', 'type': Date   },
    {'field': 'updatedAt',       'displayName': 'Updated at',        'width': '200px', 'type': Date   },
])
</script>

<template>
  <div v-if="loading" class="centered-loader">
    <div class="loader" />
  </div>
  <div v-else class="pt-table-wrapper">
    <div class="pt-search-bar">
      Some search bar here
    </div>
    <div class="pt-tab">
      <PtTable :columns="columns" :data="budgets"></PtTable>
    </div>
  </div>
</template>

<style scoped>
.pt-table-wrapper {
  --searchbar-tab-height: 30px;

  height: 100%;
}
.pt-search-bar {
  background-color: #9f9f9f;
  height: var(--searchbar-tab-height);
}
.pt-tab {
  flex-grow: 1;
  overflow: scroll;
  height: calc(100% - var(--searchbar-tab-height));
}
</style>
