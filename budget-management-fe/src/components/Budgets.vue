<script setup>
import {ref, onMounted} from 'vue'
import {getBudgets} from '../services/client.js'
import PtTable from "@/components/table/PtTable.vue";
import {useRouter} from "vue-router";

let loading = ref(false)
const budgets = ref([])
const error = ref(null)
const router = useRouter()


async function fetchBudgets(page) {
  loading.value = true
  const budgetsPage = await getBudgets(page)
  budgets.value = budgetsPage.data
  console.log('--> ', budgets.value)
  loading.value = false
  return
}

onMounted(async () => {
  await fetchBudgets(0)
})

const columns = ref([
  {'field': 'id', 'displayName': 'Id', 'width': '50px', 'type': String},
  {'field': 'title', 'displayName': 'Title', 'width': '200px', 'type': String},
  {'field': 'status', 'displayName': 'Status', 'width': '100px', 'type': String},
  {'field': 'amount', 'displayName': 'Amount', 'width': '120px', 'type': String},
  {'field': 'description', 'displayName': 'Description', 'width': '380px', 'type': String},
  {'field': 'lastEventNumber', 'displayName': 'Last event number', 'width': '100px', 'type': String},
  {'field': 'createdAt', 'displayName': 'Created at', 'width': '200px', 'type': Date},
  {'field': 'updatedAt', 'displayName': 'Updated at', 'width': '200px', 'type': Date},
])

</script>

<template>
  <v-container>
    <div v-if="loading" class="centered-loader">
      <div class="loader"/>
    </div>
    <div v-else class="pt-table-wrapper">
      <div class="pt-search-bar">
        Some search bar here
      </div>
      <div class="pt-tab">
        <PtTable :columns="columns" :data="budgets" @row-clicked="row => router.push('/budgets/' + row.id)"></PtTable>
      </div>
    </div>
  </v-container>
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
