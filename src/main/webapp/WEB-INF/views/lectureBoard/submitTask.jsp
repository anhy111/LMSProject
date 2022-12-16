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
		<form action="/lectureBoard/submitTask" id="frm" method="post" enctype="multipart/form-data" >
			<div class="card card-outline card-primary">
				<div class="card-header">
					<div class="form-group">
						<h1 class="card-title">
							${task.taskNm}
						</h1>
					</div>
				</div>
				<div class="card-body">
					<div class="col-sm-12">
						<section class="content">
							<div class="container-fluid">
								<div class="card card-danger">
										<div class="card-body">
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
															<a href="/lectureBoard/subjectList?lecaCd=${param.lecaCd}" class="btn btn-block btn-danger">취소</a>
														</div>					
												</div>
												<br>
											</div>
										</div>
								</div>
							</div>
						</section>
					</div>
				</div>
			<sec:csrfInput/>
			</div>
		</form>
 	</div>
</div>
<script type="text/javascript">
$(function(){
	
	CKEDITOR.replace("#tsubCon",
			{
			width:'100%',
			height:'500px',
			startupFocus:false
			});
});
</script>



