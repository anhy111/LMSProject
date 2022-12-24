<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- <script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script> -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/inputTemplate.css">
<style>
.segmented-control__3,.segmented-control__5,.segmented-control__6,.segmented-control__7{
width:90px;}
</style>
<% int stuNo = (int)session.getAttribute("no"); %>
 <div class="container">
	<div class="components">
		<form id="form" action="/record/applyPost" method="post" onsubmit="">
			<input type="hidden" name="stuNo" value="<%=stuNo%>"> <br>
			<input type="hidden" name="recYn" value="AP002"><!-- 승인여부 : 승인대기 공통코드 -->
			<div class="col-12">
				<div class="col-3">
					<h1>
						<label>학적 신청</label>
					</h1>
				</div>
			</div>
			<br>
			<div class="row">
				<br>
				<div class="col-12">
				<div class="col-sm-6 segmented-control2"style="width: 330px;padding:0px;">

					<input type="radio" name="rgbCd" value="RCD001" id="tab-3" checked /><label for="tab-3" class="segmented-control__3"><p>휴학</p></label>
					 <input type="radio" name="rgbCd" value="RCD003" id="tab-4" /> <label for="tab-4" class="segmented-control__5"><p>복학</p></label>
					  <input type="radio" name="rgbCd" value="RCD004" id="tab-5" /> <label for="tab-5" class="segmented-control__6"><p>자퇴</p></label> 
					  <input type="radio" name="rgbCd" value="RCD005" id="tab-6" /> <label for="tab-6" class="segmented-control__7"><p>졸업</p></label>

					<div class="segmented-control__color2"></div>
				</div>
				</div>
				<br><br>
				<div class="col-8" style="padding-top: 20px;">
					<div class="col-sm-4">
						<label>신청학기 및 기간</label>
					</div>
					<div class="col-sm-4 select">
						<select id="recYr" name="recYr" required>
								<option selected>년도선택</option>
						</select>
					</div>	
					<br>
					<div class="col-sm-4 select">
						<select id="recSem" name="recSem" required>
								<option selected>학기선택</option>
						</select>
					</div>
					<br>
					<div class="col-sm-4 select">
						<select id="recPer" name="recPer">
								<option selected>기간선택</option>
								<option value="1">1년</option>
								<option value="2">2년</option>
						</select>
					</div>
				</div>
				<br>
				<!-- 		<div class="row"> -->
				<br> <br>
					<div class="col-sm-6" id="cnslReservationDt"
						style="padding-left: 0px;padding-top: 20px;">
						<div class="col-sm-6" style="display: -webkit-inline-box;">
							<div class="alert alert-info">
								<p id="target">신청날짜</p>
							</div>
							<input style="height: 50px; border: 1px solid aliceblue;padding-left: 30px;"
								type="date" name="cnslDt" id="cnslDt" required />
						</div>
					</div>
				<br> <br>
				<div class="col-12" id="cnslConTextArea">
					<div>
						<div class="col-sm-4">
							<label>신청내용	</label>
						</div>
					</div>
					<div class="form col-8">
						<textarea id="recRsn" name="recRsn" rows="6"
							cols="70" required></textarea>
					</div>
				</div>
				<div class="col-4" style="display: inherit; padding-top: 20px;">
					<button type="submit" class="cbtn btn__primary"><label>등록</label></button> 
					<a onclick="dataReset()" class="cbtn btn__secondary"><label>취소</label></a>
					<a href="/record/main?stuNo=<%=stuNo %>" class="cbtn btn__secondary"><label>메인<label></a>
				</div>
				<br>
			</div>
			<sec:csrfInput />
		</form>
	</div>
	</div>

<script type="text/javascript">
		//현재년도/다음년도/현재학기/다음학기/체크된라디오
		//option에 append 해줄 변수
		let setCurrentRecYr,setNextRecYr,setCurrentSemester,setNextSemester,checkedRgbCdValue ="";
		let setDefaultRecSem = `<option selected>학기선택</option>`;
		let setDefaultRecYr = `<option selected>년도</option>`;
		//option value에 담을 변수
		let month,year,nextYear,currentSemester,nextSemester = ""; 
		let date = new Date();
		let temp = "";
		let recYrFlag = false;
		let recSemFlag = false;
		
		$(document).ready(function(){
			year = date.getFullYear(); //년도 recYr
		    month = date.getMonth();
		    if (month == '3' || month == '4' || month == '5' || month == '6') currentSemester = 1;
			else if (month == '9' || month == '10' || month == '11' || month == '12') currentSemester = 2;
			var currentDateString = date.toISOString().substr(0, 10);
			$('input[type="date"]').val(currentDateString).prop('readonly', true);
			$("#recRsn").summernote();//섬머노트변환
			setApplyTerm();//현재년도가 2학기일경우 현재년도 + 다음년도
		});	
		
		function selectedNextYearThenRecSemChangebyRecYr(){
			if(nextYear != ""){
			temp = currentSemester;
			currentSemester = nextSemester;
			nextSemester = temp;
			recSemFlag = true;
			}
			
			if(recSemFlag){
			$("#recSem option").remove();	
			$("#recSem").append(setDefaultRecSem);
			setCurrentSemester = `<option value='\${currentSemester}'>\${currentSemester}학기</option>`
// 			setNextSemester = `<option value='\${nextSemester}'>\${nextSemester}학기</option>`
			$("#recSem").append(setCurrentSemester);
// 			$("#recSem").append(setNextSemester);
			}
		}
		
		$("#recYr").change(function(){
			if($("#recYr option:selected").val() == nextYear){
				recYrFlag = true;
			} else {
				recYrFlag = false;
			}
			
			if(recYrFlag){
				selectedNextYearThenRecSemChangebyRecYr();
			} else {
// 				$("#recYr option").remove();
// 				$("#recYr").append(setDefaultRecYr);
				$("#recSem option").remove();	
				$("#recSem").append(setDefaultRecSem);
				setApplyTerm();
				$("#recYr option:eq(3)").remove();
				$("#recYr option:eq(4)").remove();
			}
		});
		$("input[type='radio'][name='rgbCd']").change(function() {
			//복학이나 졸업을 선택할 경우 사유를 적지 않아도 된다
			 checkedRgbCdValue =$("input[type='radio'][name='rgbCd']:checked").val();
			switch (checkedRgbCdValue) {
				  case 'RCD001'://휴학 현학기 다음학기 기간 니맘대로 사유o
				  $("#recRsn").summernote('enable');
				  $("#recSem option:eq(1)").removeAttr("disabled","disabled");
				  $("#recSem option:eq(2)").removeAttr("disabled","disabled");
				  $("#recPer").removeAttr("disabled","disabled");
		 		   break;
				  case 'RCD003'://복학 무조건 다음학기 기간x 사유x
				  $("#recRsn").summernote('disable');
				  $("#recSem option:eq(1)").attr("disabled","disabled");
				  $("#recSem option:eq(2)").removeAttr("disabled","disabled");
				  $("#recPer").attr("disabled","disabled");
				    break;
				  case 'RCD004'://자퇴 무조건 현학기 기간x 사유o
				  $("#recRsn").summernote('enable');
				  $("#recSem option:eq(2)").attr("disabled","disabled");
				  $("#recSem option:eq(1)").removeAttr("disabled","disabled");
				  $("#recPer").attr("disabled","disabled");
				    break;
				  case 'RCD005'://졸업 무조건 다음학기 기간x 사유x
				  $("#recRsn").summernote('disable');
				  $("#recSem option:eq(1)").attr("disabled","disabled");
				  $("#recSem option:eq(2)").removeAttr("disabled","disabled");
				  $("#recPer").attr("disabled","disabled");
				    break;
				}
		});
		
	   $('#recRsn').summernote({
	        placeholder: '사유를 작성해주세요',
	        tabsize: 2,
	        height: 200,
	        codeviewFilter: true,
	        codeviewIframeFilter: true
	      });	
			
	//현재 학기가 2학기일경우 nextYear를 다음년도로 
	function setApplyTerm(){
		
		if(!(nextYear - year == 1)){nextYear--; return;}
		
		if(currentSemester == 2){
			
			//현재2학기면
			
			nextYear = year + 1;//다음년도
			nextSemester = 1;//다음학기
			
			setCurrentRecYr = `<option value='\${year}'>\${year}년도</option>`;
			$("#recYr").append(setCurrentRecYr);
			setNextRecYr = `<option value='\${nextYear}'>\${nextYear}년도</option>`;
			$("#recYr").append(setNextRecYr);
			setCurrentSemester = `<option value='\${currentSemester}'>\${currentSemester}학기</option>`
			$("#recSem").append(setCurrentSemester);
			return;
			} else {
				
			//현재 2학기가아니면
			
			setCurrentRecYr = `<option value='\${year}'>\${year}년도</option>`;
			$("#recYr").append(setCurrentRecYr);	
			setCurrentSemester = `<option value='\${currentSemester}'>\${currentSemester}학기</option>`
			setNextSemester = `<option value='\${nextSemester}'>\${nextSemester}학기</option>`
			$("#recSem").append(setCurrentSemester);
			$("#recSem").append(setNextSemester);
			
			}
			
		}
	

	function dataReset(){
	var confirmResult = window.confirm("작성내용 모두 취소 하시겠습니까?");
		if (confirmResult == true) {
			$("#recRsn").summernote("reset");
		}else{
			$("#recRsn").summernote('enable');//복학 or 자퇴선택후 취소시 변경됨
			return;
		}
	}
</script>



