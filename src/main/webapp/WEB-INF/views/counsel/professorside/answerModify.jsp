<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="/resources/adminlte/plugins/jquery/jquery.min.js"></script>
<div class="container" align="center">
	<div class="row">
		<div class="col-12" id="answerModifyTable">
			<label>답변수정</label> <br>
			<form action="/counsel/professorside/answer" method="post" >
				<!-- hidden으로 바꿔줄 예정 -->
				<label>글번호</label>
				 <br>
				  <input type="text" name="cnslCd" id="cnslCdInputModify" readonly value="${answerDetail.cnslCd}">
				<div class="col-6">
					<label>답변내용</label> <br>
					<textarea id="cnslRplModify" rows="5" cols="50" name="cnslRpl"
						placeholder="답변을작성해주세요">${answerDetail.cnslRpl }</textarea>
				</div>
				<button type="submit" class="btn btn-sm btn-info">수정</button>
				<sec:csrfInput />
			</form>
		</div>
	</div>
</div>
