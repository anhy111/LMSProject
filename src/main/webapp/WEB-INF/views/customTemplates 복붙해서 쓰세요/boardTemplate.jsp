<!--  추가/변경시 최종프로젝트 게시판에 공지(필수) -->
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>



<!--  row : 행, col : 컬럼 -->
<!-- row(padding, margin 다 없어짐. 세로 딱 맞출때 좋음) -->
<!-- 
	p-0 : padding-0					0은 0이지만 p-1과 같이 1의 의미는 픽셀과 다름 감으로 때려맞혀야함
	pt-1 : padding top - 1 
	pl, pr, pb 같은 의미 left, right, bottom
	m-0 : margin-0
	ml, mr, mb있음 패딩과 동일한 의미
	위치 제어 기본은
	<div class="container">
		<div class="row">
			<div class="col-6"></div>
			<div class="col-6"></div>
		</div>
	</div>
	와 같은 구조
-->
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<%
	Date date = new Date();
date.setDate(date.getDate() - 6);
SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy.MM.dd");
String simDate = simpleDate.format(date);
%>
<div class="row">
	<div class="alert alert-light col" role="alert">
		<!-- 게시판 안내사항 -->
		<p>
			<strong>&#8251; 시험 응시자 안내 사항</strong> <br> 시험은 수업 담당 교수님이 직접 출제합니다.<br> 수강생들은 시험 <strong>시작시간</strong>과 <strong>종료시간</strong>을 엄수하여주시길 바랍니다. <br> <br> (1) 시험은 한 문항당 5점씩 채점되며, 제출을 완료하면 자동 채점됩니다. 총점은 백분율로 계산하여 보여집니다.<br> (2) 한 시험당 문항은 최대 10개로 제한되어 있습니다.<br> (3) 풀지 않은 문항이 있을 경우 시험 제출 할 수 없습니다. 응시자는 이를 확인하여 모든 답을 체크할 수 있도록 해야합니다.<br> (4) 시험을 제출 한 후 수정이 불가 하오니 신중히 제출하시기 바랍니다.<br> (5) 응시 한 후 제출한 시험의 답을 확인할 수 있습니다.<br> <br> <br> <i class="emphasisR">&#8251;&#8251; 제출 마감시간이 되면 문제 풀이 유무와 상관 없이 제출되며, 풀지 않은 문항은 자동으로 0점 처리됩니다.</i>
		</p>
	</div>
</div>

<p class="mt-2 ml-4">
	총&nbsp;<span style="color: red;">${fn:length(list) }</span>건의 게시물이 있습니다
</p>
<div class="row">
	<div class="table-responsive-sm col-12">
		<table class="table pt-0 pl-0" style="border-bottom: 1px solid #eef2f7">
			<thead class="table-light">
				<tr style="border-top: 2px solid #112a63">
					<th style="text-align: center;">
						<!-- 순번 -->
						순번
					</th>
					<th style="text-align: center;">
						<!-- column 1 -->
						학번
					</th>
					<th style="text-align: center;">
						<!-- column 2 -->
						학과
					</th>
					<th style="text-align: center;">
						<!-- column 3 -->
						이름
					</th>
					<th style="text-align: center;">
						<!-- column 4 -->
						담당교수
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
</div>

<div class="row">
	<div class="form-group text-right col p-0">
		<a href="#" class="btn btn-primary btn-sm">등록</a>
	</div>
</div>
