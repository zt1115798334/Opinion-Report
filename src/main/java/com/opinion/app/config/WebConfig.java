package com.opinion.app.config;

import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;

/**
 * @author zhangtong
 * Created by on 2017/12/8
 */
@Configuration
public class WebConfig {

    @Bean
    public EmbeddedServletContainerCustomizer containerCustomizer() {

        return (container -> {
            ErrorPage error401Page = new ErrorPage(HttpStatus.UNAUTHORIZED, "/web/401");
            ErrorPage error404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/web/404");
            ErrorPage error500Page = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/web/500");

            container.addErrorPages(error401Page, error404Page, error500Page);
        });
    }
}
