import { UserManager } from 'oidc-client';

export default new UserManager({
    authority: "http://localhost:8666/realms/test-realm",  // Адрес Keycloak
    client_id: "test-client",
    client_secret: "test-client-secret",
    redirect_uri: "http://localhost:8080/login",           // URL для редиректа после успешной авторизации
    response_type: "code",                                 // Используем Authorization Code Flow
    scope: "openid profile email",                         // Указываем необходимые скоупы
    post_logout_redirect_uri: "http://localhost:8080",     // Куда редиректить после логаута
});