<!-- src/components/LoadingDialog.vue -->
<template>
    <div v-if="visible" class="loading-overlay">
      <div class="loading-dialog">
        <div class="spinner"></div>
        <span>Carregando...</span>
      </div>
    </div>
  </template>
  
  <script lang="ts">
  import { defineComponent } from 'vue';
  
  export default defineComponent({
    name: 'LoadingDialog',
    props: {
      visible: {
        type: Boolean,
        default: false
      }
    }
  });
  </script>
  
  <style scoped>

  .loading-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 9999;
  }
  
  .loading-dialog {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background: #95fcd1;
    padding: 20px 40px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    text-align: center;
  }
  
  .loading-dialog span {
    margin-top: 10px;
    font-size: 18px;
    color: #000;
  }
  
  .spinner {
    border: 4px solid rgba(0, 0, 0, 0.2);
    border-top: 4px solid #06a764;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    animation: spin 1s linear infinite;
  }
  
  @keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
  }
  </style>
  