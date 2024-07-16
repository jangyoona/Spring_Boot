package com.demoweb.service;

import com.demoweb.entity.LoginAttemptEntity;
import com.demoweb.repository.LoginAttemptRepository;
import lombok.Setter;

public class LoginAttemptServiceImpl implements LoginAttemptService {

    @Setter
    private LoginAttemptRepository loginAttemptRepository;

    @Override
    public void saveLoginAttempt(LoginAttemptEntity loginAttemptEntity) {
        loginAttemptRepository.save(loginAttemptEntity);
    }
}
