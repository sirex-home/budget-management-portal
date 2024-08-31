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
  <PtTableFilters v-model="showSideMenu"
                  ref="filtersPanelApi"
                  :filterable-columns="filterableColumns" :searchable="searchable"
                  @filters-updated="updateSearchParams"></PtTableFilters>

  <div class="pt-table-panel" v-if="data.length > 0">
    <div class="pt-table-panel-2">       <!-- horizontal scrolling of table WITH header -->
      <div style="display: inline-block; align-self: start;">
        <div class="pt-table-head">
          <div class="pt-table-header-cell" v-for="(column, index) in props.config.columns" :key="index">
            {{ column.displayName }}
          </div>
        </div>
        <!--      <div style="flex-grow: 1; background-color: peachpuff; display: inline-flex; flex-direction: column; align-self: flex-start;">-->
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
    <v-pagination @update:model-value="changePage" size="30" v-model="page" :length="totalPages"
                  :total-visible="6"></v-pagination>
  </div>

</template>

<style scoped>
.pt-table-panel {
  --pt-table-gap: 0px;
  --pt-border-color: #ccc;
  --pt-table-head-bg-color: #f0f0f0;

  height: 100%;
  display: flex;
  flex-direction: column;
}

.pt-table-panel-2 {
  flex-grow: 1;
  display: inline-flex;
  flex-direction: column;
  overflow: auto;
}

.pt-table-head {
  display: inline-grid;
  grid-template-columns: v-bind('cssGridColumnsConfig');
  font-weight: bold;
}

.pt-table-header-cell {
  padding: 2px;
  background-color: var(--pt-table-head-bg-color);
  border: 1px solid var(--pt-border-color);
  text-align: center;
}

.pt-table-body {
  display: inline-grid;
  gap: var(--pt-table-gap);
}

.pt-table-row {
  display: inline-grid;
  grid-template-columns: v-bind('cssGridColumnsConfig');
}

.pt-table-row:hover {
  background-color: rgba(0, 0, 0, 0.05);
}

.pt-table-cell {
  padding: 10px;
  border: 1px solid var(--pt-border-color);
  text-align: center;
  max-height: 5rem;
  text-overflow: ellipsis;
  overflow: hidden;
  white-space: nowrap;
}

</style>