package org.example.budget;

import org.example.budget.integration.config.TestcontainersConfiguration;
import org.springframework.boot.SpringApplication;

public class IntegrationTestApplication {

    public static void main(String[] args) {
        SpringApplication.from(BudjetManagementApplication::main)
                .with(TestcontainersConfiguration.class)
                .run(args);
    }

}
