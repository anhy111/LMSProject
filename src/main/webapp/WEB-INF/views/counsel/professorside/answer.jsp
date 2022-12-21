<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="/resources/adminlte/plugins/jquery/jquery.min.js"></script>
<div class="container" align="center">
	<div class="row" style="border: 50px inset aliceblue; padding: 20px;">
			<div class="col-12" id="answerTable">
				<h3>
					<label>답변</label>
				</h3>
				<br> <input type="hidden" id="cnslCd"
					value="${answerDetail.cnslCd }" readonly>
				<div class="col-6">
					<h5>
						<label>학생명 : ${answerDetail.stuNm }</label>
					</h5>
					<br>
				</div>
				<div class="col-6">
					<h5>
						<label>상담제목</label>
					</h5>
					<br>
					<textarea rows="5" cols="50" readonly>${answerDetail.cnslTtl }</textarea>
				</div>
				<br>
				<div class="col-6">
					<h5>
						<label>상담내용</label>
					</h5>
					<br>
					<textarea rows="5" cols="50" readonly>${answerDetail.cnslCon }</textarea>
				</div>
				<br>
				<div id="cnslRplDiv" class="col-6">
					<h5>
						<label>답변내용</label>
					</h5>
					<br>
					<textarea rows="5" cols="50" class="cnslRplTa" id="cnslRpl"
						placeholder="답변을작성해주세요"></textarea>
				</div>
				<div id="rejectDiv" class="col-6" style="display: none;">
					<h5>
						<label>반려사유</label>
					</h5>
					<br>
					<textarea rows="5" cols="50" class="rejectTa" id="rejectReason"
						placeholder="사유을작성해주세요"></textarea>
				</div>
				<br>
				<button id="insertRpl" onclick="insertRpl()" type="button"
					class="btn btn-sm btn-outline-primary">답변등록</button>
				<button id="reject" type="button"
					class="btn btn-sm btn-outline-danger">반려하기</button>
				<button id="rejectConfirm" type="button"
					class="btn btn-sm btn-outline-primary" style="">반려등록</button>
				<button id="rejectBack" type="button"
					class="btn btn-sm btn-outline-success" style="display: none;">되돌아가기</button>
				<button onclick="closeRpl()" type="button"
					class="btn btn-sm btn-outline-warning">취소</button>
			</div>
	</div>
</div>
<script type="text/javascript">
	let cnslRpl, cnslCd, cnslType = "";
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";
	let data = {
		cnslRpl : "",
		cnslCd : "",
		cnslType : ""
	};
	$("#reject").on("click", function() {
		$("#cnslRplDiv").hide();
		$("#insertRpl").hide();
		$("#reject").hide();
		$("#rejectDiv").show();
		$("#rejectConfirm").show();
		$("#rejectBack").show();
	})
	$("#rejectConfirm").on("click", function() {
		if($("#rejectReason").val() == null || $("#rejectReason").val() == "" ){
			alert("답변을 작성해주세요!");
			return;
		}
		var confirmResult = window.confirm("정말로 반려하시겠습니까?");
		if (confirmResult == true) {
			// The user clicked OK.
			// You can execute some code here.
			data.cnslCd = $("#cnslCd").val();
			data.cnslType = '반려';
			data.cnslRpl = $("#rejectReason").val();
			$.ajax({
				url : "/counsel/professorside/answer",
				type : 'POST',
				data : JSON.stringify(data),
				datatype : 'JSON',
				contentType : 'application/json; charset=utf-8',
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function(result) {
					opener.parent.location.reload();
					window.close();
				}
			});
		} else {
			// The user clicked Cancel.
			// You can execute some code here.
			return;
		}

	})
	$("#rejectBack").on("click", function() {
		$("#rejectDiv").hide();
		$("#rejectConfirm").hide();
		$("#rejectBack").hide();
		$("#cnslRplDiv").show();
		$("#insertRpl").show();
		$("#reject").show();

		// 	$("#cnslRplDiv").hide();
		// 	$("#insertRpl").hide();
		// 	$("#reject").hide();
		// 	$("#rejectDiv").show();
		// 	$("#rejectConfirm").show();
		// 	$("#rejectBack").show();
	})

	function insertRpl() {
		if($("#cnslRpl").val() == null || $("#cnslRpl").val() == ""){
			alert("답변을 작성해주세요!");
			return;
		}
		data.cnslCd = $("#cnslCd").val();
		data.cnslRpl = $("#cnslRpl").val();
		
		$.ajax({
			url : "/counsel/professorside/answer",
			type : 'POST',
			data : JSON.stringify(data),
			datatype : 'JSON',
			contentType : 'application/json; charset=utf-8',
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				opener.parent.location.reload();
				window.close();
			}
		});
	}
	function closeRpl() {
		window.close();
	}
</script>