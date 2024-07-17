package com.demoweb.config;

import com.demoweb.aop.AccessLogger;
import com.demoweb.entity.LoginAttemptEntity;
import com.demoweb.repository.LoginAttemptRepository;
import jakarta.servlet.http.HttpServletRequest;
import lombok.Setter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.AuthenticationFailureBadCredentialsEvent;
import org.springframework.security.authentication.event.InteractiveAuthenticationSuccessEvent;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class AuthenticationEventListener implements ApplicationListener<InteractiveAuthenticationSuccessEvent> {

    @Setter(onMethod_ = @Autowired)
    private LoginAttemptRepository loginAttemptRepository;
    private final HttpServletRequest request;
    private static final Logger logger = LoggerFactory.getLogger(AuthenticationEventListener.class);



    public AuthenticationEventListener(LoginAttemptRepository loginAttemptRepository, HttpServletRequest request) {
        this.loginAttemptRepository = loginAttemptRepository;
        this.request = request;
    }

    @Override
    @Transactional
    public void onApplicationEvent(InteractiveAuthenticationSuccessEvent event) {
        String ipAddress = request.getRemoteAddr();
        Authentication authentication = event.getAuthentication();
        String username = authentication.getName();

        logger.info("Successful login attempt. Username: {}, IP Address: {}", username, ipAddress);

        LoginAttemptEntity loginAttempt = new LoginAttemptEntity(username, ipAddress, true);
        loginAttemptRepository.save(loginAttempt);
    }

    // Capture failed login attempts
    @Component
    public static class AuthenticationFailureListener implements ApplicationListener<AuthenticationFailureBadCredentialsEvent> {

        private final LoginAttemptRepository loginAttemptRepository;
        private final HttpServletRequest request;

        public AuthenticationFailureListener(LoginAttemptRepository loginAttemptRepository, HttpServletRequest request) {
            this.loginAttemptRepository = loginAttemptRepository;
            this.request = request;
        }

        @Override
        @Transactional
        public void onApplicationEvent(AuthenticationFailureBadCredentialsEvent event) {
            String ipAddress = request.getRemoteAddr();
            String username = (String) event.getAuthentication().getPrincipal();

            logger.info("Failed login attempt. Username: {}, IP Address: {}", username, ipAddress);
            try {
                LoginAttemptEntity loginAttempt = new LoginAttemptEntity(username, ipAddress, false);
                loginAttemptRepository.save(loginAttempt);
                logger.info("Saved failed login attempt to database.");
                System.out.println("리스너 안" + loginAttempt);
            } catch (Exception e) {
                logger.error("Failed to save failed login attempt to database.", e);
            }

            LoginAttemptEntity loginAttempt = new LoginAttemptEntity(username, ipAddress, false);
            loginAttemptRepository.save(loginAttempt);
        }
    }
}