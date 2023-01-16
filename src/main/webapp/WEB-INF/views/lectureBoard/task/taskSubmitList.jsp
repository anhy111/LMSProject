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
	<div>
		<h3 class="card-title">
			<strong id="lectureListYear">${lecture.lecApply.lecaNm} 과제</strong>
		</h3>
	</div>
	<div class="card-body">
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
			<div class="col-sm-12 alert alert-light bg-light border-0"
				role="alert"
				style="font-size: 0.9em; padding: 15px 30px 15px; 20 px; border: 1px solid #eee;"
				" id="subInfo">
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
		</sec:authorize>

		<sec:authorize access="hasRole('ROLE_STUDENT')">
			<div class="col-sm-12 alert alert-light bg-light border-0"
				role="alert"
				style="font-size: 0.9em; padding: 15px 30px 15px; 20 px; border: 1px solid #eee;"
				id="subInfo">
				<br>
				<h3>
					<b>※과제 안내 사항</b>
				</h3>
				<p>
					1. 과제에 대한 <strong>제출 마감 기간</strong>을 잘 확인하여 불이익이 없도록 합니다.
				</p>
				<p>2. 담당교수 채점 후 과제에 대한 점수를 확인할 수 있습니다.</p>
			</div>
		</sec:authorize>
		<br>
		<div class="col-sm-12">
			<!-- ************************************************************************ -->
			<sec:authorize access="hasRole('ROLE_STUDENT')">
				<div class="row">
					<div class="col-sm-11"></div>
			<c:if test="${ts == null }">
					<a
						href="/lectureBoard/task/submitTask?lecaCd=${param.lecaCd}&&taskCd=${param.taskCd}"
						class="col-sm-1 btn btn-block btn-outline-secondary btn-sm"
						style="float: right">제출</a>
			</c:if>
				</div>
				
			</sec:authorize>
			<table class="table table-bordered table-hover dataTable dtr-inline">
				<thead>
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>작성자</th>
						<th>제출일</th>
						<th>마감일</th>
						<th>점수</th>
					</tr>
				</thead>
				<tbody>
					<!-- ************************************************************************ -->

			<sec:authorize access="hasRole('ROLE_STUDENT')">
					<c:if test="${empty list}">
									<tr style="border-bottom: 1px solid #112a63">
										<td colspan="6" style="text-align: center;color: #888;">제출한 과제가 없습니다.</td>
									</tr>
					</c:if>
					<c:if test="${list != null}">
						<c:forEach var="row" items="${list}" varStatus="stat">
							<c:forEach var="list" items="${row.taskSubmitList}"
								varStatus="stata">
								<c:if  test="${list.stuNo == stuNo}">
								<c:if test="${stata.count%2 != 0 }">
									<tr class="odd">
								</c:if>
								<c:if test="${stata.count%2 == 0 }">
									<tr class="even">
								</c:if>
									<td class="dtr-control sorting_1" tabindex="0">${stat.count}</td>
									<td><a
										href="/lectureBoard/task/taskSubmitDetail?tsubCd=${list.tsubCd}&&lecaCd=${param.lecaCd}">${row.taskNm}</a></td>
									<td>${list.student.stuNm}</td>
									<td><fmt:formatDate value="${list.tsubDt}"
											pattern="yyyy-MM-dd" /></td>
									<td><fmt:formatDate value="${row.taskEdt}"
											pattern="yyyy-MM-dd" /></td>
									<td>${list.tsubScore}/${row.taskScore}</td>

								</tr>
								</c:if>
							</c:forEach>
						</c:forEach>
					</c:if>
			</sec:authorize>					
			
			<sec:authorize access="hasRole('ROLE_PROFESSOR')">
					<c:if test="${empty list}">
						<tr style="border-bottom: 1px solid #112a63">
							<td colspan="6" style="text-align: center;color: #888;">제출된 과제가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${list !=null}">
						<c:forEach var="row" items="${list}" varStatus="stat">
							<c:forEach var="list" items="${row.taskSubmitList}"
								varStatus="stata">
								<c:if test="${stata.count%2 != 0 }">
									<tr class="odd">
								</c:if>
								<c:if test="${stata.count%2 == 0 }">
									<tr class="even">
								</c:if>
									<td class="dtr-control sorting_1" tabindex="0">${stat.count}</td>
									<td><a
										href="/lectureBoard/task/taskSubmitDetail?tsubCd=${list.tsubCd}&&lecaCd=${param.lecaCd}">${row.taskNm}</a></td>
									<td>${list.student.stuNm}</td>
									<td><fmt:formatDate value="${list.tsubDt}"
											pattern="yyyy-MM-dd" /></td>
									<td><fmt:formatDate value="${row.taskEdt}"
											pattern="yyyy-MM-dd" /></td>
									<td>${list.tsubScore}/${row.taskScore}</td>
								</tr>
							</c:forEach>
						</c:forEach>
					</c:if>
			</sec:authorize>
				</tbody>
			</table>
			<a style="float: right" class="btn btn-outline-secondary" href="/lectureBoard/task/subjectList?lecaCd=${param.lecaCd}">목록</a>
		</div>


	</div>
	</div>
	</div>
</body>
</html>