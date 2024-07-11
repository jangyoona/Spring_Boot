package com.demoweb.repository;

import com.demoweb.entity.MemberEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<MemberEntity, String> { // 누구의 리포인지, PrimaryKey의 자료형 명시

    MemberEntity findMemberByMemberIdAndPasswd(String memberId, String passwd);
}
