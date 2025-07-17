<script setup lang="ts">
import Navbar from './components/Navbar.vue';
import { RouterView } from 'vue-router';
// import { onMounted } from 'vue';

// onMounted(() => {
//   fetch(`${import.meta.env.VITE_API_URL}users`).then(res => res.json()).then(data => {console.log(data)}).catch(error => {console.error(error)})
// })
</script>

<template>
  <Navbar />
  <RouterView />
  
</template>
