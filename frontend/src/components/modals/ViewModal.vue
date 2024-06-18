<template>
    <div class="modal" :class="{ 'is-active': show }">
        <div class="modal-background" @click="closeModal"></div>
        <div class="modal-card">
            <header class="modal-card-head">
                <p class="modal-card-title">Detalhes do Item</p>
                <button class="delete" aria-label="close" @click="closeModal"></button>
            </header>
            <section class="modal-card-body">
                <p>Nome: {{ item!.nome }}</p>
                <p>Quantidade: {{ item!.qtd }}</p>
                <p>Peso: {{ item!.kgl }}</p>
                <p>Descrição: {{ item!.desc }}</p>
                <p>Categoria: {{ item!.categ }}</p>
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
    margin-top: 15%;
    height: fit-content !important;
    max-width: 600px;
    width: 90%;
}

.modal-card-body {
    height: fit-content !important;
}

.modal-background {
    color: transparent !important;
    background-color: transparent !important;
}
</style>
