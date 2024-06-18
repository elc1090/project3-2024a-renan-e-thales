<script lang="ts">
import { defineComponent, ref, onMounted } from 'vue';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
import apiClient from '../core/axios';
import Item from '../models/Item';
import loadingStore from '@/store/loadingStore';

import NewItemModal from './modals/NewItemModal.vue';
import AddModal from './modals/AddModal.vue';
import RemoveModal from './modals/RemoveModal.vue';
import ViewModal from './modals/ViewModal.vue';

export default defineComponent({
    components: {
        NewItemModal,
        AddModal,
        RemoveModal,
        ViewModal,
        FontAwesomeIcon
    },
    data() {
        return {
            showNewItemModal: false,
            showAddModal: false,
            showRemoveModal: false,
            showViewModal: false,
            selectedItem: {} as Item
        };
    },
    methods: {
        assignSelectedItem(item: Item) {
            this.selectedItem = item;
        },
        openNewItemModal() {
            this.showNewItemModal = true;
        },
        openAddModal() {
            this.showAddModal = true;
        },
        openRemoveModal() {
            this.showRemoveModal = true;
        },
        openViewModal() {
            this.showViewModal = true;
        },
        closeAddModal() {
            this.showAddModal = false;
        },
        closeNewItemModal() {
            this.showNewItemModal = false;
        },
        closeRemoveModal() {
            this.showRemoveModal = false;
        },
        closeViewModal() {
            this.showViewModal = false;
        },
    },
    setup() {
        const delay = (ms: number) => new Promise(res => setTimeout(res, ms));
        let showMenu = ref<boolean>(false);

        const items = ref<Item[]>([]);

        const ItemsList = ref<Item[]>([

        ]);

        async function fetchItems() {
            const baseUrl = "https://apiback.netlify.app/.netlify/functions";
            try {
                loadingStore.setLoading(true);
                await delay(5000);
                fetch(`${baseUrl}/itens`)
                    .then(response => response.json())
                    .then(data => {
                        console.log(data); // Dados retornados pela sua função Netlify
                    })
                    .catch(error => {
                        console.error('Erro ao fazer a chamada para a API:', error);
                    });

                ItemsList.value.push(new Item('Garrafa de Água', 26, '500ml', 'sem descrição', 'suprimento', '10-10-10:01:02'),
                    new Item('Pacote de Sal', 128, '1Kg', 'pacote de sal', 'suprimento', '10-10-10:01:02'),
                    new Item('Pacote de Arroz', 256, '2Kg', 'pacote de arroz', 'suprimento', '10-10-10:01:02'),
                    new Item('Lata de Milho', 256, '300g', 'Lata de Milho', 'suprimento', '10-10-10:01:02'),
                    new Item('Garrafa de Suco de Uva', 256, '2L', 'Garrafa de Suco de Uva', 'suprimento', '10-10-10:01:02'),
                    new Item('Pacote de Farinha', 256, '1Kg', 'Pacote de Farinha', 'suprimento', '10-10-10:01:02'),
                    new Item('Pote de Café', 256, '250g', 'Pote de Café', 'suprimento', '10-10-10:01:02'),);
                loadingStore.setLoading(false);

            } catch (error) {
                console.error('Erro ao buscar itens:', error);
                loadingStore.setLoading(false);
            }
        }

        async function addItem(item: Item) {
            try {
                const response = await apiClient.post('/itens', item);
                console.log('Item criado com sucesso:', response.data);
            } catch (error) {
                console.error('Erro ao criar item:', error);
            }
        }

        async function updateItem(id: number, updatedItem: Item) {
            try {
                const response = await apiClient.put(`/itens/${id}`, updatedItem);
                console.log('Item atualizado com sucesso:', response.data);
            } catch (error) {
                console.error('Erro ao atualizar item:', error);
            }
        }

        async function deleteItem(id: number) {
            try {
                await apiClient.delete(`/itens/${id}`);
                console.log('Item deletado com sucesso');
            } catch (error) {
                console.error('Erro ao deletar item:', error);
            }
        }

        function handleAdd(payload: { id: number, ammount: number }) {
            const itemToUpdate = ItemsList.value.find(item => item.id === payload.id);
            if (itemToUpdate) {
                itemToUpdate.qtd += payload.ammount;
            }
        }

        function handleSub(payload: { id: number, ammount: number }) {
            const itemToUpdate = ItemsList.value.find(item => item.id === payload.id);
            if (itemToUpdate) {
                itemToUpdate.qtd -= payload.ammount;
                if (itemToUpdate.qtd - payload.ammount < 0) itemToUpdate.qtd = 0;
            }
        }

        function handleAddItem(payload: { item: Item }) {
            ItemsList.value.push(payload.item);
            console.log(payload.item);
        }

        onMounted(fetchItems);

        return {
            Item,
            items,
            ItemsList,
            loadingStore,
            addItem,
            updateItem,
            deleteItem,
            handleAdd,
            handleSub,
            showMenu,
            handleAddItem
        };
    }
});

</script>

<template>
    <h1 class="title">Home</h1>
    <section class="main-body">
        <div class="container is-fluid is-mobile">
            <div v-if="!loadingStore.state.isLoading && ItemsList.length == 0">
                <p class="subtitle no-items-message">No items found.</p>
            </div>
            <div class="columns is-multiline">
                <div class="column is-quarter" v-for="item in ItemsList" :key="item.nome">
                    <div class="card">
                        <header class="card-header" @click="item.toggleOpen(), selectedItem = item">
                            <span class="card-header-title is-centered">{{ item.nome }}</span>
                            <span class="card-header-title card-header-content is-centered" v-if="!item.isOpen">{{
                                item.qtd }} un</span>
                            <span class="icon angle-icon">
                                <font-awesome-icon icon="fa-angle-down" v-if="item.isOpen" />
                                <font-awesome-icon icon="fa-angle-up" v-if="!item.isOpen" />
                            </span>
                        </header>
                        <div class="card-content" v-if="item.isOpen">
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
                        <footer class="card-footer" v-if="item.isOpen">
                            <button class="card-footer-item" @click="openAddModal()">Adicionar
                                Unidades</button>
                            <button class="card-footer-item" @click="openRemoveModal()">Remover
                                Unidades</button>
                            <button class="card-footer-item" @click="openViewModal()">Detalhes do
                                Item</button>
                        </footer>
                    </div>
                </div>
            </div>
            <button class="button is-primary" @click="openNewItemModal()">+ Novo Item</button>
            <NewItemModal :show="showNewItemModal" @close="closeNewItemModal" :addItem="handleAddItem"></NewItemModal>
            <AddModal :show="showAddModal" @close="closeAddModal" @add="handleAdd" :item="selectedItem" />
            <RemoveModal :show="showRemoveModal" @close="closeRemoveModal" @sub="handleSub" :item="selectedItem"
                :ammount="0" />
            <ViewModal :show="showViewModal" @close="closeViewModal" :item="selectedItem" />
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

.title {
    padding-top: 16px;
    padding-left: 16px;
}

.button.is-text {
    text-decoration: none;
}

.main-body {
    margin-top: 40px;
}

.table-container {
    overflow-x: auto;
}

.card-header:hover {
    cursor: pointer;
}

.navbar-item {
    font-weight: 600;
}

.card-header-content {
    font-size: 14px !important;
}

.breadcrumb {
    background-color: rgb(21, 24, 18);
}

.navbar-dropdown {
    color: white;
}

.button-section {
    border: none !important;
    text-align: start !important;
}

.card-header-title {
    font-size: 20px;
}

.angle-icon {
    margin: 16px;
}

.card-footer-item {
    color: rgb(158, 158, 158) !important;
}

.card {
    min-width: 250px;
    padding: 0 0;
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