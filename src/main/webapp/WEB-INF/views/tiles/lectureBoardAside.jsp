<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4"
       style="background-color: #001F3F;opacity:0.9;">
	<!-- Brand Logo -->
    <a href="/" class="brand-link bg-navy" style="text-align:left;padding-top: 0px;padding-bottom: 23px;height: 69px;box-shadow: 3px 2px 3px -1px var(--light)">
    <img src="/upload/연수대로고헤드수정.jpg" alt="AdminLTE Logo" class="brand-image img-circle" style="opacity:1;width: 200px;height: 70px;max-height:70px;">
<!--         <img src="/upload/연수대로고헤드수정.jpg" alt="AdminLTE Logo" -->
<!--              class="brand-image img-circle elevation-3" style="opacity:1"> -->
<!--         <span class="brand-text font-weight-light">&nbsp;학사관리시스템</span> -->
    </a>

	<!-- Sidebar -->
	<div class="sidebar mt-5">
		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="pt-3 nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
				<!-- 학생 수강관리 ☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★-->
				<sec:authorize access="hasRole('ROLE_STUDENT')">
					<li class="nav-item">
						<a href="/lectureBoard/lecPlan?lecaCd=${param.lecaCd}" class="nav-link">
							강의 계획서
						</a>
					</li>
					<li class="nav-item">
						<a href="/lectureBoard/data/lectureData?lecaCd=${param.lecaCd}" class="nav-link"> 
								강의 자료실
						</a>
					</li>
					<li class="nav-item">
						<a href="/lectureBoard/task/subjectList?lecaCd=${param.lecaCd}" class="nav-link"> 
								과제
						</a>
					</li>
					<li class="nav-item">
						<a href="/lectureBoard/test/studentTest?lecaCd=${param.lecaCd}" class="nav-link"> 
							시험
						</a>
					</li>
					<li class="nav-item">
						<a href="/lectureBoard/attendence/studentAttendence?lecaCd=${param.lecaCd}" class="nav-link"> 
							출결
						</a>
					</li>
					<li class="nav-item">
						<a href="/lectureBoard/score/stuLecScore?lecaCd=${param.lecaCd}" class="nav-link">
							성적
						</a>
					</li>
					<li class="nav-item">
						<a href="/student/lecture/studentList?lecaCd=${param.lecaCd}" class="nav-link">수강생 목록</a>
					</li>
				</sec:authorize>
				<!-- 교수 어사이드 수강관리 ☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★ -->
				<sec:authorize access="hasRole('ROLE_PROFESSOR')">
					<li class="nav-item">
						<a href="/lectureBoard/lecPlan?lecaCd=${param.lecaCd}" class="nav-link">
							강의 계획서
						</a>
					</li>
					<li class="nav-item">
						<a href="/lectureBoard/data/lectureData?lecaCd=${param.lecaCd}" class="nav-link">
							강의 자료실
						</a>
					</li>
					<li class="nav-item">
						<a href="/lectureBoard/task/subjectList?lecaCd=${param.lecaCd}" class="nav-link">
							과제
						</a>
					</li>
					<li class="nav-item">
						<a href="/lectureBoard/test/test?lecaCd=${param.lecaCd}" class="nav-link"> 
							시험
						</a>
					</li>
					<li class="nav-item">
						<a href="/lectureBoard/attendence/attendence?lecaCd=${param.lecaCd}" class="nav-link"> 
							출결
						</a>
					</li>
					<li class="nav-item">
						<a href="/lectureBoard/score/totalScore?lecaCd=${param.lecaCd}" class="nav-link"> 
							성적
						</a>
					</li>
				</sec:authorize>
			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>

<!-- Content Wrapper. Contains page content -->