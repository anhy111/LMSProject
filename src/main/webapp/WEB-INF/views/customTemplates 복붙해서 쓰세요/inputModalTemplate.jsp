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
<!-- 
모달실행 버튼 
또는 본인이 이벤트를 발생시킬 노드의 attribute를 추가해주면 실행 할 수 있다
data-toggle="modal" data-target="#모달에 준 아이디" 
-->
<div class="row">
<div class="col-12 pr-0">
<button id="" class="btn btn-sm btn-outline-primary"
		data-toggle="modal" data-target="#모달 아이디">신청</button>
</div>
</div>
<!-- 모달 -->
<div class="modal fade show" id="모달 아이디"
	style="display: none; padding-right: 17px;" aria-modal="true"
	role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" style="height: 900px;">
			<div class="modal-header" style="background-color: #001F3F;color:white;">
				<h5 class="modal-title">학적변동 신청서 작성</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"style="color:white;">×</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- 모달바디 -->
				<form id="form" action="/record/applyPost" class="row" method="post"
					onsubmit="return checkFormData()" style="height: 100%;margin: 0 auto;padding: 0;">
					<div class="alert alert-light" role="alert"
						style="font-size: 0.9em; padding: 1em; border: 1px solid #eee; width: 100em;'">
						<p>
							<strong>※ 학적변동 안내사항</strong> <br>
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
						<!-- 그룹 라디오 박스 name, value, text 부분 변경 사용 가능 -->
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
					<div class="form-group col-8 ">
						<label for="exampleInputFile">파일첨부</label>
						<div class="input-group">
							<div class="custom-file">
								<input type="file" class="custom-file-input"
									id="exampleInputFile" cursorshover="true"> <label
									class="custom-file-label" for="exampleInputFile"></label>
							</div>
							<div class="input-group-append">
								<span class="input-group-text">Upload</span>
							</div>
						</div>
					</div>
					<sec:csrfInput />
				</form>

				<!-- 모달바디 -->
			</div>
			<div class="modal-footer justify-content-align">
				<button type="submit" form="form" class="btn btn-outline-primary">등록</button>
				<a onclick="dataReset()" class="btn btn-outline-secondary">취소</a>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달 -->
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
