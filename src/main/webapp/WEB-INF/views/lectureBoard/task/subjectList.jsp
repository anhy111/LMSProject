<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#subInfo {
	background-color: ivory;
	border: 1px solid black;
	border-radius: 10px;
}
.odd{
	background-color: #eee;
}
</style>
<title></title>
</head>
<body>
	<h3>
		<strong id="lectureListYear"> <c:if test="${lecture != null}">
						${lecture.lecApply.lecaNm} 
					</c:if> 과제
		</strong>
	</h3>
	<div class="card-tools">
		<button type="button" class="btn btn-tool" data-card-widget="collapse">
		</button>
	</div>
	<div class="col-sm-12 alert alert-light bg-light border-0" role="alert"
		style="font-size: 0.9em; padding: 15px 30px 15px; 20 px; border: 1px solid #eee;"
		id="subInfo">
		<br>
		<h4>
			<b>※과제 안내 사항</b>
		</h4>
		<p>
			1. 반드시 <strong>기간을 먼저 설정</strong>한 후, 과제를 등록하는 것을 권장합니다.
		</p>
		<p>
			2. 총점 부여는 <strong>5점에서 20점까지 등록 가능</strong>합니다.
		</p>
		<p>
			3. 제출현황의 <b>보기버튼</b>을 클릭하여 과제별 학생 제출 목록을 통해 제출여부를 확인할 수 있습니다.
		</p>
	</div>
	<br>
	<div class="col-sm-12">
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
			<div class="row">
				<div class="col-sm-11"></div>
				<a href="/lectureBoard/task/registTask?lecaCd=${param.lecaCd}"
					class="col-sm-1 btn btn-block btn-outline-secondary btn-sm"
					style="float: right">등록</a>
			</div>
		</sec:authorize>
		<table class="table table-bordered table-hover dataTable dtr-inline">
			<thead>
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>과제 시작일</th>
					<th>과제 마감일</th>
					<th>제출목록</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${task.taskNm !=null}">
					<c:forEach var="row" items="${taskList}" varStatus="stat">
					<c:if test="${stat.count%2 != 0 }">
						<tr class="odd">
					</c:if>
					<c:if test="${stat.count%2 == 0 }">
						<tr class="even">
					</c:if>
							<td class="dtr-control sorting_1" tabindex="0">${stat.count}</td>
							<td><a
								href="/lectureBoard/task/taskDetail?lecaCd=${param.lecaCd}&&taskCd=${row.taskCd}">${row.taskNm}</a></td>
							<td><fmt:formatDate value="${row.taskSdt}"
									pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatDate value="${row.taskEdt}"
									pattern="yyyy-MM-dd" /></td>

							<td><a
								href="/lectureBoard/task/taskSubmitList?taskCd=${row.taskCd}&&lecaCd=${row.lecaCd}"
								class="btn btn-block btn-outline-secondary btn-sm">보기</a></td>

						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>





	</div>
</body>
</html>