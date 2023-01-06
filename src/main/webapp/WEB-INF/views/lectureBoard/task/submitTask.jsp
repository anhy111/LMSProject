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
		<form action="/lectureBoard/task/submitTask" id="frm" method="post" enctype="multipart/form-data" >
				<div class="card-header">
					<div class="form-group">
						<h1 class="card-title">
							${task.taskNm}
						</h1>
					</div>
				</div>
				<div class="col-sm-12">
					<section class="content">
						<div class="container-fluid">
							<div class="form-group">
								<div class="input-group">
								<!-- ★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆ -->
									<input type="hidden" name="lecaCd" value="${param.lecaCd}">											
									<input type="hidden" name="taskCd" value="${param.taskCd}">											
								</div>
								<div class="input-group">
								<!-- ★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆ -->
									<textarea id="tsubCon" name="tsubCon" class="form-control" cols="15" rows="15" required></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="custom-file">
								<!-- ★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆ -->
									<input type="file" class="custom-file-input" id="customFile" name="files" multiple>
									<label class="custom-file-label" for="customFile">Choose file</label>
								</div>
							</div>
							
							
							<div class="form-group">
								<div class="row">
									<div class="col-sm-8"></div>
										<div class="col-sm-2">
											<button type="submit" class="btn btn-block btn-info" >등록</button>
										</div>
										<div class="col-sm-2">
								<!-- ★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆ -->
											<a href="/lectureBoard/task/taskSubmitList?lecaCd=${param.lecaCd}&&taskCd=${param.taskCd}" class="btn btn-block btn-danger">취소</a>
										</div>					
								</div>
								<br>
							</div>
						</div>
					</section>
				</div>
			<sec:csrfInput/>
		</form>
 	</div>
</div>
<script type="text/javascript">
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
	
	CKEDITOR.replace("#tsubCon",
			{
			width:'100%',
			height:'500px',
			startupFocus:false
			});
</script>



