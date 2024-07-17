package com.demoweb.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.Set;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "tbl_member")
public class MemberEntity {

    @Id
    private String memberId;
    @Column
    private String passwd;
    @Column
    private String email;

    @Builder.Default // Bulider를 사용해서 객체를 만들 때, 기본값 사용하는 설정
    @Column
    private String userType = "user";
    @Builder.Default
    @Column
    private Date regDate = new Date();
    @Builder.Default
    @Column
    private boolean active = true;

    @ManyToMany // ManyToMany는 중간에 테이블이 무조건 만들어 져야함 지금하는 이 코드들이 자동으로 테이블을 만들라는 설정임
    @JoinTable(name = "tbl_member_role", joinColumns = @JoinColumn(name = "memberId"), inverseJoinColumns = @JoinColumn(name = "roleNo")) // JoinColumn은 무게중심이 있는쪽에 설정
    private Set<RoleEntity> roles;




}
