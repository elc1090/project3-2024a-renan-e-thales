<template>
    <div class="modal" :class="{ 'is-active': show }">
        <div class="modal-background" @click="closeModal"></div>
        <div class="modal-card">
            <header class="modal-card-head">
                <p class="modal-card-title">Detalhes do Item</p>
                <button class="delete" aria-label="close" @click="closeModal"></button>
            </header>
            <section class="modal-card-body">
                <p class="subtitle">Nome: <b>{{ item!.nome }}</b></p>
                <p class="subtitle">Quantidade: <b>{{ item!.qtd }}</b> unidades</p>
                <p class="subtitle">Peso unitário: <b>{{ item!.kgl }}</b></p>
                <p class="subtitle">Descrição: <b>{{ item!.desc }}</b></p>
                <p class="subtitle">Categoria: <b>{{ item!.categ }}</b></p>
            </section>
            <footer class="modal-card-foot">
                <button class="button" @click="closeModal">Fechar</button>
            </footer>
        </div>
    </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import Item from '../../models/Item';

export default defineComponent({
    props: {
        show: Boolean,
        item: Object as () => Item
    },
    methods: {
        closeModal() {
            this.$emit('close');
        }
    },
    data()  {
        return this.item
    }
});
</script>

<style scoped>

.subtitle {
    font-weight: 200 !important;
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

.modal-card {
    margin-top: 24px;
    height: fit-content !important;
    max-width: 550px;
    min-width: 350px;
    margin-left: auto;
    margin-right: auto;
    width: 90%;
}

.modal-card-body {
    height: fit-content !important;
}

.button {
    margin-right: 8px;
}

.modal-background {
    color: transparent !important;
    background-color: transparent !important;
}
</style>
