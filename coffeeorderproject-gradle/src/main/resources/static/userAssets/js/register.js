
// Introduction UI
let helloArr = $('.hello').text().split('');
let textArr = $('.introduction p').text().split('');
let plusArr = [];
let plusArr2 = [];
let minusArr = [...helloArr];
let num = Math.floor(Math.random() * 2) + 1;
let finish = 0;

$('.introduction p').html('');
$('.hello').html('');

setTimeout(() => {
  helloArr.forEach((value, i) => {
    setTimeout(() => {
      
      plusArr.push(value);
      plusArr.toString();
      $('.hello').html(plusArr);

      if(i == helloArr.length - 1){
        finish = 1;
      }

      if(finish == 1){

        setTimeout(() => {
          for(let z = 0; z < helloArr.length; z++){
            setTimeout(() => {
              minusArr.pop();
              minusArr.toString();
              $('.hello').html(minusArr);

              if(z == helloArr.length - 1){
                finish = 2;
              }

              /* p tag UI */
              if(finish == 2){
                setTimeout(() => {
                  for(let i = 0; i < textArr.length; i++){
                    setTimeout(() => {
                      plusArr2.push(textArr[i]);
                      plusArr2.toString();
                      $('.introduction p').html(plusArr2);
                    }, (num * i) + '00');
                  }
                }, 500);
              }

            }, (num * z) + '00');
          }
        }, 1000);

      }

    }, (num * i) + '00')
  });
}, 1000);



// Examine Input value
$('.id-input').on('input', (e) => {
  // white space, length, special characters
  let id = $('.id-input').val();

  if(/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/.test(id)){
    $('.id-msg').html('특수문자 없이 입력해주세요.');
  } else if(/\s/.test(id)){
    $('.id-msg').html('공백 없이 입력해주세요.');
  } else if(id.length < 5 && id.length > 0){
    $('.id-msg').html('5글자 이상 입력해주세요.');
  } else if(id.length == 0){
    $('.id-msg').html('');
  } else {
    $('.id-msg').html('');
  }
});


$('.id-check-btn').on('click', () => {
	const id = $('.id-input').val();
	location.href = `register?userId=${id}`;
});

$('.pw-input').on('input', () => {
  // white space, special characters, length
  let pw = $('.pw-input').val();
  
  if(/\s/.test(pw)){
    $('.pw-msg').html('공백 없이 입력해주세요.');
  } else if(pw.length < 8 && pw.length > 0){
    $('.pw-msg').html('8글자 이상 입력해주세요.');
  } else if(pw.length == 0){
    $('.pw-msg').html('');
  } else if(!/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/.test(pw)){
    $('.pw-msg').html('대문자, 특수문자 각각 1글자 이상 포함시켜주세요.');
  } else if(!/[A-Z]/.test(pw)){
    $('.pw-msg').html('대문자, 특수문자 각각 1글자 이상 포함시켜주세요.');
  } else {
    $('.pw-msg').html('');
  }
});

$('.name-input').on('input', () => {
  // white space, special characters
  let name = $('.name-input').val();

  if(/\s/.test(name)){
    $('.name-msg').html('공백 없이 입력해주세요.');
  } else if(/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/.test(name)){
    $('.name-msg').html('특수 기호 없이 입력해주세요.');
  } else if(name.length == 0){
    $('.name-msg').html('');
  } else {
    $('.name-msg').html('');
  }
});

$('.nickname-input').on('input', () => {
	let nickname = $('.nickname-input').val();
	
	if (/\s/.test(nickname)) {
		$('.nickname-msg').html('공백 없이 입력해주세요.');
	}
});

$('.phone-input').on('input', () => {
	let phone = $('.phone-input').val();
	
	if(/\s/.test(phone)){
    	$('.phone-msg').html('공백 없이 입력해주세요.');
  	} else if(!/^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/.test(phone)) {
		$('.phone-msg').html('전화번호 형식이 맞지 않습니다.( - 빼고 입력해주세요)');
	} else if(phone.length == 0) {
		$('.phone-msg').html('');
	} else {
		$('.phone-msg').html('');
	}
});

$('.email-input').on('input', () => {
	let email = $('.email-input').val();
	
	if(/\s/.test(email)){
    	$('.email-msg').html('공백 없이 입력해주세요.');
  	} else if (!/[a-z0-9]+@[a-z]+\.[a-z]{2,3}/.test(email)) {
		$('.email-msg').html('이메일 형식이 맞지 않습니다.');
	} else if(email.length == 0) {
		$('.email-msg').html('');
	} else {
		$('.email-msg').html('');
	}
});


// Register Btn 기능
$('.register-btn').click((e) => {
  let id = $('.id-input').val();
  let pw = $('.pw-input').val();
  let name = $('.name-input').val();
  let nickname = $('.nickname-input').val();
  let phone = $('.phone-input').val();
  let email = $('.email-input').val();
  let idCheck = $('.idcheck-content').html();

  // id
  if(/\s/.test(id) 
  || id.length < 4
  || /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/.test(id)
  || id.length == 0
  || idCheck.length == 0
  || idCheck == "중복된 아이디입니다"){
    e.preventDefault();
    window.alert('아이디를 다시 확인해주세요.');
  } 
  
  // pw
  if(/\s/.test(pw) 
  || !/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/.test(pw)
  || !/[A-Z]/.test(pw)
  || pw.length < 7){
    e.preventDefault();
    window.alert('비밀번호를 다시 확인해주세요.');
  }
  
  // name
  if(/\s/.test(name)
  || /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/.test(name)
  || name.length == 0){
    e.preventDefault();
    window.alert('이름을 다시 확인해주세요.');
  } 
  
  // nickname
  if(nickname.length == 0) {
	e.preventDefault();
	window.alert('별명을 다시 확인해주세요.');
  }
  
  // phone
  if(/s/.test(phone)
  || !/^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/.test(phone)
  || phone.length == 0) {
	e.preventDefault();
	window.alert('전화번호를 다시 확인해주세요.');
  }
  
  // email
  if(email.length == 0
  || !/[a-z0-9]+@[a-z]+\.[a-z]{2,3}/.test(email)) {
	e.preventDefault();
	window.alert('이메일을 다시 확인해주세요.');
  }

});
























