<!--  추가/변경시 최종프로젝트 게시판에 공지(필수) -->
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<style>
tr.text-center td:hover{
opacity:0.6;
color:white;
background-color:gray;
transition: opacity 1s, color 1s, background-color 1;
cursor:pointer;
}
</style>
<div class="row">
<div class="alert alert-light" role="alert"
						style="font-size: 0.9em; padding: 1em; border: 1px solid #eee;">
						<p>
							<strong>※ 안내사항</strong> <br>
							<br> (1)<strong>신청유형</strong>에 따라 담당교수의 상담 내역이 필요합니다.<br>
							<br> (2) <strong>승인대기</strong>시에는 수정, 삭제 할 수 있으며&nbsp;&nbsp;<strong>승인 및 반려</strong>처리가 되면 수정, 삭제할 수 없습니다.<br> 
							<br> (3) 하단의 <strong>신청</strong> 버튼을 눌러 신청 할 수 있습니다.<br>
							<br> (4) 신청시에는 <strong>본인확인</strong>이 필요 합니다.
						</p>
					</div>
	</div>
	<div class="row">
	<table class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
		<thead>
			<tr class="text-center">
				<th width="10%">
					<!-- No --> No
				</th>
				<th width="10%">
					<!-- column 1 --> column 1
				</th>
				<th width="10%">
					<!-- column 2 --> column 2
				</th>
				<th width="10%">
					<!-- column 3 --> column 3
				</th>
				<th width="10%">
					<!-- column 4 --> column 4
				</th>
			</tr>
		</thead>
		<tbody >
			<c:forEach var="student" items="${list}" varStatus="status" end="${list.size() }">
				<tr class="text-center">
					<td>${status.end-status.index }</td><!-- No -->
					<td>${student.column1}</td>
					<td>${student.column2}</td>
					<td>${student.column3}</td>
					<td>${student.column4}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="row">
			<div class="col-12 pr-0" style="text-align: end;padding-right:20px;">
			<a class="btn btn-sm btn-outline-primary" href="#" >등록</a>
			<a class="btn btn-sm btn-outline-danger" href="#">삭제</a>
			<a class="btn btn-sm btn-outline-info" href="#">목록</a>
			</div>
</div>