import { UserManager } from 'oidc-client';

export default new UserManager({
    authority: "http://localhost:8666/realms/test-realm",
    client_id: "test-client",
    client_secret: "test-client-secret",
    redirect_uri: "http://localhost:8080/login",
    response_type: "code",
    scope: "openid profile email",
    post_logout_redirect_uri: "http://localhost:8080",
});
