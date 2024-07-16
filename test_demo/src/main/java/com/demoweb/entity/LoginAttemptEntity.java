package com.demoweb.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "y_login_attempt")
public class LoginAttemptEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
//    @Column
    private String username;
//    @Column
    private String ipAddress;
//    @Column
    private boolean success;

    public LoginAttemptEntity(){};

    public LoginAttemptEntity(String username, String ipAddress, boolean success) {
        this.username = username;
        this.ipAddress = ipAddress;
        this.success = success;
    }


}
