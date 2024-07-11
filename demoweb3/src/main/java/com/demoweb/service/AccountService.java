package com.demoweb.service;

import com.demoweb.dto.MemberDto;

public interface AccountService {

	// 회원 가입 처리
	void registerMember(MemberDto member);

	MemberDto findMemberByMemeberIdAndPasswd(MemberDto member);

	void resetPasswd(MemberDto member);

	boolean checkDuplication(String memberId);

}