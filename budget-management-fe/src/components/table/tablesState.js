import {defineStore} from 'pinia'
import {ref, computed } from 'vue'

export const useTablesStore = defineStore('tables-store', () => {

    const tablesParams = ref({  })

    function setTableParams(tableId, params) {
        tablesParams.value[tableId] = params
    }

    const tableParams = (tableId) => {
        return computed(() => tablesParams.value[tableId])
    }

    return { tablesParams, tableParams, setTableParams }
})