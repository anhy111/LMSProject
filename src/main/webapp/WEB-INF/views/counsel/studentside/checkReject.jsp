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
		<div class="col-12" id="answerTable">
			<h3><label>반려사유확인</label></h3> <br>
				<input type="hidden" value="${answerDetail.cnslCd }" readonly>
				<div class="col-6">
				<h5><label>상담제목</label></h5><br>
				<input type="text" value="${answerDetail.cnslTtl }" readonly/>
				</div>
				<br>
				<div class="col-6">
				<h5><label>상담내용</label></h5><br>
				<textarea rows="5" cols="50"  readonly>${answerDetail.cnslCon }</textarea>
				</div>
				<br>
				<div class="col-6">
					<h5><label>반려사유</label></h5> <br>
					<textarea rows="5" cols="50"  readonly>${answerDetail.cnslRpl }</textarea>
				</div>
				<br>
				<button onclick="closeAnswer()" type="button" class="btn btn-sm btn-outline-warning">확인</button>
		</div>
	</div>
</div>
<script type="text/javascript">

function closeAnswer(){window.close();}
</script>