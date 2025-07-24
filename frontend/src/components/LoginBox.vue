<script setup lang="ts">

import loginSplash from '../assets/login-splash.jpg';

</script>

<template>
    <div class="hero min-h-screen" :style="{ backgroundImage: `url(${loginSplash})` }">
        <div class="hero-overlay"></div>
        <div class="hero-content flex-col">
            <div class="card card-xl overflow-hidden">
                <div class="card-body bg-base-300 p-8 space-y-10">
                    <h1 class="text-5xl text-center text-primary font-bold">Login</h1>
                    <fieldset class="flex-col">
                        <label class="label self-start">Username</label>
                        <input type="text" placeholder="Username" class="w-full rounded-field p-2 my-2 bg-base-100 hover:bg-base-200 focus:bg-base-200 shadow-lg">
                        <label class="label self-start">Password</label>
                        <input type="text" placeholder="Password" class="w-full rounded-field p-2 my-2 bg-base-100 hover:bg-base-200 focus:bg-base-200 shadow-lg">
                        <div><a class="link link-hover">Forgot password?</a></div>
                        <button class="btn btn-lg w-full btn-primary mt-8 rounded-selector shadow-lg text-shadow-sm text-shadow-neutral">Sign in</button>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
    
</template> 