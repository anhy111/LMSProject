<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<style>
.modifyDisplay {
	display: none;
}
</style>
<form action="/lectureBoard/data/dataUpdate" method="post"
	enctype="multipart/form-data">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<div class="card-header" style="padding-bottom: 0px">
				<div class="row form-group">
					<div class="col-sm-8">
						<br>
						<h3 class="taskData">${lecData.ldtTtl}</h3>
						<input type="hidden" id="ldtCd" name="ldtCd"
							value="${lecData.ldtCd}"> <input type="hidden"
							id="lecaCd" name="lecaCd" value="${lecData.lecaCd}">
					</div>

					<div class="col-sm-4" style="text-align: right;">
						<br> <b class="col taskData" name="ldtWriter">작성자 :
							${lecData.ldtWriter}&nbsp; | &nbsp;등록일 : <fmt:formatDate
								value="${lecData.ldtReg}" pattern="yyyy-MM-dd" />
						</b> <input type="hidden" name="ldtWriter"
							value="${lecData.ldtWriter}">
					</div>
					<label class="modifyDisplay">제목</label> <input type="text"
						class="modifyDisplay form-control" id="ldtTtl" name="ldtTtl"
						value="${lecData.ldtTtl}" placeholder="제목을 입력하세요">
				</div>
			</div>
			<div class="col-sm-12">
				<section class="content">
					<div class="container-fluid" style="min-height: 500px">
						<div class="card-body">
							<div class="custom-file modifyDisplay"
								style="display: none; min-height: 300px">
								<textarea id="ldtCon" name="ldtCon" cols="15" rows="15">${lecData.ldtCon}</textarea>
							</div>
							<div id="ldtCon2" style="" class="taskData">
								${lecData.ldtCon}</div>
						</div>
					</div>
					<hr>
					<c:if test="${lecData.atchFileId != -1}">
						<div class="taskData">
							<label>첨부파일</label> <br>
							<c:forEach var="attach" items="${lecData.attachList}">
								<!-- 파일 업로드 경로 문제 해결 안됐음************************************************************************************************************** -->
								<a href="/resources/upload${attach.streFileNm}" download
									class="btn btn-outline-primary">${attach.orignlFileNm} <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-download" viewBox="0 0 16 16">
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
						<label class="custom-file-label" for="customFile">Choose file</label>
					</div>
					<div class="row">
						<div class="col-sm-7"></div>
						<div class="taskData col-sm-5" align="right">
							<sec:authorize access="hasRole('ROLE_PROFESSOR')">
								<button type="button" class="btn btn-outline-danger" id="DeleteButton">삭제</button>
								<button type="button" class="btn btn-outline-info" id="ModifyButton">수정</button>
							</sec:authorize>
							<a href="/lectureBoard/data/lectureData?lecaCd=${lecData.lecaCd}"
								class="btn btn-outline-primary">목록</a>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-10"></div>
						<div class="col-sm-1" align="right">
							<button class="btn btn-outline-primary modifyDisplay" id="modify">수정</button>
						</div>
						<div class="col-sm-1">
							<button type="button"
								class="btn btn-outline-warning modifyDisplay" id="cancle">취소</button>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<sec:csrfInput />
</form>
<script type="text/javascript">
var editor = CKEDITOR.replace('ldtCon',{
	  readOnly: true,
	   width:'100%',
		height:'350px'
});


$("#ModifyButton").on("click",function(){
	$(".modifyDisplay").attr("style","display:block");
	$(".taskData").attr("style","display:none");
	editor.setReadOnly(false);
});
$("#cancle").on("click",function(){
	$(".modifyDisplay").attr("style","display:none");
	$(".taskData").attr("style","display:block");
	editor.setReadOnly(true);
});

$("#DeleteButton").on("click",function(){
	Swal.fire({
		title : "게시물을 삭제하시겠습니까?",
				text : "삭제된 게시물은 되돌릴 수 없습니다.",
				icon : "warning",
		    showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '승인',
            cancelButtonText: '취소'
	}).then((result) => {
        if (result.isConfirmed) {
		  Swal.fire({
			    title : "삭제되었습니다.",
			    icon : "success"
		  }).then(function(){
			location.replace('/lectureBoard/data/dataDelete?lecaCd=' + ${lecData.lecaCd}+'&&ldtCd='+${lecData.ldtCd});
		  });
		}
	})
});
	


</script>

