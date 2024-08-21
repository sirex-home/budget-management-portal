package org.example.budget.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void configurePathMatch(PathMatchConfigurer configurer) {
        configurer.addPathPrefix("api", c -> c.isAnnotationPresent(RestController.class));
    }

    @Controller
    public class VueController {

        @RequestMapping(value = "/{path:[^\\.]*}")
        public String redirectVueSpecificRoutes() {
            return "forward:/index.html";
        }

    }

}
