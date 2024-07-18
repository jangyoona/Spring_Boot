package com.demoweb.security;

import com.demoweb.dto.MemberDto;
import com.demoweb.dto.RoleDto;
import com.demoweb.entity.MemberEntity;
import com.demoweb.entity.RoleEntity;
import com.demoweb.repository.MemberRepository;
import jakarta.transaction.Transactional;
import lombok.Data;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.Optional;
import java.util.Set;

@Data
public class ProjectUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = { @Autowired })
	private MemberRepository memberRepository;
	
	@Override
	@Transactional
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		//데이터베이스에서 데이터 조회
		DemoWebUserDetails userDetails = null;
		Optional<MemberEntity> result= memberRepository.findById(username); // 이 방식에선 유저Id만 가져오고, Id를 가져온 후 Pw를 체크한다.
		if (result.isEmpty() ) {
			throw new UsernameNotFoundException(username);
		} else {
			// List<RoleDto> roles = memberRepository.selectRolesById(username);
			MemberEntity memberEntity = result.get();
			Set<RoleEntity> roles = memberEntity.getRoles();

			userDetails = new DemoWebUserDetails(MemberDto.of(memberEntity), roles.stream().map(RoleDto::of).toList());
		}		
		
		return userDetails;
	}

}









