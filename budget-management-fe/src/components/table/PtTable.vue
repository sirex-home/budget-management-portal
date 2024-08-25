<script setup>
import {ref} from "vue";
import {formatDateString} from "@/services/dateService.js";

const head2 = {
  columns: ['first', 'second', 'third'],
  sortBy: 'first',
  sortOrder: 'asc' // desc
}
const data2 = [{'first': 123, 'second': 123, 'third': 123, }]
var data3 = [{'name': 'Vasia', 'age': 17}, {'name': 'Slava', 'surname': 'Cat'}]

const props = defineProps(['columns', 'data'])
let columnsWidth = ref(extractColumnsWidth(props.columns))

function extractColumnsWidth(columns) {
  let style = columns.map(el => el.width).join(' ')
  console.log(style)
  return style;
}

function extractFieldsNames(data) {
  const fields = new Set()
  for (let record of data) {
    // console.log("record: ", record)
    for (let fieldName in record) {
      fields.add(fieldName)
    }
  }
  console.log('fields: ', fields)
  return fields
}
</script>

<template>
  <div class="pt-table" v-if="props.data.length > 0">
    <div class="pt-table-head">
      <div class="pt-table-header-cell" v-for="(column, index) in props.columns" :key="index">
        {{ column.displayName }}
      </div>
    </div>
    <div class="pt-table-body">
      <div class="pt-table-row" v-for="(row, rowIndex) in props.data" :key="rowIndex">
        <div class="pt-table-cell" v-for="(column, colIndex) in props.columns" :key="colIndex">
          <span v-if="column.type === Date">{{ formatDateString(row[column.field]) }}</span>
          <span v-else>{{ row[column.field] }}</span>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
:root {
  --pt-table-gap: 10px;
}

.pt-table {
  display: inline-block;
  flex-direction: column;
  grid-template-rows: auto 1fr;
  margin: 3px;
}

.pt-table-head {
  display: grid;
  grid-template-columns: v-bind('extractColumnsWidth(props.columns)');
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
  grid-template-columns: v-bind('extractColumnsWidth(props.columns)');
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