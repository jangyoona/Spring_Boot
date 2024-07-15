package com.demoweb.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration {

    // 인증을 제어하는 도구 (Filter 기반으로 만들어짐)
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        http
//             .csrf(AbstractHttpConfigurer::disable) // csrf를 사용하지 않겠다는 설정 = csrf? 크로스 사이트 요청 위조. 피싱 공격의 일종
//             .authorizeHttpRequests((authorize) -> authorize
//                                                           .requestMatchers("/account/**").permitAll() // 어카운트 아래에 있는 애들에 대해서는 허용하겠다.
//                                                           .requestMatchers("/", "/home").permitAll() // home은 허용하겠다
//                                                           .requestMatchers("/image/**", "/styles/**").permitAll()// css 얘네도 허용하겠다. (얘네도 허용을 해줘야함)
//                                                           .anyRequest().authenticated()) // 나머지 애들은 다 로그인 페이지로 돌려보내.  authorize? 권한체크 정보.
//             .httpBasic(AbstractHttpConfigurer::disable)
//             .formLogin((formlogin)-> formlogin
//                                              .loginPage("/account/login")); // 일반적으로 사용하는 id, pw 입력받아서 로그인하는 행동

        http
                .csrf(AbstractHttpConfigurer::disable) // csrf 미사용 설정
                .authorizeHttpRequests((authorize) -> authorize
                        .requestMatchers("/board/*write*", "/board/*edit*", "/board/*delete*").authenticated() // authenticated? 로그인한 사용자만 허용 설정
                        .requestMatchers("/admin/**").hasRole("ADMIN") // hasRole? 권한을 기반으로해서 허용
                        .anyRequest().permitAll()) // 나머지 애들은 다 로그인 페이지로 돌려보내.  authorize? 권한체크 정보.
                .httpBasic(AbstractHttpConfigurer::disable)
                .formLogin((formlogin)-> formlogin
                        .loginPage("/account/login")); // 일반적으로 사용하는 id, pw 입력받아서 로그인하는 행동


        return http.build();
    }
}
