<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="row">
	<table id="stuInfoTable">
		<tr>
			<td colspan="9" style="background: #F3F8FF; height: 10px;"></td>
		</tr>
		<tr>
			<th>재학학기</th>
			<td>
				<input type="text" class="infoText" value="${graduateCredit.stuYr}학년  ${graduateCredit.stuSem}학기" readonly="readonly">
			</td>
			<th>학과</th>
			<td>
				<input type="text" class="infoText" value="${graduateCredit.depNm}" readonly="readonly">
			</td>
			<th>총학점</th>
			<td>
				<input type="text" class="infoText" value="${studentCurrentCredit.crdAc}" readonly="readonly">
			</td>
			<th>신청가능학점</th>
			<td>
				<input type="text" class="infoText" id="maxCredit" value="${graduateCredit.rdcReqCrd}" readonly="readonly">
			</td>
			<th></th>
		</tr>
		<tr>
			<td colspan="9" style="background: #F3F8FF; height: 5px;"></td>
		</tr>
		<tr>
			<th>전공필수</th>
			<td>
				<input type="text" class="infoText" name="depNm" id="depNm" value="${studentCurrentCredit.crdMrc}" readonly="readonly">
			</td>
			<th>전공선택</th>
			<td>
				<input type="text" class="infoText" name="yrNsem" id="yrNsem" value="${studentCurrentCredit.crdMoc}" readonly="readonly">
			</td>
			<th>교양필수</th>
			<td>
				<input type="text" class="infoText" name="stuSem" id="stuSem" value="${studentCurrentCredit.crdCrc}" readonly="readonly">
			</td>
			<th>교양선택</th>
			<td>
				<input type="text" class="infoText" name="stuBir" id="stuBir" value="${studentCurrentCredit.crdCoc}" readonly="readonly">
			</td>
			<th></th>
		</tr>
		<tr>
			<td colspan="9" style="background: #F3F8FF; height: 5px;"></td>
		</tr>
		<tr>
			<th>현재신청학점</th>
			<td>
				<input type="text" class="infoText" id="creditState" readonly="readonly">
			</td>
			<th>남은학점</th>
			<td >
				<input type="text" class="infoText" id="creditRemainder" readonly="readonly">
			</td>
			<th colspan="5"></th>
		</tr>
		<tr>
			<td colspan="9" style="background: #F3F8FF; height: 10px;"></td>
		</tr>
	</table>
</div>
<div class="row pb-3 mt-5">
	<h4 class="col-3 pl-0">장바구니</h4>
	<div class="form-froup col-2 offset-7 pr-0 text-right">
		<button type="button" id="timeTableSave" class="btn btn-flat btn-outline-secondary" data-toggle="modal" data-target="#saveSchedule">
			시간표 보기
		</button>
	</div>
</div>
<div class="row">
	<div class="card-body table-responsive col pt-0 pl-0" style="height: 300px;">
		<table class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
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
<div class="row mt-5">
	<h4 class="pl-0">강의목록</h4>
</div>
<div class="row">
	<div class="form-group col-2 pl-0">
		<select id="cartCollege" class="select2bs4 select2-hidden-accessible" style="width: 100%;" aria-hidden="true">
			<option value="0">단과대학</option>
			<c:forEach var="college" items="${collegeList}">
				<option value="${college.colCd}">${college.colNm}</option>
			</c:forEach>
		</select>
	</div>
	<div class="form-group col-2">
		<select id="cartDepartment" class="select2bs4 select2-hidden-accessible" style="width: 100%;" aria-hidden="true">
			<option value="">학과</option>
			<c:forEach var="department" items="${departmentList}">
				<option value="${department.depNm}">${department.depNm}</option>
			</c:forEach>
		</select>
	</div>
	<div class="form-group col-2 ">
		<select id="cartYr" class="select2bs4 select2-hidden-accessible" style="width: 100%;" aria-hidden="true">
			<option value="">학년</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
		</select>
	</div>
	<div class="form-group col-2">
		<select id="cartCategory" class="select2bs4 select2-hidden-accessible" style="width: 100%;" aria-hidden="true">
			<option value="">이수구분</option>
			<option value="전필">전공필수</option>
			<option value="전선">전공선택</option>
			<option value="교필">교양필수</option>
			<option value="교선">교양선택</option>
		</select>
	</div>
	<div class="form-gruop col-3">
		<input id="cartSubject" type="text" class="form-control" placeholder="과목명" />
	</div>

	<div class="form-group col-1 text-center">
		<button id="cartSearch" type="button" class="btn btn-flat btn-primary" value="">검색</button>
	</div>
</div>

<div class="row pb-3">
	<div class="card-body table-responsive col pt-0 pl-0" style="height: 300px;">
		<table class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
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

<div class="modal fade" id="saveSchedule" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">장바구니 강의 시간표</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
				<button type="button" class="btn btn-secondary btn-flat" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script src="/resources/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/adminlte/plugins/select2/js/select2.full.min.js"></script>
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
		
		
		$("#cartSearch").on("click",function(){
			loadNotYetSaveLecture();
		});

		
		$("#timeTableSave").on("click",loadSaveTimeTalble);
		
		
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
					if(result == "duplicate"){
						Swal.fire({
							icon: 'error',
							title:'실패',
							text : '중복되는 시간이 있습니다.'
						})
					} else if(result == "maxCredit"){
						Swal.fire({
							icon: 'error',
							title:'실패',
							text:'신청 가능한 학점을 초과했습니다.'
						})
					}
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
			
			$.ajax({
				url : "/student/lectureApply/saveCancel",
				type : "post",
				data : JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function(result) {
					loadNotYetSaveLecture();
					loadCompleteSaveLecture();
				}
			});
		});
		
		$(document).on('click', '.inquirydetail', function() {
			lecaCd = this.value;
			window.open("/student/lectureApply/inquiryForm?lecaCd="+lecaCd, "inquirydetail", "width=1000, height=800, left=100, top=50");
		});
		
		loadCompleteSaveLecture();
		loadNotYetSaveLecture();
	}); // end document


	function loadNotYetSaveLecture(){
		let college = $("#cartCollege").val();
		let department = $("#cartDepartment").val();
		let yr = $("#cartYr").val();
		let category = $("#cartCategory").val();
		let subject = $("#cartSubject").val();
		
		let data = {
			stuNo : stuNo, 
			colCd : college,
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
					str += "<td colspan='11'>검색된 강의가 없습니다.</td>";
					str += "</tr>";
					$("#notSaveLecture").html(str);
					return;
				}
				$.each(result,function(p_inx, lecture){
					
					str += `<tr class="text-center">
								<td>\${p_inx+1}</td>
								<td>\${lecture.lecApply.lecaCate}</td>
								<td class='text-left'>\${lecture.department.depNm}</td>
								<td>\${lecture.lecApply.lecaTrg}</td>
								<td class='text-left'>\${lecture.lecApply.lecaNm}</td>
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
				let credit = 0;
				if(result.length == 0){
					str = "<tr class='text-center p-0'>";
					str += "<td colspan='11'>담긴 강의가 없습니다.</td>";
					str += "</tr>";
					$("#completeSaveLecture").html(function(){
						return str;
					});
					$("#creditState").val(credit);
					$("#creditRemainder").val($("#maxCredit").val() - credit);
					return;
				}
				$.each(result,function(p_inx, lecture){
					credit += lecture.lecApply.lecaCrd;
					str += `<tr class="text-center">
								<td>\${p_inx+1}</td>
								<td>\${lecture.lecApply.lecaCate}</td>
								<td class='text-left'>\${lecture.department.depNm}</td>
								<td>\${lecture.lecApply.lecaTrg}</td>
								<td class='text-left'>\${lecture.lecApply.lecaNm}</td>
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
				$("#creditState").val(credit);
				$("#creditRemainder").val($("#maxCredit").val() - credit);
			}
		}); // end ajax
	} // end function
	
	
	
	
	
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
				
				let wk = ["m","t","w","h","f"];
				
				for(let i=0; i<5; i++){
					for(let j=1; j<=9; j++){
						$("#s"+wk[i]+j).css("backgroundColor","white")
										.css("color","white")
										.css("border","1px solid #dee2e6")
										.html("");
					}
				}
				
				const time = {};
				const lecaCdArr = [];
				const color = ["#EF404A","#F2728C","#80B463","#27AAE1","#9E7EB9","#4EB8B9","#F79552","#FFCC4E","#D5E05B"];
				
				$.each(result,function(p_inx, allocation){
					if(typeof time[allocation.lecaCd] == "undefined"){
						time[allocation.lecaCd] = new Array(allocation);
						lecaCdArr.push(allocation.lecaCd);
					} else{
						time[allocation.lecaCd].push(allocation);
					}
				});
				
				
				$.each(time, function(p_inx, lecture){
					$.each(lecture, function(p_inx, allocation){
						
						let dayWeek = "";
						switch (allocation.altDt) {
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
						
						if( $("#s"+dayWeek+(allocation.altTt-1)).val() != allocation.lecaCd){
							$("#s"+dayWeek+allocation.altTt).css("backgroundColor",color[lecaCdArr.indexOf(allocation.lecaCd)])
											.css("color","white")
											.css("border","none")
											.html(allocation.lecaNm + "\n" + allocation.bldSnm + allocation.roomNo)
											.val(allocation.lecaCd);
						} else{
							$("#s"+dayWeek+allocation.altTt).css("backgroundColor",color[lecaCdArr.indexOf(allocation.lecaCd)])
											.css("color","white")
											.css("border","none")
											.val(allocation.lecaCd);
						}
							
					}); // end for
					
				});//end for
			}// end success
		}); // end ajax
		
	}// end function
	
	
</script>