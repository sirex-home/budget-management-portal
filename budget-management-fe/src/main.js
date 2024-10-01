import './assets/main.css'

import {createApp} from 'vue'
import App from './App.vue'
import {createPinia} from "pinia";
import router from "@/router.js";
import vuetify from './vuetify.js';

const app = createApp(App)
    .use(createPinia())
    .use(vuetify.plugin, vuetify.options)
    .use(router)
    .mount('#app')
