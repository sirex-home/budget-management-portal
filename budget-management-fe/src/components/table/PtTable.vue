<script setup>
import {onMounted, onUnmounted, toRaw, ref} from "vue";
import {formatDateString} from "@/services/dateService.js";
import PtTableFilters from "@/components/table/PtTableFilters.vue";
import {useTablesStore} from "@/components/table/tablesState.js";
import eventBus from "@/eventBuss.js"

const tablesStore = useTablesStore()

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
  fetchBudgets(1, {})
  eventBus.on('open:table-filters', openSearchTools)
})

onUnmounted(() => {
  eventBus.off('open:table-filters', openSearchTools)
})


const showSideMenu = ref(false)
const data = ref([])
const page = ref(1)
const totalPages = ref(0)
const filtersPanelApi = ref(null)

const cssGridColumnsConfig = props.config.columns.map(el => el.width).join(" ")
const searchable = props.config.searchable
const filterableColumns = props.config.columns
    .filter(el => el.filterable)
    .map(el => {
      return {"field": el.field, "displayName": el.displayName}
    })

async function fetchBudgets(newPage) {
  emit('table-loading-data', true)
  const reqPage = newPage - 1
  const budgetsPage = await props.pageableDataProvider(reqPage, {})
  data.value = budgetsPage.data
  totalPages.value = budgetsPage.total
  page.value = newPage
  emit('table-loading-data', false)
}

function openSearchTools() {
  showSideMenu.value = !showSideMenu.value
  filtersPanelApi.value.initializeState(toRaw(tablesStore.tablesParams[props.tableId]))
}

function updateSearchParams(searchParams) {
  tablesStore.setTableParams('budgets', searchParams)

  showSideMenu.value = false
  console.log('req', prepareSearchRequest())
}

function prepareSearchRequest() {
  const result = {}
  let params = toRaw(tablesStore)

  if (params) {
    if (params._fulltextSearch !== null && params._fulltextSearch !== "") {
      result["fullText"] = params._fulltextSearch
    }
    const filtersInputsData = params._filtersInputsData;
    result["filters"] = []
    for (const fieldName in filtersInputsData) {
      const data = filtersInputsData[fieldName]
      if (data != null && data !== "") {
        result["filters"].push({"field": fieldName, "value": data})
      }
    }
  }
  return result;
}

function changePage(newPage) {
  page.value = newPage
  console.log('changing page', newPage)
  fetchBudgets(newPage)
}

</script>

<template>
  <div class="pt-table-panel" v-if="data.length > 0">
    <PtTableFilters v-model="showSideMenu"
                    ref="filtersPanelApi"
                    :filterable-columns="filterableColumns" :searchable="searchable"
                    @filters-updated="updateSearchParams"></PtTableFilters>

    <div class="pt-table-wrapper">
      <div class="pt-table-head">
        <div class="pt-table-header-cell" v-for="(column, index) in props.config.columns" :key="index">
          {{ column.displayName }}
        </div>
      </div>
      <div class="pt-table-body-wrapper">
        <div class="pt-table-body">
          <div class="pt-table-row" v-for="(row, rowIndex) in data" :key="rowIndex" @click="emit('row-clicked', row)">
            <div class="pt-table-cell" v-for="(column, colIndex) in props.config.columns" :key="colIndex">
              <span v-if="column.type === Date">{{ formatDateString(row[column.field]) }}</span>
              <span v-else>{{ row[column.field] }}</span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="pt-pagination-panel">
      <v-pagination @update:model-value="changePage" size="20" v-model="page" :length="totalPages"
                    :total-visible="6"></v-pagination>
    </div>

  </div>
</template>

<style scoped>
:root {
  --pt-table-gap: 10px;
}

.pt-table-wrapper {
  overflow-x: scroll;
  //overflow-y: hidden;
  flex-grow: 1;
  background-color: peachpuff;
}

.pt-table-panel {
  background-color: #00bd7e;
  height: 100%;
  width: 100%;
  display: flex;
  flex-direction: column;
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

.pt-table-body-wrapper {
  background-color: yellow;
  flex-grow: 1;
  //overflow-y: scroll;
  //overflow-y: hidden;

  //overflow-x: scroll;
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
  background-color: rgba(0, 0, 0, 0.05);
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

.pt-pagination-panel {
  height: 40px;
}

</style>