<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<%
	int stuNo = (int) session.getAttribute("no");
%>
<div class="container" style=" background-color: lightgray;">
	<form id="form" action="/counsel/studentside/applyInsert" method="post" onsubmit="return checkInsertData()">
		<input type="hidden" name="stuNo" value="<%=stuNo%>"> <br>
		<div class="col-12" >
			<div class="col-3"
				style="padding-top: 20px; padding-bottom: 10px; padding-right: 0px; padding-left: 30px;">
				<h1>
					<label>상담 등록</label>
				</h1>
			</div>
		</div>
		<br>
		<div class="row"
			style="padding-top: 10px;padding-bottom: 10px;padding-left: 30px;padding-right: 110px;border: ;border: 50px inset lightblue;background-color:white;">
			<br>
			<div class="col-8">
				<div class="col-sm-6">
					<div class="form-group clearfix">
						<div class="icheck-success d-inline">
							<input type="radio" checked="checked" id="counselTypeFace"
								name="cnslType" value="대면"> <label for="counselTypeFace"
								cursorshover="true">대면 </label>
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
			<div class="col-8">
				<div class="col-sm-6">
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
			<div class="col-8">
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
			<br>
			<!-- 		<div class="row"> -->
			<br>
			<br>
			<!----------------------------- 글제목 --------------------------->
			<div class="col-12" >
			<div class="col-sm-6" id="cnslTitleTextBox" style="padding-left: 0px;">
				<div class="col-sm-4">
					<label>제목</label>
				</div>
				<div class="col-sm-6">
					<input type="text" name="cnslTtl" required />
				</div>
			</div>
			<br>
			<div class="col-sm-6" id="cnslReservationDt" style="padding-left: 0px;">
				<div class="col-sm-4">
					<label>예약일</label>
				</div>
				<div class="col-sm-6">
					<input type="date" name="cnslDt" id="cnslDt" required/>
				</div>
			</div>
			</div>
			<br> <br>
			<div class="col-12" id="cnslConTextArea">
				<div>
					<div class="col-sm-4">
						<label>상담 할 내용</label>
					</div>
				</div>
				<div class="col-8">
					<textarea id="cnslCon" name="cnslCon" rows="6" cols="70" ></textarea>
				</div>
			</div>
				<div class="col-4" style="padding-top: inherit;padding-left: 15px;">
					<button type="submit" class="btn btn-sm btn-outline-primary">등록</button>
					<a href="/counsel/studentside/applyList?stuNo=<%=stuNo%>"
						class="btn btn-sm btn-outline-info">목록으로</a>
				</div>
			<br>
		</div>
		<sec:csrfInput />
	</form>
</div>
<script type="text/javascript">
		var editor,value = "";
		function checkInsertData(){
			 editor = CKEDITOR.instances.cnslCon;
			 value = editor.getData();
			console.log("값 : " + value);
			if(value == null || value == ""){
				alert("내용을 적어주세요");
				return false;
			} else {
				alert("모두 작성 완료!");
				return true;
			}
		}
	window.onload = function() {
		CKEDITOR.replace("cnslCon");
		$("#cnslConTextArea").hide();
		$("#cnslReservationDt").show();
	}
	$("input:radio[name='cnslType']").change(function() {
		if ($("#counselTypeFace").is(":checked")) {
			$("#cnslConTextArea").hide();
			$("#cnslReservationDt").show();
			$("#cnslDt").attr("required", "required");
		} else if ($("#counselTypeNonFace").is(":checked")) {
			$("#cnslConTextArea").show();
			$("#cnslReservationDt").hide();
			$("#cnslDt").removeAttr("required", "required");
		}
	});
</script>
