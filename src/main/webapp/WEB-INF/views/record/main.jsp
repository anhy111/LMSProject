<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	int stuNo = (int) session.getAttribute("no");
%>
<div class="container">
<div class="col-6">
<a class="btn btn-sm btn-primary" href="/record/apply?stuNo=<%= stuNo%>">신청하기</a>
</div>
	<div class="row">
		<div class="card">
			<div class="card-header">
				<h3 class="card-title">
					<b>학적 변동 리스트</b>
				</h3>
			</div>
			<div class="card-body table-responsive col-11 p-0"
				style="height: 300px;">
				<table
					class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
						<thead>
						<tr class="text-center">
							<th width="4%">글번호</th>
							<th width="18%">학적구분코드</th>
							<th width="12%">신청연도</th>
							<th width="12%">신청학기</th>
							<th width="6%">기간</th>
							<th width="4%">신청날짜</th>
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
								<td>${recordsList.recPer}</td>
								<td><fmt:formatDate value="${recordsList.recDt }"
										pattern="yyyy년 MM월 dd일" /></td>
								<td>${recordsList.recYn }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>