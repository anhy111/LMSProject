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

#subInfo{
background-color: ivory;
border: 1px solid black;
border-radius: 10px;
}
</style>
<title></title>
</head>
<body>
	<div class="col">
		<div class="card card-outline card-primary">
			<div class="card-header">
				<h1 class="card-title">
					<strong id="lectureListYear">${lecture.lecApply.lecaNm} 과제</strong>
				</h1>
				<div class="card-tools">
					<button type="button" class="btn btn-tool"
						data-card-widget="collapse">
						<i class="fas fa-minus"></i>
					</button>
				</div>
			</div>
			<div class="card-body">
				<sec:authorize access="hasRole('ROLE_PROFESSOR')">
					<div class="col-sm-12" id="subInfo">
					<br>
						<h4><b>※과제 안내 사항</b></h4>
						<p>1. 반드시 <strong>기간을 먼저 설정</strong>한 후, 과제를 등록하는 것을 권장합니다.</p>
						<p>2. 총점 부여는 <strong>5점에서 20점까지 등록 가능</strong>합니다.</p>
						<p>3. 제출현황의 <b>보기버튼</b>을 클릭하여 과제별 학생 제출 목록을 통해 제출여부를 확인할 수 있습니다.</p>
					</div>
				</sec:authorize>
				
				<sec:authorize access="hasRole('ROLE_STUDENT')">
					<div class="col-sm-12" id="subInfo">
					<br>
						<h4><b>※과제 안내 사항</b></h4>
						<p>1. 과제에 대한 <strong>제출 마감 기간</strong>을 잘 확인하여 불이익이 없도록 합니다.</p>
						<p>2. 담당교수 채점 후 과제에 대한 점수를 확인할 수 있습니다.</p>
					</div>
				</sec:authorize>
				<br>
				<div class="col-sm-12">
							<!-- ************************************************************************ -->
<%-- 					<sec:authorize access="hasRole('ROLE_STUDENT')"> --%>
						<div class="row">
							<div class="col-sm-11"></div>
							<a href="/lectureBoard/submitTask?lecaCd=${param.lecaCd}&&taskCd=${param.taskCd}" class="col-sm-1 btn btn-block btn-outline-secondary btn-sm" style="float:right">제출</a>
						</div>
<%-- 					</sec:authorize> --%>
					<table id="example2"
						class="table table-bordered table-hover dataTable dtr-inline"
						aria-describedby="example2_info">
						<thead>
							<tr>
								<th class="sorting sorting_asc" tabindex="0"
									aria-controls="example2" rowspan="1" colspan="1"
									aria-sort="ascending"
									aria-label="Rendering engine: activate to sort column descending">No
									</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Browser: activate to sort column ascending">제목</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Browser: activate to sort column ascending">작성자</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Engine version: activate to sort column ascending">제출일</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Engine version: activate to sort column ascending">마감일</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending">점수</th>
							</tr>
						</thead>
						<tbody>
						<!-- ************************************************************************ -->
				<c:if test="${list !=null}">
							<c:forEach var="row" items="${list}" varStatus="stat">
							
								<c:forEach var="list" items="${row.taskSubmitList}" varStatus="stata">
								<tr class="odd">
									<td class="dtr-control sorting_1" tabindex="0">${stat.count}</td>
									<td><a href="/lectureBoard/taskSubmitDetail?tsubCd=${list.tsubCd}">${row.taskNm}</a></td>
									<td>${list.student.stuNm}</td>
									<td><fmt:formatDate value="${list.tsubDt}" pattern="yyyy-MM-dd HH:mm"/></td>
									<td>
										<fmt:formatDate value="${row.taskEdt}" pattern="yyyy-MM-dd HH:mm"/>
									</td>
									<td>0/10</td>
									
								</tr>
								</c:forEach>
							</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				
				
			</div>
		</div>
	</div>
</body>
</html>