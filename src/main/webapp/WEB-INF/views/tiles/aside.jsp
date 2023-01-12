<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags" %>
<script src="/resources/adminlte/plugins/jquery/jquery.min.js"></script>
<script src="/resources/adminlte/plugins/jquery-ui/jquery-ui.min.js"></script>
<%
    String no = String.valueOf(session.getAttribute("no"));
%>
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4"
       style="background-color: #001F3F;opacity:1;">

	<sec:authorize access="hasRole('ROLE_STUDENT')">
	    <a href="/" class="brand-link bg-navy" style="text-align:left;padding:0;">
	   	 <img src="/upload/연수대로고헤드수정.jpg" alt="AdminLTE Logo" class="brand-image img-circle" style="opacity:1;width: 200px;height: 70px;max-height:70px;">
	<!--         <img src="/upload/연수대로고헤드수정.jpg" alt="AdminLTE Logo" -->
	<!--              class="brand-image img-circle elevation-3" style="opacity:1"> -->
	<!--         <span class="brand-text font-weight-light">&nbsp;학사관리시스템</span> -->
	    </a>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_PROFESSOR')">
		<a href="/lecture/myLecture" class="brand-link bg-navy" style="text-align:left;padding:0;">
		   	 <img src="/upload/연수대로고헤드수정.jpg" alt="AdminLTE Logo" class="brand-image img-circle" style="opacity:1;width: 200px;height: 70px;max-height:70px;">
	    </a>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_MANAGER')">
		<a href="/aschedule/calendar" class="brand-link bg-navy" style="text-align:left;padding:0;">
		   	 <img src="/upload/연수대로고헤드수정.jpg" alt="AdminLTE Logo" class="brand-image img-circle" style="opacity:1;width: 200px;height: 70px;max-height:70px;">
	    </a>
	</sec:authorize>
	
    <!-- Sidebar -->
    <div class="mt-2 sidebar">
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column nav-child-indent"
                data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                <!-- 수강관리 -->
                <sec:authorize access="hasRole('ROLE_STUDENT')">
                
<!--                     <li class="nav-header">학생 어사이드</li> -->
                    <li class="nav-item menu-is-opening menu-open"><a href="#" class="nav-link">

                        <p>
                            수강관리 <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                        <ul class="nav nav-treeview" >
                            <li class="nav-item ">
                                <a href="/student/lecture/myLecture" class="nav-link">
                                    <p>수강중인 강의</p>
                                </a>
                            </li>
                            <li class="nav-item"><a href="/student/lecture/list"
                                                    class="nav-link">
                                <p>수강 편람</p>
                            </a></li>
                            <li class="nav-item">
                                <a href="/student/lectureApply/spareList" class="nav-link">
                                    <p>예비수강신청</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/student/lectureApply/list" class="nav-link">
                                    <p>수강신청</p>
                                </a></li>
                            <li class="nav-item"><a href="/student/evaluation/list"
                                                    class="nav-link">
                                <p>강의 평가</p>
                            </a></li>
                        </ul>
                    </li>
                    <!-- 학적관리 -->
                    <li class="nav-item"><a href="/record/main?stuNo=<%=no%>" class="nav-link">
                        <p>
                            학적관리
                        </p>
                    </a>
                    </li>
                       <li class="nav-item"><a
                            href="/counsel/studentside/applyList?stuNo=<%=no%>"
                            class="nav-link">
                        <p>상담</p>
                    </a></li>
                    <li class="nav-item"><a href="#" class="nav-link">
                        <p>
                            성적 <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item"><a href="/totalScore/totalScore" class="nav-link">
                                <p>전체 성적 조회</p>
                            </a></li>
                            <li class="nav-item"><a href="/totalScore/currentScore" class="nav-link">
                                <p>현재 성적 조회</p>
                            </a></li>
                            <li class="nav-item"><a href="/totalScore/preAppeal" class="nav-link">
                                <p>성적 이의 신청</p>
                            </a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a href="#" class="nav-link">
                        <p>
                            등록/장학 <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                        <ul class="nav nav-treeview">

                            <li class="nav-item"><a href="/payment/stu/stuPaymentDetail"
                                                    class="nav-link">
                                <p>등록금 납부 내역</p>
                            </a></li>
                            </a></li>
                            <li class="nav-item"><a href="/scholarship/stu/stuScholarship" class="nav-link">
                                <p>장학금 수혜 내역</p>
                            </a></li>
                        </ul>
                    </li>
                   
<!--                     <li class="nav-item"><a -->
<!--                             href="/lectureBoard/test/studentTest?lecaCd=1" class="nav-link"> -->
<!--                         <p>내가 듣는 강의 (임시. 지우지 마시오)</p> -->
<!--                     </a></li> -->
                   </sec:authorize>
                
                <!-- 교수 어사이드 -->
                <sec:authorize access="hasRole('ROLE_PROFESSOR')">
                    <li class="nav-item menu-is-opening menu-open"><a href="#" class="nav-link">
                        <p>
                            강의 <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item"><a href="/professor/lecApply/inquiry" class="nav-link">

                                <p>강의계획서 관리</p>
                            </a></li>
                            <li class="nav-item"><a href="/lecture/myLecture"
                                                    class="nav-link">
                                <p>담당 강의 조회</p>
                            </a></li>
                            <li class="nav-item"><a href="/professor/mineEvaluation"
                                                    class="nav-link">

                                <p>강의 평가 조회</p>
                            </a></li>
                        </ul>
                    </li>
                    <!-- 학적관리 -->
                    <li class="nav-item menu-is-opening menu-open"><a href="#" class="nav-link">
                        <p>
                            학생 관리 <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/professor/stuManageOfPro" class="nav-link">
                                    <p>학생 목록</p>
                                </a>
                            </li>
                            <sec:authorize access="hasRole('ROLE_DEAN')">
                                <li class="nav-item">
                                    <a href="/professor/scholarshipStu" class="nav-link">
                                        <p>장학생 추천 목록</p>
                                    </a>
                                </li>
                            </sec:authorize>
                            <li class="nav-item">
                                <a href="/totalScore/preAppealManage" class="nav-link">
                                    <p>성적 이의 신청 관리</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item"><a
                            href="/counsel/professorside/counselList?proNo=<%=no%>" class="nav-link">
                        <p>상담</p>
                    </a></li>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_MANAGER')">
                    <!-- 학사관리자 어사이드 -->
                    <li class="nav-item"><a href="/approval/main" class="nav-link">
                        <p>
                            결재
                        </p>
                    </a></li>
<!--                     <li class="nav-item"><a href="#" class="nav-link"> -->
<!--                         <p> -->
<!--                             공지사항 관리 -->
<!--                         </p> -->
<!--                     </a></li> -->
                    <li class="nav-item"><a href="/aschedule/calendar" class="nav-link">
                        <p>학사 일정 관리</p>
                    </a></li>
<!--                     <li class="nav-item"><a href="#" class="nav-link"> -->
<!--                         <p>강의</p> -->
<!--                     </a></li> -->
                    <li class="nav-item menu-is-opening menu-open"><a href="#" class="nav-link">

                        <p>
                            등록 및 장학 관리 <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
<!--                         <ul class="nav nav-treeview" style="display: none;"> -->
<!--                         <li class="nav-item"><a href="#" class="nav-link"> -->
<!--                                 <p> -->
<!--                                     장학 <i class="fas fa-angle-left right"></i> -->
<!--                                 </p> -->
<!--                             </a> -->
                                <ul class="nav nav-treeview">
<!--                                     <li class="nav-item"><a -->
<!--                                             href="#" class="nav-link"> -->
<!--                                         <p>장학금 목록</p> -->
<!--                                     </a></li> -->
                                    <li class="nav-item"><a
                                            href="/scholarship/admin/scholarshipAward" class="nav-link">
                                        <p>장학금 수여</p>
                                    </a></li>
<!--                                     <li class="nav-item"><a -->
<!--                                             href="#" class="nav-link"> -->

<!--                                         <p>장학생 조회</p> -->
<!--                                     </a></li> -->
                                </ul>
<!--                             </li> -->
<!--                             <li class="nav-item"><a href="#" class="nav-link"> -->
<!--                                 <p> -->
<!--                                     등록 <i class="fas fa-angle-left right"></i> -->
<!--                                 </p> -->
<!--                             </a> -->
                                <ul class="nav nav-treeview">
<!--                                     <li class="nav-item"><a href="#" -->
<!--                                                             class="nav-link"> -->

<!--                                         <p>등록금 목록</p> -->
<!--                                     </a></li> -->
                                    <li class="nav-item"><a href="/payment/admin/adminBill"
                                                            class="nav-link">

                                        <p>등록금 고지</p>
                                    </a></li>
                                    <li class="nav-item"><a href="/payment/admin/adminPayment"
                                                            class="nav-link">

                                        <p>등록금 납부</p>
                                    </a></li>
                                </ul>
<!--                             </li> -->
<!--                         </ul> -->
                    </li>
                    <li class="nav-item menu-is-opening menu-open"><a href="#" class="nav-link">

                        <p>
                            학생 관리 <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item"><a href="/manage/stuManage"
                                                    class="nav-link">

                                <p>학생 조회</p>
                            </a></li>
                            <li class="nav-item"><a href="/manage/recordManage"
                                                    class="nav-link">

                                <p>학적 관리</p>
                            </a></li>
                        </ul>
                    </li>
                    <li class="nav-item menu-is-opening menu-open"><a href="#" class="nav-link">

                        <p>
                            교직원 관리<i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item"><a href="/manage/empManage?viewPage=1"
                                                    class="nav-link">

                                <p>교직원 목록</p>
                            </a></li>
                            <li class="nav-item"><a href="/manage/insertEmp"
                                                    class="nav-link">

                                <p>교직원 등록</p>
                            </a></li>
                            <li class="nav-item"><a href="/manage/proEvaluation"
                                                    class="nav-link">

                                <p> 평가 조회</p>
                            </a></li>
                        </ul>
                    </li>
                    <li class="nav-item menu-is-opening menu-open"><a href="#" class="nav-link">

                        <p>
                            학과 <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item"><a href="/department/list"
                                                    class="nav-link">

                                <p>학과 조회</p>
                            </a></li>
                            <li class="nav-item"><a href="/department/register"
                                                    class="nav-link">

                                <p>학과 등록</p>
                            </a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a href="/ketIndicators/chart"
                                            class="nav-link">
                        <p>중점 지표</p>
                    </a></li>
                </sec:authorize>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
<script type="text/javascript">

</script>