<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<!--  LECA_CD, TASK_NM, TASK_CON, TASK_EDT, ATCH_FILE_ID-->
<style>
.modifyDisplay {
	display: none;
}

#subInfo {
	background-color: ivory;
	border: 1px solid black;
	border-radius: 10px;
}

.callout {
	border-radius: 0.25rem;
	box-shadow: 1px -1px 3px rgb(0 0 0/ 12%), 0 1px 2px rgb(0 0 0/ 24%);
	background-color: #fff;
	border-left: 5px solid #e9ecef;
	margin-bottom: 1rem;
	padding: 1rem;
}
</style>
<form action="/lectureBoard/task/taskSubmitUpdate" method="post"
	enctype="multipart/form-data">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
				<div class="card-header" style="padding-bottom: 0px">
					<div class="row form-group">
						<div class="col-sm-6">
							<br>
							<h3>${task.taskNm}</h3>
	   						<input type="hidden" id="taskCd" name="taskCd" value="${task.taskCd}">
							<input type="hidden" id="lecaCd" name="lecaCd" value="${task.lecaCd}">
							<input type="hidden" id="tsubCd" name="tsubCd" value="${task.taskSubmitList[0].tsubCd}">
						</div>
						<!--taskSubmitList=[TaskSubmit(tsubCd=2, lecaCd=2, taskCd=1, stuNo=21715032, tsubDt=Fri Dec 16 10:07:08 KST 2022, tsubScore=0, atchFileId=3, tsubCon=이게 뭡니까 이게, student=Student(stuNo=21715032, depCd=0, stuYr=0, stuSem=0, stuNm=학생이승연 -->
						<div class="col-sm-6" style="text-align: right;">
							<br>
							<p class="col taskData">
								작성자 : ${task.taskSubmitList[0].student.stuNm} <b>|</b> &nbsp;등록일
								:
								<fmt:formatDate value="${task.taskSubmitList[0].tsubDt}"
									pattern="yyyy-MM-dd hh:mm" />
								&nbsp; <B>|</B>&nbsp; 마감일 :
								<fmt:formatDate value="${task.taskEdt}"
									pattern="yyyy-MM-dd hh:mm" />
							</p>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="col-sm-12">
						<section class="content">
							<div class="container-fluid">
										<div class="taskData" style="min-height: 300px">${task.taskSubmitList[0].tsubCon}</div>
										<div class="modifyDisplay">
											<textarea id="tsubCon" name="tsubCon" class="form-control"
												cols="15" rows="15">${task.taskSubmitList[0].tsubCon}</textarea>
										</div>

										<hr>
										<c:if test="${task.taskSubmitList[0].atchFileId != -1}">
											<div class="taskData">
												<label>첨부파일</label> <br>
												<c:forEach var="attach"
													items="${task.taskSubmitList[0].attach}">
													<!-- 파일 업로드 경로 문제 해결 안됐음************************************************************************************************************** -->
													<a href="/resources/upload${attach.streFileNm}" download
														class="btn btn-outline-primary">${attach.orignlFileNm}
														<svg xmlns="http://www.w3.org/2000/svg" width="16"
															height="16" fill="currentColor" class="bi bi-download"
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
										<br>
										<sec:authorize access="hasRole('ROLE_PROFESSOR')">
										<div class="callout callout-danger">
											<h5>
												<b>과제 점수</b>
											</h5>
											<p>1. 점수를 부여하고 기한 내에 점수를 수정할 수 있습니다.</p>
											<p>2. 마감일 이후에는 점수를 수정할 수 없으므로 기한을 잘 확인하여 주시길 바랍니다.</p>
											<hr>
											<div class="col-2" style="display: inline-block;">
												<input type="number" class="form-control" value="${task.taskSubmitList[0].tsubScore}"
													max="${task.taskScore}" min="0" id="tsubScore" name="tsubScore">
											</div>
											<div class="col-2" style="display: inline-block;">
												<p>/ ${task.taskScore}</p>
											</div>
											<div class="col-2" style="display: inline-block;">
												<button type="button" class="btn btn-outline-success"
													id="jumsu">점수 등록</button>
											</div>
										</div>
										</sec:authorize>

										<div class="custom-file modifyDisplay">
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
							<sec:authorize access="hasRole('ROLE_STUDENT')">
								<button type="button" class="btn btn-outline-danger" id="DeleteButton">삭제</button>
								<button type="button" class="btn btn-outline-info" id="ModifyButton">수정</button>
							</sec:authorize>
							<a
								href="/lectureBoard/task/taskSubmitList?taskCd=${task.taskCd}&&lecaCd=${task.lecaCd}"
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
				</div>
		</div>
	</div>
	<sec:csrfInput />
</form>
<!-- 1. 폼 만들어서 수정 데이터 날리고 수정된 페이지로 이동하자 
	 2. 취소 누르-->
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
	$("#tsubScore").on("change",function(){
		
		if($("#tsubScore").val() > ${task.taskScore}){
			$("#tsubScore").val(${task.taskScore});
		}
	})

	var editor = CKEDITOR.replace('tsubCon', {
		   readOnly: true,
		   width:'100%',
			height:'500px'
		});
	
	$("#DeleteButton").on("click",function(){
		Swal.fire({
			  title: '글을 삭제하시겠습니까?',
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
				  location.replace('/lectureBoard/task/submitDelete?tsubCd=' + ${task.taskSubmitList[0].tsubCd});
			  }
			});
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
	
	
	
		
	
</script>
<script type="text/javascript">
  
$("#jumsu").on("click",function(){
	let tsubCd = $("#tsubCd").val();
	let tsubScore = $("#tsubScore").val();
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";
	let data = {  
		 tsubScore: tsubScore,
		 tsubCd: tsubCd
	  };
	$.ajax({
	    url: "/lectureBoard/task/tsubScoreUpdate"
	    ,contentType:"application/json"
	    ,data: JSON.stringify(data)    
	    ,async:false
	    ,beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		}
	    ,type: "post"                         
	    ,dataType: "json"                     
	    ,success : function(result){
	    	console.log(result);
	    	if(result == 1){
	    		Swal.fire({
					  title: '등록 성공!',
					  text:"점수가 등록되었습니다.",
					  icon:'success'
				})
	    	}else{
	    		Swal.fire({
					  title: '등록 실패!',
					  text:"점수 등록에 실패하였습니다.",
					  icon:'warning'
				})
	    	}
	              }
        ,error: function(){
	            	alert("A");  
		         }
	});
});
</script>