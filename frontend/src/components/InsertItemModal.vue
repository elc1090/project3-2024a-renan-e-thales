<template>
    <section>
      <div class="container">
        <button class="button is-primary" @click="openModal">Adicionar Item</button>
  
        <div class="modal" :class="{'is-active': isModalActive}">
          <div class="modal-background" @click="closeModal"></div>
          <div class="modal-card">
            <header class="modal-card-head">
              <p class="modal-card-title">Adicionar Novo Item</p>
              <button class="delete" aria-label="close" @click="closeModal"></button>
            </header>
            <section class="modal-card-body">
              <form @submit.prevent="addItem">
                <div class="field">
                  <label class="label">Nome do Item</label>
                  <div class="control">
                    <input class="input" type="text" v-model="novoItem.nome" placeholder="Nome do Item">
                  </div>
                </div>
  
                <div class="field">
                  <label class="label">Quantidade</label>
                  <div class="control">
                    <input class="input" type="number" v-model.number="novoItem.qtd" placeholder="Quantidade">
                  </div>
                </div>

  
                <div class="field is-grouped">
                  <div class="control">
                    <button type="submit" class="button is-primary">Salvar</button>
                  </div>
                  <div class="control">
                    <button class="button" @click="closeModal">Cancelar</button>
                  </div>
                </div>
              </form>
            </section>
          </div>
        </div>
      </div>
    </section>
  </template>
  
  <script lang="ts">
  import { defineComponent, ref } from 'vue';
  import Item from '@/models/Item';
  
  export default defineComponent({
    components: {},
    setup() {
      const isModalActive = ref(false);
      const novoItem = ref(new Item('', 0, '', '', ''));
      
      const openModal = () => {
        isModalActive.value = true;
      };
  
      const closeModal = () => {
        isModalActive.value = false;
      };
  
      const addItem = () => {
        console.log('Novo item:', novoItem.value);

        try {

        }

        closeModal();
      };
  
      return {
        isModalActive,
        novoItem,
        openModal,
        closeModal,
        addItem
      };
    }
  });
  </script>
  
  <style scoped>
  
  </style>
  