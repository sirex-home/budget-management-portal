package org.example.budget.integration;

import org.example.budget.integration.config.TestcontainersConfiguration;
import org.junit.jupiter.api.Tag;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.ActiveProfiles;


//@AutoConfigureWireMock(port = 0)
@Tag(BaseIntegrationTest.PROFILE_INTEGRATION_TEST)
@ActiveProfiles(BaseIntegrationTest.PROFILE_INTEGRATION_TEST)
@Import({TestcontainersConfiguration.class})
@SpringBootTest(webEnvironment=SpringBootTest.WebEnvironment.RANDOM_PORT)
public class BaseIntegrationTest {

    public static final String PROFILE_INTEGRATION_TEST = "integration-test";

}
