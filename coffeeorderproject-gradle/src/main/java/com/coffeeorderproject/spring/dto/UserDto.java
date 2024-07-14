package com.coffeeorderproject.spring.dto;

import com.coffeeorderproject.spring.entity.UserEntity;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.ArrayList;
import java.util.Optional;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserDto {
	
	@NotBlank(message = "아이디를 입력하세요.")
	@Pattern(regexp = "^[A-Za-z0-p]{4,20}$", message = "4~20 글자 내로 입력해 주세요.")
	private String userId;
	@NotBlank(message = "이름을 입력하세요.")
	@Pattern(regexp = "^[0-9a-zA-Zㄱ-ㅎ가-힣]*$", message = "글자만 입력해 주세요.")
	private String userName;
	@NotBlank(message = "닉네임을 입력하세요.")
	private String userNickname;
	@NotBlank(message = "휴대폰 번호를 입력하세요.")
	@Pattern(regexp = "^\\d{2,3}\\d{3,4}\\d{4}$", message = "-없이 숫자만 입력해 주세요.")
	private String userPhone;
	@NotBlank(message = "이메일을 입력하세요.")
	@Pattern(regexp = "^[a-zA-Z0-9]+@[0-9a-zA-Z]+\\.[a-z]+$", message = "이메일 형식에 맞게 입력해 주세요.")
	private String userEmail;
	@NotBlank(message = "비밀번호를 입력하세요.")
//	@Pattern(regexp = "^[A-Za-z0-p]{8,20}$",
//			 message = "패스워드는 8~20개의 영문자 숫자 조합")
	private String userPw;
	private Boolean userAdmin;
	private Date userRegidate;
	private Boolean userActive;
	
	private int couponId;
	private ArrayList<UserCouponDto> usercoupon;
	

	public UserEntity toEntity() {
        return UserEntity.builder().userId(userId).userName(userName).userNickname(userNickname)
								   .userPhone(userPhone).userEmail(userEmail).userPw(userPw).build();
	}

//	public static UserDto of(Optional<UserEntity> entity) {
//        return entity.map(userEntity -> UserDto.builder()
//                .userId(userEntity.getUserId())
//                .userName(userEntity.getUserName())
//                .userNickname(userEntity.getUserNickname())
//                .userPhone(userEntity.getUserPhone())
//                .userEmail(userEntity.getUserEmail())
//                .userAdmin(userEntity.getUserAdmin())
//                .userRegidate((Date) userEntity.getUserRegidate())
//                .userActive(userEntity.getUserActive()).build()).orElse(null);
//	}

	// 윤아 남자친구 코드
	public static UserDto of(UserEntity userEntity) {
		return UserDto.builder()
				.userId(userEntity.getUserId())
				.userName(userEntity.getUserName())
				.userNickname(userEntity.getUserNickname())
				.userPhone(userEntity.getUserPhone())
				.userEmail(userEntity.getUserEmail())
				.userAdmin(userEntity.getUserAdmin())
				.userRegidate((Date) userEntity.getUserRegidate())
				.userActive(userEntity.getUserActive()).build();
	}




}
