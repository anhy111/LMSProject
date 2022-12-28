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
<div class="row"style="box-sizing:border-box;">
	<form id="form" action="#" class="col-12" method="post" onsubmit="return checkFormData()">
	<div class="col-4">
		<div class="card card-primary">
			<div class="card-header" style="background-color:#112a63;">
				<h3 class="card-title">학적변동 신청서 작성</h3>
			</div>
			<div class="alert alert-light" role="alert" style="font-size: 0.9em;padding:1em;border: 1px solid #eee;">
					<p>
						<strong>※ 학적변동 안내사항</strong>
						<br><br>
						(1)<strong> 학적구분</strong>선택 후 학기 및 기간을 선택하여 주세요<br>
						<br>
						(2) 학적구분에 따라 선택할수 있는 옵션이 달라집니다<br>
						 - <strong>활성화된 옵션</strong>만 입력이 가능합니다.<br>
						<br>
						(3) 이름 및 신청날짜는 자동 입력됩니다<br>
						<br>
						(4) *는 필수 선택/입력 정보입니다.
					</p>
				</div>
			<div class="card-body">
				<input style="margin:0px;padding:0px;" type="hidden" name="stuNo" value="<%=stuNo%>">
				<input style="margin:0px;padding:0px;" type="hidden" name="recYn" value="AP002">
				<input style="margin:0px;padding:0px;" type="hidden" id="recSem" name="recSem">
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
				
				<label class="col-sm-1"style="color:black; margin:0px;"for="segmented-control2">&nbsp;*</label>
				</div>
				<label>&nbsp;학기 선택*&nbsp;</label>
				<div class="form-group">
					<select class="col-4 custom-select rounded-0"
						id="recYr" name="recYr">
						<option selected>년도</option>
					</select> 
					
				    <button class="btn btn-secondary" type="button" id="currentSem"></button>
				    <button class="btn btn-secondary"type="button" id="nextSem"></button>
				    <label id="selectedYRSEMlabel">&nbsp; : <code style="color:blue" id="selectedYRSEM"></code></label>
				</div>
				<div class="form-group">
					<select class="col-4 custom-select rounded-0"
						id="recPer" name="recPer" required="required">
						<option>기간</option>
						<option value="1">1년</option>
						<option value="2">2년</option>
					</select> <code>&nbsp;[휴학 선택시]</code>
				</div>
				<div class="form-group">
					<label for="exampleInputBorder">신청자*</label> <input type="text"
						class="col-4 form-control form-control-border"
						id="exampleInputBorder" readonly value="<%=name%>">
				</div>
				<div class="form-group">
					<label for="exampleInputRounded0">내용</label> <br>
					<div class="row">
					<textarea class="col-12 form-control" rows="3"  name="recRsn" id="recRsn" required="required"
						placeholder="내용을입력하여주세요" ></textarea>
						</div>
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
					<button type="submit" class="btn btn-sm btn-outline-primary">등록</button>
					<a onclick="dataReset()" class="btn btn-sm btn-outline-secondary">취소</a>
					<a href="/record/main?stuNo=<%=stuNo%>"class="btn btn-sm btn-outline-info">목록</a>
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
	      this.selectedIndex = 0;
	    }
	  });
	};

function checkFormData(){
	if($("#recSem").val() == "" || $("#recSem").val() == null){
		Swal.fire({
			  icon: 'error',
			  title: '년도 선택해 주세요',
			})
		return false;
	} else {
		return true;//submit
	} 
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
</script>
