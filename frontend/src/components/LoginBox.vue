<script setup lang="ts">
</script>

<template>
    <div class="card overflow-hidden max-w-sm mx-auto mt-32 shadow-2xl">
        <div class="bg-primary text-center text-base-100 text-shadow-sm text-shadow-neutral font-semibold text-3xl p-4 max-w-full">
            Login
        </div>

        <div class="card-body bg-base-300 flex flex-col p-8">
            <fieldset>
                <input type="text" placeholder="Username" class="rounded-field p-2 mx-4 my-2 bg-base-100 hover:bg-base-200 focus:bg-base-200 shadow-lg">
                <input type="text" placeholder="Password" class="rounded-field p-2 mx-4 my-2 bg-base-100 hover:bg-base-200 focus:bg-base-200 shadow-lg">
                <button class="btn btn-lg btn-primary mx-auto mt-4 rounded-selector shadow-lg text-shadow-sm text-shadow-neutral">Sign in</button>
            </fieldset>
        </div>
    </div>
</template> 