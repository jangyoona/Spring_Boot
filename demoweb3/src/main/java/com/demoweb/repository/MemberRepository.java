package com.demoweb.repository;

import com.demoweb.entity.MemberEntity;
import com.demoweb.entity.RoleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MemberRepository extends JpaRepository<MemberEntity, String> { // 누구의 리포인지, PrimaryKey의 자료형 명시

    MemberEntity findMemberByMemberIdAndPasswd(String memberId, String passwd);

    @Query(value = "SELECT re FROM RoleEntity re WHERE re.roleName = :roleName")
    RoleEntity findRoleByRoleName(String roleName);
}
