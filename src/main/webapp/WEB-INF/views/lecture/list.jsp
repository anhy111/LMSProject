<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	var date = new Date();
	let year = date.getFullYear();
	let month = date.getMonth();
	var semester;

	if (month == '3' || month == '4' || month == '5' || month == '6') semester = 1;
	else if (month == '9' || month == '10' || month == '11' || month == '12') semester = 2;

	let lectureListYear = year + "년도 " + semester + "학기 강의목록";
	console.log(lectureListYear);

	$(function() {
		$("#lectureListYear").text(lectureListYear);
	})
</script>
</head>
<body>

	<div class="col">
		<div class="card card-outline card-primary">
			<div class="card-header">
				<h1 class="card-title">
					<strong id="lectureListYear"></strong>
				</h1>
				<div class="card-tools">
					<button type="button" class="btn btn-tool"
						data-card-widget="collapse">
						<i class="fas fa-minus"></i>
					</button>
				</div>
			</div>
			<div class="card-body">
				<div class="col-sm-12">
				<section class="content">
					<div class="container-fluid">
						<form action="/lecture/list" method="get">
							<div class="row">
								<div class="col-md-10 offset-md-1">
									<div class="form-group">
										<div class="input-group input-group-lg">
											<input type="search" class="form-control form-control-lg"
												placeholder="검색어를 입력하세요"  id="keyword" name="keyword" value="${keyword}">
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
					<table id="example2"
						class="table table-bordered table-hover dataTable dtr-inline"
						aria-describedby="example2_info">
						<thead>
							<tr>
								<th class="sorting sorting_asc" tabindex="0"
									aria-controls="example2" rowspan="1" colspan="1"
									aria-sort="ascending"
									aria-label="Rendering engine: activate to sort column descending">강의
									번호</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Browser: activate to sort column ascending">연도</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Platform(s): activate to sort column ascending">학기</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Engine version: activate to sort column ascending">강의
									명</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Engine version: activate to sort column ascending">학과
								</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending">담당
									교수</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending">정원</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending">이수구분</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${lecture}" varStatus="stat">
								<tr class="odd">
									<td class="dtr-control sorting_1" tabindex="0">${row.lecApply.lecaCd}</td>
									<td>${row.lecApply.lecaYr}</td>
									<td>${row.lecApply.lecaSem}</td>
									<td>${row.lecApply.lecaNm}</td>
									<td>${row.department.depNm}</td>
									<td>${row.employee.empNm}</td>
									<td>${row.lecApply.lecaCap}</td>
									<td>${row.lecApply.lecaCate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
