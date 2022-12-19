<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%
int stuNo = (int)session.getAttribute("no");
%>
<style>
div {
	border: 1px solid orange;
}
}
</style>
<div class="container" align="center">
	<form action="/counsel/studentside/applyInsert" method="post">
<input type="text" name="stuNo" value="<%=stuNo %>"> 
		<div class="row">
			<div class="col-12">
				<h1>
					<label>상담 등록</label>
				</h1>
				<br> <br>
			</div>
			<div class="col-12">
			<div class="col-sm-6">
				<div class="col-sm-4">
					<label>대면/비대면</label>
				</div>
				<div class="form-group clearfix">
					<div class="icheck-success d-inline">
						<input type="radio" checked="checked" id="counselTypeFace"
							name="cnslType" value="대면"> <label
							for="counselTypeFace" cursorshover="true">대면 </label>
					</div>
					<div class="icheck-success d-inline">
						<input type="radio" id="counselTypeNonFace" name="cnslType"
							value="비대면"> <label for="counselTypeNonFace"
							cursorshover="true">비대면 </label>
					</div>
				</div>
			</div>
			</div>
			<br> <br>
			<div class="col-12">
			<div class="col-sm-6">
				<div class="col-sm-4">
					<label>상담 유형</label>
				</div>
				<div class="form-group clearfix">
					<div class="icheck-primary d-inline">
						<!----------------상담카테고리 -------------->
						<input type="radio" id="radioPrimary1" name="cnslCate" value="시험"
							checked="checked"> <label for="radioPrimary1"
							cursorshover="true">시험 </label>
					</div>
					<div class="icheck-primary d-inline">
						<input type="radio" id="radioPrimary2" name="cnslCate" value="과제">
						<label for="radioPrimary2" cursorshover="true">과제 </label>
					</div>
					<div class="icheck-primary d-inline">
						<input type="radio" id="radioPrimary3" name="cnslCate" value="출결"
							cursorshover="true"> <label for="radioPrimary3">출결
						</label>
					</div>
				</div>
			</div>
			</div>
			<br> <br>
			<div class="col-12">
			<div class="col-sm-4">
				<label>담당 교수</label>
			</div>
			<div class="col-6">
				<select name="empNm">
					<c:forEach var="professorList" items="${professorList }">
						<option value="${professorList.proNo }_${professorList.empNm }">${professorList.empNm }</option>
					</c:forEach>
				</select>
			</div>
			</div>
		</div>
		<br><br>
		<div class="row">
			<br> <br>
			<!----------------------------- 글제목 --------------------------->
			<div class="col-12"id="cnslTitleTextBox">
			<div class="col-sm-2">
				<label>제목</label>
			</div>
			<div class="col-8">
				<input type="text" name="cnslTtl" />
			</div>
			</div>
			<div class="col-12"id="cnslReservationDt" style="display:none;">
			<div class="col-sm-2">
				<label>상담예약</label>
			</div>
			<div class="col-8">
				<input type="date" name="cnslDt" />
			</div>
			</div>
			<br> <br>
			<div class="col-12" id="cnslConTextArea">
				<div>
					<div class="col-sm-4">
						<label>상담 할 내용</label>
					</div>
				</div>
				<textarea name="cnslCon" rows="10" cols="100"></textarea>
			</div>
		</div>
		<div class="col-12">
			<div class="col-4">
				<button type="submit" class="btn btn-sm btn-outline-primary">등록</button>
				<a href="/counsel/studentside/applyList?stuNo=<%=stuNo %>" class="btn btn-sm btn-outline-danger">목록으로</a>
			</div>
		</div>
			<sec:csrfInput />
		</form>
</div>
<script type="text/javascript">
window.onload=function(){
	$("#cnslConTextArea").css("display", "none");
// 	$("#cnslTitleTextBox").css("display", "none");
	$("#cnslReservationDt").css("display", "block");
}
	$("input:radio[name='cnslType']").change(function() {
		if ($("#counselTypeFace").is(":checked")) {
			// 				console.log("대면값 : " + $("#counselTypeFace").val())
			$("#cnslConTextArea").css("display", "none");
// 			$("#cnslTitleTextBox").css("display", "none");
			$("#cnslReservationDt").css("display", "block");
		} else if ($("#counselTypeNonFace").is(":checked")) {
			alert($("input:radio[name='cnslType']:checked").val());
			$("#cnslConTextArea").css("display", "block");
// 			$("#cnslTitleTextBox").css("display", "block	");
			$("#cnslReservationDt").css("display", "none");
			// 				console.log("비대면값 : " + $("#counselTypeNonFace").val())
		}
	});
</script>
