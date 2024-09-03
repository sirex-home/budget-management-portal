<script setup>
import {useRoute} from 'vue-router'
import {getBudgetDetails, getBudgetEvents, updateBudget} from '../services/client.js'
import {ref, onMounted, toRaw} from "vue";
import {formatDateString} from "@/services/dateService.js"
import UpdateBudgetDialog from  "@/components/UpdateBudgetDialog.vue"
const route = useRoute()

let details = ref(null)
let events = ref([])
let openUpdateDialog = ref(false)

onMounted(async () => {
  details.value = await getBudgetDetails(route.params.id)
  events.value = await getBudgetEvents(route.params.id, 0)
})

async function onBudgetUpdate(data) {
  openUpdateDialog.value = false
  await updateBudget(details.value.id, data)
  for (let field in data) {
    details.value[field] = data[field]
  }
  events.value = await getBudgetEvents(route.params.id, 0)
}

function abortBudgetUpdate() {
  openUpdateDialog.value = false
}

</script>

<template>
  <v-container>
    Current state:
    <div v-if="details" class="budget-details">
      <div class="properties-section">
        <div><span class="pt-property">Title: </span>{{ details.title }}</div>
        <div><span class="pt-property">Id: </span>{{ details.id }}</div>
        <div><span class="pt-property">Amount: </span>{{ details.amount }} <input type="text"></div>
        <div><span class="pt-property">Status: </span>{{ details.status }}</div>
        <div><span class="pt-property">Last event number: </span>{{ details.lastEventNumber }}</div>
        <div><span class="pt-property">Created at: </span>{{ details.createdAt }}</div>
        <div><span class="pt-property">Updated at: </span>{{ details.updatedAt }}</div>
        <div><span class="pt-property">Updated by: </span>{{ details.updatedBy }}</div>
      </div>
      <div class="properties-section">
        <span class="pt-property">Description: </span>{{ details.description }}
      </div>
    </div>
    <div v-if="details" class="pt-budget-controls">
      <v-btn @click="openUpdateDialog = true">Update</v-btn>
      <UpdateBudgetDialog v-model="openUpdateDialog" :init-data="details"
                          @budget-update-aborted="abortBudgetUpdate"
                          @budget-updated="el => onBudgetUpdate(el)"
      ></UpdateBudgetDialog>
    </div>
    <div class="events-section">
      <div><span class="pt-property">Events</span></div>
      <div class="budget-event-panel" v-for="(evt, index) in events" :key="index">
        {{ evt.sequenceNumber }} - {{ evt.payload.type }} - {{ formatDateString(evt.createdAt) }}
        <div v-if="evt.payload.type === 'UPDATE'">
          <div v-if="evt.payload.title"><span class="pt-property">Title: </span>{{ evt.payload.title }}</div>
          <div v-if="evt.payload.description"><span class="pt-property">Description:  </span>{{ evt.payload.description }}</div>
          <div v-if="evt.payload.amount"><span class="pt-property">Amount:  </span>{{ evt.payload.amount }}</div>
        </div>
        <div v-else-if="evt.payload.type === 'CREATE'">
          <div v-if="evt.payload.title"><span class="pt-property">Title: </span>{{ evt.payload.title }}</div>
          <div v-if="evt.payload.description"><span class="pt-property">Description:  </span>{{ evt.payload.description }}</div>
          <div v-if="evt.payload.amount"><span class="pt-property">Amount:  </span>{{ evt.payload.amount }}</div>
        </div>
        <div v-else>
          ERROR: unexpected event.
          <div>{{ evt }}</div>
        </div>
      </div>
    </div>
  </v-container>
</template>

<style scoped>
.budget-event-panel {
  border-radius: 5px;
  border: solid 1px #ccc;
  margin: 2px;
  padding: 3px;
}

.budget-details {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}

.properties-section {
  width: 400px;
  max-height: 300px;
}

.events-section {

}

input[type=email] {
  background: transparent;
  border: none;
  border-bottom: solid 1px #ccc;
  padding: 5px;
  transition: padding 0.4s;
}

input[type=email]:placeholder-shown + label {
  color: #aaa;
  font-size: 14px;
  left: 5px;
  top: 5px;
}

label,
input[type=email]:focus + label {
  color: #4476bd;
  font-size: 12px;
  left: 2px;
  pointer-events: none;
  position: absolute;
  top: 2px;
  transition: top 0.4s, left 0.4s, font-size 0.4s;
}

input[type=email]::placeholder {
  color: transparent;
}

input[type=email]:focus,
input[type=email]:not(:placeholder-shown) {
  border-bottom: solid 1px #4476bd;
  outline: none;
  padding: 20px 5px 5px;
}

</style>
