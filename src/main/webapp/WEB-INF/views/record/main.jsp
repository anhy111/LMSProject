<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	int stuNo = (int) session.getAttribute("no");
%>
<link rel="stylesheet" type="text/css" href="/resources/css/dataTableTemplate.css">

<div class="container">
<div class="col-6">
<a class="btn btn-md btn-primary" href="/record/apply?stuNo=<%= stuNo%>">신청하기</a>
</div>
	<div class="row">
		<div class="card">
			<div class="card-header">
				<h3 class="card-title">
					<b>학적 변동 리스트</b>
				</h3>
			</div>
			<div class="card-body table-responsive col-11 p-0"
				style="height: 300px;width:1600px;">
				<table
					class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
						<thead>
						<tr class="text-center">
							<th width="4%">순번</th>
							<th width="12%">카테고리</th>
							<th width="4%">신청연도</th>
							<th width="12%">신청학기</th>
							<th width="12%">기간</th>
							<th width="12%">신청날짜</th>
							<th width="4%">승인여부</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="recordsList" items="${recordsList}">
							<tr>
								<td>${recordsList.recCd}</td>
								<td>${recordsList.rgbCd}</td>
								<td>${recordsList.recYr}</td>
								<td>${recordsList.recSem}</td>
								<td>${recordsList.recPer}개월</td>
								<td><fmt:formatDate value="${recordsList.recDt }" pattern="yyyy년 MM월 dd일" /></td>
								<td>
								<c:if test="${recordsList.recYn eq '반려'}">
								<span style="color:red;">${recordsList.recYn }</span>
								</c:if>
								<c:if test="${recordsList.recYn eq '승인대기'}">
								<span style="color:black;">${recordsList.recYn }</span>
								</c:if>
								<c:if test="${recordsList.recYn eq '승인'}">
								<span style="color:blue;">${recordsList.recYn }</span>
								</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>