<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<% String no = String.valueOf(session.getAttribute("no")); %>
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-light-primary elevation-4">
	<!-- Brand Logo -->
	<a href="/test/home" class="brand-link"> <img
		src="/resources/upload/연수대icon.png" alt="AdminLTE Logo"
		class="brand-image img-circle elevation-3" style="opacity: .8">
		<span class="brand-text font-weight-light">연수대학교</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->

		<!-- SidebarSearch Form -->
		<div class="form-inline">
			<div class="input-group" data-widget="sidebar-search">
				<input class="form-control form-control-sidebar" type="search"
					placeholder="Search" aria-label="Search">
				<div class="input-group-append">
					<button class="btn btn-sidebar">
						<i class="fas fa-search fa-fw"></i>
					</button>
				</div>
			</div>
		</div>

		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
				<!-- 수강관리 -->
				<sec:authorize access="hasRole('ROLE_STUDENT')">
					<li class="nav-header">학생 어사이드</li>
					<li class="nav-item">
						<a href="#" class="nav-link"> 
							<i class="nav-icon fas fa-book"></i>
							<p>
								마이페이지 <i class="right fas fa-angle-left"></i>
							</p>
						</a>
						<ul class="nav nav-treeview">
							<li class="nav-item">
								<a href="/mypage/mypage?memNo=<%=no%>" class="nav-link"> 
									<i class="far fa-circle nav-icon"></i>
									<p>내 정보 확인</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="/mypage/changeStuPw" class="nav-link"> 
									<i class="far fa-circle nav-icon"></i>
									<p>비밀번호 변경</p>
								</a>
							</li>
						</ul>
					</li>
					<li class="nav-item">
						<a href="#" class="nav-link"> 
							<i class="nav-icon fas fa-book"></i>
							<p>
								수강관리 <i class="right fas fa-angle-left"></i>
							</p>
						</a>
						<ul class="nav nav-treeview">
							<li class="nav-item">
								<a href="/student/lectureApply/list" class="nav-link"> 
									<i class="far fa-circle nav-icon"></i>
									<p>수강신청</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link"> 
									<i class="far fa-circle nav-icon"></i>
									<p>수강 편람</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link"> 
									<i class="far fa-circle nav-icon"></i>
									<p>수강평가</p>
								</a>
							</li>
						</ul>
					</li>
					<!-- 학적관리 -->
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-copy"></i>
							<p>
								학적관리 <i class="right fas fa-angle-left"></i>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>휴학 신청</p>
							</a></li>
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>복학 신청</p>
							</a></li>
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>자퇴 신청</p>
							</a></li>
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>졸업</p>
							</a></li>
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>학적 변동 현황</p>
							</a></li>
						</ul></li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-chart-pie"></i>
							<p>
								성적 <i class="right fas fa-angle-left"></i>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>전체 성적 조회</p>
							</a></li>
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>전체 학기 성적 조회</p>
							</a></li>
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>성적 이의 신청</p>
							</a></li>
						</ul></li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-edit"></i>
							<p>
								등록/장학 <i class="right fas fa-angle-left"></i>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>등록금 납부 내역</p>
							</a></li>
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>등록금 고지서</p>
							</a></li>
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>장학 내역 조회</p>
							</a></li>
						</ul></li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon far fa-envelope"></i>
							<p>상담</p>
					</a></li>
				</sec:authorize>
				<!-- 교수 어사이드 -->
				<sec:authorize access="hasRole('ROLE_PROFESSOR')">
					<li class="nav-header">교수 어사이드</li>
					<li class="nav-item">
					<a href="#" class="nav-link"> 
						<i class="nav-icon fas fa-book"></i>
						<p>
							강의 <i class="right fas fa-angle-left"></i>
						</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a href="/lecture/list" class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>전체 강의 조회</p>
							</a></li>
							<li class="nav-item"><a href="/professor/lecApply/inquiry" class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>강의계획서 조회</p>
							</a></li>
							<li class="nav-item"><a href="/professor/lecApply/request" class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>강의계획서 신청</p>
							</a></li>
							<li class="nav-item"><a href="/lecture/myLecture" class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>담당 강의 조회</p>
							</a></li>
						</ul></li>
					<!-- 학적관리 -->
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-copy"></i>
							<p>
								평가 <i class="right fas fa-angle-left"></i>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>수업 평가 조회</p>
							</a></li>
						</ul></li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-chart-pie"></i>
							<p>공지사항</p>
					</a></li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-edit"></i>
							<p>결재</p>
					</a></li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-book"></i>
							<p>
								학생 관리 <i class="right fas fa-angle-left"></i>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item">
								<a href="#" class="nav-link"> 
									<i class="far fa-circle nav-icon"></i>
										<p>학생 목록</p>
								</a>
							</li>
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>장학생 추천</p>
							</a></li>
						</ul></li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-book"></i>
							<p>상담</p>
					</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_MANAGER')">
					<!-- 학사관리자 어사이드 -->
					<li class="nav-header">관리자 어사이드</li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-book"></i>
							<p>
								결재 <i class="right fas fa-angle-left"></i>
							</p>
					</a></li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-copy"></i>
							<p>
								공지사항 관리 <i class="right fas fa-angle-left"></i>
							</p>
					</a></li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-chart-pie"></i>
							<p>학사일정 관리</p>
					</a></li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-edit"></i>
							<p>강의</p>
					</a></li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-book"></i>
							<p>등록/장학</p>
					</a></li>
					<li class="nav-item">
						<a href="#" class="nav-link"> 
							<i class="nav-icon fas fa-book"></i>
							<p>
								학생관리 <i class="right fas fa-angle-left"></i>
							</p>
						</a>
						<ul class="nav nav-treeview">
							<li class="nav-item">
								<a href="/manage/stuManage" class="nav-link"> 
									<i class="far fa-circle nav-icon"></i>
									<p>학생 목록 조회</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="/manage/insertStu" class="nav-link"> 
									<i class="far fa-circle nav-icon"></i>
									<p>학생 등록</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="/manage/recordManage" class="nav-link"> 
									<i class="far fa-circle nav-icon"></i>
									<p>휴복학 관리</p>
								</a>
							</li>
						</ul>
					</li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-book"></i>
							<p>교수 관리</p>
					</a></li>
					<li class="nav-item">
						<a href="#" class="nav-link"> 
							<i class="nav-icon fas fa-book"></i>
							<p>
								학과 <i class="right fas fa-angle-left"></i>
							</p>
						</a>
						<ul class="nav nav-treeview">
							<li class="nav-item">
								<a href="/manage/stuManage" class="nav-link"> 
									<i class="far fa-circle nav-icon"></i>
									<p>학과 조회</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="/manage/insertStu" class="nav-link"> 
									<i class="far fa-circle nav-icon"></i>
									<p>학과 등록</p>
								</a>
							</li>
						</ul>
					</li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-book"></i>
							<p>중점 지표</p>
					</a></li>
				</sec:authorize>
			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>

<!-- Content Wrapper. Contains page content -->