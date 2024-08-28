<script setup>
import {useRoute} from 'vue-router'
import {getBudgetDetails} from '../services/client.js'
import {ref, onMounted} from "vue";

const route = useRoute()

let details = ref(null)
onMounted(async () => {
  details.value = await getBudgetDetails(route.params.id)
})
</script>

<template>
  <v-container>
    <div v-if="details != null" class="budget-details">
      <div class="left-column">
        <div>
          Id: {{ details.id }}
        </div>
        <div>
          Status: {{ details.status }}
        </div>
        <div>
          Title: {{ details.title }}
        </div>
        <div>
          Amount: {{ details.amount }}
          <input type="text">
        </div>
        <div>
          Last event number: {{ details.lastEventNumber }}
        </div>
        <div>
          Created at: {{ details.createdAt }}
        </div>
        <div>
          Updated at: {{ details.updatedAt }}
        </div>
        <div>
          Updated by: {{ details.updatedBy }}
        </div>
      </div>
      <div class="right-column">
        <div>
          Description: {{ details.description }}
        </div>
      </div>
    </div>
  </v-container>
</template>

<style scoped>
.budget-details {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 5px;
}

.left-column {
  grid-column: 1;
  grid-row: 1;
}

.right-column {
  grid-column: 2;
  grid-row: 1;
}


.custom-input {
  position: relative;
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
