package org.example.budget.integration;

import org.example.budget.integration.config.TestConstants;
import org.example.budget.integration.config.TestcontainersConfiguration;
import org.junit.jupiter.api.Tag;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.containers.PostgreSQLContainer;

import java.util.Map;

//@AutoConfigureWireMock(port = 0)
@Tag(TestConstants.PROFILE_INTEGRATION_TEST)
@ActiveProfiles(TestConstants.PROFILE_INTEGRATION_TEST)
@Import({TestcontainersConfiguration.class})
@SpringBootTest(webEnvironment=SpringBootTest.WebEnvironment.RANDOM_PORT)
public class BaseIntegrationTest {


}
