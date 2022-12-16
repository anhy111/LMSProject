<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="/resources/adminlte/plugins/jquery/jquery.min.js"></script>
<div class="container" align="center">
	<div class="row">
		<div class="col-12" id="answerTable">
			<label>답변</label> <br>
				<label>글번호</label> <input type="text"  id="cnslCd"  value="${answerDetail.cnslCd }"  readonly>
				<br>
				<div class="col-6">
					<label>답변내용</label> <br>
					<textarea rows="5" cols="50"  id="cnslRpl" placeholder="답변을작성해주세요"></textarea>
				</div>
				<button id="submitButton" onclick="insertRpl()"type="button" class="btn btn-sm btn-info">답변등록</button>
		</div>
	</div>
</div>
<script type="text/javascript">
let cnslRpl = "";
let cnslCd = "";
let header = "${_csrf.headerName}";
let token = "${_csrf.token}";
let data = {
		cnslRpl : "",
		cnslCd : ""
};
$(function(){
	data.cnslRpl = $("#cnslRpl").val();
	data.cnslCd = $("#cnslCd").val();
});
function insertRpl(){
	alert("ㅎㅇ");
	alert(JSON.stringify(data));
	$.ajax({
		url:"/counsel/professorside/answer",
		type:'POST',
		data: JSON.stringify(data),
		datatype:'JSON',
		contentType:'application/json;charset=utf-8',
		beforeSend: function (xhr) {
			xhr.setRequestHeader(header, token);
		},
		success:function(result){
			console.log(result);
			opener.parent.location.reload();
			window.close();
		}
	});
}
</script>