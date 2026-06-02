package com.shankong.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return NoOpPasswordEncoder.getInstance();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        return http
                .authorizeHttpRequests(auth -> {
                    auth.antMatchers("/static/**", "/login", "/logout").permitAll();
                    auth.anyRequest().authenticated();
                })
                .formLogin(form -> {
                    form.loginPage("/login")
                        .loginProcessingUrl("/login")
                        .usernameParameter("managerName")
                        .passwordParameter("managerPwd")
                        .defaultSuccessUrl("/index", true)
                        .permitAll();
                })
                .logout(logout -> {
                    logout.logoutUrl("/logout")
                         .logoutSuccessUrl("/login")
                         .permitAll();
                })
                .csrf().disable()
                .headers(headers -> headers.frameOptions().disable())
                .build();
    }
}
