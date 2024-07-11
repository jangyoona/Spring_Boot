package com.coffeeorderproject.spring.entity;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name="user")
public class UserEntity {

    @Id
    private String userId;
    @Column(nullable = false)
    private String userName;
    @Column
    private String userNickname;
    @Column
    private String userPhone;
    @Column
    private String userEmail;
    @Column(nullable = false)
    private String userPw;

    @Column @Builder.Default
    private Boolean userAdmin = false;
    @Column @Builder.Default
    private Date userRegidate = new Date();
    @Column @Builder.Default
    private Boolean userActive = false;


//    private int couponId;

//    @OneToMany(fetch = FetchType.LAZY)
//    @JoinColumn(name="userId")
   // private ArrayList<UserCouponDto> usercoupon;


}
