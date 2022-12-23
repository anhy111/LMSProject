<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<%
	int stuNo = (int) session.getAttribute("no");
%>
<style>
tr.recordTr{
 opacity:1;
 background-color:white;
 color:black;
 transition: background-color 1s; opacity 1s;
}
tr.recordTr:hover {
  cursor: pointer;
  opacity:1;
  background-color:blue;
  color:white;
  transition : background-color 1s; opacity 1s;
}
</style>
<div class="container" >	
	<form id="form" action="/counsel/studentside/applyInsert" method="post" onsubmit="return checkInsertData()">
		<input type="hidden" name="stuNo" value="<%=stuNo%>"> <br>
		<input type="hidden"  id="recCd" name="recCd"  value="0"/>	
		<div class="col-12" >
			<div class="col-3">
				<h1>
					<label>상담 등록</label>
				</h1>
			</div>
		</div>
		<br>
		<div class="row">
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
				<div class="col-sm-6">
				
					<button type="button" class="recordList btn btn-default" data-toggle="modal" data-target="#modal-lg">학적 조회</button>
				</div>
				<br>
			</div>
				<br> <br>
			<div class="col-8">
				<div class="col-sm-6">
					<div class="form-group clearfix">
						<div class="icheck-primary d-inline">
							<!----------------상담카테고리 -------------->
							<input type="radio" id="radioPrimary4" name="cnslCate" value="휴학"
								checked="checked"> <label for="radioPrimary4"
								cursorshover="true">휴학 </label>
						</div>
						<div class="icheck-primary d-inline">
							<input type="radio" id="radioPrimary5" name="cnslCate" value="자퇴">
							<label for="radioPrimary5" cursorshover="true">자퇴 </label>
						</div>
						<div class="icheck-primary d-inline">
							<input type="radio" id="radioPrimary6" name="cnslCate" value="졸업"
								cursorshover="true"> <label for="radioPrimary6">졸업
							</label>
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
					<select name="proNo">
						<c:forEach var="professorList" items="${professorList }">
							<option value="${professorList.proNo }">${professorList.empNm }</option>
<%-- 							<option value="${professorList.proNo }_${professorList.empNm }">${professorList.empNm }</option> --%>
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
				<div class="col-4" >
					<button type="submit" class="btn btn-sm btn-outline-primary">등록</button>
					<a href="/counsel/studentside/applyList?stuNo=<%=stuNo%>"
						class="btn btn-sm btn-outline-info">목록으로</a>
				</div>
			<br>
		</div>
		<sec:csrfInput />
	</form>
</div>
<!-- 모달 -->

<div class="modal fade" id="modal-lg" style="display: none;"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">신청한 학적 리스트</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
					<div class="card-body table-responsive col-11 p-0"
				style="height: 300px;width:1600px;">
				<table
					class="table table-head-fixed text-nowrap table-condensed table-sm">
						<thead>
						<tr class="text-center">
							<th width="4%">순번</th>
							<th width="12%">카테고리</th>
							<th width="4%">신청연도</th>
							<th width="12%">신청학기</th>
							<th width="12%">기간</th>
							<th width="12%">신청날짜</th>
							<th width="4%">승인여부</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="recordList" items="${recordList}">
							<tr class="recordTr">
								<td>${recordList.recCd}</td>
								<td>${recordList.rgbCd}</td>
								<td>${recordList.recYr}</td>
								<td>${recordList.recSem}</td>
								<td>${recordList.recPer}개월</td>
								<td><fmt:formatDate value="${recordList.recDt }" pattern="yyyy년 MM월 dd일" /></td>
								<td>
								<c:if test="${recordList.recYn eq '반려'}">
								<span style="color:red;">${recordList.recYn }</span>
								</c:if>
								<c:if test="${recordList.recYn eq '승인대기'}">
								<span style="color:black;">${recordList.recYn }</span>
								</c:if>
								<c:if test="${recordList.recYn eq '승인'}">
								<span style="color:blue;">${recordList.recYn }</span>
								</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="modalClose btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>

	</div>

</div>

<!-- 모달 -->
<script type="text/javascript">
let header = "${_csrf.headerName}";
let token = "${_csrf.token}";
		var editor,value,recordTrElements,tdValues,radioButtons,tdRecordValue = "";
		function checkInsertData(){
			 editor = CKEDITOR.instances.cnslCon;
			 value = editor.getData();
			console.log("값 : " + value);	
			 if ($("#counselTypeNonFace").is(":checked")) {
					if(value == null || value == ""){
						alert("내용을 적어주세요");
						return false;
					} else {
						return true;
					}
			 }else if($("#counselTypeFace").is(":checked")) {
				 return true;
			 }
		}
		
		
	window.onload = function() {

		radioButtons  = document.querySelectorAll('input[type="radio"]');

		recordTrElements  = document.querySelectorAll('.recordTr');

		recordTrElements.forEach(element => {
		  element.addEventListener('click', function() {
		    // Your click event handler code goes here
			  tdValues  = Array.from(this.querySelectorAll('td')).map(td => td.textContent);
			  for (let i = 0; i < radioButtons.length; i++) {
				  if(tdValues[1].substring(2,4)==radioButtons[i].value){ 
					  radioButtons[i].checked = true;
					  tdRecordValue = tdValues[0];
					  $("#recCd").val(tdRecordValue);
					  document.querySelector(".modalClose").click();
				} else if(tdValues[1].substring(-2)==radioButtons[i].value){ 
					 radioButtons[i].checked = true;
					 tdRecordValue = tdValues[0];
					 $("#recCd").val(tdRecordValue);
					 document.querySelector(".modalClose").click();
				}
			  }
		  });
		});
		
		
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
