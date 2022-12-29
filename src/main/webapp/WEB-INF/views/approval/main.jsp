<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="row">
	<table class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
		<thead>
			<tr>
				<th>No</th>
				<th>기안자</th>
				<th>구분</th>
				<th>승인 여부</th>
				<th>기안일자</th>
				<th>승인 일자</th>
				<th>결재자</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="approval" items="${approvalList}" varStatus="stat">
				<tr>
					<td>${approval.apprCd}</td>
					<!-- 클릭시 결재요청한 서류를 모달창으로 출력 -->
					<td>${approval.proNo}</td>
					<td>${approval.apprCate}</td>
					<td>${approval.apprYn}</td>
					<td>
						<fmt:formatDate value="${approval.apprSdt}" pattern="YYYY/MM/DD" />
					</td>
					<td>
						<fmt:formatDate value="${approval.apprDt}" pattern="YYYY/MM/DD" />
					</td>
					<td>${approval.empNo}</td>
					<td><button>결제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
