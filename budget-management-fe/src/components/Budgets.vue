<script setup>
import {ref} from 'vue'
import {getBudgets} from '../services/client.js'
import PtTable from "@/components/table/PtTable.vue";
import {useRouter} from "vue-router";

let loading = ref(false)
const error = ref(null)
const router = useRouter()

const config = ref({
  searchable: true,
  columns: [
    {'type': String, 'width': '50px',  'filterable': false, 'sortable': true,  'field': 'id',              'displayName': 'Id' },
    {'type': String, 'width': '200px', 'filterable': true,  'sortable': false, 'field': 'title',           'displayName': 'Title'},
    {'type': String, 'width': '100px', 'filterable': true,  'sortable': false, 'field': 'status',          'displayName': 'Status'},
    {'type': String, 'width': '120px', 'filterable': false, 'sortable': true,  'field': 'amount',          'displayName': 'Amount'},
    {'type': String, 'width': '380px', 'filterable': true,  'sortable': false, 'field': 'description',     'displayName': 'Description'},
    {'type': String, 'width': '100px', 'filterable': false, 'sortable': false, 'field': 'lastEventNumber', 'displayName': 'Last event number'},
    {'type': Date,   'width': '200px', 'filterable': false, 'sortable': true,  'field': 'createdAt',       'displayName': 'Created at'},
    {'type': Date,   'width': '200px', 'filterable': false, 'sortable': true,  'field': 'updatedAt',       'displayName': 'Updated at'},
    {'type': String, 'width': '100px', 'filterable': false, 'sortable': false, 'field': 'updatedBy',       'displayName': 'Updated by'},
  ]
})

function setLoading(state) {
  loading.value = state
}
const tableId = "budgets"

</script>

<template>
  <v-container class="page-container">
    <div v-show="loading" class="centered-loader">
      <div class="loader"/>
    </div>
    <PtTable :table-id='tableId' :config="config" :pageableDataProvider="getBudgets"
             @table-loading-data="setLoading"
             @row-clicked="row => router.push('/budgets/' + row.id)">
    </PtTable>
  </v-container>
</template>

<style scoped>
.page-container {
  height: calc(100vh - var(--v-layout-top));
  //background-color: #004040;
}

</style>
