<template>
    <div class="modal" :class="{ 'is-active': show }">
        <div class="modal-background" @click="closeModal"></div>
        <div class="modal-card">
            <header class="modal-card-head">
                <p class="modal-card-title">Remover Unidades</p>
                <button class="delete" aria-label="close" @click="closeModal"></button>
            </header>
            <section class="modal-card-body">
                <p class="subtitle">{{ item?.qtd }} -> {{ item!.qtd - ammount > 0 ? item!.qtd - ammount : 0 }}</p>
                <div class="columns is-multiline">
                    <div class="column">
                        <button class="button is-small" @click="sub(100)">-100</button>
                        <button class="button is-small" @click="sub(10)">-10</button>
                        <button class="button is-small" @click="sub(1)">-1</button>
                    </div>
                    <div class="column">
                        <input class="input" type="number" v-model.number="ammount" />
                    </div>
                    <div class="column">
                        <button class="button is-small" @click="add(1)">+1</button>
                        <button class="button is-small" @click="add(10)">+10</button>
                        <button class="button is-small" @click="add(100)">+100</button>
                    </div>
                </div>
            </section>
            <footer class="modal-card-foot">
                <button class="button is-danger" @click="finishAction">Remover</button>
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
            ammount: 0,
        }
    },
    props: {
        show: Boolean,
        item: Object as () => Item
    },
    methods: {
        add(n: number) {
            this.ammount = this.ammount + n;
            if (this.ammount > this.item!.qtd) this.ammount = this.item!.qtd;
        },
        sub(n: number) {
            this.ammount = this.ammount - n;
            if (this.ammount - n < 0) this.ammount = 0
        },
        finishAction() {
            this.$emit('sub', { id: this.item!.id, ammount: this.ammount });
            this.ammount = 0;
            this.$emit('close');
        },
        closeModal() {
            this.ammount = 0;
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

.modal-card {
    margin-top: 10%;
    height: fit-content !important;
    max-width: 550px;
    min-width: 350px;
    margin-left: auto;
    margin-right: auto;
    width: 90%;
}

.button {
    margin-right: 8px;
}

.modal-card-body {
    height: fit-content !important;
}

.modal-background {
    color: transparent !important;
    background-color: transparent !important;
}
</style>
