package com.demoweb.dto;

import com.demoweb.entity.MemberEntity;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberDto {
	
//	@NotBlank(message = "아이디를 입력하세요")
//	@Pattern(regexp = "^[A-Za-z0-p]{8,20}$", message = "아이디는 8~20개의 영문자 숫자 조합")
	private String memberId;
//	@NotBlank(message = "패스워드를 입력하세요")
//	@Pattern(regexp = "^[A-Za-z0-p]{8,20}$", message = "패스워드는 8~20개의 영문자 숫자 조합") // 특수문자 넣으면 안됨
	private String passwd;
	@NotBlank(message = "이메일을 입력하세요")
//	@Pattern(regexp = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$",
	@Pattern(regexp = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$",
			 message = "이메일 형식 오류")
	private String email;

	@Builder.Default
	private String userType = "ROLE_USER";
	private Date regDate;
	private boolean active;



	public MemberEntity toEntity() { // Dto -> Entity로 값을 넘겨주기 위해 생성한 메서드 (타입이 다르기 때문에)
        return MemberEntity.builder().memberId(memberId).passwd(passwd).email(email).userType(userType).build();
	}

	public static MemberDto of(MemberEntity memberEntity) { // Entity(DB에서 넘어온 데이터) -> Dto(view)로 넘겨주기 위해 생성한 메서드 (타입이 다르기 때문에)
        return MemberDto.builder().memberId(memberEntity.getMemberId()).passwd(memberEntity.getPasswd())
				.email(memberEntity.getEmail()).userType(memberEntity.getUserType()).regDate(memberEntity.getRegDate()).build();
	}
	
}
