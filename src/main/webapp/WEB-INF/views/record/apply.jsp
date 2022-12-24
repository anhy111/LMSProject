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
						<select id="recSem" name="recSem">
								<option selected>학기선택</option>
								<option value="1">1학기</option>
								<option value="2">2학기</option>
						</select>
					</div>
					<br>
					<div class="col-sm-4 select">
						<select id="recPer" name="recPer">
								<option selected>기간선택</option>
						</select>
					</div>
				</div>
				<br>
				<!-- 		<div class="row"> -->
				<br> <br>
					<div class="col-sm-6" id="cnslReservationDt"
						style="padding-left: 0px;padding-top: 20px;">
						<div class="col-sm-2">
							<label>예약일</label>
						</div>
						<div class="col-sm-6" style="display: -webkit-inline-box;">
							<div class="alert alert-info">
								<p id="target">상담 예약일</p>
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
					<button type="submit" class="cbtn btn__primary"><lable>등록</label></button> 
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
		let currentRecYr,nextRecYr ="";
		var date = new Date();
		let year = date.getFullYear(); //년도 recYr
		let nextYear =""; //현재학기가 2학기일경우 다음년도 recYr
		let month = date.getMonth();
		var semester;

		if (month == '3' || month == '4' || month == '5' || month == '6') semester = 1;
		else if (month == '9' || month == '10' || month == '11' || month == '12') semester = 2;
		
		let setRecYr = "";
		let setNextRecYr = "";
		
	$(document).ready(function(){
		$('input[type="date"]').change(function() {
			/* on change get value then print to page */
			var outputDate = (this.value);
			$("#target").text(outputDate);
		});
// 			CKEDITOR.replace("recRsn");
			$("#recRsn").summernote();
			setRecYr = `<option value='\${year}'>\${year}년도</option>`;
			$("#recYr").append(setRecYr);
			setApplyTerm();
			//복학이나 졸업을 선택할 경우 사유를 적지 않아도 된다
			$("input[type='radio'][name='rgbCd']").change(function() {
				if($("input[type='radio'][name='rgbCd']:checked").val() == 'RCD003' || $("input[type='radio'][name='rgbCd']:checked").val() == 'RCD005'){
// 					$("#cnslConTextArea").hide();
					$("#recRsn").summernote('disabled');
				} else { 
// 					$("#cnslConTextArea").show();
					$("#recRsn").summernote('enable');
				}
			});
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
		if(semester == 2){ 
			nextYear = year + 1;
			if(!(nextYear - year == 1)){nextYear--; return;}
			setNextRecYr = `<option value='\${nextYear}'>\${nextYear}년도</option>`;
			$("#recYr").append(setNextRecYr);
		}
	}

	function dataReset(){
		
		var confirmResult = window.confirm("작성내용 모두 취소 하시겠습니까?");
		if (confirmResult == true) {
			form.reset();
			$("#recRsn").summernote("reset");
		}else{
			return;
		}
	}
</script>



