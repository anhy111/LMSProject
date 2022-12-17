<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="/resources/adminlte/plugins/jquery/jquery.min.js"></script>
<style>div{border:1px solid black;}</style>
<div class="container" align="center">
	<div class="row">
		<div class="col-12" id="answerTable">
			<h3><label>답변확인</label></h3> <br>
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
					<h5><label>답변내용</label></h5> <br>
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