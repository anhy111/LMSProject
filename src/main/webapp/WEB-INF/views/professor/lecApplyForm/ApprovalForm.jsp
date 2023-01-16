<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의계획서 상세페이지</title>
<link rel="stylesheet" href="/resources/css/inquiry1.css">
<link rel="stylesheet" href="/resources/css/inquiry2.css">
</head>
<body>
	<div id="realFormBody">
	
	<span id="lecApplyTitle">강의계획서 상세</span>
	
<!-- 	<div id="div4btns"> -->
<!-- 		<button id="close" onclick="fn_close()" type="button" class="btn btn-secondary">닫기</button> -->
<!-- 	</div> -->
	
	<br><br>
	
	<ul class="nav nav-pills nav-justified form-wizard-header mb-3"
	style="width:100%;margin-left:1px;">
        <li class="nav-item">
            <a id="firstLecApplyLi" href="#account-2" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 pt-2 pb-2 active">
                <i class="mdi mdi-account-circle me-1"></i>
                <span class="d-none d-sm-inline">기본사항</span>
            </a>
        </li>
        <li class="nav-item">
            <a id="secondLecApplyLi" href="#profile-tab-2" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 pt-2 pb-2">
                <i class="mdi mdi-pencil"></i>
                <span class="d-none d-sm-inline">세부사항</span>
            </a>
        </li>
        <li class="nav-item">
            <a id="thirdLecApplyLi" href="#finish-2" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 pt-2 pb-2">
                <i class="mdi mdi-clock-time-nine-outline"></i>
                <span class="d-none d-sm-inline">시간표</span>
            </a>
        </li>
    </ul>
	    
	<div id="blockNum1">
	    <p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;교수정보</p>
	    <table class="lecApplyTable" border="1">
	    	<tr>
	    		<th>담당교수</th>
	    		<td><input type="text" name="empNm" size=30 value="${professor.empNm }" disabled></td>
	    		<th>교수소속</th>
	    		<td><input type="text" name="empAddr1" size=30 value="${professor.empAddr1 }" disabled></td>
	    	</tr>
	    	<tr>
	    		<th>학과전화</th>
	    		<td><input type="text" name="depTel" size=30 value="${professor.depTel }" disabled></td>
	    		<th>교수전화</th>
	    		<td><input type="text" name="empTel" size=30 value="${professor.empTel }" disabled></td>
	    	</tr>
	    </table>
	    
	    <br><br>
	    <p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;강의 기본사항</p>
	    <table class="lecApplyTable" border="1" style="z-index: 9000;">
	    	<tr>
	    		<th>년도</th>
	    		<td>
	    			<input type="text" name="lecaYr" size=30 value="${lecApplyList[0].lecaYr }년" disabled>
	    		</td>
	    		<th>학기</th>
	    		<td>
	    			<input type="text" name="lecaSem" size=30 value="${lecApplyList[0].lecaSem }학기" disabled>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>대상학년</th>
	    		<td>
	    			<input type="text" name="lecaTrg" size=30 value="${lecApplyList[0].lecaTrg }학년" disabled>
	    		</td>
	    		<th>학점</th>
	    		<td>
	    			<input type="text" name="lecaCrd" size=30 value="${lecApplyList[0].lecaCrd }학점" disabled>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>강의명</th>
	    		<td>
	    			<input type="text" name="lecaNm" size=30 value="${lecApplyList[0].lecaNm }" disabled>
	    		</td>
	    		<th>이수구분</th>
	    		<td>
	    			<input type="text" name="lecaCate" size=30 value="${lecApplyList[0].lecaCate }" disabled>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>과목 카테고리</th>
	    		<td>
		    		<input type="text" name="subNm" size=30 value="${lecApplyList[0].subNm }" disabled>
	    		</td>
	    		<th>과목번호</th>
	    		<td>
	    			<input type="text" name="subCd" size=30 value="${lecApplyList[0].subCd }" disabled>
	    		</td>
	    	</tr>
	    </table>
	    
	    <div data-simplebar id="autoMaker" style="display:none; z-index:9001;"></div>
    </div>
    
    <div id="blockNum2">
    	<p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;강의 세부사항</p>
    	<table class="lecApplyTable" border="1" style="z-index: 9000;">
    		<tr>
	    		<th>수업개요</th>
	    		<td colspan="5">
	    			<textarea id="lecaCon" name="lecaCon" rows="3" cols="90" disabled>${lecApplyList[0].lecaCon }</textarea>
	    		</td>
	    	</tr>
    		<tr>
	    		<th>교재 및 <br>참고문헌</th>
	    		<td colspan="5">
	    			<textarea id="lecaBook" name="lecaBook" rows="3" cols="90" disabled>${lecApplyList[0].lecaBook }</textarea>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>성적평가방식</th>
	    		<td colspan="2">
	    			<input type="text" name="lecaGrade" size=30 value="${lecApplyList[0].lecaGrade }" disabled>
	    		</td>
	    		<th>최대정원</th>
	    		<td colspan="2">
	    			<input type="text" id="lecaCap" name="lecaCap" value="${lecApplyList[0].lecaCap }" disabled>명
	    		</td>
	    	</tr>
	    	<tr>
	    		<th rowspan="2">평가방법(%)</th>
	    		<td style="width:116px; font-weight:bold; text-align:center;">중간고사</td>
	    		<td style="width:116px; font-weight:bold; text-align:center;">기말고사</td>
	    		<td style="width:116px; font-weight:bold; text-align:center;">과제</td>
	    		<td style="width:116px; font-weight:bold; text-align:center;">출결</td>
	    	</tr>
	    	<tr>
	    		<td style="width:116px; text-align:center;"><input type="text" id="lecaMp" name="lecaMp" value="${lecApplyList[0].lecaMp }" size=5 disabled>%</td>
	    		<td style="width:116px; text-align:center;"><input type="text" id="lecaFp" name="lecaFp" value="${lecApplyList[0].lecaFp }" size=5 disabled>%</td>
	    		<td style="width:116px; text-align:center;"><input type="text" id="lecaTp" name="lecaTp" value="${lecApplyList[0].lecaTp }" size=5 disabled>%</td>
	    		<td style="width:116px; text-align:center;"><input type="text" id="lecaAp" name="lecaAp" value="${lecApplyList[0].lecaAp }" size=5 disabled>%</td>
	    	</tr>
    	</table>
    	
    	<br><br>
	    
	    <p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;강의 계획</p>
	    <table id="lecWeekPlan" class="lecApplyTable" border="1" style="z-index: 9000;">
	    	<tr><th>1주차</th><td colspan="5"><textarea id="weekPlan1" rows="2" cols="90" disabled>${weekPlanList[0].wpCon }</textarea></td></tr>
	    	<tr><th>2주차</th><td colspan="5"><textarea id="weekPlan2" rows="2" cols="90" disabled>${weekPlanList[1].wpCon }</textarea></td></tr>
	    	<tr><th>3주차</th><td colspan="5"><textarea id="weekPlan3" rows="2" cols="90" disabled>${weekPlanList[2].wpCon }</textarea></td></tr>
	    	<tr><th>4주차</th><td colspan="5"><textarea id="weekPlan4" rows="2" cols="90" disabled>${weekPlanList[3].wpCon }</textarea></td></tr>
	    	<tr><th>5주차</th><td colspan="5"><textarea id="weekPlan5" rows="2" cols="90" disabled>${weekPlanList[4].wpCon }</textarea></td></tr>
	    	<tr><th>6주차</th><td colspan="5"><textarea id="weekPlan6" rows="2" cols="90" disabled>${weekPlanList[5].wpCon }</textarea></td></tr>
	    	<tr><th>7주차</th><td colspan="5"><textarea id="weekPlan7" rows="2" cols="90" disabled>${weekPlanList[6].wpCon }</textarea></td></tr>
	    	<tr><th>8주차</th><td colspan="5"><textarea id="weekPlan8" rows="2" cols="90" disabled>중간고사</textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>9주차</th><td colspan="5"><textarea id="weekPlan9" rows="2" cols="90" disabled>${weekPlanList[8].wpCon }</textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>10주차</th><td colspan="5"><textarea id="weekPlan10" rows="2" cols="90" disabled>${weekPlanList[9].wpCon }</textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>11주차</th><td colspan="5"><textarea id="weekPlan11" rows="2" cols="90" disabled>${weekPlanList[10].wpCon }</textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>12주차</th><td colspan="5"><textarea id="weekPlan12" rows="2" cols="90" disabled>${weekPlanList[11].wpCon }</textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>13주차</th><td colspan="5"><textarea id="weekPlan13" rows="2" cols="90" disabled>${weekPlanList[12].wpCon }</textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>14주차</th><td colspan="5"><textarea id="weekPlan14" rows="2" cols="90" disabled>${weekPlanList[13].wpCon }</textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>15주차</th><td colspan="5"><textarea id="weekPlan15" rows="2" cols="90" disabled>${weekPlanList[14].wpCon }</textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>16주차</th><td colspan="5"><textarea id="weekPlan16" rows="2" cols="90" disabled>기말고사</textarea></td></tr>
	    </table>
	    <div class="d-grid">
		    <button type="button" id="showMoreTrs" class="btn btn-secondary" style="width:250px;">더 보기</button>
		    <button type="button" id="showLessTrs" class="btn btn-secondary" style="width:250px; display:none;">닫기</button>
		</div>
    </div>
    
    <div id="blockNum3" class="mb-0">
    	<p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;시간표</p>
    	<div class="row pl-4">
	    	<div class="col-2 ">
		  		<select id="building" class="select2bs4 select2-hidden-accessible col-2 offset-1" style="width: 100%;" aria-hidden="true">
					<option value="0">건물</option>
					<c:forEach var="building" items="${buildingList}">
					<option value="${building.bldCd}">${building.bldSnm}</option>
					</c:forEach>
				</select>
			</div>
	    	<div class="col-2">
		  		<select id="room" class="select2bs4 select2-hidden-accessible col-2 offset-1" style="width: 100%;" aria-hidden="true">
					<option value="0">강의실</option>
				</select>
			</div>
		</div>
    	<div id="blockNum3TimeTable" style="float : left; width : 400px;">
    		<table id="timeTableChoice" border="1">
    			<tr><th style="width : 70px;"></th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th></tr>
    			<tr><th>1교시</th><td></td><td></td><td></td><td></td><td></td></tr>
    			<tr><th>2교시</th><td></td><td></td><td></td><td></td><td></td></tr>
   				<tr><th>3교시</th><td></td><td></td><td></td><td></td><td></td></tr>
   				<tr><th>4교시</th><td></td><td></td><td></td><td></td><td></td></tr>
   				<tr><th>5교시</th><td></td><td></td><td></td><td></td><td></td></tr>
   				<tr><th>6교시</th><td></td><td></td><td></td><td></td><td></td></tr>
   				<tr><th>7교시</th><td></td><td></td><td></td><td></td><td></td></tr>
   				<tr><th>8교시</th><td></td><td></td><td></td><td></td><td></td></tr>
   				<tr><th>9교시</th><td></td><td></td><td></td><td></td><td></td></tr>
    		</table>
    	</div>
    	<div id="blockNum3Time" style="width : 400px; height : 300px;">
    		<p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;강의 시간</p>
    		<textarea id="textArea4time" rows="16" cols="45" disabled></textarea>
    	</div>
    </div>
    
    <div id="div4transitionBtns" style="clear : both;" class="mt-0">
	    <button id="previousBtn" type="button" class="btn btn-primary">이전</button>
		<button id="nextBtn" type="button" class="btn btn-primary">다음</button>
	</div>
    <div class="modal-footer justify-content-align">
		<div id="apprBtn1" style="display: none">
			<button type="button" class="btn btn-outline-warning" id="approve">승인</button>
			<button type="button" id="loadReferModal" class="btn btn-outline-danger">반려</button>
		</div>
		<div id="apprBtn2" style="display: none">
			<button type="button" id="cancelApprove" class="btn btn-outline-danger">승인취소</button>
		</div>
		<div id="apprBtn3" style="display: none">
			<button type="button" class="btn btn-outline-secondary" id="cancelMsg">반려 사유</button>
			<button type="button" id="cancelRefer" class="btn btn-outline-danger">반려취소</button>
		</div>
	</div>
	<div class="modal fade" id="referReasonWrite" style="display:none; z-index:1041" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">반려</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<label for="recRej" class="col-form-label">반려 사유를 입력해주세요.</label>
						<textarea class="form-control" id="reasonWrite" rows="7"></textarea>
					</div>
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" id="refer" value="AP003" class="btn btn-block btn-danger">반려</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="referReasonRead" style="display:none;z-index:1041" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">반려 사유</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<textarea class="form-control" id="reasonRead" rows="7" readonly></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
    </div>
</body>
<script src="/resources/adminlte/plugins/select2/js/select2.full.min.js"></script>
<script src="/resources/adminlte/dist/js/demo.js"></script>
<script type="text/javascript">
	var lecTimeTable = ${lecApplyList[0].lecaTt};
	var apprYn = "${approval.apprYn}";
	var apprRsn = "${approval.apprRsn}";
	var lecaCd = "${param.lecaCd}";
	var header = "${_csrf.headerName}";
	var token = "${_csrf.token}";
	var pageInit = true;
	
	console.log('apprYn : ' + apprYn);
	console.log("apprRsn : " + apprRsn);
	function initTimeTable(){
		if(lecTimeTable.length <= 0){
			return;
		}
		$("#building").val(lecTimeTable[0].bldCd)
						.prop("selected",true)
						.select2({ theme : 'bootstrap4' })
						.trigger("change");
	}
	
	function lecTimeTableToText(p_timeTable){
		let str = "";
		for(let i=0; i<p_timeTable.length; i++){
			str += p_timeTable[i].bldNm + " " + p_timeTable[i].roomNo + " " + p_timeTable[i].wk + " " + p_timeTable[i].time + "교시\n";
		}
		return str;
	}
	
	function highlightedTimeTable(){
		$('#timeTableChoice td').removeClass("highlighted");
		let room = $("#room").val();
		let timeTable = $('#timeTableChoice');
		// 기존에 선택된 교시는 색칠해주기
		for(let i=0; i<lecTimeTable.length; i++){
			if(room == lecTimeTable[i].roomCd){
				let x;
				switch(lecTimeTable[i].wk){
				case "월":
					x = 0;
					break;
				case "화":
					x = 1;
					break;
				case "수":
					x = 2;
					break;
				case "목":
					x = 3;
					break;
				case "금":
					x = 4;
					break;
				}
				timeTable.find("tr").eq(lecTimeTable[i].time).find("td").eq(x).toggleClass("highlighted");
			}
		}
	}
	
	window.onload = function() {
		
		//Initialize Select2 Elements
		$('.select2').select2();

		//Initialize Select2 Elements
		$('.select2bs4').select2({
			theme : 'bootstrap4'
		});
		
		//더보기 버튼을 누르면
		$('#showMoreTrs').on('click', function() {
			$('.switchTr').show();
			
	    	$('#showMoreTrs').hide();
	    	$('#showLessTrs').show();
		});
		//닫기 버튼을 누르면
		$('#showLessTrs').on('click', function() {
			$('.switchTr').hide();
			
	    	$('#showLessTrs').hide();
	    	$('#showMoreTrs').show();
		});
		
		
		//블록 클릭 시 div 변경 이벤트////////////////////////////////////////////////////////////////////////////
		if($('#firstLecApplyLi').hasClass("active")) {
			$('#blockNum1').show();
			$('#blockNum2').hide();
			$('#blockNum3').hide();
			$('#previousBtn').attr('disabled', true);
			$('#nextBtn').attr('disabled', false);
		}else if($('#secondLecApplyLi').hasClass("active")) {
			$('#blockNum1').hide();
			$('#blockNum2').show();
			$('#blockNum3').hide();
			$('#previousBtn').attr('disabled', false);
			$('#nextBtn').attr('disabled', false);
		}else if($('#thirdLecApplyLi').hasClass("active")) {
			$('#blockNum1').hide();
			$('#blockNum2').hide();
			$('#blockNum3').show();
			$('#previousBtn').attr('disabled', false);
			$('#nextBtn').attr('disabled', true);
		}
		
		$('#firstLecApplyLi').on('click', function() {
			$('#blockNum1').show();
			$('#blockNum2').hide();
			$('#blockNum3').hide();
			$('#previousBtn').attr('disabled', true);
			$('#nextBtn').attr('disabled', false);
		});
		$('#secondLecApplyLi').on('click', function() {
			$('#blockNum1').hide();
			$('#blockNum2').show();
			$('#blockNum3').hide();
			$('#previousBtn').attr('disabled', false);
			$('#nextBtn').attr('disabled', false);
		});
		$('#thirdLecApplyLi').on('click', function() {
			$('#blockNum1').hide();
			$('#blockNum2').hide();
			$('#blockNum3').show();
			$('#previousBtn').attr('disabled', false);
			$('#nextBtn').attr('disabled', true);
		});
		//////////////////////////////////////////////////////////////////////
		$('#previousBtn').on('click', function() {
			if($('#secondLecApplyLi').hasClass("active")) {
				$('#firstLecApplyLi').trigger('click');
			}else if($('#thirdLecApplyLi').hasClass("active")) {
				$('#secondLecApplyLi').trigger('click');
			}
		});
		$('#nextBtn').on('click', function() {
			if($('#firstLecApplyLi').hasClass("active")) {
				$('#secondLecApplyLi').trigger('click');
			}else if($('#secondLecApplyLi').hasClass("active")) {
				$('#thirdLecApplyLi').trigger('click');
			}
		});
		
		$("#timeTableChoice td").css("pointer-events","none");
		
		$("#building").on("change",function(){
			if(this.value == ""){
				return;
			}
			let data = {
				bldCd : this.value
			};
			
			$.ajax({
				url : "/professor/lecApplyForm/roomByBuildingList",
				type : "get",
				data : data,
				success : function(result){
					let str = "";
					if(!result.length){
						str += "<option value='0'>강의실</option>";
						str += "<option value='0'>강의실이 없습니다.</option>";
					} else{
						str += "<option value='0'>강의실</option>";
						$.each(result,function(p_inx, p_val){
							str += `<option value='\${p_val.roomCd}'>\${p_val.roomNo}</option>`;
						});
					}
					$("#room").html(str);
					
					if(pageInit){
						$("#room").val(lecTimeTable[0].roomCd)
									.prop("selected",true)
									.select2({ theme : 'bootstrap4' })
									.trigger("change");
						pageInit = false;
					}
				}
			})
		});
		
		$("#room").on("change",function(){
			highlightedTimeTable();
		});
		
		// 승인
		$("#approve").on("click",function(){
			approveMode();
			
			requestApprove('AP001');
		});
		
		// 반려사유작성
		$("#loadReferModal").on("click",function(){
			$("#referReasonWrite").modal('show');
			$("#reasonWrite").val("");
		});
		
		//반려
		$("#refer").on("click",function(){
			referMode();
			apprRsn = $("#reasonWrite").val();
			requestApprove('AP003', apprRsn);
		});
		
		//승인취소
		$("#cancelApprove").on("click",function(){
			pendingApproveMode();
			requestApprove('AP002');
		});
		
		//반려취소
		$("#cancelRefer").on("click",function(){
			pendingApproveMode();
			requestApprove('AP002');
		});
		
		//반려사유보기
		$("#cancelMsg").on("click",function(){
			$("#referReasonRead").modal('show');
			$("#reasonRead").val(apprRsn);
		});
		
		$("#textArea4time").html(lecTimeTableToText(lecTimeTable));
		initTimeTable();
		
		// 불러온 강의계획서의 결재상태에 따라 버튼 변경
		if(apprYn == '승인대기'){
			pendingApproveMode();
		}else if (apprYn == '승인') {
			approveMode();
		}else if (apprYn == '반려') {
			referMode();
		}
	}
	
	function approveMode(){
		$("#apprBtn1").hide();
		$("#apprBtn2").show();
		$("#apprBtn3").hide();
	}
	
	function pendingApproveMode(){
		$("#apprBtn1").show();
		$("#apprBtn2").hide();
		$("#apprBtn3").hide();
	} 
	
	function referMode(){
		$("#referReasonWrite").modal('hide');
		$("#apprBtn1").hide();
		$("#apprBtn2").hide();
		$("#apprBtn3").show();
	}
	
	function requestApprove(p_code,reason){
		let data = {
			apprYn : p_code,
			apprRsn : typeof reason == "undefined" ? "" : reason,
			apprCate : 'APC001',		
			apprTagCd : lecaCd,
			allocationList : timeTableSetLecaCd(lecTimeTable)
		}
		
		console.log("data : ", data);
		$.ajax({
			url : "/approval/updateApproval",
			type : "post",
			data : JSON.stringify(data),
			contentType : "application/json; charset=UTF-8",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(result){
				if(result <= 0){
					Swal.fire(
					      	"결재 실패",
					        "새로고침 후 다시시도해주세요.", // had a missing comma
					        "error"
				    )
				}
				
				let msg = '';
				switch(p_code){
				case 'AP001':
					msg = '결재';
					break;
				case 'AP002':
					msg = '취소';
					break;
				case 'AP003':
					msg = '반려';
					break;
				}
				Swal.fire(
	                    msg +' 완료',
	                    '정상적으로 '+msg+' 되었습니다.',
	                    'success'
	            ).then(function(){
	            	opener.location.reload();
	            	window.close();
	            });
			}
		})
	}
	
	function timeTableSetLecaCd(p_timeTable){
		let table = [];
		for(let i=0; i<p_timeTable.length; i++){
			table.push({
				lecaCd : lecaCd,
				roomCd : p_timeTable[i].roomCd,
				altDt : p_timeTable[i].wk,
				altTt : p_timeTable[i].time,
			});
		}
		return table;
	}
	
	function fn_close() {
		window.close();
	}
</script>
</html>