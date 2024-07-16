package com.demoweb.service;

import com.demoweb.entity.LoginAttemptEntity;
import com.demoweb.repository.LoginAttemptRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TestService {
    private final LoginAttemptRepository loginAttemptRepository;

    public TestService(LoginAttemptRepository loginAttemptRepository) {
        this.loginAttemptRepository = loginAttemptRepository;
    }

    @Transactional
    public void saveLoginAttempt() {
        LoginAttemptEntity loginAttempt = new LoginAttemptEntity("testuser", "127.0.0.1", true);
        loginAttemptRepository.save(loginAttempt);
        System.out.println("Test login attempt saved");
    }
}