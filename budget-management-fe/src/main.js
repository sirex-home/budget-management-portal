import './assets/main.css'

import {createApp} from 'vue'
import App from './App.vue'
import {createRouter, createWebHistory} from "vue-router";
import {createPinia} from "pinia";

import vuetify from './vuetify.js';
import Home from "@/components/Home.vue";
import Budgets from "@/components/Budgets.vue";
import BudgetsDetails from "@/components/BudgetsDetails.vue";
import LoginRedirect from "@/components/LoginRedirect.vue";


const routes = [
    {path: '/',                                    component: Home},
    {path: '/home',        name: 'home',           component: Home},
    {path: '/login',       name: 'login',          component: LoginRedirect },
    {path: '/budgets',     name: 'budgets',        component: Budgets,
        meta: { actions: [ { event: 'open:table-filters', icon: 'mdi-filter' } ] } },
    {path: '/budgets/:id', name: 'budget-details', component: BudgetsDetails}
]

const app = createApp(App)
    .use(createPinia())
    .use(vuetify.plugin, vuetify.options)
    .use(createRouter({
        history: createWebHistory(),
        routes,
    }))
    .mount('#app')
