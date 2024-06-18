<script lang="ts">

export default {
    name: 'LoginPage',
    data() {
    return {
    };
  }
}

</script>

<template>
    <section>
        <div class="container is-fluid is-mobile">
            <div class="columns">
                <div class="column is-half is-offset-one-quarter">
                    <div class="card">
                        <header class="card-header">
                            <span class="card-header-title is-centered">Login</span>
                        </header>
                        <div class="card-content">
                            <div class="login-form">
                                <div class="field">
                                    <input
                                        class="input is-primary"
                                        type="text"
                                        placeholder="Nome de usuário"
                                    />
                                </div>
                                <input
                                    class="input is-primary"
                                    type="Password"
                                    placeholder="Senha"
                                /><RouterLink class="button is-primary" to="/home">Entrar</RouterLink>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<style>

section {
    height: 100vh !important;
}

input {
    margin-bottom: 16px;
}

.card-header-title {
    font-size: 30px;
}
</style>