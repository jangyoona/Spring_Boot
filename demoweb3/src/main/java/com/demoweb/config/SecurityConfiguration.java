package com.demoweb.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration {

    // 인증을 제어하는 도구 (Filter 기반으로 만들어짐)
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        1-1.
//        http
//             .csrf(AbstractHttpConfigurer::disable) // csrf를 사용하지 않겠다는 설정 = csrf? 크로스 사이트 요청 위조. 피싱 공격의 일종
//             .authorizeHttpRequests((authorize) -> authorize
//                                                           .requestMatchers("/account/**").permitAll() // 어카운트 아래에 있는 애들에 대해서는 허용하겠다.
//                                                           .requestMatchers("/", "/home").permitAll() // home은 허용하겠다
//                                                           .requestMatchers("/image/**", "/styles/**").permitAll()// css 얘네도 허용하겠다. (얘네도 허용을 해줘야함)
//                                                           .anyRequest().authenticated()) // 그 외 모든 요청은 인증을 필요설정  authorize? 권한체크 정보.
//             .httpBasic(AbstractHttpConfigurer::disable)
//             .formLogin((formlogin)-> formlogin
//                                              .loginPage("/account/login")); // 일반적으로 사용하는 id, pw 입력받아서 로그인하는 행동

//        1-2.
//        http
//                .csrf(AbstractHttpConfigurer::disable) // csrf 미사용 설정
//                .authorizeHttpRequests((authorize) -> authorize
//                        .requestMatchers("/board/*write*", "/board/*edit*", "/board/*delete*").authenticated() // authenticated? 로그인한 사용자만 허용 설정
//                        .requestMatchers("/admin/**").hasRole("ADMIN") // hasRole? 권한을 기반으로해서 허용
//                        .anyRequest().permitAll()) // 그 외 모든 요청은 인증을 필요설정  authorize? 권한체크 정보.
//                .httpBasic(AbstractHttpConfigurer::disable)
//                .formLogin((formlogin)-> formlogin
//                        .loginPage("/account/login")); // 일반적으로 사용하는 id, pw 입력받아서 로그인하는 행동

//        2.
//        http
//                .csrf(AbstractHttpConfigurer::disable) // csrf 미사용 설정
//                .authorizeHttpRequests((authorize) -> authorize
//                        .requestMatchers("/board/*write*", "/board/*edit*", "/board/*delete*").authenticated() // authenticated? 로그인한 사용자만 허용 설정
//                        .requestMatchers("/admin/**").hasRole("ADMIN") // hasRole? 권한을 기반으로해서 허용
//                        .anyRequest().permitAll()) // 그 외 모든 요청은 인증을 필요설정  authorize? 권한체크 정보.
//                .httpBasic(Customizer.withDefaults())
//                .formLogin(AbstractHttpConfigurer::disable); // 일반적으로 사용하는 id, pw 입력받아서 로그인하는 행동
//
//        3.
//        http
//                .csrf(AbstractHttpConfigurer::disable) // csrf 미사용 설정
//                .authorizeHttpRequests((authorize) -> authorize
//                        .requestMatchers("/board/*write*", "/board/*edit*", "/board/*delete*").authenticated() // authenticated? 로그인한 사용자만 허용 설정
//                        .requestMatchers("/admin/**").hasRole("ADMIN") // hasRole? 권한을 기반으로해서 허용
//                        .anyRequest().permitAll()) // 그 외 모든 요청은 인증을 필요설정  authorize? 권한체크 정보.
//                .httpBasic(AbstractHttpConfigurer::disable)
//                .formLogin(Customizer.withDefaults()); // 일반적으로 사용하는 id, pw 입력받아서 로그인하는 행동

//        4.
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
                        .usernameParameter("memberId") // <input name="유저Id 커스텀 설정">
                        .passwordParameter("passwd") // <input name="유저Pw 커스텀 설정">
                .loginProcessingUrl("/account/process-login")); // <form action="경로 커스텀 설정">
        return http.build();
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////////


    @Bean
    PasswordEncoder passwordEncoder(){ // Spring Security가 기본적으로 사용하는 passwordEncoder
        return new BCryptPasswordEncoder();
    }


//    UserDetailsService Class 사용 - 잘 안씀
//    // 1.
//    @Bean
//    public UserDetailsService userDetailsService() {
//        System.out.println(passwordEncoder().encode("Pa$$w0rd"));
//        InMemoryUserDetailsManager userDetailService = new InMemoryUserDetailsManager(); // 사용자 정보를 메모리에 두겠다
//        userDetailService.createUser(User // 사용자 등록
//                .withUsername("inmemoryuser")
////                .password("{noop}Pa$$w0rd") // Security는 기본적으로 암호화 처리가 되어있음. 따라서 암호화 되지 않은 경우 {noop} 를 붙여줘야 사용 가능함.
//                .password(passwordEncoder() .encode("Pa$$w0rd"))
//                .roles("USER") // ROLE_USER
//                .build());
//        userDetailService.createUser(User // 사용자 등록
//                .withUsername("inmemoryadmin")
//               // .password("{noop}Pa$$w0rd") // Security는 기본적으로 암호화 처리가 되어있음. 따라서 암호화 되지 않은 경우 {noop} 를 붙여줘야 사용 가능함.
//                .password(passwordEncoder() .encode("Pa$$w0rd"))
//                .roles("ADMIN") // ROLE_ADMIN
//                .build());
//        return userDetailService;
//    }

    // 2-1.
//    @Bean
//    public UserDetailsService userDetailsService(DataSource dataSource) { // JdbcUserDetailsManager? DB에 저장함
//        return new JdbcUserDetailsManager(dataSource); // 미리 정해진 테이블, SQL을 사용해서 인증처리
//
//    }

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


}



