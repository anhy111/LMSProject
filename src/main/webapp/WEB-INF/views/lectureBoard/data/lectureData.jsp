<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<style type="text/css">
table {
	border-collapse: collapse;
	border-spacing: 0;
}

.board-table {
	font-size: 16px;
	width: 100%;
	border-top: 2px solid black;
	border-bottom: 1px solid #ccc;
}

.board-table a {
	color: #333;
	display: inline-block;
	line-height: 1.4;
	word-break: break-all;
	vertical-align: middle;
}

.board-table a:hover {
	text-decoration: underline;
}

.board-table th {
	text-align: center;
}

.board-table .th-num {
	width: 100px;
	text-align: center;
}

.board-table .th-date {
	width: 150px;
}

.board-table .th-writer {
	width: 70px;
}

.board-table .th-count {
	width: 70px;
}

.board-table th, .board-table td {
	padding: 14px 0;
}

.board-table tbody td {
	border-top: 1px solid #e7e7e7;
	text-align: center;
}

.board-table tbody .td-title {
	text-align: left;
}

.board-table tbody th {
	padding-left: 28px;
	padding-right: 14px;
	border-top: 1px solid #e7e7e7;
	text-align: left;
}

.board-table tbody th p {
	display: none;
}

/* reset */
* {
	list-style: none;
	text-decoration: none;
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}
</style>
</head>
<body>

	<div class="col">
				<div class="row">
					<br>
				</div>
				<h2>
					<strong id="">${lecture.lecApply.lecaNm} - 강의자료실</strong>
				</h2>
			</div>
			<div class="col-sm-12">
				<section class="notice">
					<!-- board list area -->
					<div id="board-list">
						<div class="container" align="right" style="align-content: center">
						<sec:authorize access="hasRole('ROLE_PROFESSOR')">
							<a class="btn btn-secondary" href="/lectureBoard/data/dataInsert?lecaCd=${param.lecaCd}">글쓰기</a>
						</sec:authorize>
							<br> <br>
							<table class="board-table">
								<thead>
									<tr>
										<th scope="col" class="th-num">NO</th>
										<th scope="col">제목</th>
										<th scope="col" class="th-writer">작성자</th>
										<th scope="col" class="th-date">등록일</th>
										<th scope="col" class="th-count">조회 수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${lecData}" varStatus="stat">
										<tr class="odd">
											<td class="dtr-control sorting_1" tabindex="0">${stat.count}</td>
											<td class="td-title"><a href="/lectureBoard/data/dataDetail?ldtCd=${row.ldtCd}&&lecaCd=${row.lecaCd}"><B>${row.ldtTtl}</B></a></td>
											<td>${row.ldtWriter}</td>
											<td><fmt:formatDate value="${row.ldtReg}"
													pattern="yyyy-mm-dd" /></td>
											<td>${row.ldtCount}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<br>
					<div class="container-fluid">
						<form action="/lectureBoard/data/lectureData" method="get">
							<div class="row">
								<div class="col-md-10 offset-md-1">
									<div class="form-group">
										<div class="input-group input-group-lg">
											<select name="category">
												<option value="1">전체</option>
												<option value="2">제목</option>
												<option value="3">작성자</option>
											</select> <input type="hidden" name="lecaCd" value="${param.lecaCd}">
											<input type="search" class="form-control form-control-lg"
												placeholder="검색어를 입력하세요" id="keyword" name="keyWord"
												value="${keyWord}">
											<div class="input-group-append">
												<button type="submit" class="btn btn-lg btn-default">
													<i class="fa fa-search"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</section>
			</div>
</body>
</html>
