import './assets/main.css'

import {createApp} from 'vue'
import App from './App.vue'
import Home from "@/components/Home.vue";
import Budgets from "@/components/Budgets.vue";
import BudgetsDetails from "@/components/BudgetsDetails.vue";
import {createRouter, createWebHistory} from "vue-router";

const routes = [
    {path: '/', component: Home},
    {path: '/home', component: Home},
    {path: '/budgets', component: Budgets},
    {path: '/budgets/:id', component: BudgetsDetails}
]

const app = createApp(App)
    .use(createRouter({
        history: createWebHistory(),
        routes,
    }))
    .mount('#app')
