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
								<div class="row">
									<div class="card-body container-fluid">
										<div class="row">
											<div class="col-2">
												<label>학과</label><input type="text" class="form-control"
													value="${graduateCredit.depNm}" readonly />
											</div>
											<div class="col-2 offset-1">
												<label>신청가능학점</label><input type="text" class="form-control"
													value="${graduateCredit.rdcReqCrd}" readonly />
											</div>
											<div class="col-2 offset-1">
												<label>학년</label><input type="text" class="form-control"
													value="${graduateCredit.stuYr}학년  ${graduateCredit.stuSem}학기"
													readonly />
											</div>
										</div>
									</div>
								</div>
								<hr>
								<div class="row p-3">
									<div class="form-group col-1">
										<h5>키워드 검색</h5>
									</div>
									<div class="form-group col-2">
										<select id="department"
											class="select2bs4 select2-hidden-accessible"
											style="width: 100%;" aria-hidden="true">
											<option value="">학과</option>
											<c:forEach var="department" items="${departmentList}">
												<option value="${department.depNm}">${department.depNm}</option>
											</c:forEach>
										</select>
									</div>
									<div class="form-group col-2 ">
										<select id="yr" class="select2bs4 select2-hidden-accessible"
											style="width: 100%;" aria-hidden="true">
											<option value="">학년</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
										</select>
									</div>
									<div class="form-group col-2">
										<select id="category"
											class="select2bs4 select2-hidden-accessible"
											style="width: 100%;" aria-hidden="true">
											<option value="">이수구분</option>
											<option value="전필">전공필수</option>
											<option value="전선">전공선택</option>
											<option value="교필">교양필수</option>
											<option value="교선">교양선택</option>
										</select>
									</div>
									<div class="form-gruop col-2">
										<input id="subject" type="text" class="form-control"
											placeholder="과목명" />
									</div>

									<div class="form-group col-1">
										<button id="search" type="button"
											class="btn btn-flat btn-primary" value="">검색</button>
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
							<div class="tab-pane fade show active" id="custom-tabs-four-home"
								role="tabpanel" aria-labelledby="custom-tabs-four-home-tab">
								<div class="card container-fluid">
									<h3>예비수강신청</h3>
									<div class="row">
										<div class="card-body container-fluid">
											<div class="row">
												<div class="col-2">
													<label>학과</label><input type="text" class="form-control"
														value="${graduateCredit.depNm}" readonly />
												</div>
												<div class="col-2 offset-1">
													<label>신청가능학점</label><input type="text"
														class="form-control" value="${graduateCredit.rdcReqCrd}"
														readonly />
												</div>
												<div class="col-2 offset-1">
													<label>학년</label><input type="text" class="form-control"
														value="${graduateCredit.stuYr}학년  ${graduateCredit.stuSem}학기"
														readonly />
												</div>
											</div>
										</div>
									</div>
									<hr>
									<div class="row p-3">
										<div class="form-group col-1">
											<h5>키워드 검색</h5>
										</div>
										<div class="form-group col-2">
											<select id="cartDepartment"
												class="select2bs4 select2-hidden-accessible"
												style="width: 100%;" aria-hidden="true">
												<option value="">학과</option>
												<c:forEach var="department" items="${departmentList}">
													<option value="${department.depNm}">${department.depNm}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group col-2 ">
											<select id="cartYr"
												class="select2bs4 select2-hidden-accessible"
												style="width: 100%;" aria-hidden="true">
												<option value="">학년</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select>
										</div>
										<div class="form-group col-2">
											<select id="cartCategory"
												class="select2bs4 select2-hidden-accessible"
												style="width: 100%;" aria-hidden="true">
												<option value="">이수구분</option>
												<option value="전필">전공필수</option>
												<option value="전선">전공선택</option>
												<option value="교필">교양필수</option>
												<option value="교선">교양선택</option>
											</select>
										</div>
										<div class="form-gruop col-2">
											<input id="cartSubject" type="text" class="form-control"
												placeholder="과목명" />
										</div>

										<div class="form-group col-1">
											<button id="cartSearch" type="button"
												class="btn btn-flat btn-primary" value="">검색</button>
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
										<h3>장바구니</h3>
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
												<tbody id="completeSaveLecture">
												</tbody>
											</table>
										</div>
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
		
		$("#search").on("click",function(){
			loadNotYetApplyLecture();
		});

		$(document).on("click",'.apply', function(e) {

			let data = {
				lecaCd : e.target.value,
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
					if(result == "maxCredit"){
						alert("신청 가능한 학점을 초과했습니다.");
					} else if(result == "maxHeadcount"){
						alert("인원이 초과되었습니다.");
					}
					loadCompleteApplyLecture();
					loadNotYetApplyLecture();
				}
			});
		});
		
		$(document).on("click",'.applyCancel', function(e) {

			let data = {
				lecaCd : e.target.value,
				stuNo : stuNo
			};
			
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
					loadCompleteApplyLecture();
					loadNotYetApplyLecture();
				}
			});
		});
		
		$(document).on("click",".save",function(e){
			let data = {
				lecaCd : e.target.value,
				stuNo : stuNo
			};
			
			let header = "${_csrf.headerName}";
			let token = "${_csrf.token}";
			
			$.ajax({
				url : "/student/lectureApply/save",
				type : "post",
				data : JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function(result) {
					loadCompleteSaveLecture();
					loadNotYetSaveLecture();
				}
			});
		});
		
		$(document).on("click",'.saveCancel', function(e) {

			let data = {
				lecaCd : e.target.value,
				stuNo : stuNo
			};
			
			let header = "${_csrf.headerName}";
			let token = "${_csrf.token}";
			
			$.ajax({
				url : "/student/lectureApply/saveCancel",
				type : "post",
				data : JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function(result) {
					loadCompleteSaveLecture();
					loadNotYetSaveLecture();
				}
			});
		});
		
		loadNotYetApplyLecture(); 
		loadCompleteApplyLecture();
		loadNotYetSaveLecture(); 
		loadCompleteSaveLecture();
		
	});
	
	function loadNotYetApplyLecture(){
		
		let department = $("#department").val();
		let yr = $("#yr").val();
		let category = $("#category").val();
		let subject = $("#subject").val();
		
		
		
		let data = {
			stuNo : stuNo, 
			depNm :  department,
			lecaTrg : yr,
			lecaCate : category,
			lecaNm : subject
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
					return;
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
										class="btn btn-block bg-gradient-primary btn-sm btn-flat apply"
										value="\${lecture.lecaCd}">신청</button></td>
							</tr>`
				});
				$("#notApplyLecture").append(str);
			}
		});
	}
	
	function loadCompleteApplyLecture(){
		
		let data = {
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
					$("#completeApplyLecture").html(str);
					return;
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
										class="btn btn-block bg-gradient-primary btn-sm btn-flat applyCancel"
										value="\${lecture.lecaCd}">취소</button></td>
							</tr>`
				});
				$("#completeApplyLecture").append(str);
				
				
			}
		}); // end ajax
	} // end function
	
	function loadNotYetSaveLecture(){
		
		let department = $("#cartDepartment").val();
		let yr = $("#cartYr").val();
		let category = $("#cartCategory").val();
		let subject = $("#cartSubject").val();
		
		
		
		let data = {
			stuNo : stuNo, 
			depNm :  department,
			lecaTrg : yr,
			lecaCate : category,
			lecaNm : subject
		};

		let header = "${_csrf.headerName}";
		let token = "${_csrf.token}";

		$.ajax({
			url : "/student/lectureApply/notYetSaveLectureList",
			type : "get",
			data : data,
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				$("#notSaveLecture").html("");
				let str = "";
				if(result.length == 0){
					str = "<tr class='text-center p-0'>";
					str += "<td colspan='11'>신청된 강의가 없습니다.</td>";
					str += "</tr>";
					$("#notApplyLecture").html(str);
					return;
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
										class="btn btn-block bg-gradient-primary btn-sm btn-flat save"
										value="\${lecture.lecaCd}">담기</button></td>
							</tr>`
				});
				$("#notSaveLecture").append(str);
			}
		});
	}
	
	function loadCompleteSaveLecture(){
		
		let data = {
				stuNo : stuNo
			};

		let header = "${_csrf.headerName}";
		let token = "${_csrf.token}";

		$.ajax({
			url : "/student/lectureApply/completeSaveLectureList",
			type : "get",
			data : data,
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				$("#completeSaveLecture").html("");
				let str = "";
				if(result.length == 0){
					str = "<tr class='text-center p-0'>";
					str += "<td colspan='11'>등록된 강의가 없습니다.</td>";
					str += "</tr>";
					$("#completeSaveLecture").html(str);
					return;
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
										class="btn btn-block bg-gradient-primary btn-sm btn-flat saveCancel"
										value="\${lecture.lecaCd}">취소</button></td>
							</tr>`
				});
				$("#completeSaveLecture").append(str);
			}
		}); // end ajax
	} // end function
	
	
</script>