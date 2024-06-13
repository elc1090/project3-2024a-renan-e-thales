<script lang="ts">

import Items from '../models/Items';

export default {
    name: 'HomePage',
    data() {
    return {
      items: Items
    };
  }
}

</script>

<template>
    <section>
        <h1 class="is-primary">Home</h1>
        <div class="container is-fluid is-mobile">
            <div class="columns">
                <div class="column is-half is-offset-one-quarter">
                    <div class="card" v-for="item in items" :key="item.nome">
                        <header class="card-header">
                            <span class="card-header-title is-centered">{{item.nome}}</span>
                            <!-- <button class="card-header-icon" aria-label="more options">
                                <span class="icon">
                                    <i class="fas fa-angle-down" aria-hidden="true"></i>
                                </span>
                            </button> -->
                        </header>
                        <div class="card-content">
                            <div class="columns is-mobile">
                                <div class="column is-half info-body-headers">
                                    <p>Quantidade: </p>
                                    <p>Peso: </p>
                                    <p>Descrição: </p>
                                    <p>Categoria: </p>
                                </div>
                                <div class="column is-half info-body-content">
                                    <p><b>{{item.qtd}} un</b></p>
                                    <p><b>{{item.kgl}}</b></p>
                                    <p><b>{{item.desc}}</b></p>
                                    <p><b>{{item.categ}}</b></p>
                                </div>
                            </div>
                        </div>
                        <footer class="card-footer">
                            <RouterLink :to="{ path: '/item',}" class="card-footer-item">Visualizar</RouterLink>
                            <RouterLink :to="{ path: '/item',}" class="card-footer-item">Editar</RouterLink>
                            <RouterLink :to="{ path: '/item',}" class="card-footer-item">Remover</RouterLink>
                        </footer>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<style>
.table-container {
    overflow-x: auto;
}

.button-section {
    border: none !important;
    text-align: start !important;
}

.card-footer-item {
    color: rgb(158, 158, 158) !important;
}

.card {
    max-width: 640px;
}

.info-body-headers {
    text-align: left;
}

.info-body-content {
    text-align: right;
}

.footer-button {
    min-width: 33.3%;
}

</style>