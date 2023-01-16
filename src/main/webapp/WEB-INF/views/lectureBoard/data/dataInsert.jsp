<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<!--  LECA_CD, TASK_NM, TASK_CON, TASK_EDT, ATCH_FILE_ID--> 
<div class="row">
	<div class="col-sm-1" ></div>
	<div class="col-sm-10" >
		<form action="/lectureBoard/data/dataInsert" id="frm" method="post" enctype="multipart/form-data" >
				<div class="card-header">
					<div class="form-group">
							<label class="modifyDisplay">제목</label>
							<input type="hidden" value="${param.lecaCd}" name="lecaCd">
								<input type="text" class="form-control" id="ldtTtl" name="ldtTtl"  placeholder="제목을 입력하세요">
					</div>
				</div>
				<div class="card-body">
					<div class="col-sm-12">
						<section class="content">
										<div class="card-body"  >
											<div>
												<textarea id="ldtCon" name="ldtCon" class="form-control" cols="15" rows="15"></textarea>
											</div>
											
											<hr>
											<div  class="taskData">
												<label>첨부파일</label> <br>
												<div class="custom-file">
													<input type="file" id="customFile" name="files" multiple >
													<label class="custom-file-label" for="customFile">Choose file</label>
												</div>
										</div>
								</div>
						</section>
					</div>
			
				<div class="row">
					<div class="col-sm-10">
					</div>
						<div class="col-sm-1" align="right" >
							<button type="submit" class="btn btn-outline-primary" id="modify">등록</button>
						</div>
					<div class="col-sm-1">
						<a class="btn btn-outline-warning" href="/lectureBoard/data/lectureData?lecaCd=${param.lecaCd}">취소</a>
					</div>
				</div>
			</div>
<sec:csrfInput/>
</form>
</div>
</div>
<script type="text/javascript">

$("input[type='file']").on('change',function(){
	var str = '';
	for(var i = 0;i<event.target.filefile2.length;i++){
		if(event.target.filefile2.length - 1 != i){
			str += event.target.filefile2[i].name+', ';
		}else{
			str += event.target.filefile2[i].name;
		}
	}
    $(this).next('.custom-file-label').html(str);
});

CKEDITOR.replace("ldtCon",
		{
		width:'100%',
		height:'500px',
		startupFocus:false
		});
</script>