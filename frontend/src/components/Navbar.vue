<script setup lang="ts">
  import { RouterLink } from 'vue-router';
</script>

<template>
  <div class="navbar bg-primary shadow-sm">
    <div class="navbar-start">
      <router-link to="/" class="btn btn-ghost hover:text-primary text-xl text-primary-content text-shadow-sm text-shadow-neutral" >Medical Site</router-link>
    </div>
    <div class="navbar-center">
    </div>
    <div class="navbar-end">
      <router-link to="/login" class="btn btn-ghost hover:text-primary text-xl text-primary-content text-shadow-sm text-shadow-neutral">Login</router-link>
    </div>
  </div>
</template>