<script lang="ts">
import { defineComponent, ref, onMounted } from 'vue';
import apiClient from '../core/axios';
import Item from '../models/Item';
import loadingStore from '@/store/loadingStore';

export default defineComponent({
    setup() {
        const items = ref<Item[]>([]);

        async function fetchItems() {
            try {
                const response = await apiClient.get<Item[]>('/items');
                items.value = response.data;
            } catch (error) {
                console.error('Erro ao buscar itens:', error);
            }
        }

        async function addItem(item: Item) {
            try {
                const response = await apiClient.post('/items', item);
                console.log('Item criado com sucesso:', response.data);
            } catch (error) {
                console.error('Erro ao criar item:', error);
            }
        }

        async function updateItem(id: number, updatedItem: Item) {
            try {
                const response = await apiClient.put(`/items/${id}`, updatedItem);
                console.log('Item atualizado com sucesso:', response.data);
            } catch (error) {
                console.error('Erro ao atualizar item:', error);
            }
        }

        async function deleteItem(id: number) {
            try {
                await apiClient.delete(`/items/${id}`);
                console.log('Item deletado com sucesso');
            } catch (error) {
                console.error('Erro ao deletar item:', error);
            }
        }

        onMounted(fetchItems);

        return {
            Item,
            items,
            loadingStore,
            addItem,
            updateItem,
            deleteItem
        };
    }
});

</script>

<template>
    <section>
        <header class="title-header">
            <span class="title is-centered">Home</span>
        </header>
        <div class="container is-fluid is-mobile">
            <div class="columns">
                <div class="column is-half is-offset-one-quarter">
                    <div v-if="!loadingStore.state.isLoading && items.length == 0">
                        <p class="no-items-message">No items found.</p>
                        <div class="modal">
                            <div class="modal-background"></div>
                            <div class="modal-card">
                                <header class="modal-card-head">
                                    <p class="modal-card-title">Modal title</p>
                                    <button class="delete" aria-label="close"></button>
                                </header>
                                <section class="modal-card-body">
                                    <!-- Content ... -->
                                </section>
                                <footer class="modal-card-foot">
                                    <div class="buttons">
                                        <button class="button is-success">Save changes</button>
                                        <button class="button">Cancel</button>
                                    </div>
                                </footer>
                            </div>
                        </div>
                    </div>
                    <div class="card" v-for="item in items" :key="item.nome">
                        <header class="card-header">
                            <span class="card-header-title is-centered">{{ item.nome }}</span>
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
                                    <p><b>{{ item.qtd }} un</b></p>
                                    <p><b>{{ item.kgl }}</b></p>
                                    <p><b>{{ item.desc }}</b></p>
                                    <p><b>{{ item.categ }}</b></p>
                                </div>
                            </div>
                        </div>
                        <footer class="card-footer">
                            <button class="card-footer-item">
                                <RouterLink :to="{ path: '/item', }">Visualizar</RouterLink>
                            </button>
                            <button class="card-footer-item"
                                @click="addItem(new Item('Nome do Item', 1, '1', 'Descrição', 'Categoria', '10-10-10:01:02'))">Adicionar</button>
                            <button class="card-footer-item">
                                <RouterLink :to="{ path: '/item', }">Editar</RouterLink>
                            </button>
                            <button class="card-footer-item" @click="deleteItem(item.id)">
                                <RouterLink :to="{ path: '/item', }">Remover</RouterLink>
                            </button>
                        </footer>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<style>
.title {
    color: white;
}

.no-items-message {
    color: grey;
}

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