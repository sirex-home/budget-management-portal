package org.example.budget.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

import java.util.Optional;

@Configuration
@EnableJpaAuditing(auditorAwareRef = "auditorAware")
public class JPAConfig {

    @Bean
    public AuditorAware<String> auditorAware() {
        // TODO KG: implement security integration
        // return () -> Optional.of(((SecurityProperties.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername());
        return () -> Optional.of("mocked_security_user");
    }

}