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
<script type="text/javascript" defer="defer">

$(function(){
	
	
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
		$('#memPass').val('asdfasdf');
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
<!-- 비밀번호찾기 -->
<script type="text/javascript" defer="defer">
$(function(){
	
	$(document).on("click", "#findId", function(){
		$('#login').hide();
		$('#find').show();
		$('#findForm form').show();
		$('#labelId').show();
		$('#labelPass').hide();
		$('#passForm').hide();
		
	});
	
	$(document).on("click", "#findPass", function(){
		$('#login').hide();
		$('#find').show();
		$('#findForm form').hide();
		$('#labelId').hide();
		$('#labelPass').show();
		$('#passForm').show();
	});
	
	$('#searchId').on('click', function() {
		
		memNm = $('#memNm').val();
		memBir = $('#memBir').val();
		memTel = $('#memTel').val();
		
		console.log("memNm은?? " + memNm + " memBir은?? " + memBir + " memTel은?? " + memTel);
		
		let header = "${_csrf.headerName}";
		let token = "${_csrf.token}";
		
		$.ajax({
			type: 'post',
			url: '/login/searchId',
			data: { 
					memNm : memNm,
					memBir : memBir,
					memTel : memTel
			},
			beforeSend:function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success :function(searchId){
				console.log(searchId);
				//alert("회원님의 아이디는 " + res + "입니다.");
				
				if(searchId == null || searchId == '') {
					$('#alertId').text("일치하는 아이디가 없습니다.");
				}else {
					$('#alertId').text("회원님의 아이디는 " + searchId + "입니다.");
					$('#alertId').css("color", "blue");
				}
			},
			error:function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
	
	
	$('#searchPass').on('click', function() {
		
		let memNo = $("#memNo").val();
		let tel = $('#tel').val();

		let header = "${_csrf.headerName}";
		let token = "${_csrf.token}";
		
		if(memNo == '') {
			alert("아이디를 입력해주세요.");
			return;
		}else if(tel == '') {
			alert("전화번호를 입력해주세요.");
			return;
		}
		
		let data = {"memNo":memNo, "tel":tel};
		
		console.log("data : " + JSON.stringify(data));
		
		$.ajax({
			type: 'post',
			url: '/login/searchPass',
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			beforeSend:function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success :function(res){
				console.log("res : " + JSON.stringify(res));
				alert(res + "\n(으)로 임시비밀번호를 전송하였습니다.");
			},
			error:function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		
	});


	$('#idInfoInsertBtn').on('click',function(){
		$('#memNm').attr('value','이승연');
		$('#memBir').attr('value','990119');
		$('#memTel').attr('value','01055395081');
	})
	
	$('#passInfoInsertBtn').on('click',function(){
		$('#memNo').attr('value','201209001');
		$('#tel').attr('value','01099327362');
	})
	
});
</script>

<div class="login-bg" id="login">
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
					</ul>
				</div>
			</div>

			<sec:csrfInput/>
		</form>
		
		<div class="box03">
			<ul>
				<li>
					<a href="#" id="findId" title="새 창 열림">
						<span>아이디 찾기</span>
					</a>
				</li>
				<li>
					<button id="findPass" title="새 창 열림">
						<span>임시 비밀번호 발급</span>
					</button>
				</li>
			</ul>
		</div>
	</div>
</div>

<!-- 아이디 비밀번호 찾기  -->
<div class="login-bg" id="find" style="display:none;">
	<div class="login-wrap">
		<input type="hidden" id="tap_check" name="tap_check" value="id">

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
						<div class="logo-wrap text-right"></div>
						<label id="labelId">아이디찾기</label>
						<label id="labelPass">임시 비밀번호 발급</label>
					</div>
					<div class="login-cont-wrap">
						<div id="fullScreen">
							<div id="findForm">
<!-- 								<button id="findId">아이디 찾기</button> -->
<!-- 								<button id="findPass">비밀번호 찾기</button> -->
		
								<!-- 아이디 -->
								<div id="id_pw" class="findId-cont is-active">
									<form action="/login/hi" method="post">
										<label style="margin-bottom: 10px;">이름</label> 
										<input type="text" id="memNm" placeholder="이름을 입력하세요." maxlength="16" /> <br>
										
										<label style="margin-bottom: 10px;">생년월일</label> 
										<input type="text" id="memBir" placeholder="생년월일  6자리를 입력하세요." /> <br>
										
										<label style="margin-bottom: 10px;">전화번호</label> 
										<input type="text" id="memTel" placeholder="전화번호를 입력하세요." />
										
										<div class="text-right" style="margin-top:10px;">
											<span style="padding-right:15px" id="alertId"></span>
											<button type="button" class="btn btn-outline-dark" id="searchId">확인</button>
											<button type="button" id="idInfoInsertBtn" class="btn btn-secondary">자동입력</button>
										</div>
										<a href="/login/login" id="goBackToLogin"
											style="text-decoration: none;"> 
											<i class="dripicons-reply" id="goBackToLoginIcon" style="color: #001353;"></i> 
											&nbsp;로그인 페이지로 돌아가기
										</a>
										<sec:csrfInput />
									</form>
								</div>
								
								<!-- 비밀번호 -->
								<div id="id_pw" class="findId-cont is-active">
									<div id="passForm" style="display: none;">
										<label style="margin-bottom: 10px;">아이디</label> 
										<input type="text" id="memNo" placeholder="ID를 입력하세요." /> <br> 
										
										<label style="margin-bottom: 10px;">전화번호</label> 
										<input type="text" id="tel" placeholder="-없이 숫자만 입력하세요." />
										
										<div class="text-right" style="margin-top:10px;">
											<button type="button" class="btn btn-outline-dark" id="searchPass">임시 비밀번호 전송</button>
											<button type="button" id="passInfoInsertBtn" class="btn btn-secondary">자동입력</button>
											<span id="spanForMargin"></span>
										</div>
										<p>
											<a href="/login/login" id="goBackToLogin" style="text-decoration: none;"> 
												<i class="dripicons-reply" id="goBackToLoginIcon" style="color: #001353;"></i> &nbsp;로그인 페이지로 돌아가기
											</a>
										</p>
									</div>
								</div>
								
							</div>
						</div>
					</div>
				</div>
		</div>
		<div class="box03">
			<ul>
				<li>
					<a href="#" id="findId" title="새 창 열림">
						<span>아이디 찾기</span>
					</a>
				</li>
				<li>
					<button id="findPass" title="새 창 열림">
						<span>임시 비밀번호 발급</span>
					</button>
				</li>
			</ul>
		</div>
	</div>
</div>
