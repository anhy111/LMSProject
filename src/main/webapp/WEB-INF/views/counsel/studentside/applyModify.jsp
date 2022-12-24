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
		<div class="col-12" >
			<h3><label>상담글 확인</label></h3> <br>
				<input type="hidden"  id="cnslCd"  value="${answerDetail.cnslCd }" readonly>
				<div class="col-6">
				<h5><label>상담제목</label></h5><br>
				<input type="text"  value="${answerDetail.cnslTtl }" />
				</div>
				<br>
				<div class="col-6">
				<h5><label>상담내용</label></h5><br>
				<textarea rows="5" cols="50"  id="cnslCon">${answerDetail.cnslCon }</textarea>
				</div>
				<br>
				<button onclick="modifyCont()" type="button" class="btn btn-sm btn-outline-primary">수정하기</button>
				<button onclick="closeApply()" type="button" class="btn btn-sm btn-outline-warning">취소</button>
				<button onclick="deleteApply()" type="button" class="btn btn-sm btn-outline-danger">삭제</button>
		</div>
	</div>
</div>
<script type="text/javascript">
let cnslCon,cnslCd = "";
let header = "${_csrf.headerName}";
let token = "${_csrf.token}";
let data = {cnslCd : "",cnslCon : ""};
function modifyCont(){
	data.cnslCd = $("#cnslCd").val();
	data.cnslCon = $("#cnslCon").val();
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
	data.cnslCd = $("#cnslCd").val();
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