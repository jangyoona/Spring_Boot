// 취소btn -> 로그인 페이지로 이동
$('#my-cancel-btn').on('click', () => {
	location.href = "/coffeeorderproject/userAccount/login";
});


// new pw 검사
$('.my-pw-input').on('input', () => {
	// white space, special characters, length
	let newPw = $('#newpw').val();
	  
	  if(/\s/.test(newPw)){
	    $('.newPw-msg').html('공백 없이 입력해주세요.');
	  } else if(newPw.length < 8 && newPw.length > 0){
	    $('.newPw-msg').html('8글자 이상 입력해주세요.');
	  } else if(newPw.length == 0){
	    $('.newPw-msg').html('');
	  } else if(!/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/.test(newPw)){
	    $('.newPw-msg').html('대문자, 특수문자 각각 1글자 이상 포함시켜주세요.');
	  } else if(!/[A-Z]/.test(newPw)){
	    $('.newPw-msg').html('대문자, 특수문자 각각 1글자 이상 포함시켜주세요.');
	  } else {
	    $('.newPw-msg').html('');
	  }
});

// check pw 기능
$('#check-pw').on("input", () => {
	let newPw = $('#newpw').val();
  	let checkPw = $('#check-pw').val();
  	
  	if (newPw != checkPw) {
  		$('.checkPw-msg').html('입력하신 새비밀번호와 다릅니다.');
  	} else {
  		$('.checkPw-msg').html('');
  	}
});

// submit btn 기능
$('#my-resetPw-btn').on('click', (e) => {
  let newPw = $('#newpw').val();
  let checkPw = $('#check-pw').val();
  let userId = $('.my-id-input').val();
  
  console.log($('.newPw-msg').html().length);

  // submit-btn 공백 검사
  if (userId.length == 0 
	  || newPw.length == 0 
	  || checkPw.length == 0
	  || $('.checkPw-msg').html().length > 0
	  || $('.newPw-msg').html().length > 0) {
	  e.preventDefault();
	  window.alert("입력란을 다시 확인해주세요.");
  }

});