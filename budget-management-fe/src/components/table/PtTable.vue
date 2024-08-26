<script setup>
import {ref} from "vue";
import {formatDateString} from "@/services/dateService.js";

const props = defineProps(['columns', 'data'])
const emit = defineEmits(['row-clicked'])

function extractColumnsWidth() {
  return props.columns.map(el => el.width).join(" ")
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
      <div class="pt-table-row" v-for="(row, rowIndex) in props.data" :key="rowIndex" @click="emit('row-clicked', row)">
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
  grid-template-columns: v-bind('extractColumnsWidth()');
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
  grid-template-columns: v-bind('extractColumnsWidth()');
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