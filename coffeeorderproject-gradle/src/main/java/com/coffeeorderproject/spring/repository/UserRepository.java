package com.coffeeorderproject.spring.repository;

import com.coffeeorderproject.spring.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserRepository extends JpaRepository<UserEntity, String> {

    int countByUserId(String userId);

    UserEntity findUserByUserIdAndUserPw(String userId, String userPw);

    @Query("SELECT userEmail from UserEntity WHERE userId = :userId")
    String findByUserEmail(String userId);

}
