<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="/resources/adminlte/plugins/jquery/jquery.min.js"></script>
<div class="container" align="center">
	<div class="row"style="
    border: 50px inset aliceblue;
    padding: 20px;
">
				<input type="hidden"  id="modifyCnslCd"  value="${answerDetail.modifyCnslCd }" readonly>
				<div class="form-group col-12">
				<div class="col-sm-4">
							<label>제목</label>
						</div>
				<input type="text"  class="col-6 form-control form-control-border-rounded-0"  value="${answerDetail.cnslTtl }" />
				</div>
				<div class="form-group col-12">
						<div class="col-sm-4">
							<label>상담 내용</label>
						</div>
					<div class="row">
				<textarea rows="5"   id="modifyCnslCon" class="col-10 ml-2 form-control">${answerDetail.modifyCnslCon }</textarea>
					</div>
				</div>
				<br>
				<button onclick="modifyCont()" type="button" class="btn btn-outline-primary">수정하기</button>
				<button onclick="deleteApply()" type="button" class="btn btn-outline-danger">삭제</button>
	</div>
</div>
<script type="text/javascript">
let modifyCnslCon,modifyCnslCd = "";
let header = "${_csrf.headerName}";
let token = "${_csrf.token}";
let data = {modifyCnslCd : "",modifyCnslCon : ""};
function modifyCont(){
	data.modifyCnslCd = $("#modifyCnslCd").val();
	data.modifyCnslCon = $("#modifyCnslCon").val();
	$.ajax({
		url:"/counsel/studentside/applyModify",
		type:'POST',
		data: JSON.stringify(data),
		datatype:'JSON',
		contentType: 'application/json; charset=utf-8',
		beforeSend: function (xhr) {
			xhr.setRequestHeader(header, token);
		},
		success:function(result){
			opener.parent.location.reload();
			window.close();
		}
	});
}
function deleteApply(){
	data.modifyCnslCd = $("#modifyCnslCd").val();
	$.ajax({
		url:"/counsel/studentside/deleteApply",
		type:'POST',
		data: JSON.stringify(data),
		datatype:'JSON',
		contentType: 'application/json; charset=utf-8',
		beforeSend: function (xhr) {
			xhr.setRequestHeader(header, token);
		},
		success:function(result){
			opener.parent.location.reload();
			window.close();
		}
	});
}
function closeApply(){window.close();}
</script>