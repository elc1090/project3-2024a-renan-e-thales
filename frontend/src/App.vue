<template>
  <div id="app">
    <RouterView/>
    <LoadingDialog :visible="loadingStore.state.isLoading" />
  </div>
</template>

<script lang="ts">
import './assets/style.scss';

import { defineComponent } from 'vue';
import LoadingDialog from './components/LoadingDialog.vue';
import loadingStore from './store/loadingStore';

export default defineComponent({
  name: 'App',
  components: {
    LoadingDialog
  },
  setup() {
    return {
      loadingStore
    };
  }
});
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  padding-top: 40px; 
}
</style>
