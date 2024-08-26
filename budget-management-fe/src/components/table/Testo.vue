<script setup>
import { defineProps, onMounted, onBeforeUnmount } from 'vue';
const emit = defineEmits(['update:show']);

async function delay(time) {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(27)
    }, time)
  })
}

onMounted(async () => {
  console.log("Testo 1")
  await delay(1000)
  console.log("Testo 2")
  emit('update:show', true);
  console.log("Testo 3")
  await delay(2000)
  console.log("Testo 4")
  emit('update:show', false);

});
</script>

<template>
  <div>Nested Component Loaded</div>
</template>

