<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="/resources/login/css/default.css">
<!-- <link rel="stylesheet" href="/resources/login/css/loginPage.css"> -->
<script type="text/javascript" src="/resources/login/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="/resources/login/js/rsa/rsa.js"></script>
<script type="text/javascript" src="/resources/login/js/rsa/prng4.js"></script>
<script type="text/javascript" src="/resources/login/js/rsa/rng.js"></script>
<script type="text/javascript" src="/resources/login/js/common/prototype.js"></script>
<script type="text/javascript" src="/resources/login/js/common/eventKeyBlock.js"></script>
<script type="text/javascript" src="/resources/login/js/common/cookieUtil.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<style>
html, body {
  width: 100vw;
  height: 100vh;
}
.container {
  width: 100%;
  height: 100%;
  background: pink;
}
ul,li{
  list-style:none;
}
.imgSlide{
	overflow : hidden;
	width: 100%;
	height : 100%;
}
.slides, .slides li{
	display : inline-block;
	width : 100%;
	height : 100%;
	position : absolute;
	top: 0;
	left : 0;
	overflow : hidden;
}
.slides #roll{
	display : inline-block;
	width : 100%;
	height : 100%;
	overflow : hidden;
}
</style>
<script type="text/javascript" defer="defer">

$(function(){
	
	var roll = 0;
	
	setTimeout(function images(){
		
		roll ++;
		
		if(roll == 10){
			roll = 0;
		}
		
		setTimeout(function() {}, 1000);
		
		$("#roll").fadeTo(1000, 0.6, function(){
			$("#roll").attr("src", "/resources/upload/login/login_" + (roll+1)+ ".jpg");
		});
		
		$("#roll").fadeTo(1000, 1);
		
		setTimeout(images, 3000);
	}, 3000);
	
	//저장된 쿠키값을 가져와서 ID칸에 넣어주는데 없으면 공백으로 들어감.
	var key = getCookie("key");
	$('#rememberId').val(key);
	
	//그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력칸에 저장된 ID가 표시된 상태라면,
	if($('#id').val(key) != ""){
		$('#rememberId').attr("checked",true);//ID저장하기를 체크 상태로 두기
	}
	
	var inputPass = document.getElementById("memPass");
	inputPass.addEventListener("keyup", function(event) {
	  //엔터키로 로그인하기
      if(event.keyCode === 13) {
        event.preventDefault();
        document.getElementById("loginBtn").click();
      }
    });

	$('#checkId').change(function(){//체크박스에 변화가 있다면,
		if($('#rememberId').is(":checkd")){//ID저장하기 체크 시
			setCookie("key",$('#id').val(),time()+60*60*1);//1시간 동안 쿠키 보관
		}else{//ID저장하기 체크 해제 시,
			deleteCookie("key");
		}
	});
	
	//ID저장하기를 체크한 상태에서 ID를 입력하는 경우에도 쿠키 저장
	$('#id').keyup(function(){
		if($('#rememberId').is(":checked")){
			setCookie("key",$("#id").val(),time()+60*60*1);
		}
	});
	
});
	
	//쿠키 저장하기
	//setCookie => 쿠키를 생성하고 지워주는 역할
	function setCookie(cookieName, value, exdays){
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
							+ ((exdays == null)? "" : ";expires = " + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}
	
	//쿠키 삭제
	function deleteCookie(cookieName){
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "=" + "; expires=" + expireDate.toGMTString();
	}
	
	function getCookie(cookieName){
		cookieName = cookieName + "=";
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if(start != -1){//쿠키가 존재하면
			start += cookieName.length;
			var end = cookieData.indexOf(';',start);
			if(end==-1)//쿠키 값의 마지막 위치 인덱스 번호 설정
				end = cookieData.length;
			console.log("end위치 : " + end);
			cookieValue = cookieData.substring(start,end);
		}
		return unescape(cookieValue);
	}

	function login() {
		if( $('#memCd').val().trim() == '' ) {
			alert('아이디를 입력하세요!');
			$('#memCd').focus();
			return;
		} else if( $('#memPass').val().trim() == '' ) {
			alert('비밀번호를 입력하세요!');
			$('#memPass').focus();
			return;
		}
		
		let data = {"id":$('#memCd').val(), "pw":$('#memPass').val() };
		
		$("#frm").submit();
	}
	
	//Caps Lock 이벤트
	function fnKeyPress(e) {
		var keyCode = 0;
		var shiftKey = false;
		keyCode = e.keyCode;
		if (e.keyCode == 0) {
		keyCode = e.which;
		}
		shiftKey = e.shiftKey;
	
	
		//Shift를 누르지 않은 상태에서 대문자 범위 일 경우
		if ((keyCode >= 65 && keyCode <= 90) && !shiftKey) {
			$('#alertCapsLock').text("CapsLock이 켜져 있습니다.");
			setTimeout("fnCapsHide()", 1500);
		}
	
		//Shift를 누른 상태에서 소문자 범위 일 경우
		if ((keyCode >= 97 && keyCode <= 122) && shiftKey) {
			$('#alertCapsLock').text("CapsLock이 켜져 있습니다.");
			setTimeout("fnCapsHide()", 1500);
		}
	}
	
	function fnCapsHide() {
		$('#alertCapsLock').text("");
	}
	
	//학생 자동 로그인
	function stuAutoLogin() {
		$('#memCd').val('21715032');
		$('#memPass').val('asdf');
		$('#frm').submit();
	}
	//교수 자동 로그인
	function proAutoLogin() {
		$('#memCd').val('1');
		$('#memPass').val('1');
		$('#frm').submit();
	}
	//관리자 자동 로그인
	function manAutoLogin() {
		$('#memCd').val('7');
		$('#memPass').val('7');
		$('#frm').submit();
	}
	
</script>
<!-- <div class="imgSlide"> -->
<!-- 	<ul class="slides"> -->
<!-- 		<li><img src="/resources/upload/login/login_1.jpg" id="roll" style="filter: brightness(0.5);"/></li> -->
<!-- 	</ul> -->
<!-- </div> -->

<div class="login-bg">
	<div class="login-wrap">
		<input type="hidden" id="tap_check" name="tap_check" value="id">

		<form name="frm" id="frm" action="/login" method="post" style="display: contents;">
			<!-- 여기서 작업 변경 -->
			<div class="box01">
				<p class="text01">
					나는 <span>연수인</span><br>
					<span>나의 미래</span>를 만든다!
				</p>
				<p class="text02">진리와 자유를 향한 연수의 도전</p>
			</div>

			<div class="box02">
				<div>
					<div class="login-top">
						<div class="logo-wrap"></div>
					</div>
					<div class="login-cont-wrap">
						<div>
							<!-- 오픈전 임시로 문구 표시 -->
							<div style="height:30px;">※ 기존 연수포탈(https://portal.yeonsu.ac.kr)의 비밀번호로 로그인해 주십시오.</div>
							
							<div id="id_pw" class="login-cont is-active">
								<input type="text" id="memCd" name="username" title="아이디 혹은 학번"
									placeholder="학번(교번) (ID No.)" maxlength="16"> 
									
								<input
									type="password" id="memPass" name="password"
									title="비밀번호" placeholder="비밀번호 (Password)" maxlength="16"
									style="display: block;">

								<div id="info" class="error info">
									로그인 정보 &gt; ID : 교직원 번호, 초기비밀번호 : 생년월일 6자리<br> 
									<font class="info-en">INFO &gt; ID : Employee number, Init PW: BirthDay (6 digit)</font>
									<p class="error1" style="display: block;"></p>
								</div>

								<a href="#none;" id="loginBtn" class="submit" onclick="login()">로그인(Login)</a>

							</div>
							<div id="naver" class="login-cont">
								<input id="loginNaverId" type="text" name="loginId"
									title="아이디 혹은 학번" placeholder="학번(교번) (ID No.)">
								<div id="info" class="error info">
									로그인 정보 &gt; ID : 교직원 번호, 초기비밀번호 : 생년월일 6자리<br> 
									<font class="info-en">INFO &gt; ID : Employee number, Init
										PW: BirthDay (6 digit)</font>
									<p class="error1" style="display: block;"></p>
								</div>
							</div>
						</div>
						<div class="row mt-3 mb-3" id="loginBottom">
							<div class="col-12">
<!-- 								<span id="alertCapsLock"></span> <br> -->
<!-- 								<p> -->
<!-- 									<input type="checkbox" id="rememberId" /> <label> 아이디저장</label>  -->
<!-- 									<a style="float: right;" href="/login/findID" id="findInfo">ID  | 비밀번호 찾기</a> -->
<!-- 								</p> -->

								<p>
									<button type="button" class="btn btn-outline-dark btn-sm btnAlign"
										onclick="stuAutoLogin()">학생 자동로그인</button>
									<button type="button" class="btn btn-outline-dark btn-sm btnAlign"
										onclick="proAutoLogin()">교수 자동로그인</button>
									<button type="button" class="btn btn-outline-dark btn-sm"
										onclick="manAutoLogin()">관리자 자동로그인</button>
								</p>
							</div>
						</div>
						<p>
							이용 후 반드시 로그아웃 해주세요!<br>Please be sure to log out after use.
						</p>
					</div>
				</div>
				<div class="m_box02">
					<ul>
						<li>
							<a href="/login/findID" title="새 창 열림">
								<span>아이디 찾기</span>
							</a>
						</li>
						<li>
							<a href="/login/findID" title="새 창 열림">
								<span>임시비밀번호 발급</span>
							</a>
						</li>
						<li>
							<a href="https://underwood1.yonsei.ac.kr/haksa/HELP/dugrock-01.htm"
								target="_blank" title="새 탭 열림">
								<span>로그인 도움말</span>
							</a>
						</li>
					</ul>
				</div>
			</div>

			<div id="naverIdLogin" style="display: none;">
				<a id="naverIdLogin_loginButton" href="#">
					<img src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.1" height="60">
				</a>
			</div>
			<div id="naverdisplay" style="display: none;">
				<a id="naverIdLogin_loginButton" onclick="NaverLoginex(event);">
					<img src="/sso/user/pm/img/btnW_naver.png" tabindex="0" alt="네이버인증서로그인"
						style="width: 260px; cursor: pointer;">
				</a>
			</div>
			<sec:csrfInput/>
		</form>
		
		<div class="box03">
			<ul>
				<li><a href="/login/findID" title="새 창 열림"><span>아이디
							찾기</span></a></li>
				<li><a href="/login/findID" title="새 창 열림"><span>임시
							비밀번호 발급</span></a></li>
				<li><a
					href="https://underwood1.yonsei.ac.kr/haksa/HELP/dugrock-01.htm"
					target="_blank" title="새 탭 열림"><span>로그인 도움말</span></a></li>
			</ul>
		</div>

		<!-- (2) LoginWithNaverId Javscript SDK -->
		<script
			src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.1.js"></script>
		<!-- (3) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
		<script>
            window.name='opener';
            var naverLogin = new naver.LoginWithNaverId(
                {
                    clientId: "4JwXlRmFN3fGWDQdKLn9",
                    callbackUrl: document.location.protocol + "//" + document.location.host + "/sso/callback.jsp",
                    isPopup: true,
                    loginButton: {color: "green", type: 3, height: 60}
                }
            );
            /* (4) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
            naverLogin.init();

            /* (5) 현재 로그인 상태를 확인 */
            function callBackFunction(event) {
                console.log(event.data);
                console.log(event);
                if(event.origin == 'https://infra.yonsei.ac.kr'){

                    naverLogin.getLoginStatus(function (status) {
                        console.log(status);
                        if (event.data != "") {

                            fSubmitSSONaverCertLoginForm(event.data);
                        }
                    });
                }
            };

            if( window.attachEvent ) {
                window.attachEvent("onmessage", callBackFunction );
            } else if( window.addEventListener ){
                window.addEventListener( "message" , callBackFunction );
            }
        </script>
	</div>
</div>
