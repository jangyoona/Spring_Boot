package com.coffeeorderproject.spring.dto;

import java.sql.Date;
import java.util.ArrayList;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

@Data
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
	
	
	
	
}
