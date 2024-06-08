<template>
    <div class="rows">
        <div class="row">
            <img alt="Vue logo" src="../assets/logo.png">
        </div>
        <div class="row">
            <h1>Estoque Front</h1>
        </div>
        <div class="row">
            <div class="columns">
                <div class="column is-4 is-offset-4">
                    <input class="input is-primary"
                    type="text"
                    placeholder="Login">
                    <span>&nbsp;</span>
                    <input class="input is-primary"
                    type="password"
                    placeholder="Senha">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-3">
                <Button class="button is-primary"><RouterLink to="/home">Entrar</RouterLink></Button>
            </div>
        </div>
    </div>
</template>

<script setup>
import { RouterLink } from 'vue-router'

</script>

<style>
h1 {
    color: white !important;
    font-size: 36px;
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
}

.row {
    margin-top: 20px;
    margin-bottom: 20px;
    margin-left: 10%;
    margin-right: 10%;
}

a {
    color: black;
}
</style>