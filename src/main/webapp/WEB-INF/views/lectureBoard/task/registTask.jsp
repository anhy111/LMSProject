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
<div class="row">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<form action="/lectureBoard/task/registTask" id="frm" method="post"
			enctype="multipart/form-data">
			<div class="col-sm-12">
				<div class="form-group row">
					<div style="display: inline-block" class="col-sm-5">
						<label>제목</label> <input type="text" id="taskNm" name="taskNm"
							class="form-control change" required>
					</div>
					<div class="col-sm-5">
						<label>과제 점수 (5~20점)</label> <input type="text" id="taskScore"
							name="taskScore" class="form-control change" required>
					</div>

				</div>
				<section class="content">
					<div class="container-fluid">
						<div class="form-group">
							<div class="input-group">
								<input type="hidden" name="lecaCd" value="${param.lecaCd}">
							</div>
							<div class="form-group">
								<div>
									<label>마감일 </label>
								</div>
								<input type="date" id="taskEdt" name="taskEdt" required>
							</div>
							<div class="input-group">
								<textarea id="taskCon" name="taskCon" class="form-control"
									required></textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="customFile"
									name="files" multiple> <label class="custom-file-label"
									for="customFile">Choose file</label>
							</div>
						</div>


						<div class="form-group">
							<div class="row">
								<div class="col-sm-8"></div>
								<div class="col-sm-2">
									<button type="button" id="registTask"
										class="btn btn-block btn-outline-info">등록</button>
								</div>
								<div class="col-sm-2">
									<a href="/lectureBoard/task/subjectList?lecaCd=${param.lecaCd}"
										class="btn btn-block btn-outline-danger">취소</a>
								</div>
							</div>
							<br>
						</div>
					</div>
				</section>
			</div>
			<sec:csrfInput />
		</form>
	</div>
</div>
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

	$("#taskScore").on("change", function() {

		if ($("#taskScore").val() > 20) {
			$("#taskScore").val(20);
			Swal.fire({

				text : "과제점수는 20점을 초과할 수 없습니다.",
				icon : 'warning'
			})
		}
	})
	$("#registTask").on("click", function() {
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

	

	$("input[type='file']").on('change', function() {
		var str = '';
		for (var i = 0; i < event.target.files.length; i++) {
			if (event.target.files.length - 1 != i) {
				str += event.target.files[i].name + ',  ';
			} else {
				str += event.target.files[i].name;
			}
		}
		$(this).next('.custom-file-label').html(str);
	});
	// 	CKEDITOR.replace("taskCon", {
	// 		width : '100%',
	// 		height : '400px',
	// 		startupFocus : false

	// 	});
</script>