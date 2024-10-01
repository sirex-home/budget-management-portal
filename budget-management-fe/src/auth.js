import {ref} from 'vue'
import {UserManager} from 'oidc-client';
import router from "@/router.js";
import serverAxios, {retryClient} from '@/serverAxios.js';

let authenticated = ref(false)

const userManager = new UserManager({
    authority: "http://localhost:8666/realms/test-realm",
    client_id: "test-client",
    client_secret: "test-client-secret",
    redirect_uri: "http://localhost:8080/login",
    response_type: "code",
    scope: "openid profile email",
    post_logout_redirect_uri: "http://localhost:8080",
})

let authUser = null;
serverAxios.interceptors.response.use(
    (response) => response,
    async (error) => {
        if (error.status === 401) {
            // TODO KG: several API calls may experience 401 and than force refresh tokens -> think about queue/lock solution
            authUser = await userManager.signinSilent()
            error.config.headers['Authorization'] = `Bearer ${authUser.access_token}`;
            console.log("Retry request with refreshed token")
            return retryClient.request(error.config); // to omit recursive loop serverAxios->interceptor->serverAxios->...
        }
        return error;
    }
);

serverAxios.interceptors.request.use(function (config) {
    if (authUser && authUser.access_token) {
        config.headers.Authorization = `Bearer ${authUser.access_token}`;
    }
    return config;
});

async function goToRootPage() {
    await router.replace({path: '/'});
}

export default {
    isAuthenticated: authenticated,
    openLoginPage: async function () {
        await userManager.signinRedirect()
    },
    registerTokens: async function () {
        await userManager.signinRedirectCallback();
        this.isAuthenticated.value = true;
        authUser = await userManager.getUser();
        await goToRootPage();
    },
    logout: async function () {
        await userManager.signoutRedirect()
        authenticated.value = false;
        authUser = null;
    }
};
