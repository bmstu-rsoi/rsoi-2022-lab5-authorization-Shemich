package ru.shemich.gatewayservice.config;

import com.okta.spring.boot.oauth.Okta;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests(request -> request.anyRequest().authenticated())
                .oauth2ResourceServer().jwt();

        http.cors();

        Okta.configureResourceServer401ResponseBody(http);
    }
}