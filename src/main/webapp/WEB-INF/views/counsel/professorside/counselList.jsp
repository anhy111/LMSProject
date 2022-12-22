<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<style>
.card {
	width: 1600px;
	padding: 20px;
	border: 10px outset lightblue;
	align-items: center;
}
</style>
<div class="container"
	style="border: 20px outset lightgrey; padding: 20px; text-align: center;float: left;">
	<div class="col-12" style="display: flex;">
		<h1>
			<label>상담요청목록</label>
		</h1>
	</div>
	<div class="col-6" style="display: flex; padding-top: 10px;">
		<button onclick="counselListUp()"
			class="btn btn-md btn-outline-primary">대면상담</button>
		<button onclick="nonFaceCounselListUp()"
			class="btn btn-md btn-outline-success">비대면상담</button>
		<button onclick="allListUp()" class="btn btn-md btn-outline-secondary">전체리스트</button>
	</div>
	<br> <br>
	<div class="row" id="nonFaceCounselListTable">
		<div class="card">
			<div class="card-header">
				<h3 class="card-title">
					<b>비대면상담요청리스트</b>
				</h3>
			</div>
			<div class="card-body table-responsive col-11 p-0"
				style="height: 300px;">
				<table
					class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
					<thead>
						<tr class="text-center">
							<th width="12%">상담번호</th>
							<th width="6%">학생명</th>
							<th width="6%">카테고리</th>
							<th width="8%">제목</th>
							<th width="12%">신청일</th>
							<th width="12%">답변일</th>
							<th width="6%">답변</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="nonFaceCounselList" items="${nonFaceCounselList}">
							<tr>
								<td>${nonFaceCounselList.cnslCd}</td>
								<td>${nonFaceCounselList.stuNm}</td>
								<td>${nonFaceCounselList.cnslCate }</td>
								<td>${fn:substring(nonFaceCounselList.cnslTtl,0,5) }</td>
								<td><fmt:formatDate value="${nonFaceCounselList.cnslReg }"
										pattern="yyyy/MM/dd" /></td>
								<td><fmt:formatDate value="${nonFaceCounselList.cnslDt }"
										pattern="yyyy/MM/dd" /></td>
								<td><c:if
										test="${nonFaceCounselList.cnslDt == null and nonFaceCounselList.cnslType == '비대면'}">
										<button name="answerInsert" id="answerInsert"
											class="btn btn-sm btn-secondary"
											value="${nonFaceCounselList.cnslCd}">답변작성</button>
									</c:if> <c:if
										test="${nonFaceCounselList.cnslDt != null and nonFaceCounselList.cnslType == '반려'}">
										<span style="color: red">반려처리</span>
									</c:if> <c:if
										test="${nonFaceCounselList.cnslDt != null and nonFaceCounselList.cnslType == '비대면'}">
										<button name="answerModify" id="answerModify"
											class="btn btn-sm btn-success"
											value="${nonFaceCounselList.cnslCd}">답변수정</button>
									</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!--  
						
						
						
						비대면 상담 리스트
						-->
	<div class="row" id="counselListTable">
		<div class="card">
			<div class="card-header">
				<h3 class="card-title">
					<b>대면상담요청리스트</b>
				</h3>
			</div>
			<div class="card-body table-responsive col-11 p-0"
				style="height: 300px;">
				<table
					class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
					<thead>
						<tr class="text-center">
							<th width="12%">상담번호</th>
							<th width="6%">학생명</th>
							<th width="6%">카테고리</th>
							<th width="8%">제목</th>
							<th width="12%">신청일</th>
							<th width="12%">상담예약일</th>
							<th width="6%">상담기록확인</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="counselList" items="${counselList}">
							<tr>
								<td>${counselList.cnslCd}</td>
								<!-- 클릭시 결재요청한 서류를 모달창으로 출력 -->
								<td>${counselList.stuNm}</td>
								<td>${counselList.cnslCate }</td>
								<td>${fn:substring(counselList.cnslTtl,0,5) }</td>
								<td><fmt:formatDate value="${counselList.cnslReg }"
										pattern="yyyy/MM/dd" /></td>
								<td><fmt:formatDate value="${counselList.cnslDt }"
										pattern="yyyy/MM/dd" /></td>
								<c:if test="${counselList.cnslRpl != null }">
									<td><button id="answerNoteModify"
											value="${counselList.cnslCd }" class="btn btn-sm btn-success">상담
											완료</button></td>
								</c:if>
								<c:if test="${counselList.cnslRpl == null }">
									<td><button id="answerNoteWrite"
											value="${counselList.cnslCd }" class="btn btn-sm btn-info">상담
											전</button></td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</div>

<script type="text/javascript">
	function counselListUp() {
		$("#nonFaceCounselListTable").hide();
		$("#counselListTable").show();
	}
	function nonFaceCounselListUp() {
		$("#nonFaceCounselListTable").show();
		$("#counselListTable").hide();
	}
	function allListUp() {
		$("#nonFaceCounselListTable").show();
		$("#counselListTable").show();
	}
	/*비대면 상담*/
	$(document).on(
			'click',
			'#answerInsert',
			function() {
				window.open("/counsel/professorside/answer?cnslCd="
						+ this.value, "answerInsert",
						"width=1000, height=800, left=100, top=50");
			});
	$(document).on(
			'click',
			'#answerModify',
			function() {
				window.open("/counsel/professorside/answerModify?cnslCd="
						+ this.value, "answerModify",
						"width=1000, height=800, left=100, top=50");
			});
	/*대면 상담*/
	$(document).on(
			'click',
			'#answerNoteWrite',
			function() {
				window.open(
						"/counsel/professorside/answerNoteWriteUpdate?cnslCd="
								+ this.value, "answerNoteWrite",
						"width=1000, height=800, left=100, top=50");
			});
	$(document).on(
			'click',
			'#answerNoteModify',
			function() {
				window.open(
						"/counsel/professorside/answerNoteWriteUpdate?cnslCd="
								+ this.value, "answerNoteModify",
						"width=1000, height=800, left=100, top=50");
			});
</script>
