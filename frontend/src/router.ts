import { createRouter, createWebHistory } from 'vue-router';
import HomePage from './components/HomePage.vue';
import LoginPage from './components/LoginPage.vue';
import ItemPage from './components/ItemPage.vue';

const router = () =>
    createRouter({
      history: createWebHistory(),
      routes: [
        { path: '/', name: 'default', component: LoginPage },
        { path: '/login', name: 'login', component: LoginPage },
        { path: '/home', name: 'home', component: HomePage },
        { path: '/item', name: 'item', component: ItemPage, props: true },
      ],
    });
   
  export default router;