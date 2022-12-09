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
						<li class="nav-item"><a class="nav-link active"
							id="custom-tabs-four-home-tab" data-toggle="pill"
							href="#custom-tabs-four-home" role="tab"
							aria-controls="custom-tabs-four-home" aria-selected="true">수강신청</a></li>
						<li class="nav-item"><a class="nav-link"
							id="custom-tabs-four-profile-tab" data-toggle="pill"
							href="#custom-tabs-four-profile" role="tab"
							aria-controls="custom-tabs-four-profile" aria-selected="false">예비수강신청</a></li>
					</ul>
				</div>

				<div class="card-body">
					<div class="tab-content" id="custom-tabs-four-tabContent">
						<div class="tab-pane fade show active" id="custom-tabs-four-home"
							role="tabpanel" aria-labelledby="custom-tabs-four-home-tab">
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
									<div class="form-group col-2 ">
										<select class="select2bs4 select2-hidden-accessible"
											style="width: 100%;" aria-hidden="true">
											<option value="">학년</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
										</select>
									</div>
									<div class="form-group col-2">
										<select class="select2bs4 select2-hidden-accessible"
											style="width: 100%;" aria-hidden="true">
											<option value="">이수구분</option>
											<option value="전공필수">전공필수</option>
											<option value="전공선택">전공선택</option>
											<option value="교양필수">교양필수</option>
											<option value="교양선택">교양선택</option>
										</select>
									</div>


								</div>
								<hr>
								<div class="row pl-3">
									<h3>강의목록</h3>
								</div>

								<div class="row pl-3 pb-3">
									<div class="card-body table-responsive col-11"
										style="height: 300px;">
										<table
											class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
											<thead>
												<tr class="text-center">
													<th width="4%">순번</th>
													<th width="8%">이수구분</th>
													<th width="18%">개설학과</th>
													<th width="4%">학년</th>
													<th width="20%">과목명</th>
													<th width="4%">학점</th>
													<th width="6%">최대인원</th>
													<th width="10%">현재인원</th>
													<th>교수명</th>
													<th>강의계획서</th>
													<th>신청</th>
												</tr>
											</thead>
											<tbody id="notApplyLecture">

											</tbody>
										</table>
									</div>
								</div>
								<div class="row pl-3">
									<h3>수강신청된 강의목록</h3>
								</div>
								<div class="row pl-3 pb-3">
									<div class="card-body table-responsive col-11"
										style="height: 300px;">
										<table
											class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
											<thead>
												<tr class="text-center">
													<th width="4%">순번</th>
													<th width="8%">이수구분</th>
													<th width="18%">개설학과</th>
													<th width="4%">학년</th>
													<th width="20%">과목명</th>
													<th width="4%">학점</th>
													<th width="6%">최대인원</th>
													<th width="10%">현재인원</th>
													<th>교수명</th>
													<th>강의계획서</th>
													<th>취소</th>
												</tr>
											</thead>
											<tbody id="completeApplyLecture">
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="custom-tabs-four-profile"
							role="tabpanel" aria-labelledby="custom-tabs-four-profile-tab">
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
									<div class="form-group col-2 ">
										<select class="select2bs4 select2-hidden-accessible"
											style="width: 100%;" aria-hidden="true">
											<option value="">학년</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
										</select>
									</div>
									<div class="form-group col-2">
										<select class="select2bs4 select2-hidden-accessible"
											style="width: 100%;" aria-hidden="true">
											<option value="">이수구분</option>
											<option value="전공필수">전공필수</option>
											<option value="전공선택">전공선택</option>
											<option value="교양필수">교양필수</option>
											<option value="교양선택">교양선택</option>
										</select>
									</div>


								</div>
								<hr>
								<div class="row pl-3">
									<h3>강의목록</h3>
								</div>

								<div class="row pl-3 pb-3">
									<div class="card-body table-responsive col-11"
										style="height: 300px;">
										<table
											class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
											<thead>
												<tr class="text-center">
													<th width="4%">순번</th>
													<th width="8%">이수구분</th>
													<th width="18%">개설학과</th>
													<th width="4%">학년</th>
													<th width="20%">과목명</th>
													<th width="4%">학점</th>
													<th width="6%">최대인원</th>
													<th width="10%">현재인원</th>
													<th>교수명</th>
													<th>강의계획서</th>
													<th>신청</th>
												</tr>
											</thead>
											<tbody id="notSaveLecture">

											</tbody>
										</table>
									</div>
								</div>
								<div class="row pl-3">
									<h3>수강 장바구니</h3>
								</div>
								<div class="row pl-3 pb-3">
									<div class="card-body table-responsive col-11"
										style="height: 300px;">
										<table
											class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
											<thead>
												<tr class="text-center">
													<th width="4%">순번</th>
													<th width="8%">이수구분</th>
													<th width="18%">개설학과</th>
													<th width="4%">학년</th>
													<th width="20%">과목명</th>
													<th width="4%">학점</th>
													<th width="6%">최대인원</th>
													<th width="10%">현재인원</th>
													<th>교수명</th>
													<th>강의계획서</th>
													<th>취소</th>
												</tr>
											</thead>
											<tbody id="SaveLecture">
											</tbody>
										</table>
									</div>
								</div>
							</div>							
						</div>
					</div>
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
	
	$(function() {
		//Initialize Select2 Elements
		$('.select2').select2();

		//Initialize Select2 Elements
		$('.select2bs4').select2({
			theme : 'bootstrap4'
		});

		$(document).on("click",'.apply', function(e) {

			data = {
				lecaCd : e.target.value,
				stuNo : stuNo
			};

			console.log("lecaCd",data.lecaCd);
			
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
					if(result == 0){
						alert("인원이 초과되었습니다.");
					}
					loadCompleteApplyLecture();
					loadNotYetApplyLecture();
				}
			});
		});
		
		$(document).on("click",'.applyCancel', function(e) {

			data = {
				lecaCd : e.target.value,
				stuNo : stuNo
			};

			console.log("lecaCd",data.lecaCd);
			
			let header = "${_csrf.headerName}";
			let token = "${_csrf.token}";
			
			$.ajax({
				url : "/student/lectureApply/applyCancel",
				type : "post",
				data : JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function(result) {
					if(result == 0){
						alert("인원이 초과되었습니다.");
					}
					loadCompleteApplyLecture();
					loadNotYetApplyLecture();
				}
			});
		});
		
		loadNotYetApplyLecture(); 
		loadCompleteApplyLecture();
		
	});
	
	function loadNotYetApplyLecture(){
		data = {
				stuNo : stuNo
			};

		let header = "${_csrf.headerName}";
		let token = "${_csrf.token}";

		$.ajax({
			url : "/student/lectureApply/notYetApplyLectureList",
			type : "get",
			data : data,
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				$("#notApplyLecture").html("");
				let str = "";
				if(result.length == 0){
					str = "<tr class='text-center p-0'>";
					str += "<td colspan='11'>신청된 강의가 없습니다.</td>";
					str += "</tr>";
					$("#notApplyLecture").html(str);
				}
				$.each(result,function(p_inx, lecture){
					
					
					let percent = (lecture.lecHcnt/lecture.lecApply.lecaCap*100).toFixed(0);
					let color = "bg-primary";
					if(percent >= 100){
						color = "bg-danger";
					}
					
					
					str += `<tr class="text-center">
								<td>\${p_inx+1}</td>
								<td>\${lecture.lecApply.lecaCate}</td>
								<td>\${lecture.department.depNm}</td>
								<td>\${lecture.lecApply.lecaTrg}</td>
								<td>\${lecture.lecApply.lecaNm}</td>
								<td>\${lecture.lecApply.lecaCrd}</td>
								<td>\${lecture.lecApply.lecaCap}</td>
								<td class="pt-2">
									<div class="progress progress-xs progress-striped active">
										<div class="progress-bar bg-primary"
											style="width: ` + `\${lecture.lecHcnt/lecture.lecApply.lecaCap*100}%` + `"></div>
									</div>
									<div class="text-center">\${lecture.lecHcnt}/\${lecture.lecApply.lecaCap}
										&nbsp;&nbsp;<span class="badge \${color}">\${percent}%</span>
									</div>
								</td>
								<td>\${lecture.employee.empNm}</td>
								<td><input type="button"
									class="btn btn-block btn-outline-secondary btn-flat btn-sm"
									data-number="\${lecture.lecApply.lecaCd}" value="강의계획서" /></td>
								<td><button
										class="btn btn-block bg-gradient-primary btn-sm apply"
										value="\${lecture.lecaCd}">신청</button></td>
							</tr>`
				});
				$("#notApplyLecture").append(str);
			}
		});
	}
	
	function loadCompleteApplyLecture(){
		
		data = {
				stuNo : stuNo
			};

		let header = "${_csrf.headerName}";
		let token = "${_csrf.token}";

		$.ajax({
			url : "/student/lectureApply/completeApplyLectureList",
			type : "get",
			data : data,
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				$("#completeApplyLecture").html("");
				let str = "";
				if(result.length == 0){
					str = "<tr class='text-center p-0'>";
					str += "<td colspan='11'>등록된 강의가 없습니다.</td>";
					str += "</tr>";
					$("#notApplyLecture").html(str);
				}
				$.each(result,function(p_inx, lecture){
					str += `<tr class="text-center">
								<td>\${p_inx+1}</td>
								<td>\${lecture.lecApply.lecaCate}</td>
								<td>\${lecture.department.depNm}</td>
								<td>\${lecture.lecApply.lecaTrg}</td>
								<td>\${lecture.lecApply.lecaNm}</td>
								<td>\${lecture.lecApply.lecaCrd}</td>
								<td>\${lecture.lecApply.lecaCap}</td>
								<td class="pt-2">
									<div class="progress progress-xs progress-striped active">
										<div class="progress-bar bg-primary"
											style="width: ` + `\${lecture.lecHcnt/lecture.lecApply.lecaCap*100}%` + `"></div>
									</div>
									<div class="text-center">\${lecture.lecHcnt}/\${lecture.lecApply.lecaCap}
										&nbsp;&nbsp;<span class="badge bg-primary">\${(lecture.lecHcnt/lecture.lecApply.lecaCap*100).toFixed(0)}%</span>
									</div>
								</td>
								<td>\${lecture.employee.empNm}</td>
								<td><input type="button"
									class="btn btn-block btn-outline-secondary btn-flat btn-sm"
									data-number="\${lecture.lecApply.lecaCd}" value="강의계획서" /></td>
								<td><button
										class="btn btn-block bg-gradient-primary btn-sm applyCancel"
										value="\${lecture.lecaCd}">취소</button></td>
							</tr>`
				});
				$("#completeApplyLecture").append(str);
				
				
			}
		}); // end ajax
		
	} // end function
</script>