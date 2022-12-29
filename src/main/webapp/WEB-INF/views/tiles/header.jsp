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
.d-block:hover{
opacity:1;
transition:opacity 1s;
}
</style>
<script type="text/javascript">
let tid;
let cnt = parseInt(<%=session.getMaxInactiveInterval()%> -5); //초기값(초단위)

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

$(function(){

	counter_init();
	
	$("#refresh").on("click", function(){
		
		window.location.reload(true);
		
	});

});
</script>
<style>

	.fa-sync-alt:hover{
        font-size: 18px;
        cursor:pointer;
    }
    
    /* 말풍선 적절한 top 과 margin-left 로 위치조정 */
	.arrow_box {
	  display: none;
	  position: absolute;
	  width: 100px;
	  padding: 8px;
	  left: 0;
	  -webkit-border-radius: 8px;
	  -moz-border-radius: 8px;
	  border-radius: 8px;
	  background: #333;
	  color: #fff;
	  font-size: 14px;
	}
	
	.arrow_box:after {
	  position: absolute;
	  bottom: 100%;
	  left: 50%;
	  width: 0;
	  height: 0;
	  margin-left: -10px;
	  border: solid transparent;
	  border-color: rgba(51, 51, 51, 0);
	  border-bottom-color: #333;
	  border-width: 10px;
	  pointer-events: none;
	  content: ' ';
	}
    
    span:hover + p.arrow_box {
	  display: block;
	}
	
	a:hover + p.arrow_box {
	  display: block;
	}
</style>
<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light" style="background-color: #001F3F;opacity:0.9;">

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
						<p class="arrow_box">시간 연장</p>
					</div>
				</div>
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
			<p class="arrow_box">마이페이지</p>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
			<div class="nav-link" style="color:white;">
				<span id="counter"></span>
			</div>
			<form style="display: none;" id="logoutFrm" action="/logout" method="post">
				<sec:csrfInput/>
			</form>
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
			<form style="display: none;" id="logoutFrm" action="/logout" method="post">
				<sec:csrfInput/>
			</form>
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
		<li class="nav-item dropdown"><a class="nav-link" style="color:white;"
			data-toggle="dropdown" href="#"> <i class="far fa-bell"></i> <span
				class="badge badge-warning navbar-badge">15</span>
		</a>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
				<span class="dropdown-item dropdown-header">15 Notifications</span>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <i
					class="fas fa-envelope mr-2"></i> 4 new messages <span
					class="float-right text-muted text-sm">3 mins</span>
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <i class="fas fa-users mr-2"></i>
					8 friend requests <span class="float-right text-muted text-sm">12
						hours</span>
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <i class="fas fa-file mr-2"></i>
					3 new reports <span class="float-right text-muted text-sm">2
						days</span>
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item dropdown-footer">See All
					Notifications</a>
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
