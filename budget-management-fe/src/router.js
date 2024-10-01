import {createRouter, createWebHistory} from "vue-router";

import Home from "@/components/Home.vue";
import Budgets from "@/components/Budgets.vue";
import BudgetsDetails from "@/components/BudgetsDetails.vue";
import LoginRedirect from "@/components/core/LoginRedirect.vue";

const routes = [
    {path: '/',                                    component: Home},
    {path: '/home',        name: 'home',           component: Home},
    {path: '/login',       name: 'login',          component: LoginRedirect },
    {path: '/budgets',     name: 'budgets',        component: Budgets,
        meta: { actions: [ { event: 'open:table-filters', icon: 'mdi-filter' } ] } },
    {path: '/budgets/:id', name: 'budget-details', component: BudgetsDetails}
]

export default createRouter({
    history: createWebHistory(),
    routes,
})