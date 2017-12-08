package com.opinion.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.http.HttpStatus;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * @author zhangtong
 */
@Configuration
@ComponentScan("com.opinion")
@EntityScan(basePackages = "com.opinion.mysql.entity")
@EnableJpaRepositories(basePackages = "com.opinion.mysql.repository")
@EnableAutoConfiguration
@EnableScheduling
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
