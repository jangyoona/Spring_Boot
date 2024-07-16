package com.demoweb.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Set;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Table(name = "tbl_role")
public class RoleEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // MySQL은 IDENTITY를 주로 쓰는거 같아...
    private int roleNo;

    @Column
    private String roleName;

    @Column
    private String roleDesc;

    @ManyToMany(mappedBy = "roles")
    private Set<MemberEntity> members; // Set? 권한 중복이 있으면 안되기 때문에






}
