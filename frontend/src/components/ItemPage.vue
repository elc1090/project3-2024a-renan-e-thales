<template>
    <div class="container mt-4">
        <text>{{ item.nome }}</text>
    </div>
  </template>
  
  <script>
  import Item from '../models/Item.ts';
  
  export default {
    props: {
        item: {
            type: Item,
            default: () => ({
                id: 0,
                nome: '',
                qtd: 0,
                kgl: '',
                desc: '',
                categ: ''
            })
        }
    },
    data() {
      return {
        newItem: {
          id: 0,
          nome: '',
          qtd: 0,
          kgl: 0,
          desc: '',
          categ: ''
        },
        items: []
      };
    },
    methods: {
      
      }
    }
  </script>
  
  <style scoped>
  .container {
    max-width: 600px;
  }
  </style>
  