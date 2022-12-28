<!--  추가/변경시 최종프로젝트 게시판에 공지(필수) -->
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>


<div class="card-body table-responsive pt-0 pl-0" style="height: 300px;">
	<table class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
		<thead>
			<tr class="text-center">
				<th style="text-align: center;">
					<!-- 순번 --> 순번
				</th>
				<th style="text-align: center;">
					<!-- column 1 --> 학번
				</th>
				<th style="text-align: center;">
					<!-- column 2 --> 학과
				</th>
				<th style="text-align: center;">
					<!-- column 3 --> 이름
				</th>
				<th style="text-align: center;">
					<!-- column 4 --> 담당교수
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="student" items="${list}" varStatus="status">
				<tr class="text-center">
					<td>${status.count}</td>
					<td>${student.stuNo}</td>
					<td class="text-left">${student.depNm}</td>
					<td>${student.stuNm}</td>
					<td>${student.empNm}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
