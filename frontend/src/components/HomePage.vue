<template>
    <section>
        <h1 class="is-primary">Home</h1>
        <div class="container is-fluid is-mobile">
            <div class="table-container">
                <table class="table is-bordered is-striped is-hoverable is-fullwidth">
                    <thead>
                        <tr>
                            <th>nome</th>
                            <th>qtd</th>
                            <th>Kg/L</th>
                            <th class="optional-td">desc</th>
                            <th class="optional-td">categoria</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="item in items" :key="item.nome">
                            <th class="item-name">{{item.nome}}</th>
                            <td >{{item.qtd}} un</td>
                            <td >{{item.kgl}}</td>
                            <td class="optional-td">{{item.desc}}</td>
                            <td class="optional-td">{{item.categ}}</td>
                            <td class="button-section"><button class="button is-dark"><RouterLink :to="{ path: '/item',}" class="routerlink_button">Ver Item</RouterLink></button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</template>

<script lang="ts">

import itemList from '../models/Items'

export default {
    name: 'HomePage',
    data() {
    return {
      items: itemList
    };
  }
}

</script>

<style>
.table-container {
    overflow-x: auto;
}

.button-section {
    border: none !important;
    text-align: start !important;
}

.routerlink_button {
    color: rgb(158, 158, 158) !important;
}

th:first-child {
    width: 50%;
}

td {
    width: 20%;
    vertical-align: center !important;
    text-align: start !important;
}

@media (max-width: 640px) {
    .optional-td {
        display: none;
    }
}

</style>