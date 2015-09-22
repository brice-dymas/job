/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.spring;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com>
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter
{

    @Autowired
    DataSource dataSource;

    @Autowired
    public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception
    {

        auth.jdbcAuthentication().dataSource(dataSource).passwordEncoder(passwordEncoder())
                .usersByUsernameQuery(
                        "select username,password, enabled from users where enabled=true and username=?")
                .authoritiesByUsernameQuery(
                        "select user_username, role from user_roles where user_username=?");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception
    {
        http.authorizeRequests()
                .antMatchers("/jobSeeker/**").authenticated()
                .antMatchers("/secteur/**").authenticated()
                .antMatchers("/entreprise/**").authenticated()
                .antMatchers("/placement/**").authenticated()
                .antMatchers("/user/**/edit").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/user/**/editSimpleUser").authenticated()
                .antMatchers("/user/**/update").authenticated()
                .antMatchers("/user/**/**/updateSimpleUser").authenticated()
                .antMatchers("/user/**/show").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/user/**").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/welcome.jsp").authenticated()
                .and()
                .formLogin().loginPage("/login").failureUrl("/login?error")
                .usernameParameter("username").passwordParameter("password").and()
                .exceptionHandling().accessDeniedPage("/403")
                .and()
                .logout().logoutSuccessUrl("/")
                .and()
                .csrf();

    }

    @Bean
    public PasswordEncoder passwordEncoder()
    {
        PasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder;
    }
}
