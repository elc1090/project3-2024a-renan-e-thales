import { createApp } from 'vue'
import { createMemoryHistory, createRouter } from 'vue-router'
import App from './App.vue'
import LoginPage from './components/LoginPage.vue'
import HomePage from './components/HomePage.vue'
import ItemPage from './components/ItemPage.vue'
import { library } from '@fortawesome/fontawesome-svg-core';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
import { faCoffee, faAngleDown, faAngleUp } from '@fortawesome/free-solid-svg-icons';
import '@mdi/font/css/materialdesignicons.css';

const routes = [
  { path: '/', component: LoginPage },
  { path: '/login', component: LoginPage },
  { path: '/home', component: HomePage },
  { path: '/item/:id', component: ItemPage, props: true },
]

const router = createRouter({
  history: createMemoryHistory(),
  routes,
})

library.add(faCoffee);
library.add(faAngleDown);
library.add(faAngleUp);

createApp(App).component('font-awesome-icon', FontAwesomeIcon).use(router).mount('#app')
