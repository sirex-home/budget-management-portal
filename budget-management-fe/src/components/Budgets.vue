<script setup>
import {ref, onMounted} from 'vue'
import {getBudgets} from '../services/client.js'
import PtTable from "@/components/table/PtTable.vue";
import Testo from "@/components/table/Testo.vue";
import {useRouter} from "vue-router";

let loading = ref(false)
const error = ref(null)
const router = useRouter()

const columns = ref([
  {'type': String, 'width': '50px',  'field': 'id',              'displayName': 'Id' },
  {'type': String, 'width': '200px', 'field': 'title',           'displayName': 'Title'},
  {'type': String, 'width': '100px', 'field': 'status',          'displayName': 'Status'},
  {'type': String, 'width': '120px', 'field': 'amount',          'displayName': 'Amount'},
  {'type': String, 'width': '380px', 'field': 'description',     'displayName': 'Description'},
  {'type': String, 'width': '100px', 'field': 'lastEventNumber', 'displayName': 'Last event number'},
  {'type': Date,   'width': '200px', 'field': 'createdAt',       'displayName': 'Created at'},
  {'type': Date,   'width': '200px', 'field': 'updatedAt',       'displayName': 'Updated at'},
])

function setLoading(state) {
  console.log("setLoading => ", state)
  loading.value = state
}

let trigger = ref(false)

function updateShow(newValue) {
  trigger.value = newValue;
  // setLoading(newValue)
}
</script>

<template>
  <v-container>
<!--    <div v-if="trigger">trigger</div>-->
<!--    <Testo @update:show="updateShow"></Testo>-->

    <div v-if="loading" class="centered-loader">
      <div class="loader"/>
    </div>
    <div v-else class="pt-table-wrapper">
      <div class="pt-search-bar">
        Some search bar here
      </div>
      <div class="pt-tab">
        <PtTable :columns="columns"
                 @update:loading="setLoading"
                 @row-clicked="row => router.push('/budgets/' + row.id)"
        >
        </PtTable>
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
