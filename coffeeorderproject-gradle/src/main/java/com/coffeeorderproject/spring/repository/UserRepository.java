package com.coffeeorderproject.spring.repository;

import com.coffeeorderproject.spring.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserEntity, String> {

}
