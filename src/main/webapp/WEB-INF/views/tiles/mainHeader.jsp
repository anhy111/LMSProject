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
.profile {
  position: absolute;
  left: 0;
}

@media (min-width: 768px) {
  .profile {
    left: 45%;
  }
}

@media (min-width: 992px) {
  .profile {
    left: 60%;
  }
}

@media (min-width: 1200px) {
  .profile {
    left: 85%;
  }
}
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
	
	.categorybar .navbar-link:hover{
		opacity:0.7;
		color:blue;
		border-bottom : 5px solid orange;
		transition:opacity 2s  color 2s border-bottom 2s;
	}
	
	.mypage:hover, .logout:hover{
		opacity:0.7;
		color:blue;
		transition:opacity 2s  color 2s;
	}
	
	.portlet:hover, .logout:hover{
		opacity:0.7;
		color:blue;
		transition:opacity 2s  color 2s;
	}
</style>
<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light" style="background-color: rgb(0, 31, 63, 1);height:70px;">
	    <ul class="navbar-nav mr-auto">
			<a href="/" class="brand-link bg-navy" style="text-align:left;padding-top: 0px;padding-bottom: 23px;height: 69px;">
				<img src="/upload/연수대로고헤드수정.jpg" alt="AdminLTE Logo" class="brand-image img-circle" style="opacity:1;width: 200px;height: 70px;max-height:70px;">
			</a>
	    <sec:authorize access="hasRole('ROLE_STUDENT')">
	      <li class="nav-item categorybar active" style="margin-left:235px;">
	        <a class="navbar-link" style="color:white;margin-left: 50px;margin-right: 50px;padding-bottom: 15px;" href="/student/lecture/myLecture">사이버캠퍼스</a>
	        <a class="navbar-link" style="color:white;margin-right: 50px;padding-bottom: 15px;"href="/notice/list">공지사항</a>
	        <a class="navbar-link" style="color:white;margin-right: 50px;padding-bottom: 15px;"href="/qna/main">문의게시판</a>
	        <a class="navbar-link" style="color:white;margin-right: 50px;padding-bottom: 15px;" href="/facility/full">시설예약</a>
	      </li>
	     </sec:authorize>
	    <sec:authorize access="hasRole('ROLE_PROFESSOR')">
	      <li class="nav-item categorybar active" style="margin-left:235px;">
	        <a class="navbar-link" style="color:white;margin-left: 50px;margin-right: 50px;padding-bottom: 15px;" href="/lecture/myLecture">사이버캠퍼스</a>
	        <a class="navbar-link" style="color:white;margin-right: 50px;padding-bottom: 15px;"href="/notice/list">공지사항</a>
	        <a class="navbar-link" style="color:white;margin-right: 50px;padding-bottom: 15px;"href="/qna/main">문의게시판</a>
	        <a class="navbar-link" style="color:white;margin-right: 50px;padding-bottom: 15px;" href="/facility/full">시설예약</a>
	      </li>
	     </sec:authorize>
	    <sec:authorize access="hasRole('ROLE_MANAGER')">
	      <li class="nav-item categorybar active" style="margin-left:300px;">
<!-- 	        <a class="navbar-link" style="color:white;margin-left: 50px;margin-right: 50px;padding-bottom: 15px;" href="#">사이버캠퍼스</a> -->
	        <a class="navbar-link" style="color:white;margin-right: 50px;margin-right: 50px;padding-bottom: 15px;"href="/notice/list">공지사항</a>
	        <a class="navbar-link" style="color:white;margin-right: 50px;padding-bottom: 15px;"href="/qna/main">문의게시판</a>
	        <a class="navbar-link" style="color:white;margin-right: 50px;padding-bottom: 15px;" href="/facility/full">시설예약</a>
	      </li>
	     </sec:authorize>
	    </ul>
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
			<!-- Notifications Dropdown Menu -->
			<div class="nav-link" style="color:white;">
				<div class="row">
					<span id="counter" style="padding-right:7px;"></span>
					<div class="text-center" style="width:15px;">
						<span class="fas fa-sync-alt" id="refresh"></span>
					</div>
				</div>
			</div>
			<form style="display: none;" id="logoutFrm" action="/logout" method="post">
				<sec:csrfInput/>
			</form>
			<div style="margin:5px;">
				<a style="background-color:#001F3F;color:white;border:0;padding-bottom: 15px;" class="btn btn-default btn-sm portlet"> 포틀릿 설정 </a> 
				<a style="background-color:#001F3F;color:white;border:0;padding-bottom: 15px;" class="btn btn-default btn-sm mypage">
					<%=department %>&nbsp;&nbsp;|&nbsp;&nbsp;<%=name %>님</a>		
				<div style="padding: 20px;position: absolute;min-width: 250px;max-width: 250px;min-height: 320px;max-height: 320px;display: none;"class="profile card card-primary card-outline">
					<div class="card-body box-profile">
						<div class="text-center">
							<img class="profile-user-img img-fluid img-circle" src="/upload<%=pic%>" alt="User profile picture">
						</div>
						<h3 class="profile-username text-center"style="margin-top:10px;"><%=name %></h3>
						<p class="text-muted text-center"><%=department %></p>
						<ul class="list-group list-group-unbordered mb-3"></ul>
						<a href="/mypage/mypage" class="btn btn-primary btn-block"><b>개인정보수정</b></a>
					</div>
				
				</div>
			</div>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
			<div class="nav-link" style="color:white;">
				<div class="row">
					<span id="counter" style="padding-right:7px;"></span>
					<div class="text-center" style="width:15px;">
						<span class="fas fa-sync-alt" id="refresh"></span>
					</div>
				</div>
			</div>
			<form style="display: none;" id="logoutFrm" action="/logout" method="post">
				<sec:csrfInput/>
			</form>
			<div style="margin:5px;">
				<a style="background-color:#001F3F;color:white;border:0;padding-bottom: 15px;" class="btn btn-default btn-sm portlet"> 포틀릿 설정 </a> 
				<a  style="background-color:#001F3F;color:white;border:0;padding-bottom: 15px;"  class="btn btn-default btn-sm mypage">
					<%=position %>&nbsp;&nbsp;|&nbsp;&nbsp;<%=name %>님</a>
				<div style="padding: 20px;position: absolute;min-width: 250px;max-width: 250px;min-height: 320px;max-height: 320px;display: none;"class="profile card card-primary card-outline">
					<div class="card-body box-profile">
						<div class="text-center">
							<img class="profile-user-img img-fluid img-circle" src="/upload<%=pic%>" alt="User profile picture">
						</div>
						<h3 class="profile-username text-center"style="margin-top:10px;"><%=name %></h3>
						<p class="text-muted text-center"><%=position %></p>
						<ul class="list-group list-group-unbordered mb-3"></ul>
					<a href="/mypage/mypage" class="btn btn-primary btn-block"><b>개인정보수정</b></a>
					</div>
				</div>
					
			</div>
<!-- 			<p class="arrow_box2">마이페이지</p> -->
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_MANAGER')">
			<div class="nav-link" style="color:white;">
				<div class="row">
					<span id="counter" style="padding-right:7px;"></span>
					<div class="text-center" style="width:15px;">
						<span class="fas fa-sync-alt" id="refresh"></span>
					</div>
				</div>
			</div>
			<form style="display: none;" id="logoutFrm" action="/logout" method="post">
				<sec:csrfInput/>
			</form>
			<div style="margin:5px;">
				<a style="background-color:#001F3F;color:white;border:0;padding-bottom: 15px;" class="btn btn-default btn-sm portlet"> 포틀릿 설정 </a> 
				<a  style="background-color:#001F3F;color:white;border:0;padding-bottom: 15px;"  class="btn btn-default btn-sm mypage">
					<%=division %>&nbsp;&nbsp;<%=position %>&nbsp;&nbsp;|&nbsp;&nbsp;<%=name %>님</a>
				<div style="padding: 20px;position: absolute;min-width: 250px;max-width: 250px;min-height: 320px;max-height: 320px;display: none;"class="profile card card-primary card-outline">
					<div class="card-body box-profile">
						<div class="text-center">
							<img class="profile-user-img img-fluid img-circle" src="/upload<%=pic%>" alt="User profile picture">
						</div>
						<h3 class="profile-username text-center"style="margin-top:10px;"><%=name %></h3>
						<p class="text-muted text-center"><%=division %>&nbsp;<%=position %></p>
						<ul class="list-group list-group-unbordered mb-3"></ul>
						<a href="/mypage/mypage" class="btn btn-primary btn-block"><b>개인정보수정</b></a>
					</div>
				
				</div>
					
			</div>
<!-- 			<p class="arrow_box2">마이페이지</p> -->
		</sec:authorize>

	
		<div style="margin:5px;">
			<form action="/logout" method="post">
				<button style="background-color:#001F3F;color:white;border:0;" type="submit" class="btn btn-default btn-sm logout">로그아웃</button>
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
<script type="text/javascript">
let previousX = 0;
let mypage = document.querySelector(".mypage");
let profile = document.querySelector(".profile");
mypage.addEventListener('mouseover', (event) => {
	  const currentX = event.clientX;
	  if (currentX > previousX) {
		  setTimeout(() => $(".profile").hide(), 3000);
	  } 
	  previousX = currentX;
	$(".profile").show();
	});
profile.addEventListener('mouseover', () => {$(".profile").show();});
profile.addEventListener('mouseout', () => {$(".profile").hide();	});

$(function(){
	
	$(".portlet").on("click", function(){
		
		window.open("/main/portlet", "portlet", "width=1500, height=900, left=100, top=50");
		
	});
	
});
</script>
