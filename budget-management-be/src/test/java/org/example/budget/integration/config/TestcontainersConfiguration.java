package org.example.budget.integration.config;

import dasniko.testcontainers.keycloak.KeycloakContainer;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.KeycloakBuilder;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.boot.testcontainers.service.connection.ServiceConnection;
import org.springframework.context.annotation.Bean;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.containers.PostgreSQLContainer;
import org.testcontainers.utility.DockerImageName;

import java.util.List;
import java.util.Map;

@TestConfiguration(proxyBeanMethods = false)
public class TestcontainersConfiguration {

    @Bean
    @ServiceConnection
    PostgreSQLContainer<?> postgresContainer() {
        return new PostgreSQLContainer<>(DockerImageName.parse("postgres:16.4-alpine"))
                .withDatabaseName("budget-service")
                .withUsername("admin")
                .withPassword("admin")
                .withTmpFs(Map.of("/var/lib/postgresql/data", "rw"));
    }

    @Bean
    KeycloakContainer KeycloakContainer() {
        KeycloakContainer keycloak = new KeycloakContainer()
                .withAdminUsername("admin")
                .withAdminPassword("admin")
                .withRealmImportFile("test-realm.json")
                ;

        keycloak.setPortBindings(List.of(
                "9000:9000", "8888:8080"));
        keycloak.start();

        Keycloak keycloakAdminClient = KeycloakBuilder.builder()
                .serverUrl(keycloak.getAuthServerUrl())
                .realm(KeycloakContainer.MASTER_REALM)
                .clientId(KeycloakContainer.ADMIN_CLI_CLIENT)
                .username(keycloak.getAdminUsername())
                .password(keycloak.getAdminPassword())
                .build();

        System.out.println();
        System.out.println("keycloak: " + keycloak.getExposedPorts());
        System.out.println();

        return keycloak;
    }

//    docker run -p 8080:8080 -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin quay.io/keycloak/keycloak:25.0.4 start-dev



    @DynamicPropertySource
    static void setupTestContainers(DynamicPropertyRegistry dynamicPropertyRegistry, PostgreSQLContainer<?> postgresContainer) {
        dynamicPropertyRegistry.add("spring.datasource.url", postgresContainer::getJdbcUrl);
        dynamicPropertyRegistry.add("spring.datasource.username", postgresContainer::getUsername);
        dynamicPropertyRegistry.add("spring.datasource.password", postgresContainer::getPassword);
    }

}