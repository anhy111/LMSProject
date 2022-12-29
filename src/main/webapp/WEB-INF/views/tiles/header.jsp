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
<style>
.info,.nav-link{
color:white;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
let tid;
let cnt = parseInt(<%=session.getMaxInactiveInterval()%> -5); //초기값(초단위)
// var socket = null;

function counter_init(){
	tid =setInterval("counter_run()", 990);
}

function counter_run(){
	document.all.counter.innerText = time_format(cnt);
	cnt--;
	
	if(cnt < 5){
		$("#session").css("display", "block");
	}
	
	if(cnt < 0){
		clearInterval(tid);
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

	counter_init();
// 	socket = new SockJS("<c:url value="/echo-ws"/>");
//     // 데이터를 전달 받았을때 
//     socket.onmessage = onMessage; // toast 생성)

});
</script>
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
				<span id="counter"></span>
			</div>
			<form style="display: none;" id="logoutFrm" action="/logout" method="post">
			<sec:csrfInput/>
			</form>
			<a href="/mypage/mypage?memNo=<%=no%>" class="d-block">
				<div class="user-panel d-flex">
					<div class="image">
						<img src="/upload<%=pic%>"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<%=name %> &nbsp;&nbsp; | &nbsp;&nbsp;<%=department %> 
					</div>
				</div>
			</a>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
			<div class="nav-link" style="color:white;">
				<span id="counter"></span>
			</div>
			<a href="#" class="d-block"> 
				<div class="user-panel d-flex">
					<div class="image">
						<img src="/upload<%=pic%>"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<%=name %> 교수 &nbsp;&nbsp; | &nbsp;&nbsp;<%=position %> 
					</div>
				</div>
			</a>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_MANAGER')">
			<div class="nav-link" style="color:white;">
				<span id="counter"></span>
			</div>
			<a href="#" class="d-block">
				<div class="user-panel d-flex">
					<div class="image">
						<img src="/upload<%=pic%>"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						 <%=name %> &nbsp;&nbsp; | &nbsp;&nbsp;<%=division %>&nbsp;&nbsp; | &nbsp;&nbsp;<%=position %>  
					</div>
				</div>
			</a>
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

<!-- 세션 타임아웃 모달 -->
<div class="modal fade" id="session" style="display: none;"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">로그인 시간 연장</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<p>One fine body…</p>
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>

	</div>

</div>
