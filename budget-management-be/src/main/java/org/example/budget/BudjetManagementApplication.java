package org.example.budget;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.Map;

@SpringBootApplication
public class BudjetManagementApplication {

    public static void main(String[] args) {
        Map<String, String> env = System.getenv();
        for (String envName : env.keySet()) {
            System.out.format("---> %s=%s%n", envName, env.get(envName));
        }

        SpringApplication.run(BudjetManagementApplication.class, args);
    }

}
