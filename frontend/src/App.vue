<script setup lang="ts">
import NavBar from './components/NavBar.vue';
import LoginBox from './components/LoginBox.vue';
import { onMounted } from 'vue';

onMounted(() => {
  fetch(`${import.meta.env.VITE_API_URL}users`).then(res => res.json()).then(data => {console.log(data)}).catch(error => {console.error(error)})
})
</script>

<template>
  <NavBar></NavBar>
  <LoginBox></LoginBox>
</template>

<style scoped>
.logo {
  height: 6em;
  padding: 1.5em;
  will-change: filter;
  transition: filter 300ms;
}
.logo:hover {
  filter: drop-shadow(0 0 2em #646cffaa);
}
.logo.vue:hover {
  filter: drop-shadow(0 0 2em #42b883aa);
}
</style>
