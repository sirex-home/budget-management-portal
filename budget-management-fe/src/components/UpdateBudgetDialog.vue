<script setup>
import {ref, toRaw} from "vue"

const emit = defineEmits(['budget-updated', 'budget-update-aborted'])

const props = defineProps({
  update: Function,
  initData: Object
})

let openUpdateDialog = ref(false)
const initialState = JSON.parse(JSON.stringify(props.initData))
let data = ref(JSON.parse(JSON.stringify(props.initData)))

function executeUpdate() {
  openUpdateDialog.value = false

  console.log('===> ', data.value.title, " || ", initialState.title)

  const update = {}
  if (data.value.title !== initialState.title) {
    update.title = data.value.title
  }
  if (data.value.amount !== initialState.amount) {
    update.amount = data.value.amount
  }
  if (data.value.description !== initialState.description) {
    update.description = data.value.description
  }
  if (Object.keys(update).length > 0) {
    emit('budget-updated', update)
  } else {
    data = ref(JSON.parse(JSON.stringify(props.initData)))
    abort()
  }
}

function abort() {
  emit("budget-update-aborted")
}

</script>

<template>
  <v-dialog v-model="openUpdateDialog" width="auto">
    <div class="dialog-panel">
      <div class="pt-title">Update balance: {{ data.id }}</div>
      <div class="pt-data-panel">
<!--        <div class="core-properties"><span class="pt-property">Amount: </span> <input v-model="amount" type="text"></div>-->
<!--        <div class="core-properties"><span class="pt-property">Title: </span> <input v-model="title" type="text"></div>-->

        <v-text-field label="Amount" v-model="data.amount"></v-text-field>
        <v-text-field label="Title" v-model="data.title"></v-text-field>
      </div>
      <v-textarea label="Label" v-model="data.description" variant="outlined"></v-textarea>
      <div class="pt-controls-panel">
        <v-btn class="ms-auto" text="Ok" @click="executeUpdate"></v-btn>
      </div>

    </div>

  </v-dialog>
</template>

<style scoped>
.pt-title {

}

.pt-property {

}

.pt-data-panel {

}

.dialog-panel {
  background-color: #cccccc;
  width: 800px;
  height: 600px;
  border-radius: 5px;
  padding: 5px;
}

</style>