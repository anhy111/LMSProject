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
			<div class="card card-outline card-primary">
				<div class="card-header">
						<div class="row form-group">
							<div class="col-sm-3">
								<h3>${task.taskNm}</h3>
							</div>
							<div class="col-sm-5"></div>
							<div class="col-sm-4" style="text-align:right;">
								<b>등록일 : <fmt:formatDate value="${task.taskSdt}" pattern="yyyy-MM-dd"/>&nbsp; |&nbsp; 마감일 : <fmt:formatDate value="${task.taskEdt}" pattern="yyyy-MM-dd hh:mm"/></b>
							</div>
						</div>
				</div>
				<div class="card-body">
					<div class="col-sm-12">
						<section class="content">
							<div class="container-fluid">
								<div class="card card-danger">
										<div class="card-body"  >
											<textarea id=taskCon readonly >${task.taskCon}</textarea>
											<hr>
											<c:if test="${task.atchFileId != -1}">
											<label>첨부파일</label> <br>
											<c:forEach var="attach" items="${task.attach}"  >
											<button class="btn btn-outline-primary">${attach.orignlFileNm} <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16">
												  <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
												  <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/>
													</svg>
											</button>
											</c:forEach>
											</c:if>
										</div>
								</div>
							</div>
						</section>
					</div>
				<div class="row">
					<div class="col-sm-11">
					</div>
					<div class="col-sm-1">
						<a href="/lectureBoard/subjectList?lecaCd=${task.lecaCd}"  class="btn btn-primary">목록</a>
					</div>
				</div>
				</div>
			</div>
 	</div>
</div>
<script type="text/javascript">
	CKEDITOR.replace("taskCon",
			{
			width:'100%',
			height:'500px',
			startupFocus:false
			});
</script>



