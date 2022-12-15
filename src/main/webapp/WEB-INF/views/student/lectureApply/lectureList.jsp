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
											<h5 class="col-1">나의 정보</h5>
											<div class="col-2">
												<label>학과</label><input type="text" class="form-control"
													value="${graduateCredit.depNm}" readonly />
											</div>
											<div class="col-2 offset-1">
												<label>신청가능학점</label><input type="text" class="form-control"
													value="${graduateCredit.rdcReqCrd}" readonly />
											</div>
											<div class="col-2 offset-1">
												<label>재학학기</label><input type="text" class="form-control"
													value="${graduateCredit.stuYr}학년  ${graduateCredit.stuSem}학기"
													readonly />
											</div>
										</div>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="card-body container-fluid">
										<div class="row">
											<h5 class="col-1">이수한 학점</h5>
											<div class="col-2">
												<label>전공필수</label><input type="text" class="form-control"
													value="${studentCurrentCredit.crdMrc}" readonly />
											</div>
											<div class="col-2">
												<label>전공선택</label><input type="text" class="form-control"
													value="${studentCurrentCredit.crdMoc}" readonly />
											</div>
											<div class="col-2">
												<label>교양필수</label><input type="text" class="form-control"
													value="${studentCurrentCredit.crdCrc}" readonly />
											</div>
											<div class="col-2">
												<label>교양선택</label><input type="text" class="form-control"
													value="${studentCurrentCredit.crdCoc}" readonly />
											</div>
											<div class="col-2">
												<label>총학점</label><input type="text" class="form-control"
													value="${studentCurrentCredit.crdAc}" readonly />
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
										<select id="college"
											class="select2bs4 select2-hidden-accessible"
											style="width: 100%;" aria-hidden="true">
											<option value="">단과대학</option>
											<c:forEach var="college" items="${collegeList}">
												<option value="${college.colNm}">${college.colNm}</option>
											</c:forEach>
										</select>
									</div>
									<div class="form-group col-2">
										<select id="department"
											class="select2bs4 select2-hidden-accessible"
											style="width: 100%;" aria-hidden="true">
											<option value="">학과</option>
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
									<div class="card-body table-responsive col-11 p-0"
										style="height: 300px;">
										<table
											class="table table-head-fixed text-nowrap table-striped table-bordered table-sm">
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
								
								<div class="row pl-3 pr-3">
									<div class="col-5">
										<h3 style="display: inline-block;">장바구니 목록</h3>&nbsp;&nbsp;&nbsp;
										<label>※예비수강신청에서 장바구니에 담은 강의 목록입니다.</label>
									</div>
									<button type="button" id="timeTableSave"
											class="col-1 offset-5 btn btn-flat btn-primary"
											data-toggle="modal" data-target="#saveSchedule">장바구니 <br>시간표
											보기</button>
								</div>
								<div class="row pl-3"></div>
								<div class="row pl-3 pb-3">
									<div class="card-body table-responsive col-11 p-0"
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
											<tbody id="notApplySaveLecture">

											</tbody>
										</table>
									</div>
								</div>
								<div class="row pl-3 pr-3">
									<h3 class="col-3">수강신청된 강의목록</h3>
									<button type="button" id="timeTableApply"
										class="col-1 offset-7 btn btn-flat btn-primary"
										data-toggle="modal" data-target="#applySchedule">신청된<br>시간표
										보기</button>
								</div>
								<div class="row pl-3 pb-3">
									<div class="card-body table-responsive col-11 p-0"
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
								<div class="modal fade" id="applySchedule" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalCenterTitle"
									aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered modal-lg"
										role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalCenterTitle">강의
													시간표</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<table class="table m-0 table-bordered text-center">
													<thead>
														<tr>
															<th width="10%">교시</th>
															<th width="15%">시간</th>
															<th width="15%">월</th>
															<th width="15%">화</th>
															<th width="15%">수</th>
															<th width="15%">목</th>
															<th width="15%">금</th>
														</tr>
													</thead>
													<tbody id="timeTable">
														<tr height="70">
															<td class="align-middle">1교시</td>
															<td class="align-middle">09:00 ~ 09:50</td>
															<td id="am1"></td>
															<td id="at1"></td>
															<td id="aw1"></td>
															<td id="ah1"></td>
															<td id="af1"></td>
														</tr>
														<tr height="70">
															<td class="align-middle">2교시</td>
															<td class="align-middle">10:00 ~ 10:50</td>
															<td id="am2"></td>
															<td id="at2"></td>
															<td id="aw2"></td>
															<td id="ah2"></td>
															<td id="af2"></td>
														</tr>
														<tr height="70">
															<td class="align-middle">3교시</td>
															<td class="align-middle">11:00 ~ 11:50</td>
															<td id="am3"></td>
															<td id="at3"></td>
															<td id="aw3"></td>
															<td id="ah3"></td>
															<td id="af3"></td>
														</tr>
														<tr height="70">
															<td class="align-middle">4교시</td>
															<td class="align-middle">12:00 ~ 12:50</td>
															<td id="am4"></td>
															<td id="at4"></td>
															<td id="aw4"></td>
															<td id="ah4"></td>
															<td id="af4"></td>
														</tr>
														<tr height="70">
															<td class="align-middle">5교시</td>
															<td class="align-middle">13:00 ~ 13:50</td>
															<td id="am5"></td>
															<td id="at5"></td>
															<td id="aw5"></td>
															<td id="ah5"></td>
															<td id="af5"></td>
														</tr>
														<tr height="70">
															<td class="align-middle">6교시</td>
															<td class="align-middle">14:00 ~ 14:50</td>
															<td id="am6"></td>
															<td id="at6"></td>
															<td id="aw6"></td>
															<td id="ah6"></td>
															<td id="af6"></td>
														</tr>
														<tr height="70">
															<td class="align-middle">7교시</td>
															<td class="align-middle">15:00 ~ 15:50</td>
															<td id="am7"></td>
															<td id="at7"></td>
															<td id="aw7"></td>
															<td id="ah7"></td>
															<td id="af7"></td>
														</tr>
														<tr height="70">
															<td class="align-middle">8교시</td>
															<td class="align-middle">16:00 ~ 16:50</td>
															<td id="am8"></td>
															<td id="at8"></td>
															<td id="aw8"></td>
															<td id="ah8"></td>
															<td id="af8"></td>
														</tr>
														<tr height="70">
															<td class="align-middle">9교시</td>
															<td class="align-middle">17:00 ~ 17:50</td>
															<td id="am9"></td>
															<td id="at9"></td>
															<td id="aw9"></td>
															<td id="ah9"></td>
															<td id="af9"></td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary btn-flat"
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="custom-tabs-four-profile"
							role="tabpanel" aria-labelledby="custom-tabs-four-profile-tab">
							<div class="tab-pane fade show active" id="custom-tabs-four-home"
								role="tabpanel" aria-labelledby="custom-tabs-four-home-tab">
								<div class="card container-fluid">
									<h5>예비수강신청</h5>
									<div class="row">
										<div class="card-body container-fluid">
											<div class="row">
												<h5 class="col-1">나의 정보</h5>
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
													<label>재학학기</label><input type="text" class="form-control"
														value="${graduateCredit.stuYr}학년  ${graduateCredit.stuSem}학기"
														readonly />
												</div>
											</div>
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="card-body container-fluid">
											<div class="row">
												<h5 class="col-1">이수한 학점</h5>
												<div class="col-2">
													<label>전공필수</label><input type="text" class="form-control"
														value="${studentCurrentCredit.crdMrc}" readonly />
												</div>
												<div class="col-2">
													<label>전공선택</label><input type="text" class="form-control"
														value="${studentCurrentCredit.crdMoc}" readonly />
												</div>
												<div class="col-2">
													<label>교양필수</label><input type="text" class="form-control"
														value="${studentCurrentCredit.crdCrc}" readonly />
												</div>
												<div class="col-2">
													<label>교양선택</label><input type="text" class="form-control"
														value="${studentCurrentCredit.crdCoc}" readonly />
												</div>
												<div class="col-2">
													<label>총학점</label><input type="text" class="form-control"
														value="${studentCurrentCredit.crdAc}" readonly />
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
											<select id="cartCollege"
												class="select2bs4 select2-hidden-accessible"
												style="width: 100%;" aria-hidden="true">
												<option value="">단과대학</option>
												<c:forEach var="college" items="${collegeList}">
													<option value="${college.colNm}">${college.colNm}</option>
												</c:forEach>
											</select>
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
										<div class="card-body table-responsive col-11 p-0"
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
									<div class="row pl-3 pr-3">
										<h3 class="col-3">장바구니</h3>
										<button type="button" id="timeTableSave"
											class="col-1 offset-7 btn btn-flat btn-primary"
											data-toggle="modal" data-target="#saveSchedule">장바구니 <br>시간표
											보기</button>
									</div>
									<div class="row pl-3 pb-3">
										<div class="card-body table-responsive col-11 p-0"
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
									<div class="modal fade" id="saveSchedule" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalCenterTitle"
									aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered modal-lg"
										role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalCenterTitle">장바구니 강의
													시간표</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<table class="table m-0 table-bordered text-center">
													<thead>
														<tr>
															<th width="10%">교시</th>
															<th width="15%">시간</th>
															<th width="15%">월</th>
															<th width="15%">화</th>
															<th width="15%">수</th>
															<th width="15%">목</th>
															<th width="15%">금</th>
														</tr>
													</thead>
													<tbody id="timeTable">
														<tr height="70">
															<td class="align-middle">1교시</td>
															<td class="align-middle">09:00 ~ 09:50</td>
															<td id="sm1"></td>
															<td id="st1"></td>
															<td id="sw1"></td>
															<td id="sh1"></td>
															<td id="sf1"></td>
														</tr>
														<tr height="70">
															<td class="align-middle">2교시</td>
															<td class="align-middle">10:00 ~ 10:50</td>
															<td id="sm2"></td>
															<td id="st2"></td>
															<td id="sw2"></td>
															<td id="sh2"></td>
															<td id="sf2"></td>
														</tr>
														<tr height="70">
															<td class="align-middle">3교시</td>
															<td class="align-middle">11:00 ~ 11:50</td>
															<td id="sm3"></td>
															<td id="st3"></td>
															<td id="sw3"></td>
															<td id="sh3"></td>
															<td id="sf3"></td>
														</tr>
														<tr height="70">
															<td class="align-middle">4교시</td>
															<td class="align-middle">12:00 ~ 12:50</td>
															<td id="sm4"></td>
															<td id="st4"></td>
															<td id="sw4"></td>
															<td id="sh4"></td>
															<td id="sf4"></td>
														</tr>
														<tr height="70">
															<td class="align-middle">5교시</td>
															<td class="align-middle">13:00 ~ 13:50</td>
															<td id="sm5"></td>
															<td id="st5"></td>
															<td id="sw5"></td>
															<td id="sh5"></td>
															<td id="sf5"></td>
														</tr>
														<tr height="70">
															<td class="align-middle">6교시</td>
															<td class="align-middle">14:00 ~ 14:50</td>
															<td id="sm6"></td>
															<td id="st6"></td>
															<td id="sw6"></td>
															<td id="sh6"></td>
															<td id="sf6"></td>
														</tr>
														<tr height="70">
															<td class="align-middle">7교시</td>
															<td class="align-middle">15:00 ~ 15:50</td>
															<td id="sm7"></td>
															<td id="st7"></td>
															<td id="sw7"></td>
															<td id="sh7"></td>
															<td id="sf7"></td>
														</tr>
														<tr height="70">
															<td class="align-middle">8교시</td>
															<td class="align-middle">16:00 ~ 16:50</td>
															<td id="sm8"></td>
															<td id="st8"></td>
															<td id="sw8"></td>
															<td id="sh8"></td>
															<td id="sf8"></td>
														</tr>
														<tr height="70">
															<td class="align-middle">9교시</td>
															<td class="align-middle">17:00 ~ 17:50</td>
															<td id="sm9"></td>
															<td id="st9"></td>
															<td id="sw9"></td>
															<td id="sh9"></td>
															<td id="sf9"></td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary btn-flat"
													data-dismiss="modal">Close</button>
											</div>
										</div>
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
	
	var header = "${_csrf.headerName}";
	var token = "${_csrf.token}";
	
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
		
		$("#cartSearch").on("click",function(){
			loadNotYetSaveLecture();
		});
		
		$("#timeTableApply").on("click",loadApplyTimeTalble);
		
		$("#timeTableSave").on("click",loadSaveTimeTalble);
		
		$("#colleage").on("change",function(){
			
			let data = {
					colCd : this.value
			};
			
			$.ajax({
				url:"/student/lectureApply/departmentByCollege",
				type:"get",
				data:data,
				contentType : "application/json;utf-8",
				success:function(result){
					let str = "";
					console.log(result);
					if(!result.length){
						str += "<option value=''>학과</option>";
						str += "<option value=''>학과가 없습니다</option>";
					} else{
						str += "<option value=''>학과</option>";
						$.each(result,function(p_inx, p_val){
							str += `<option value='\${p_val.depNm}'>\${p_val.depNm}</option>`;
						});
					}
					$("#department").html(str);
				}
			});
			
		});
		
		$("#cartColleage").on("change",function(){
			
			let data = {
					colCd : this.value
			};
			
			$.ajax({
				url:"/student/lectureApply/departmentByCollege",
				type:"get",
				data:data,
				contentType : "application/json;utf-8",
				success:function(result){
					let str = "";
					console.log(result);
					if(!result.length){
						str += "<option value=''>학과</option>";
						str += "<option value=''>학과가 없습니다</option>";
					} else{
						str += "<option value=''>학과</option>";
						$.each(result,function(p_inx, p_val){
							str += `<option value='\${p_val.depNm}'>\${p_val.depNm}</option>`;
						});
					}
					$("#cartDepartment").html(str);
				}
			});
			
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
					loadNotApplySaveLecture();
				}
			});
		});
		
		$(document).on("click",'.applyCancel', function(e) {

			let data = {
				lecaCd : e.target.value,
				stuNo : stuNo
			};
			
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
					loadNotApplySaveLecture();
				}
			});
		});
		
		$(document).on("click",".save",function(e){
			let data = {
				lecaCd : e.target.value,
				stuNo : stuNo
			};
			
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
					loadNotApplySaveLecture();
				}
			});
		});
		
		$(document).on("click",'.saveCancel', function(e) {

			let data = {
				lecaCd : e.target.value,
				stuNo : stuNo
			};
			
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
					loadNotApplySaveLecture();
				}
			});
		});
		
		$(document).on('click', '.inquirydetail', function() {
			lecaCd = this.value;
			console.log("강의계획서 코드: " + lecaCd);
			window.open("/professor/lecApplyForm/inquiryForm?lecaCd="+lecaCd, "inquirydetail", "width=1000, height=800, left=100, top=50");
		});
		
		loadNotYetApplyLecture(); 
		loadCompleteApplyLecture();
		loadNotYetSaveLecture(); 
		loadCompleteSaveLecture();
		loadNotApplySaveLecture();
		
	}); // end document
	
	function loadNotYetApplyLecture(){
		
		let college = $("#college").val();
		let department = $("#department").val();
		let yr = $("#yr").val();
		let category = $("#category").val();
		let subject = $("#subject").val();
		
		
		let data = {
			stuNo : stuNo, 
			colNm : college,
			depNm :  department,
			lecaTrg : yr,
			lecaCate : category,
			lecaNm : subject
		};


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
					str += "<td colspan='11'>등록된 강의가 없습니다.</td>";
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
								<td><button type="button"
									class="btn btn-block btn-outline-secondary btn-flat btn-sm inquirydetail"
									value="\${lecture.lecApply.lecaCd}" >강의계획서</button></td>
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
					str += "<td colspan='11'>신청된 강의가 없습니다.</td>";
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
								<td><button type="button"
									class="btn btn-block btn-outline-secondary btn-flat btn-sm inquirydetail"
									value="\${lecture.lecApply.lecaCd}" >강의계획서</button></td>
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
		let college = $("#cartCollege").val();
		let department = $("#cartDepartment").val();
		let yr = $("#cartYr").val();
		let category = $("#cartCategory").val();
		let subject = $("#cartSubject").val();
		
		let data = {
			stuNo : stuNo, 
			colNm : college,
			depNm :  department,
			lecaTrg : yr,
			lecaCate : category,
			lecaNm : subject
		};

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
					str += "<td colspan='11'>등록된 강의가 없습니다.</td>";
					str += "</tr>";
					$("#notSaveLecture").html(str);
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
								<td>\${lecture.employee.empNm}</td>
								<td><button type="button"
									class="btn btn-block btn-outline-secondary btn-flat btn-sm inquirydetail"
									value="\${lecture.lecApply.lecaCd}" >강의계획서</button></td>
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

		$.ajax({
			url : "/student/lectureApply/completeSaveLectureList",
			type : "get",
			data : data,
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				$("#completeSaveLecture").html(function(){
					return "";
				});
				let str = "";
				if(result.length == 0){
					str = "<tr class='text-center p-0'>";
					str += "<td colspan='11'>담긴 강의가 없습니다.</td>";
					str += "</tr>";
					$("#completeSaveLecture").html(function(){
						return str;
					});
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
								<td>\${lecture.employee.empNm}</td>
								<td><button type="button"
									class="btn btn-block btn-outline-secondary btn-flat btn-sm inquirydetail"
									value="\${lecture.lecApply.lecaCd}" >강의계획서</button></td>
								<td><button
										class="btn btn-block bg-gradient-primary btn-sm btn-flat saveCancel"
										value="\${lecture.lecaCd}">취소</button></td>
							</tr>`
				});
				$("#completeSaveLecture").append(str);
			}
		}); // end ajax
	} // end function
	
	function loadNotApplySaveLecture(){
		let data = {
				stuNo : stuNo
			};

		
		
		$.ajax({
			url : "/student/lectureApply/loadNotApplySaveLecture",
			type : "get",
			data : data,
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				$("#notApplySaveLecture").html(function(){
					return "";
				});
				let str = "";
				if(result.length == 0){
					str = "<tr class='text-center p-0'>";
					str += "<td colspan='11'>신청 가능한 강의가 없습니다.</td>";
					str += "</tr>";
					$("#notApplySaveLecture").html(function(){
						return str;
					});
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
								<td><button type="button"
									class="btn btn-block btn-outline-secondary btn-flat btn-sm inquirydetail"
									value="\${lecture.lecApply.lecaCd}" >강의계획서</button></td>
								<td><button
										class="btn btn-block bg-gradient-primary btn-sm btn-flat apply"
										value="\${lecture.lecaCd}">신청</button></td>
							</tr>`
				});
				$("#notApplySaveLecture").append(str);
			}
		}); // end ajax
	}// end function 
	
	function loadApplyTimeTalble(){
		
		let data = {
				stuNo : stuNo
		};
		
		$.ajax({
			url : "/student/lectureApply/applyTimeTable",
			type : "get",
			data : data,
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				console.log("result : ", result);
				
				let wk = ["m","t","w","h","f"];
				
				for(let i=0; i<5; i++){
					for(let j=1; j<=9; j++){
						$("#a"+wk[i]+j).css("backgroundColor","white")
										.css("color","white")
										.css("border","1px solid #dee2e6")
										.html("");
					}
				}
				
				$.each(result, function(p_inx, lecture){
					
					let dayWeek = "";
					switch (lecture.altDt) {
					case '월':
						dayWeek = "m";
						break;
					case '화':
						dayWeek = "t";
						break;
					case '수':
						dayWeek = "w";
						break;
					case '목':
						dayWeek = "h";
						break;
					case '금':
						dayWeek = "f";
						break;
					}
					let color = ["#EF404A","#F2728C","#80B463","#27AAE1","#9E7EB9","#4EB8B9","#F79552","#FFCC4E","#D5E05B"];
					for(let i=lecture.altSt; i<=lecture.altEn; i++){
						if( i == lecture.altSt){
							$("#a"+dayWeek+i).css("backgroundColor",color[p_inx])
										.css("color","white")
										.css("border","none")
										.html(lecture.lecaNm + "\n" + lecture.bldSnm + lecture.roomNo);
						} else{
							$("#a"+dayWeek+i).css("backgroundColor",color[p_inx])
										.css("color","white")
										.css("border","none");
						}
						
					}
					
				});//end for
			}// end success
		}); // end ajax
		
	}// end function
	
	function loadSaveTimeTalble(){
		
		let data = {
				stuNo : stuNo
		};
		
		$.ajax({
			url : "/student/lectureApply/saveTimeTable",
			type : "get",
			data : data,
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				console.log("result : ", result);
				
				let wk = ["m","t","w","h","f"];
				
				for(let i=0; i<5; i++){
					for(let j=1; j<=9; j++){
						$("#s"+wk[i]+j).css("backgroundColor","white")
										.css("color","white")
										.css("border","1px solid #dee2e6")
										.html("");
					}
				}
				
				$.each(result, function(p_inx, lecture){
					
					let dayWeek = "";
					switch (lecture.altDt) {
					case '월':
						dayWeek = "m";
						break;
					case '화':
						dayWeek = "t";
						break;
					case '수':
						dayWeek = "w";
						break;
					case '목':
						dayWeek = "h";
						break;
					case '금':
						dayWeek = "f";
						break;
					}
					let color = ["#EF404A","#F2728C","#80B463","#27AAE1","#9E7EB9","#4EB8B9","#F79552","#FFCC4E","#D5E05B"];
					for(let i=lecture.altSt; i<=lecture.altEn; i++){
						if( i == lecture.altSt){
							$("#s"+dayWeek+i).css("backgroundColor",color[p_inx])
											.css("color","white")
											.css("border","none")
											.html(lecture.lecaNm + "\n" + lecture.bldSnm + lecture.roomNo);
						} else{
							$("#s"+dayWeek+i).css("backgroundColor",color[p_inx])
											.css("color","white")
											.css("border","none")
						}
						
					}
					
				});//end for
			}// end success
		}); // end ajax
		
	}// end function
	
	
</script>