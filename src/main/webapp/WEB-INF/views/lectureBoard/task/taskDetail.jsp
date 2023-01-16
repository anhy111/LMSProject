<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!--  LECA_CD, TASK_NM, TASK_CON, TASK_EDT, ATCH_FILE_ID-->
<style>
.modifyDisplay {
	display: none;
}
</style>
<form action="/lectureBoard/task/taskUpdate" method="post"
	enctype="multipart/form-data" id="frm">
	<div class="row">
		<div class="col">
			<div class="row form-group ">
				<div class="col-sm-3">
					<label class="modifyDisplay">제목</label> <input type="text"
						class="form-control change modifyDisplay" id="taskNm"
						name="taskNm" value="${task.taskNm}">
				</div>
				<div class="col-sm-3">
					<label class="modifyDisplay">과제 점수</label> <input type="text"
						class="form-control change modifyDisplay" id="taskScore"
						name="taskScore" required>
				</div>
				<div class="modifyDisplay">
							<label>마감일</label> <input type="date" class="form-control change modifyDisplay"
								id="taskEdt" name="taskEdt" required>
						</div>

				<div class="col-sm-8">
					<h3 class="taskData">${task.taskNm}</h3>
					<input type="hidden" id="taskCd" name="taskCd"
						value="${task.taskCd}"> <input type="hidden" id="lecaCd"
						name="lecaCd" value="${task.lecaCd}">
				</div>

				<div class="col-sm-4" style="text-align: right;">
					<br> <b class="col taskData">등록일 : <fmt:formatDate
							value="${task.taskSdt}" pattern="yyyy-MM-dd" />&nbsp; |&nbsp;
						마감일 : <fmt:formatDate value="${task.taskEdt}"
							pattern="yyyy-MM-dd hh:mm" /></b> <br> <b class="col taskData">과제
						점수 : ${task.taskScore}</b>
				</div>
			</div>
			<div class="col-sm-12">
				<hr>
				<section class="content">
					<div class="container-fluid">
						
						<div class="taskData" style="min-height: 300px;">${task.taskCon}</div>
						<div class="modifyDisplay">
							<textarea id="taskCon" name="taskCon" class="form-control"
								cols="15" rows="15">${task.taskCon}</textarea>
						</div>

						<hr>
						<c:if test="${task.atchFileId != -1}">
							<div class="taskData">
								<label>첨부파일</label> <br>
								<c:forEach var="attach" items="${task.attach}">
									<!-- 파일 업로드 경로 문제 해결 안됐음************************************************************************************************************** -->
									<a href="/resources/upload${attach.streFileNm}" download
										class="btn btn-outline-primary">${attach.orignlFileNm} <svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-download"
											viewBox="0 0 16 16">
													  <path
												d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z" />
													  <path
												d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z" />
														</svg>
									</a>

								</c:forEach>
							</div>
						</c:if>
						<div class="custom-file modifyDisplay" style="display: none">
							<input type="file" id="customFile" name="files" multiple>
							<label class="custom-file-label" for="customFile">Choose
								file</label>
						</div>
					</div>
				</section>
			</div>
			<div class="row">
				<div class="col-sm-7"></div>
				<div class="taskData col-sm-5" align="right">
					<sec:authorize access="hasRole('ROLE_PROFESSOR')">
						<button type="button" class="btn btn-outline-danger" id="DeleteButton">삭제</button>
						<button type="button" class="btn btn-outline-info" id="ModifyButton">수정</button>
					</sec:authorize>
					<a href="/lectureBoard/task/subjectList?lecaCd=${task.lecaCd}"
						class="btn btn-outline-primary">목록</a>
				</div>
			</div>
			<br>
			<br>
			<div class="row">
				<div class="col-sm-10"></div>
				<div class="col-sm-1" align="right">
					<button type="button" id="modiForm" class="btn btn-outline-primary modifyDisplay" id="modify">수정</button>
				</div>
				<div class="col-sm-1">
					<button type="button" class="btn btn-outline-warning modifyDisplay"
						id="cancle">취소</button>
				</div>
			</div>
		</div>
	</div>
	<sec:csrfInput />
</form>
<!-- 1. 폼 만들어서 수정 데이터 날리고 수정된 페이지로 이동하자 
	 2. 취소 누르-->
<script type="text/javascript">
$('#taskCon')
.summernote(
		{
			placeholder : '',
			tabsize : 2,
			width : '100%',
			height : 190,
			toolbar : [
					[ 'style', [ 'style' ] ],
					[ 'fontname', [ 'fontname' ] ],
					[ 'fontsize', [ 'fontsize' ] ],
					[ 'font', [ 'bold', 'underline', 'clear' ] ],
					[ 'color', [ 'color' ] ],
					[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
					[ 'table', [ 'table' ] ],
					[ 'insert', [ 'link', 'picture', 'video' ] ],
					[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ],
			fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
					'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림',
					'돋움체', '바탕체' ],
			fontSizes : [ '8', '9', '10', '11', '12', '14', '16',
					'18', '20', '22', '24', '28', '30', '36', '50',
					'72' ]
		});


$("input[type='file']").on('change',function(){
	var str = '';
	for(var i = 0;i<event.target.files.length;i++){
		if(event.target.files.length - 1 != i){
			str += event.target.files[i].name+',  ';
		}else{
			str += event.target.files[i].name;
		}
	}
    $(this).next('.custom-file-label').html(str);
});

	$("#DeleteButton").on("click",function(){
		Swal.fire({
			  title: '삭제하시겠습니까?',
			  text: "삭제하시면 다시 복구시킬 수 없습니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '삭제',
			  cancelButtonText: '취소'
		}).then((result) => {
			  if (result.value) {
	              //"삭제" 버튼을 눌렀을 때 작업할 내용을 이곳에 넣어주면 된다. 
				  location.replace('/lectureBoard/task/taskDelete?lecaCd='+ ${task.lecaCd} +'&&taskCd=' + ${task.taskCd} );
		   };
		});
	});
	$("#modiForm").on("click",function(){
		if ($("#taskCon").val() == null || $("#taskCon").val() == '') {
			Swal.fire({
				text : "내용을 입력해 주세요.",
				icon : 'warning'
			})
			$("#taskCon").focus();
			return;
		}
		if ($("#taskNm").val() == null || $("#taskNm").val() == '') {
			Swal.fire({
				text : "제목을 입력해 주세요.",
				icon : 'warning'
			})
			$("#taskNm").focus();
			return;
		}
		if ($("#taskScore").val() == null || $("#taskScore").val() == '') {
			Swal.fire({
				text : "점수을 입력해 주세요.",
				icon : 'warning'
			})
			$("#taskScore").focus();
			return;
		}
		if (isNaN($("#taskScore").val())) {
			Swal.fire({
			text: '내용은 숫자만 입력해 주세요.',
			icon: 'warning'
		    });
			$("#taskScore").focus();
			return
		}
			
		if ($("#taskEdt").val() == null || $("#taskEdt").val() == '') {
			Swal.fire({
				text : "날짜를 입력해 주세요.",
				icon : 'warning'
			})
			$("#taskEdt").focus();
			return;
		}
		$("#frm").submit();
		
	})
	$("#ModifyButton").on("click",function(){
		$(".modifyDisplay").attr("style","display:block");
		$(".taskData").attr("style","display:none");
	});
	
	$("#cancle").on("click",function(){
		$(".modifyDisplay").attr("style","display:none");
		$(".taskData").attr("style","display:block");
	});
</script>