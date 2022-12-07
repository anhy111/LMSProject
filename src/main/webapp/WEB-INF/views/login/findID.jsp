<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="/resources/css/findID.css"/>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" defer="defer">
$(function(){
	
	//배경화면
	var roll = 0;
	
	setTimeout(function images(){
		
		roll ++;
		
		if(roll == 10){
			roll = 0;
		}
		
		setTimeout(function() {}, 1000);
		
		$("#roll").fadeTo(1000, 0.6, function(){
			$("#roll").attr("src", "/resources/upload/login/login_" + (roll+1)+ ".jpg");
// 			$("#roll").fadeTo(1000, 0.6);
		});
		
		$("#roll").fadeTo(1000, 1);
		
		setTimeout(images, 3000);
	}, 3000);
	
	$('#findId').on('click',function(){
		$('#passForm').hide();
		$('#findForm form').show();
		$('#findId')
		.css('background','white')
		.css('color','#001353')
		.css('opacity','70%')
		.css('padding', '10px')
		.css('border','3px solid white');
		
		$('#findPass')
		.css('background','#001353')
		.css('color','white')
		.css('opacity', '70%')
		.css('padding', '10px')
		.css('border', '3px solid #001353');
		
	});
	
	$('#findPass').on('click',function(){
		$('#findForm form').hide();
		$('#passForm').show();
		$('#findPass')
		.css('background','white')
		.css('color','#001353')
		.css('opacity','70%')
		.css('padding', '10px')
		.css('border','3px solid white');
		
		$('#findId')
		.css('background','#001353')
		.css('color','white')
		.css('opacity', '70%')
		.css('padding', '10px')
		.css('border', '3px solid #001353');
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
		let tel1 = $('#tel1').val();
		let tel2 = $('#tel2').val();

		let header = "${_csrf.headerName}";
		let token = "${_csrf.token}";
		
		if(memNo == '') {
			alert("아이디를 입력해주세요.");
			return;
		}else if(tel1 == '' || tel2 == '') {
			alert("전화번호를 입력해주세요.");
			return;
		}
		
		tel = tel + "-" + tel1 + "-" + tel2;
		
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
			error: function(req, text) {
				 alert(text + ': ' + req.status);
		 	}
		});
		
	});


	$('#idInfoInsertBtn').on('click',function(){
		$('#memNm').attr('value','이승연');
		$('#memBir').attr('value','990119');
		$('#memTel').attr('value','01055395081');
	})
	
	$('#passInfoInsertBtn').on('click',function(){
		$('#memCd').attr('value','21715032');
		$('#tel').attr('value','010');
		$('#tel1').attr('value','5539');
		$('#tel2').attr('value','5081');
	})
	
});
</script>

<div class="imgSlide">
	<ul class="slides">
		<li><img src="/resources/upload/login/login_1.jpg" id="roll" style="filter: brightness(0.5);"/></li>
	</ul>
</div>

<div id="fullScreen">
	
	<div id="findForm">
		<button id="findId">아이디 찾기</button>
		<button id="findPass">비밀번호 찾기</button>
		
		<form action="/login/hi" method="post">
			<label>이름</label>
			<input type="text" id="memNm" placeholder="이름을 입력하세요."/>
			<br>
			<label>생년월일</label>
			<input type="text" id="memBir" placeholder="생년월일  6자리를 입력하세요."/>
			<br>
			<label>전화번호</label>
			<input type="text" id="memTel" placeholder="전화번호를 입력하세요."/>
			<button type="button" class="btn btn-outline-dark" id="searchId">확인</button>
			<button type="button" id="idInfoInsertBtn" class="btn btn-secondary" style="position:absolute; top:500px;right:310px;">자동입력</button>
			<span id="alertId"></span>
			<p>
				<a href="/login/login" id="goBackToLogin" style="text-decoration: none;">
					<i class="dripicons-reply" id="goBackToLoginIcon" style="color : #001353;"></i>
					&nbsp;로그인 페이지로 돌아가기
				</a>
			</p>
			<sec:csrfInput/>
		</form>
		
		
		<div id="passForm" style="display:none;">
			<label>ID</label><input type="text" id="memNo" placeholder="ID를 입력하세요."/>
			
			<br>
			
			<label>전화번호</label>
			<select id="tel">
				<option selected>010</option>
				<option>011</option>
				<option>016</option>
				<option>017</option>
				<option>018</option>
				<option>019</option>
			</select>
			-<input type="text" id="tel1"/>
			-<input type="text" id="tel2"/>
			
			<br>
			
			<button type="button" class="btn btn-outline-dark" id="searchPass">임시 비밀번호 전송</button>
			<button type="button" id="passInfoInsertBtn" class="btn btn-secondary" style="position:absolute; top:500px;right:310px;">자동입력</button>
			<span id="spanForMargin"></span>
			<p>
				<a href="/login/loginForm" id="goBackToLogin" style="text-decoration: none;">
					<i class="dripicons-reply" id="goBackToLoginIcon" style="color : #001353;"></i>
					&nbsp;로그인 페이지로 돌아가기
				</a>
			</p>
		</div>
	</div>
</div>