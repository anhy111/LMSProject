<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!-- <link rel="stylesheet" href="/resources/css/findID.css"/> -->
<link rel="stylesheet" href="/resources/login/css/default.css">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" defer="defer">
$(function(){
	
	$('#findId').on('click',function(){
		$('#passForm').hide();
		$('#findForm form').show();
		
	});
	
	$('#findPass').on('click',function(){
		$('#findForm form').hide();
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
// 					$('#alertId').css("color", "red");
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

<div class="login-bg">
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
				<li>
					<a href="#" target="_blank" title="새 탭 열림">
						<span>로그인 도움말</span>
					</a>
				</li>
			</ul>
		</div>
	</div>
</div>