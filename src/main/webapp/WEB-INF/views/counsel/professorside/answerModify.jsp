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
		<div class="col-12" id="answerModifyTable">
			<h3><label>답변수정</label></h3> <br>
				<input type="hidden"  id="cnslCd"  value="${answerDetail.cnslCd}"readonly>
				<div class="col-6">
				<h5><label>학생명 : ${answerDetail.stuNm }</label></h5><br>
				</div>
				<div class="col-6">
				<h5><label>상담제목</label></h5><br>
				<textarea rows="5" cols="50"  readonly>${answerDetail.cnslTtl }</textarea>
				</div>
				<br>
				<div class="col-6">
				<h5><label>상담내용</label></h5><br>
				<textarea rows="5" cols="50"  readonly>${answerDetail.cnslCon }</textarea>
				</div>
				<br>
				<div class="col-6">
					<label>답변내용</label> <br>
					<textarea  id="cnslRpl" rows="5" cols="50" >${answerDetail.cnslRpl }</textarea>
				</div>
				<br>
				<button onclick="insertRpl()" type="button" class="btn btn-sm btn-outline-info">수정</button>
				<button onclick="closeRpl()" type="button" class="btn btn-sm btn-outline-warning">취소</button>
		</div>
	</div>
</div>
<script type="text/javascript">
let cnslRpl,cnslCd,cnslType = "";
let header = "${_csrf.headerName}";
let token = "${_csrf.token}";
let data = {cnslRpl : "",cnslCd : "", cnslType:""};
function insertRpl(){
	data.cnslCd = $("#cnslCd").val();
	data.cnslRpl = $("#cnslRpl").val();
	alert(JSON.stringify(data));
	$.ajax({
		url:"/counsel/professorside/answer",
		type:'POST',
		data: JSON.stringify(data),
		datatype:'JSON',
		contentType: 'application/json; charset=utf-8',
		beforeSend: function (xhr) {
			xhr.setRequestHeader(header, token);
		},
		success:function(result){
			if(result > 0){
			opener.parent.location.reload();
			window.close();
			} else{
				alert("실패");
			}
		}
	});
}
function closeRpl(){window.close();}
</script>