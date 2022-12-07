<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="card mb-0 col-10 offset-1">
				<div class="card-header tab-regular">
					<ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
						<li class="nav-item"><a class="nav-link active show"
							id="card-tab-1" data-toggle="tab" href="#card-1" role="tab"
							aria-controls="card-1" aria-selected="true">수강신청</a></li>
						<li class="nav-item"><a class="nav-link" id="card-tab-2"
							data-toggle="tab" href="#card-2" role="tab"
							aria-controls="card-2" aria-selected="false">예비수강신청</a></li>
					</ul>
				</div>

				<div class="card-body">
					<div class="card container-fluid">
						<div class="row p-3">
							<div class="form-group col-1">키워드 검색</div>
							<div class="form-group col-2">
								<select class="select2bs4 select2-hidden-accessible"
									style="width: 100%;" aria-hidden="true">
									<option value="">학과</option>
									<c:forEach var="department" items="${departmentList}">
										<option value="department.depNm">${department.depNm}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-2">
								<select class="select2bs4 select2-hidden-accessible"
									style="width: 100%;" aria-hidden="true">
									<option>학년</option>
									<option>Alaska</option>
									<option>California</option>
									<option>Delaware</option>
									<option>Tennessee</option>
									<option>Texas</option>
									<option>Washington</option>
								</select>
							</div>
							<div class="form-group col-2">
								<select class="select2bs4 select2-hidden-accessible"
									style="width: 100%;" aria-hidden="true">
									<option>이수구분</option>
									<option>Alaska</option>
									<option>California</option>
									<option>Delaware</option>
									<option>Tennessee</option>
									<option>Texas</option>
									<option>Washington</option>
								</select>
							</div>


						</div>
						<hr>
						<div class="row pl-3">
							<h3>강의목록</h3>
						</div>

						<div class="row pl-3 pr-3 pb-3">
							<div class="card-body table-responsive p-0 col-11"
								style="height: 300px;">
								<table
									class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed">
									<thead>
										<tr class="text-center p-0">
											<th>순번</th>
											<th>이수구분</th>
											<th>개설학과</th>
											<th>학년</th>
											<th>과목명</th>
											<th>학점</th>
											<th>최대인원</th>
											<th>현재인원</th>
											<th>교수명</th>
											<th>강의계획서</th>
											<th>신청</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="lecture" items="${lectureList}"
											varStatus="status">
											<tr class="text-center p-0">
												<td>${status.count}</td>
												<td>${lecture.lecApply.lecaCate}</td>
												<td>${lecture.department.depNm}</td>
												<td>${lecture.lecApply.lecaTrg}</td>
												<td>${lecture.lecApply.lecaNm}</td>
												<td>${lecture.lecApply.lecaCrd}</td>
												<td>${lecture.lecApply.lecaCap}</td>
												<td class="p-2 pt-3">
													<div class="progress progress-xs progress-striped active">
														<div class="progress-bar bg-primary"
															style="width: ${lecture.lecHcnt/lecture.lecApply.lecaCap*100}%"></div>
													</div>
													<div class="text-center">${lecture.lecHcnt}/${lecture.lecApply.lecaCap}
														&nbsp;&nbsp;<span class="badge bg-primary"><fmt:formatNumber
																value="${lecture.lecHcnt/lecture.lecApply.lecaCap*100}"
																pattern="0"></fmt:formatNumber>%</span>
													</div>
												</td>
												<td>${lecture.employee.empNm}</td>
												<td><input type="button"
													class="btn btn-block btn-outline-secondary btn-flat btn-sm"
													data-number="${lecture.lecApply.lecaCd}" value="강의계획서" /></td>
												<td><button
														class="btn btn-block bg-gradient-primary btn-sm apply"
														value="${lecture.lecaCd}">신청</button></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="card-body">
								<h3>수강신청된 강의목록</h3>
							</div>
						</div>
						<div class="row pl-3 pr-3 pb-3">
							<div class="card-body table-responsive p-0 col-11"
								style="height: 300px;">
								<table
									class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed">
									<thead>
										<tr class="text-center p-0">
											<th>순번</th>
											<th>이수구분</th>
											<th>개설학과</th>
											<th>학년</th>
											<th>과목명</th>
											<th>학점</th>
											<th>최대인원</th>
											<th>현재인원</th>
											<th>교수명</th>
											<th>강의계획서</th>
											<th>신청</th>
										</tr>
									</thead>
									<tbody>
										<tr class="text-center p-0">
											<td colspan="11">신청된 강의가 없습니다.</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- end container -->
				</div>
				<!-- end cardbody -->

			</div>
		</div>
	</div>
</div>
<script
	src="/resources/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/adminlte/plugins/select2/js/select2.full.min.js"></script>
<script src="/resources/adminlte/dist/js/adminlte.min.js"></script>
<script src="/resources/adminlte/dist/js/demo.js"></script>
<script>
	var stuNo = "${stuNo}";
	console.log("학생번호 ? " + stuNo);
	$(function() {
		//Initialize Select2 Elements
		$('.select2').select2();

		//Initialize Select2 Elements
		$('.select2bs4').select2({
			theme : 'bootstrap4'
		});

		$(".apply").on("click", function() {

			data = {
				lecaCd : this.value,
				stuNo : stuNo
			};

			let header = "${_csrf.headerName}";
			let token = "${_csrf.token}";

			$.ajax({
				url : "/student/lectureApply/apply",
				type : "post",
				data : JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function(result) {
					console.log("result : " + result);
				}
			})

		});
		loadCompleteApplyLecture();
	});
	
	function loadCompleteApplyLecture(){
		
		data = {
				stuNo : stuNo
			};

		let header = "${_csrf.headerName}";
		let token = "${_csrf.token}";

		$.ajax({
			url : "/student/lectureApply/completeApplyList",
			type : "get",
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				console.log("result : " + result);
			}
		})
		
	}
</script>