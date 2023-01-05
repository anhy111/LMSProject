<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%
	//스크립틀릿
	//장바구니 = 세션
	//장바구니 고유번호 = session.getId();
	String name = String.valueOf(session.getAttribute("name"));
	String position = String.valueOf(session.getAttribute("position"));
	String division = String.valueOf(session.getAttribute("division"));
	String department = String.valueOf(session.getAttribute("department"));
	String no = String.valueOf(session.getAttribute("no"));
	String pic = String.valueOf(session.getAttribute("pic"));
%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
let logoutTid;
let logoutTime = parseInt(<%=session.getMaxInactiveInterval()%> -5); //초기값(초단위)


function counter_init(){
	logoutTid =setInterval("counter_run()", 990);
}

function counter_run(){
	document.all.counter.innerText = time_format(logoutTime);
	logoutTime--;
	
	if(logoutTime < 0){
		alert("세션이 종료되어 로그아웃 됩니다.")
		clearInterval(logoutTid);
		$("#logoutFrm").submit();
	}
}

function time_format(s) {
	var nHour=0;
	var nMin=0;
	var nSec=0;
	if(s>0) {
		nMin = parseInt(s/60);
		nSec = s%60;

		if(nMin>60) {
			nHour = parseInt(nMin/60);
			nMin = nMin%60;
		}
	} 
	if(nSec<10) nSec = "0"+nSec;
	if(nMin<10) nMin = "0"+nMin;

	return nMin+":"+nSec;
}

// function onMessage(evt){
//     var data = evt.data;
//     // toast
//     let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
//     toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
//     toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
//     toast += "<span aria-hidden='true'>&times;</span></button>";
//     toast += "</div> <div class='toast-body'>" + data + "</div></div>";
//     $("#msgStack").append(toast);   // msgStack div에 생성한 toast 추가
//     $(".toast").toast({"animation": true, "autohide": false});
//     $('.toast').toast('show');
// };	

	
$(function(){
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";
	
	counter_init();

	$("#refresh").on("click", function(){
		
		$.ajax({
			type: 'get',
			url: '/sessionPlus',
			beforeSend:function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success :function(data){
				console.log("성공이라해주라 ", data);
				
				logoutTime = 1800; 
				
			},
			error:function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
		
		
	});
});
</script>
<style>

	.fa-sync-alt:hover{
        font-size: 18px;
        cursor:pointer;
    }
    
    /* 말풍선 적절한 top 과 margin-left 로 위치조정 */
	.arrow_box1 {
		display: none;
		position: absolute;
		padding: 8px;
		left: 0;
		bottom: -65px;
		border-radius: 8px;
		background: #dcdcdc;
		color: #fff;
		font-size: 14px;
		opacity:0.9;
	}
	
	.arrow_box1:after {
	  position: absolute;
	  bottom: 100%;
	  left: 50%;
	  width: 0;
	  height: 0;
	  margin-left: -10px;
	  border: solid transparent;
	  border-color: rgba(51, 51, 51, 0);
	  border-bottom-color: #dcdcdc;
	  border-width: 10px;
	  pointer-events: none;
	  content: ' ';
	  opacity:0.9;
	}
	.arrow_box2 {
	  display: none;
	  position: absolute;
	  padding: 8px;
	  right: 175px;
	  bottom: -50px;
	  border-radius: 8px;
	  background: #dcdcdc;
	  color: #fff;
	  font-size: 14px;
	  opacity:0.9;
	}
	
	.arrow_box2:after {
	  position: absolute;
	  bottom: 100%;
	  left: 50%;
	  width: 0;
	  height: 0;
	  margin-left: -10px;
	  border: solid transparent;
	  border-color: rgba(51, 51, 51, 0);
	  border-bottom-color: #dcdcdc;
	  border-width: 10px;
	  pointer-events: none;
	  content: ' ';
	  opacity:0.9;
	}
    
    span:hover + p.arrow_box1 {
	  display: block;
	}
	
	a:hover + p.arrow_box2 {
	  display: block;
	}
</style>
<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light" style="background-color: rgb(0, 31, 63, 0.9);">

	<!-- Right navbar links -->
	<ul class="navbar-nav ml-auto">
		<!-- 로그인 하지 않은 경우 -->
		<sec:authorize access="isAnonymous()">
		<div class="user-panel d-flex">
			<div class="image">
				<img src="/resources/adminlte/dist/img/문상훈17.jpg"
					class="img-circle elevation-2" alt="User Image">
			</div>
			<div class="info">
				<a href="#" class="d-block"> 비회원</a>
			</div>
		</div>
		</sec:authorize>
		<!-- 인증된 사용자인 경우 -->
		<sec:authorize access="hasRole('ROLE_STUDENT')">
			<div class="nav-link" style="color:white;">
				<div class="row">
					<span id="counter" style="padding-right:7px;"></span>
					<div class="text-center" style="width:15px;">
						<span class="fas fa-sync-alt" id="refresh"></span>
						<p class="arrow_box1">시간 연장</p>
					</div>
				</div>
			</div>
			<form style="display: none;" id="logoutFrm" action="/logout" method="post">
				<sec:csrfInput/>
			</form>
			<a href="/mypage/mypage" class="d-block">
				<div class="user-panel d-flex">
					<div class="image">
						<img src="/upload<%=pic%>"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info" style="color:white;">
						<%=name %> &nbsp;&nbsp; | &nbsp;&nbsp;<%=department %> 
					</div>
				</div>
			</a>
			<p class="arrow_box2">마이페이지</p>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
			<div class="nav-link" style="color:white;">
				<div class="row">
					<span id="counter" style="padding-right:7px;"></span>
					<div class="text-center" style="width:15px;">
						<span class="fas fa-sync-alt" id="refresh"></span>
						<p class="arrow_box1">시간 연장</p>
					</div>
				</div>
			</div>
			<form style="display: none;" id="logoutFrm" action="/logout" method="post">
				<sec:csrfInput/>
			</form>
			<a href="/mypage/mypage" class="d-block">
				<div class="user-panel d-flex">
					<div class="image">
						<img src="/upload<%=pic%>"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info" style="color:white;">
						<%=name %> 교수 &nbsp;&nbsp; | &nbsp;&nbsp;<%=position %> 
					</div>
				</div>
			</a>
			<p class="arrow_box2">마이페이지</p>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_MANAGER')">
			<div class="nav-link" style="color:white;">
				<div class="row">
					<span id="counter" style="padding-right:7px;"></span>
					<div class="text-center" style="width:15px;">
						<span class="fas fa-sync-alt" id="refresh"></span>
						<p class="arrow_box1">시간 연장</p>
					</div>
				</div>
			</div>
			<form style="display: none;" id="logoutFrm" action="/logout" method="post">
				<sec:csrfInput/>
			</form>
			<a href="/mypage/mypage" class="d-block">
				<div class="user-panel d-flex">
					<div class="image">
						<img src="/upload<%=pic%>"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info" style="color:white;">
						 <%=name %> &nbsp;&nbsp; | &nbsp;&nbsp;<%=division %>&nbsp;&nbsp; | &nbsp;&nbsp;<%=position %>  
					</div>
				</div>
			</a>
			<p class="arrow_box2">마이페이지</p>
		</sec:authorize>

		<!-- Notifications Dropdown Menu -->
		<li class="nav-item dropdown">
			<a class="nav-link" style="color: white;" data-toggle="dropdown" href="#"> 
				<i class="far fa-bell"></i> 
				<span id="notificationBadge" class="badge badge-warning navbar-badge">0</span>
			</a>
			<div class="dropdown-menu dropdown-menu-xl">
				<span class="dropdown-item dropdown-header">알림내역</span>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> 
					<i class="fas fa-book fa-lg"></i>
						경제학개론 - 과제게시판
					<span class="float-right text-muted text-sm">
						12 시간전
					</span><br>
					<span class="text-muted text-sm">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;새 글이 등록되었습니다.
					</span>
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <i class="fas fa-school mr-1"></i> 개강<span class="float-right text-muted text-sm">12 시간전</span>
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <i class="fas fa-won-sign mr-1"></i> 등록금 납부<span class="float-right text-muted text-sm">2 일전</span>
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item dropdown-footer btn btn-outline-secondary">펼쳐보기</a>
			</div>
		</li>
		<div style="margin:5px;">
			<form action="/logout" method="post">
				<button type="submit" class="btn btn-light btn-sm"><b>로그아웃</b></button>
				<sec:csrfInput />
			</form>
		</div>
<!-- 		<li class="nav-item"> -->
<!-- 			<a class="nav-link" style="color:white;" data-widget="fullscreen"href="#" role="button">  -->
<!-- 				<i class="fas fa-expand-arrows-alt"></i> -->
<!-- 			</a> -->
<!-- 		</li> -->
<!-- 		<li class="nav-item"> -->
<!-- 			<a class="nav-link" style="color:white;" data-widget="control-sidebar" data-controlsidebar-slide="true" href="#" role="button">  -->
<!-- 				<i class="fas fa-th-large"></i> -->
<!-- 			</a> -->
<!-- 		</li> -->
	</ul>
</nav>
<!-- /.navbar -->

