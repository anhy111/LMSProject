<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/inputModalTemplate.css">
<%
	int stuNo = (int) session.getAttribute("no");
	String name = String.valueOf(session.getAttribute("name"));
%>
<style>
td:nth-last-child(n):hover{
opacity:0.6;
color:white;
background-color:gray;
transition: opacity 1s, color 1s, background-color 1;
cursor:pointer;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<!-- <div class="card-header"> -->
<!-- 	<h3 class="card-title"> -->
<!-- 		<b>학적 변동 리스트</b> -->
<!-- 	</h3> -->
<!-- </div> -->
<div class="row">
 <iframe name='blankifr' style='display:none;'></iframe>
<input type="hidden" value="${student.stuRgb }" id="stuRgb" />
<div class="col-6 alert alert-light" role="alert"
						style="font-size: 0.9em; padding: 1em; border: 1px solid #eee;">
						<p>
							<strong>※ 안내사항</strong> <br>
							<br> (1)<strong>신청유형</strong>에 따라 담당교수의 상담 내역이 필요합니다.<br>
							<br> (2) <strong>승인대기</strong>시에는 수정, 삭제 할 수 있으며<br>&nbsp;&nbsp;&nbsp;&nbsp;<strong>승인 및 반려</strong>처리가 되면 수정, 삭제할 수 없습니다.<br> 
							<br> (3) 하단의 <strong>신청</strong> 버튼을 눌러 신청 할 수 있습니다.<br>
							<br> (4) 현재 승인된 내역이 있다면 만료 후 새로 <strong>신청 할 수 있습니다.</strong>
						</p>
					</div>
<div class="col-6 alert alert-light" role="alert"
						style="font-size: 0.9em; padding: 1em; border: 1px solid #eee;">
						<p>
							<strong>현재 내 학적 상태</strong> <br>
							<br> <strong>학적구분&nbsp;:&nbsp;</strong>&nbsp;<span id="recordStateNow"style="color:blue;"></span><br>
							<br> <strong>신청날짜&nbsp;:&nbsp;</strong>&nbsp;<span id="recordApplyDate"style="color:blue;"></span><br> 
							<br> <strong>종료날짜&nbsp;:&nbsp;</strong>&nbsp;<span id="recordEndDate" style="color:blue;"></span><br>
							<br> <strong>비고&nbsp;:&nbsp;</strong>&nbsp;<span id="recordStateEtc" style="color:blue;"></span><br>
						</p>
					</div>
</div>
<!-- <div class="card-body table-responsive col-12 "style="min-height: 300px;"> -->
<div class="row">
	<table id="applyTable"
		class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
		<thead>
			<tr class="text-center">
				<th width="4%">No</th>
				<th width="4%">신청유형</th>
				<th width="10%">신청연도</th>
				<th width="4%">신청학기</th>
				<th width="4%">기간</th>
				<th width="10%">신청일자</th>
				<th width="6%">승인여부</th>
			</tr>
		</thead>
		<tbody class="text-center">
			<c:forEach var="recordsList" items="${recordsList}" varStatus="status" end="${recordsList.size() }">
				<tr data-toggle="modal" data-target="#modal-modify">
					<td  data-value="${recordsList.recCd }">${status.end-status.index }</td>
					<td>${recordsList.rgbCd}</td>
					<td >${recordsList.recYr}년도</td>
					<td>${recordsList.recSem}학기</td>
					<td class="applyPer">${recordsList.recPer}년</td>
					<td class="applyRecDt" data-value="${recordsList.recDt }" ><fmt:formatDate value="${recordsList.recDt }" pattern="yy/MM/dd"  /></td>
					<c:if test="${recordsList.recYn eq '반려'}">
					<td class="applyState" style="color: red;">${recordsList.recYn }</td>
					</c:if> 
					<c:if test="${recordsList.recYn eq '승인대기'}">
					<td class="applyState"  style="color: black;">${recordsList.recYn }</td>
					</c:if> 
					<c:if test="${recordsList.recYn eq '승인'}">
					<td class="applyState"  style="color: blue;">${recordsList.recYn }</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<!-- </div> -->
</div>
<div class="row">
<div class="col-12 pr-0	" style="text-align: end;">
	<!-- 			<button class="btn btn-sm btn-outline-primary" >신청</button> -->
	<button id="applyBtn" class="btn btn-primary"data-toggle="modal" data-target="#modal-default">신청</button>
</div>
</div>

<!-- 신청 모달-->
<div class="modal fade show" id="modal-default"
	style="display: none; padding-right: 17px;" aria-modal="true"
	role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" style="top:100px;">
			<div class="modal-header" style="background-color: #001F3F;color:white;">
				<h5 class="modal-title">학적변동 신청서 작성</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"style="color:white;">×</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- 모달바디 -->
				<form id="form" action="/record/applyPost" class="row" method="post" target='blankifr'
					onsubmit="return checkFormData()" style="height: 100%;margin: 0 auto;padding: 0;">
					<div class="alert alert-light" role="alert"
						style="font-size: 0.9em; padding: 1em; border: 1px solid #eee; width: 100em;">
						<p>
							<strong>※ 안내사항</strong> <br>
							<br> (1)<strong> 학적구분</strong>선택 후 학기 및 기간을 선택하여 주세요<br>
							<!-- 						 - 시험 기간 미설정시, 등록 직후 바로 시험에 응시 가능합니다.<br> -->
							<!-- 						 - <strong>기간을 설정하지 않고 문제를 등록하여 문제 유출이 되는 경우가 종종 발생합니다.</strong><br> -->
							<br> (2) 학적구분에 따라 선택할수 있는 옵션이 달라집니다<br> - <strong>활성화된
								옵션</strong>만 입력이 가능합니다.<br> <br> (3) 이름 및 신청날짜는 자동 입력됩니다<br>
							<br> (4) *는 필수 선택/입력 정보입니다.
						</p>
					</div>
					<input style="margin: 0px; padding: 0px;" type="hidden"
						name="stuNo" value="<%=stuNo%>"> <input
						style="margin: 0px; padding: 0px;" type="hidden" name="recYn"
						value="AP002"> <input style="margin: 0px; padding: 0px;"
						type="hidden" id="recSem" name="recSem">
					<div class="col-12 segmented-control2"
						style="width: 330px; padding: 0px; vertical-align: middle;">
						<input type="radio" name="rgbCd" value="RCD001" id="tab-3" checked /><label
							for="tab-3" class="segmented-control__3"><p>휴학</p></label> <input
							type="radio" name="rgbCd" value="RCD003" id="tab-4" /> <label
							for="tab-4" class="segmented-control__5"><p>복학</p></label> <input
							type="radio" name="rgbCd" value="RCD004" id="tab-5" /> <label
							for="tab-5" class="segmented-control__6"><p>자퇴</p></label> <input
							type="radio" name="rgbCd" value="RCD005" id="tab-6" /> <label
							for="tab-6" class="segmented-control__7"><p>졸업</p></label> <label
							class="col-sm-1" style="color: black; margin: 0px;"
							for="segmented-control2">&nbsp;*</label>
					</div>
					<!-- 				<label>&nbsp;학기 선택*&nbsp;</label> -->
					<div class="form-group col-12" >
						<select class="col-4 custom-select rounded-0" id="recYr"
							name="recYr">
							<option selected>년도</option>
						</select>

						<button class="btn btn-secondary" type="button" id="currentSem"></button>
						<button class="btn btn-secondary" type="button" id="nextSem"></button>
						<label id="selectedYRSEMlabel">&nbsp;*<code
								style="color: blue" id="selectedYRSEM"></code></label>
					</div>
					<div class="form-group col-12" style="margin:0px;">
						<select class="col-4 custom-select rounded-0" id="recPer"
							name="recPer" required="required">
							<option>기간</option>
							<option value="1">1년</option>
							<option value="2">2년</option>
						</select>
						<code>&nbsp;[휴학 선택시]</code>
					</div>
					<div class="form-group col-12" style="margin:0px;">
						<label for="exampleInputBorder">신청자*</label> <input type="text"
							class="col-4 form-control form-control-border"
							id="exampleInputBorder" readonly value="<%=name%>">
					</div>
					<div class="form-group col-12" style="margin:0px;">
						<label for="exampleInputRounded0">사유</label> <br>
						<div class="row">
							<textarea class="col-11 form-control" rows="3" name="recRsn"
								id="recRsn" required="required" placeholder="사유를입력하여주세요"
								style="margin-left: 10px;"></textarea>
						</div>
					</div>
					<sec:csrfInput />
				</form>

				<!-- 모달바디 -->
			</div>
			<div class="modal-footer justify-content-align">
			<button type="button" id="insertData" class="btn btn-outline-primary">자동 입력</button>
				<button type="submit" form="form"
					class="btn btn-outline-primary">등록</button>
				<a onclick="dataReset()" class="btn btn-outline-secondary">작성취소</a>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 신청 모달 -->
<!-- 수정,삭제 모달-->
<div class="modal fade show" id="modal-modify"
	style="display: none; padding-right: 17px;" aria-modal="true"
	role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" style="top:100px;">
			<div class="modal-header" style="background-color: #001F3F;color:white;">
				<h5 class="modal-title">학적변동 신청서 수정</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"style="color:white;">×</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- 모달바디 -->
<!-- 				<form id="form" action="/record/applyPost" class="row" method="post" -->
<!-- 					onsubmit="return checkFormData()" style="height: 100%;margin: 0 auto;padding: 0;"> -->
					<div class="alert alert-light" role="alert"
						style="font-size: 0.9em; padding: 1em; border: 1px solid #eee; width: 100%;">
						<p>
							<strong>※ 수정시 안내 및 주의 사항</strong> <br>
							<br> (1)&nbsp;<strong>기간/사유</strong>외에는 수정 할 수 없습니다<br>
							<br> (2)&nbsp;수정할 수 없는 값이 입력되었다면 <strong style="color:red">삭제</strong>후 재 신청 바랍니다<br>
							<br> (3)&nbsp;<strong style="color:blue">졸업</strong>&nbsp;및&nbsp;<strong style="color:blue">복학</strong>&nbsp;신청은&nbsp;수정 할 수 없습니다.<br>
						</p>
					</div>
					<div class="col-sm-4">
					<label>구분*</label>
					</div>
					<div class="form-group col-12">
						<input type="text"class="col-4 form-control form-control-border"id="modifyRgbCd" readonly />
					</div>
					<div class="col-sm-4">
					<label>년도*</label></div>
					<div class="form-group col-12" >
						<input type="text"class="col-4 form-control form-control-border"id="modifyRecYr" readonly /> 
					</div>
					<div class="col-sm-4">
					<label>학기*</label></div>
					<div class="form-group col-12" >
						<input type="text"class="col-4 form-control form-control-border"id="modifyRecSem" readonly /> 
					</div>
					<div class="form-group col-12" style="margin:0px;">
						<select class="col-4 custom-select rounded-0" id="modifyRecPer" >
							<option>기간</option>
							<option value="1">1년</option>
							<option value="2">2년</option>
						</select>
						<code>&nbsp;[휴학 선택시*]</code>
					</div>
					<br>
					<div class="form-group col-12" style="margin:0px;">
						<label for="exampleInputBorder">신청자*</label> <input type="text"
							class="col-4 form-control form-control-border"
							id="exampleInputBorder" readonly value="<%=name%>">
					</div>
					<br>
					<div class="form-group col-12" style="margin:0px;">
						<label for="exampleInputRounded0">사유</label> <br>
						<div class="row">
							<textarea class="col-11 form-control" rows="3" id="modifyRecRsn"required="required" placeholder="사유를입력하여주세요"style="margin-left: 10px;"></textarea>
						</div>
					</div>

				<!-- 모달바디 -->
			</div>
			<div class="modal-footer justify-content-align">
				<button type="button" id="modifyApply"class="btn btn-outline-primary">수정</button>
				<button type="button" id="deleteApply"class="btn btn-outline-danger">삭제</button>
<!-- 				<a onclick="dataReset()" class="btn btn-outline-secondary">작성취소</a> -->
				<button id="closeModifyModal" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 수정 삭제 모달 -->
<script type="text/javascript">
		let header = "${_csrf.headerName}";
		let token = "${_csrf.token}";
		//option에 append 해줄 변수 // 현재년도/다음년도/현재학기/다음학기/체크된라디오
		let setCurrentRecYr,setNextRecYr,setCurrentSemester,setNextSemester,checkedRgbCdValue ="";
		//option value에 담을 변수
		let month,year,nextYear,currentSemester,nextSemester = ""; 
		let date = new Date();
		
		//내년도가있는지, 구분이변경되었는지, 승인된 학적변동 사항이 있는지 체크하는 플래그변수
		let nextYearExist,rgbCdisChanged,confirmedApplyIsExist = false;
		let linkval,applyState = "";
		let setModifyData = {
			recCd : "",
			rgbCd: "",
			recYr:"",
			recSem:"",
			recPer:"",
			recRsn:""
		};
		
		/**
		 *  yyyyMMdd 포맷으로 반환
		 */
		function getFormatDate(date){
		    var year = date.getFullYear();              //yyyy
		    var month = (1 + date.getMonth());          //M
		    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
		    var day = date.getDate();                   //d
		    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
		    return  year + '/' + month + '/' + day;       //'`-' 추가하여 yyyy-mm-dd 형태 생성 가능
		}
		
		$(document).ready(function(){
			$("#recordStateNow").text($("#stuRgb").val());
    	    $("#recordApplyDate").text("없음");
    	    $("#recordEndDate").text("없음");
    	    $("#recordStateEtc").text("없음");
			year = date.getFullYear(); //년도 recYr
			month = date.getMonth()+1;
		    if (month == '1' || month == '2' || month == '3' || month == '4' || month == '5' || month == '6') currentSemester = 1;
			else if (month == '7' || month == '8' || month == '9' || month == '10' || month == '11' || month == '12') currentSemester = 2;
		    setRecYr();//현재년도가 2학기일경우 현재년도 + 다음년도
		    applyState = document.querySelectorAll(".applyState");
		    applyState.forEach(apply=>{
		    	if(apply.innerHTML == '반려'){
		    		var parent = apply.parentNode;
		    	    parent.removeAttribute("data-target");
		    	    parent.removeAttribute("data-toggle");
		    	}
		    	if(apply.innerHTML == '승인'){
		    		$("#applyBtn").attr("disabled","disabled");
		    	    var parent = apply.parentNode;
		    	    parent.removeAttribute("data-target");
		    	    parent.removeAttribute("data-toggle");
		    	    
		    	    var tds = parent.getElementsByTagName('td');
		    	    
		    	    if(tds[1].innerHTML == '휴학'){
					//날짜 계산
		    	     var confirmedPer = Number(tds[4].innerHTML.substring(0,1));//기간
		    	     console.log("기간 : " + confirmedPer);
		    	     var confirmedReg = tds[5].dataset.value;//신청일
		    	     
		    	     var confirmedRegDateStr = confirmedReg;
		    	     var confirmedRegDateToDate = new Date(confirmedRegDateStr.replace(/(\w+ \w+ \d+) [0-9:]+ KST (\d+)/, "$1 $2"));
		    	     var confirmedRegDateToDateSet = [confirmedRegDateToDate.getFullYear(),
		    	    	 			('0'+(confirmedRegDateToDate.getMonth()+1)).slice(-2),
		    	    	 			('0'+confirmedRegDateToDate.getDate()).slice(-2)].join('-');
		    	     
		    	     var confirmedRegDay = new Date(confirmedRegDateToDateSet);
					var endConfirmedReg = new Date(confirmedRegDay.setFullYear(confirmedRegDay.getFullYear() + confirmedPer));
// 		    	     console.log("신청일 날짜 :"  + confirmedRegDay);
// 					var endConfirmedReg = new Date(confirmedRegDay.setMinutes(confirmedRegDay.getMinutes() + 1));//test 1분후
// 		    	     console.log("신청일로부터 1년후 : " + endConfirmedReg);
					  
// 					console.log("현재날짜 : " + date);
// 					console.log("마감날짜 : " + endConfirmedReg);
					
					 //나의 학적 정보
		    	    $("#recordStateNow").text(tds[1].innerHTML);
		    	    $("#recordApplyDate").text(tds[5].innerHTML);
		    	    $("#recordEndDate").text(getFormatDate(endConfirmedReg).substring(2,10));
		    	    
		    	    if (Math.abs(confirmedRegDay.getTime() - endConfirmedReg.getTime()) === confirmedPer * 31536000000) {  // 31536000000 is the number of milliseconds in one year
						  Swal.fire({
							  icon: 'info',
							  title: '학적 변동 신청 가능합니다!',
							})
					  $("#applyBtn").removeAttr("disabled");
					  tds[6].innerHTML = "처리완료";
					  tds[6].style.color = "black";
					}
	    	      } else { //복학,자퇴,졸업
		    	    var parent = apply.parentNode;
    	    	    var tds = parent.getElementsByTagName('td');
    	    	    $("#applyBtn").attr("disabled","disabled");
		    	    parent.removeAttribute("data-target");
		    	    parent.removeAttribute("data-toggle");
    	    	  	$("#recordStateNow").text(tds[1].innerHTML);
		    	    $("#recordApplyDate").text("");
		    	    $("#recordEndDate").text("");
		    	    $("#recordStateEtc").text(tds[2].innerHTML+" "+tds[3].innerHTML+" "+tds[1].innerHTML+"예정");// 신청한 학기에 복학 예정
		    	    appliedRecordIsDone(tds[2].innerHTML,tds[3].innerHTML,tds[1].innerHTML);
	    	      }
		    	}
// 		    	if(apply.innerHTML == '승인대기'||apply.innerHTML == '처리완료'||apply == null){
// 		    		$("#recordStateNow").text($("#stuRgb").val());
// 		    	    $("#recordApplyDate").text("없음");
// 		    	    $("#recordEndDate").text("없음");
// 		    	    $("#recordStateEtc").text("없음");
// 		    	}
		    })
		  });
		
		function appliedRecordIsDone(appliedYear, appliedSem, appliedRgbCd){
			var yearNow = year;
			var semesterNow = currentSemester;
			if(appliedRgbCd == "복학"){
			  if(appliedYear == yearNow && appliedSem == semesterNow-1){
				  Swal.fire({
					  icon: 'info',
					  title: '학적 변동 신청 가능합니다!',
					})
			  $("#applyBtn").removeAttr("disabled");
			  tds[6].innerHTML = "처리완료";
			  tds[6].style.color = "black";
			  } else {
				  return;
			  }
			  if(appliedYear == yearNow+1 && appliedSem == semesterNow+1){
				  Swal.fire({
					  icon: 'info',
					  title: '학적 변동 신청 가능합니다!',
					})
			  $("#applyBtn").removeAttr("disabled");
			  tds[6].innerHTML = "처리완료";
			  tds[6].style.color = "black";
			  } else {
				  return;
			  }
			  return;
			}
		}
			
		var tds = document.querySelectorAll('td');
		tds.forEach(td=>{
		td.addEventListener('click', function() {
			$("#modifyRecPer").removeAttr("disabled");
			 $("#modifyRecRsn").removeAttr("disabled");
			  $("#modifyApply").removeAttr("disabled");
			  var row = this.parentNode;
			  var cells = row.querySelectorAll('td');
			  linkval = cells[0].dataset.value;
			  if(cells[1].innerHTML != '휴학'){
				  $("#modifyRecPer").attr("disabled","disabled");
				  if(cells[1].innerHTML == '졸업' || cells[1].innerHTML == '복학'){
					  $("#modifyRecRsn").attr("disabled","disabled");
					  $("#modifyApply").attr("disabled","disabled");
					  Swal.fire({
						  icon: 'warning',
						  title: '수정 할 수 없습니다. 삭제 후 재 신청해주세요',
					  })
				  }
			  }
			  setModifyData.recCd = linkval
			  $.ajax({
				  url:"/record/applyDetail",
				  type:"POST",
				  data:JSON.stringify(setModifyData),
				  dataType:"JSON",
				  contentType:'application/json;charset=utf-8',
				  beforeSend: function (xhr) {
						xhr.setRequestHeader(header, token);
					},
				  success:function(data){
// 					 alert(JSON.stringify(data));

					$("#modifyRgbCd").val(data.rgbCd);
					$("#modifyRecYr").val(data.recYr);
					$("#modifyRecSem").val(data.recSem);
					for(var i =0;i<$("#modifyRecPer").find('option').length;i++){
						if($("#modifyRecPer option:eq("+i+")").val() == data.recPer){
							$("#modifyRecPer option:eq("+i+")").prop("selected",true);
						}
					$("#modifyRecRsn").val(data.recRsn);
					}
				  }
			  });
			});
		})
		
		$("#modifyApply").on("click",function(){
			if($("#modifyRecPer option:selected").val() == $("#modifyRecPer option:eq(0)").val()){
				  Swal.fire({
					  icon: 'error',
					  title: '기간을 선택해주세요',
					})
				return;
			}
			if($("#modifyRecRsn").val() == null ||$("#modifyRecRsn").val() == '' ){
				  Swal.fire({
					  icon: 'error',
					  title: '사유를 작성해주세요',
					})
				return;
			} 
			if($("#modifyRgbCd").val() == '휴학'||$("#modifyRgbCd").val() == '자퇴'){ //휴학,자퇴 일때
				if(!($("#modifyRecRsn").val().length >= 10)){
					Swal.fire({
						  icon: 'error',
						  title: '사유는 10글자 이상 작성해주세요',
						})
					return false;
				}
			}
			setModifyData.recPer = $("#modifyRecPer option:selected").val();
			setModifyData.recRsn = $("#modifyRecRsn").val();
			$.ajax({
				  url:"/record/applyModify",
				  type:"POST",
				  data:JSON.stringify(setModifyData),
				  dataType:"JSON",
				  contentType:'application/json;charset=utf-8',
				  beforeSend: function (xhr) {
						xhr.setRequestHeader(header, token);
					},
				  success:function(data){
					  Swal.fire(
			                    '수정 완료',
			                    '정상적으로 수정 되었습니다.',
			                    'success'
			                ).then(function(){
					        	window.location.reload(true);			        	
					        });
				  }
			})
		})
		$("#deleteApply").on("click",function(){
			Swal.fire({
				  title: '등록된 신청을 삭제 하시겠습니까?',
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '삭제',
				  cancelButtonText: '취소'
				}).then((result) => {
				  if (result.isConfirmed) {
				      $.ajax({
				  url:"/record/applyDelete",
				  type:"POST",
				  data:JSON.stringify(setModifyData),
				  dataType:"JSON",
				  contentType:'application/json;charset=utf-8',
				  beforeSend: function (xhr) {
						xhr.setRequestHeader(header, token);
					},
				  success:function(data){
					  Swal.fire(
			                    '삭제 완료',
			                    '정상적으로 삭제 되었습니다.',
			                    'success'
			                ).then(function(){
					        	window.location.reload(true);			        	
					        });
				  }	
				})
			  }
			});
			  return;
			
		})
		
		$("#nextSem").on("click",function(){
			if($("#recYr option:selected").val() == $("#recYr option:eq(0)").val()){
				Swal.fire({
					  icon: 'error',
					  title: '년도를 먼저 선택해 주세요',
					})
				return;
			}
			var sem = this.innerHTML
			$("input[name='recSem']").val(sem.substr(0,1));
			var yr = $("select[name=recYr] :selected").val();
			$("#selectedYRSEM").html("&nbsp;"+ yr +"년도 "+ sem + "입니다");
		});
		
		$("#currentSem").on("click",function(){
			if($("#recYr option:selected").val() == $("#recYr option:eq(0)").val()){
				Swal.fire({
					  icon: 'error',
					  title: '년도를 먼저 선택해 주세요',
					})
				return;
			}
			var sem = this.innerHTML
			$("input[name='recSem']").val(sem.substr(0,1));
			var yr = $("select[name=recYr] :selected").val();
			$("#selectedYRSEM").html("&nbsp;"+ yr +"년도 "+ sem + "입니다");
		});
		
		$("#recYr").change(function(){
			if($("input[type='radio'][name='rgbCd']:checked").val() == 'RCD001'){ //휴학일 경우에만 현재학기 선택 가능
				if($("#recYr option:selected").val() == nextYear){
					$("#nextSem").show();
					$("#currentSem").hide();
					return;
				} else {
					$("#currentSem").show();
					$("#nextSem").hide();
					return;
				}
			} 
				return;
		});
		
		function resetYRSEM(){
			if(rgbCdisChanged){
			$("#recYr option:eq(0)").prop("selected",true);
			$("#recPer option:eq(0)").prop("selected",true);
			$("#recSem option:eq(0)").prop("selected",true);
			$("#currentSem").hide();
			$("#nextSem").hide();
			$("#recRsn").val("");
		    $("#recRsn").removeAttr('disabled');
		    $("#recPer").removeAttr("disabled");
		    $("#recRsn").attr("required",false);
		    $("#recPer").attr("required",false);
		    $("#selectedYRSEM").html("");
			rgbCdisChanged = false;
			 recPerValidation = false;
		 	  recRsnValidation = false;
			return;
			}
			return;
		}
		
		$("input[type='radio'][name='rgbCd']").change(function() {
			rgbCdisChanged = true;
			resetYRSEM();
			//복학이나 졸업을 선택할 경우 사유를 적지 않아도 된다
			 checkedRgbCdValue =$("input[type='radio'][name='rgbCd']:checked").val();
			switch (checkedRgbCdValue) {
				  case 'RCD001'://휴학 현학기 다음학기 기간 니맘대로 사유o
				  nextYearViewOnlyRCD001();
				  $("#recRsn").attr("required","required");
				  $("#recPer").attr("required","required");
		 		  break;
				  case 'RCD003'://복학 무조건 다음학기 기간x 사유x
				  nextYearViewOnlyRCD001();
				  $("#nextSem").show();
				  $("#recRsn").attr('disabled','disabled');
				  $("#recPer").attr("disabled",'disabled');
				    break;
				  case 'RCD004'://자퇴 무조건 현학기 기간x 사유o
				  nextYearViewOnlyRCD001();
				  $("#currentSem").show();
				  $("#recPer").attr("disabled","disabled");
				  recRsnValidation = true;
				  $("#recRsn").attr("required","required");
				    break;
				  case 'RCD005'://졸업 무조건 다음학기 기간x 사유x
				  nextYearViewOnlyRCD001();
				  $("#nextSem").show();
				  $("#recRsn").attr('disabled',"disabled");
				  $("#recPer").attr("disabled","disabled");
				    break;
				}
		});
	/*recYr select option에 nextYear 값이 있다면 휴학일때는 선택할 수 있지만 
	  휴학이 아닐때는 다음학기(내년도 1학기)만 선택 하여야 한다.
	*/
	function nextYearViewOnlyRCD001(){
		if(nextYearExist){//내년이 존재하나요?(2학기있나요?)
			if($("input[type='radio'][name='rgbCd']:checked").val()=='RCD001'){//휴학이면 리턴
				$("#recYr option:eq(1)").removeAttr("disabled");
				$("#recYr option:eq(2)").removeAttr("disabled");
				return;
			} 
			if($("input[type='radio'][name='rgbCd']:checked").val()=='RCD004') {//자퇴면 현학기만
					$("#recYr option:eq(1)").removeAttr("disabled");
					$("#recYr option:eq(2)").attr("disabled","disabled");
					return;
			} else {
					$("#recYr option:eq(1)").attr("disabled","disabled");
					$("#recYr option:eq(2)").removeAttr("disabled");
					return;
			}
		}
		return;
	}		
	//현재 학기가 2학기일경우 nextYear를 다음년도로 
	function setRecYr(){
		//학기선택버튼 전체 가리기
		$("#currentSem").hide();
		$("#nextSem").hide();
// 		if(!(nextYear - year == 1)){nextYear--; return;}
		if(currentSemester == 2){//현재2학기면
			nextYearExist = true;
			nextYear = year + 1;//다음년도
			nextSemester = 1;//다음학기
			
			$("#currentSem").text(currentSemester+"학기");
			$("#nextSem").text(nextSemester+"학기");
			
			setCurrentRecYr = `<option value='\${year}'>\${year}년도</option>`;
			$("#recYr").append(setCurrentRecYr);
			setNextRecYr = `<option value='\${nextYear}'>\${nextYear}년도</option>`;
			$("#recYr").append(setNextRecYr);
			return;
			}
				
			//현재 2학기가아니면
			nextYearExist = false;
			nextSemester = currentSemester+1;
			setCurrentRecYr = `<option value='\${year}'>\${year}년도</option>`;
			$("#recYr").append(setCurrentRecYr);	
			$("#currentSem").text(currentSemester+"학기");
			$("#nextSem").text(nextSemester+"학기");
			
		}
	
	
	$.fn.clearForm = function () {
		  return this.each(function () {
		    var type = this.type,
		      tag = this.tagName.toLowerCase();
		    if (tag === 'form') {
		      return $(':input', this).clearForm();
		    }
		    if (
// 		      type === 'text' ||
// 		      type === 'password' ||
// 		      type === 'hidden' ||
		      tag === 'textarea'
		    ) {
		      this.value = '';
// 		    } else if (type === 'checkbox' || type === 'radio') {
// 		      this.checkedIndex = 0;
		    } else if (tag === 'select') {
		      this.selectedIndex = 0;
		    }
		  });
		};
	
	function checkFormData(){
		if($("input[type='radio'][name='rgbCd']:checked").val() == 'RCD001'||$("input[type='radio'][name='rgbCd']:checked").val() == 'RCD004'){ //휴학,자퇴 일때
			if(!($("#recRsn").val().length >= 10)){
				Swal.fire({
					  icon: 'error',
					  title: '사유는 10글자 이상 작성해주세요',
					})
				return false;
			}
		}
		
		if($("#recYr option:selected").val() == $("#recYr option:eq(0)").val()){
			Swal.fire({
				  icon: 'error',
				  title: '년도 선택해 주세요',
				})
			return false;
		}
		
		if($("#recSem").val() == "" || $("#recSem").val() == null){
			Swal.fire({
				  icon: 'error',
				  title: '학기를 선택해주세요',
				})
		    return false;
		} 
		
		var checkPer = $("input[type='radio'][name='rgbCd']:checked").val() == 'RCD001'
			?  $("#recPer option:checked").val() == $("#recPer option:eq(0)").val()
					?  true   :  false 
						:	false ;
		if(checkPer){
		Swal.fire({
		icon: 'error',
		title: '기간을 선택해주세요',
		})
		return false;	
		} 
		Swal.fire({
			  title: '신청 완료되었습니다.',
			  text: "상담 페이지로 이동 하시겠습니까?",
			  icon: 'success',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '네 이동합니다',
			  cancelButtonText: '아니요'
			}).then((result) => {
			  if (result.isConfirmed) {
				  $("#form").attr("target","blankifr");
				  location.href = "/counsel/studentside/applyList?stuNo="+$("input[name='stuNo']").val();
// 				  return true;
			  } else {
				  $("#form").removeAttr("target");
				  location.href = "/record/main?stuNo="+$("input[name='stuNo']").val();
				  
			  }
			});
		
		
	}
		
	function dataReset(){
		Swal.fire({
			  title: '작성을 취소하시겠습니까?',
			  text: "작성한 내용이 모두 지워집니다",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '삭제',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.isConfirmed) {
			    Swal.fire(
			      '삭제완료',
			      '작성 내용 모두 삭제 되었습니다',
			      'success',
			    )
			      $("#selectedYRSEM").html("");
			      $("#form").clearForm();
			  }
			});
			  return;
	}
	
	$("#insertData").on("click",function(){
		$("#recYr option:eq(1)").prop("selected",true);
		$("#recPer option:eq(1)").prop("selected",true);
		$("#recRsn").val("건강상의 이유로 휴학 신청합니다.")
	})
</script>
