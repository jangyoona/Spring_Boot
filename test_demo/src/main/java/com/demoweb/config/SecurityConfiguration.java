package com.demoweb.config;

import org.hibernate.query.NativeQuery;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.Collection;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration {

    private final AuthenticationEventListener authenticationEventListener;
    private final AuthenticationEventListener.AuthenticationFailureListener authenticationFailureListener;

    public SecurityConfiguration(AuthenticationEventListener authenticationEventListener, AuthenticationEventListener.AuthenticationFailureListener authenticationFailureListener) {
        this.authenticationEventListener = authenticationEventListener;
        this.authenticationFailureListener = authenticationFailureListener;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(AbstractHttpConfigurer::disable) // csrf 미사용 설정
                .authorizeHttpRequests((authorize) -> authorize
                        .requestMatchers("/board/*write*", "/board/*edit*", "/board/*delete*").authenticated() // authenticated? 로그인한 사용자만 허용 설정
                        .requestMatchers("/admin/**").hasRole("ADMIN") // hasRole? 권한을 기반으로해서 허용
                        .anyRequest().permitAll()) // 그 외 모든 요청은 인증을 필요설정  authorize? 권한체크 정보.
                .httpBasic(AbstractHttpConfigurer::disable)
                .formLogin((login) -> login
                        // 단, Parameter 설정을 안할 경우에는 - 약속<규격>된대로 input-name 속성을 => id는 'username' / pw는 'password' 로 설정해줘야함(action? /login 으로.)
                        .loginPage("/account/login") // <spring-security가 가지고 있는 몬생긴 form말고, 이쪽 화면에서 처리할게 라는 커스텀 설정>
                        .failureUrl("/account/login?fail")
                        .usernameParameter("memberId") // <input name="유저Id 커스텀 설정">
                        .passwordParameter("passwd") // <input name="유저Pw 커스텀 설정">
                        .loginProcessingUrl("/account/process-login"))
                .logout((logout) -> logout
                        .logoutUrl("/account/logout")
                        .invalidateHttpSession(true)
                        .deleteCookies("JSESSIONID")
                        .logoutSuccessUrl("/account/login"));

        return http.build();
    }


    //////////////////////////////////////////////////////////////////////////////////////////////
    // 인증을 제어하는 도구 (Filter 기반으로 만들어짐)
//    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
////        4.
//        http
//                .csrf(AbstractHttpConfigurer::disable) // csrf 미사용 설정
//                .authorizeHttpRequests((authorize) -> authorize
//                        .requestMatchers("/board/*write*", "/board/*edit*", "/board/*delete*").authenticated() // authenticated? 로그인한 사용자만 허용 설정
//                        .requestMatchers("/admin/**").hasRole("ADMIN") // hasRole? 권한을 기반으로해서 허용
//                        .anyRequest().permitAll()) // 그 외 모든 요청은 인증을 필요설정  authorize? 권한체크 정보.
//                .httpBasic(AbstractHttpConfigurer::disable)
//                .formLogin((login) -> login
//                        // 단, Parameter 설정을 안할 경우에는 - 약속<규격>된대로 input-name 속성을 => id는 'username' / pw는 'password' 로 설정해줘야함(action? /login 으로.)
//                        .loginPage("/account/login") // <spring-security가 가지고 있는 몬생긴 form말고, 이쪽 화면에서 처리할게 라는 커스텀 설정>
//                        .usernameParameter("memberId") // <input name="유저Id 커스텀 설정">
//                        .passwordParameter("passwd") // <input name="유저Pw 커스텀 설정">
//                        .loginProcessingUrl("/account/process-login")); // <form action="경로 커스텀 설정">
//        return http.build();
//    }
    ///////////////////////////////////////////////////////////////////////////////////////////////////


    @Bean
    PasswordEncoder passwordEncoder(){ // Spring Security가 기본적으로 사용하는 passwordEncoder
        return new BCryptPasswordEncoder();
    }

    // 2-2.
    @Bean
    public UserDetailsService userDetailsService(DataSource dataSource) { // JdbcUserDetailsManager? DB에 저장함

        JdbcUserDetailsManager userDetailsService = new JdbcUserDetailsManager(dataSource); // 미리 정해진 테이블, SQL을 사용해서 인증처리

        // 사용자 정의 테이블을 사용하기 위해 로그인, 권한 검사에 사용할 Query 지정 (약속된 테이블이 아니라 커스텀이라 코드+쿼리문으로 알려 줘야함)
        userDetailsService.setUsersByUsernameQuery("select email,password,enabled "
                + "from custom_users "
                + "where email = ?");
        userDetailsService.setAuthoritiesByUsernameQuery("select email, authority " +
                "from custom_authorities " +
                "where email = ?");
        return userDetailsService;
    }


    // ///////////////////////////////////////////////////////////////////////





}


