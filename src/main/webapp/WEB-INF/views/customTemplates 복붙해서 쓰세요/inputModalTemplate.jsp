<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/inputModalTemplate.css">
<%
	int stuNo = (int) session.getAttribute("no");
	String name = String.valueOf(session.getAttribute("name"));
%>

<div class="row" style="padding-left: 10px;">
	<form id="form" action="/record/applyPost" class="col-12" method="post" onsubmit="return checkFormData()">
	<div class="col-4">
		<div class="card card-primary">
			<div class="card-header">
				<h3 class="card-title">학적변동 신청서 작성</h3>
			</div>
			<div class="alert alert-light" role="alert" style="font-size: 0.9em;padding:1em;border: 1px solid #eee;">
					<p>
						<strong>※ 학적변동 안내사항</strong>
						<br><br>
						(1)<strong> 학적구분</strong>선택 후 학기 및 기간을 선택하여 주세요<br>
<!-- 						 - 시험 기간 미설정시, 등록 직후 바로 시험에 응시 가능합니다.<br> -->
<!-- 						 - <strong>기간을 설정하지 않고 문제를 등록하여 문제 유출이 되는 경우가 종종 발생합니다.</strong><br> -->
						<br>
						(2) 학적구분에 따라 선택할수 있는 옵션이 달라집니다<br>
						 - <strong>해당하는옵션</strong>만 입력이 가능합니다.<br>
						<br>
						(3) 이름 및 신청날짜는 자동 입력됩니다<br>
						<br>
						(4) *는 필수 입력 정보입니다.
					</p>
				</div>
			<div class="card-body">
				<input style="margin:0px;padding:0px;" type="hidden" name="stuNo" value="<%=stuNo%>">
				<input style="margin:0px;padding:0px;" type="hidden" name="recYn" value="AP002">
				<input style="margin:0px;padding:0px;" type="hidden" name="recSem">
				<div class="segmented-control2"
					style="width: 330px; padding: 0px; vertical-align: middle;">
					<input type="radio" name="rgbCd" value="RCD001" id="tab-3" checked /><label
						for="tab-3" class="segmented-control__3"><p>휴학</p></label> <input
						type="radio" name="rgbCd" value="RCD003" id="tab-4" /> <label
						for="tab-4" class="segmented-control__5"><p>복학</p></label> <input
						type="radio" name="rgbCd" value="RCD004" id="tab-5" /> <label
						for="tab-5" class="segmented-control__6"><p>자퇴</p></label> <input
						type="radio" name="rgbCd" value="RCD005" id="tab-6" /> <label
						for="tab-6" class="segmented-control__7"><p>졸업</p></label>
					<label style="margin:0px;"class="col-sm-4" for="segmented-control2">&nbsp;학적구분*</label>
				</div>
				<div class="form-group">
					<select class="col-2 custom-select rounded-0"
						id="recYr" name="recYr">
						<option selected>년도</option>
					</select> <label for="recYr">&nbsp;신청학기*<code>&nbsp;
							*(휴학제외) 다음학기 신청 가능합니다</code></label>
				</div>
				    <button class="btn btn-secondary" type="button" id="currentSem"></button>
				    <button class="btn btn-secondary"type="button" id="nextSem"></button>
				    <label id="selectedYRSEMlabel">&nbsp;선택된학기 : <code id="selectedYRSEM"></code></label>
			    <br><br>
				<div class="form-group">
					<select class="col-3 custom-select rounded-0"
						id="recPer" name="recPer">
						<option value="1">1년</option>
						<option value="2">2년</option>
					</select> <label for="recPer">&nbsp;기간 <code>&nbsp;
							*휴학일경우 선택</code></label>
				</div>
				<div class="form-group">
					<label for="exampleInputBorder">신청자명*</label> <input type="text"
						class="col-3 form-control form-control-border"
						id="exampleInputBorder" readonly value="<%=name%>">
				</div>
				<div class="form-group">
					<label for="exampleInputRounded0">사유</label> <br>
					<textarea class="row" rows="3" cols="50vh" name="recRsn" id="recRsn"
						placeholder="    사유를입력하여주세요"></textarea>
				</div>
				<div class="form-group">
				<label for="exampleInputFile">파일첨부</label>
				<div class="input-group">
				<div class="custom-file">
				<input type="file" class="custom-file-input" id="exampleInputFile" cursorshover="true">
				<label class="custom-file-label" for="exampleInputFile"></label>
				</div>
				<div class="input-group-append">
				<span class="input-group-text">Upload</span>
				</div>
				</div>
				</div>
				<div style="text-align: end; padding-top: 10px;">
				
					<div class="btn-group">
					<button type="submit" class="btn btn-sm btn-outline-primary"><label>등록</label></button>
					<a onclick="dataReset()" class="btn btn-sm btn-outline-secondary"><label>취소</label></a>
					<a href="/record/main?stuNo=<%=stuNo%>"
						class="btn btn-sm btn-outline-info"><label>목록<label></a>
					</div>
				</div>
			</div>
		</div>
	</div>
			<sec:csrfInput />
	</form>
</div>


<script type="text/javascript">

$.fn.clearForm = function () {
	  return this.each(function () {
	    var type = this.type,
	      tag = this.tagName.toLowerCase();
	    if (tag === 'form') {
	      return $(':input', this).clearForm();
	    }
	    if (
//		      type === 'text' ||
//		      type === 'password' ||
//		      type === 'hidden' ||
	      tag === 'textarea'
	    ) {
	      this.value = '';
//		    } else if (type === 'checkbox' || type === 'radio') {
//		      this.checkedIndex = 0;
	    } else if (tag === 'select') {
	      this.selectedIndex = -1;
	    }
	  });
	};

function checkFormData(){
	if($("#recSem").val() == "" || $("#recSem").val() == null){
		alert("학기를 선택해 주세요");
		return false;
	} else {
		return true;
	} 
}
	
function dataReset(){
var confirmResult = window.confirm("작성내용 모두 취소 하시겠습니까?");
	if (confirmResult == true) {
		$("#form").clearForm();
	}else{
		return;
	}
}
</script>
