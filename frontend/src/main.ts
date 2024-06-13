import { createApp } from 'vue'
import { createMemoryHistory, createRouter } from 'vue-router'
import App from './App.vue'
import LoginPage from './components/LoginPage.vue'
import HomePage from './components/HomePage.vue'

const routes = [
  { path: '/', component: LoginPage },
  { path: '/login', component: LoginPage },
  { path: '/home', component: HomePage },
]

const router = createRouter({
  history: createMemoryHistory(),
  routes,
})

createApp(App).use(router).mount('#app')
