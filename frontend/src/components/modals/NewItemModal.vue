<template>
    <div class="modal" :class="{ 'is-active': show }">
        <div class="modal-background" @click="closeModal"></div>
        <div class="modal-card">
            <header class="modal-card-head">
                <p class="modal-card-title">Adicionar Unidades</p>
                <button class="delete" aria-label="close" @click="closeModal"></button>
            </header>
            <section class="modal-card-body">
                <form>
                    <input class="input" type="text" placeholder="Nome" v.model="nome" />
                    <input class="input" type="text" placeholder="Quantidade inicial" v.model.number="qtd" />
                    <input class="input" type="text" placeholder="Peso" v.model="peso" />
                    <input class="input" type="text" placeholder="Descrição" v.model="description" />
                    <input class="input" type="text" placeholder="Categoria" v.model="category" />
                </form>
            </section>
            <footer class="modal-card-foot">
                <button class="button is-success" @click="closeModal">Adicionar</button>
                <button class="button" @click="closeModal">Cancelar</button>
            </footer>
        </div>
    </div>
</template>

<script lang="ts">
import Item from '@/models/Item';
import { defineComponent } from 'vue';

export default defineComponent({
    data() {
        return {
            nome: '',
            qtd: 0,
            peso: '',
            description: '',
            category: '',
        }
    }, 
    props: {
        show: Boolean,
    },
    methods: {
        closeModal() {
            this.$emit('addItem', {item: new Item(this.nome, this.qtd, this.peso, this.description, this.category, Date.now().toString as unknown as string)});
            this.$emit('close');
        }
    },
});
</script>

<style scoped>
.input {
    width: fit-content !important;
    height: fit-content !important;
}

.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 999;
    width: 100% !important;
}

.modal.is-active {
    display: block;
}

.button {
    margin-right: 8px;
}

.modal-card {
    margin-top: 15%;
    height: fit-content !important;
    max-width: 80%;
    min-width: 350px;
    margin-left: auto;
    margin-right: auto;
}

.modal-card-body {
    height: fit-content !important;
}

.modal-background {
    color: transparent !important;
    background-color: transparent !important;
}
</style>
