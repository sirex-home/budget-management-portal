<script setup>
import {onMounted, toRaw, ref} from "vue";
import {formatDateString} from "@/services/dateService.js";
import PtTableFilters from "@/components/table/PtTableFilters.vue";


const props = defineProps({
  tableId: {
    type: String,
    required: true
  },
  config: Object,
  pageableDataProvider: Function
})

const emit = defineEmits(['row-clicked', 'table-loading-data'])

onMounted(async () => {
  fetchBudgets(0, {})
})

const showSideMenu = ref(false)
const data = ref([])
const page = ref(1)
const totalPages = ref(0)
const selectedSearchParams = ref({})
const filtersPanelApi = ref(null)

const cssGridColumnsConfig = props.config.columns.map(el => el.width).join(" ")
const searchable = props.config.searchable
const filterableColumns = props.config.columns
    .filter(el => el.filterable)
    .map(el => { return { "field": el.field, "displayName": el.displayName } })

async function fetchBudgets(newPage) {
  emit('table-loading-data', true)
  const budgetsPage = await props.pageableDataProvider(newPage, {})
  data.value = budgetsPage.data
  totalPages.value = budgetsPage.total
  page.value = newPage
  emit('table-loading-data', false)
}

function openSearchTools() {
  showSideMenu.value = !showSideMenu.value
  filtersPanelApi.value.initializeState(toRaw(selectedSearchParams.value))
}

function updateSearchParams(searchParams) {
  selectedSearchParams.value = searchParams
  showSideMenu.value = false
  console.log('req', prepareSearchRequest())
}

function prepareSearchRequest() {
  const result = {}
  let params = toRaw(selectedSearchParams.value)

  if (params) {
    if (params._fulltextSearch !== null && params._fulltextSearch !== "") {
      result["fullText"] = params._fulltextSearch
    }
    const filtersInputsData = params._filtersInputsData;
    result["filters"] = []
    for (const fieldName in filtersInputsData) {
      const data = filtersInputsData[fieldName]
      if (data != null && data !== "") {
        result["filters"].push({ "field": fieldName, "value": data })
      }
    }
  }
  return result;
}

</script>

<template>
  <div class="pt-table-panel" v-if="data.length > 0">
    <PtTableFilters v-model="showSideMenu"
                    ref="filtersPanelApi"
                    :filterable-columns="filterableColumns" :searchable="searchable"
                    @filters-updated="updateSearchParams"></PtTableFilters>

    <v-container >
      <v-btn @click="openSearchTools">Search tools</v-btn>
    </v-container>

    <div class="pt-table-head">
      <div class="pt-table-header-cell" v-for="(column, index) in props.config.columns" :key="index">
        {{ column.displayName }}
      </div>
    </div>
    <div class="pt-table-body">
      <div class="pt-table-row" v-for="(row, rowIndex) in data" :key="rowIndex" @click="emit('row-clicked', row)">
        <div class="pt-table-cell" v-for="(column, colIndex) in props.config.columns" :key="colIndex">
          <span v-if="column.type === Date">{{ formatDateString(row[column.field]) }}</span>
          <span v-else>{{ row[column.field] }}</span>
        </div>
      </div>
    </div>
    <v-pagination v-model="page" :length="15" :total-visible="6"></v-pagination>
  </div>
</template>

<style scoped>
:root {
  --pt-table-gap: 10px;
}

.pt-search-bar {
  background-color: #9f9f9f;
  height: var(--searchbar-tab-height);
}

.pt-table-panel {
  display: inline-block;
  flex-direction: column;
  grid-template-rows: auto 1fr;
  margin: 3px;
}

.pt-table-head {
  display: grid;
  grid-template-columns: v-bind('cssGridColumnsConfig');
  font-weight: bold;
}


.pt-table-header-cell {
  padding: 2px;
  background-color: #f0f0f0;
  border: 1px solid #ccc;
  text-align: center;
}

.pt-table-body {
  display: grid;
  gap: var(--pt-table-gap);
}

.pt-table-row {
  display: grid;
  grid-template-columns: v-bind('cssGridColumnsConfig');
}
.pt-table-row:hover {
  background-color: rgba(0,0,0,0.05);
}

.pt-table-cell {
  padding: 10px;
  border: 1px solid #ccc;
  text-align: center;
  max-height: 5rem;
  text-overflow: ellipsis;
  overflow: hidden;
  white-space: nowrap;
}
</style>