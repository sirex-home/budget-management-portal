import {createVuetify} from 'vuetify';
import * as components from 'vuetify/components';
import * as directives from 'vuetify/directives';
import 'vuetify/styles'; // импорт стилей Vuetify
import {aliases, mdi} from 'vuetify/iconsets/mdi';

export default {
    plugin: createVuetify({
        components,
        directives,
        icons: {
            defaultSet: 'mdi',
            aliases,
            sets: {
                mdi,
            },
        },
    }),
    options: {
        theme: {
            primary: '#3951b5',
            secondary: '#b0bec5',
            accent: '#8c9eff',
            error: '#b71c1c'
        }
    }
};