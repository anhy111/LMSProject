<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<div class="container" >
	<div class="col-12">
		<h1>
			<label>상담요청목록</label>
		</h1>
	</div>
		<div class="col-sm-8" style="float: left;">
			<button onclick="counselListUp()" class="btn btn-md btn-primary">대면상담</button>
			<button onclick="nonFaceCounselListUp()"class="btn btn-md btn-success">비대면상담</button>
			<button onclick="allListUp()"class="btn btn-md btn-outline-secondary">전체리스트</button>
		</div>
		<br><br>
	<div class="row" id="nonFaceCounselListTable">
		<div class="card">
		<div class="card-header">
			<h3 class="card-title">비대면상담요청리스트</h3>
			</div>
			<div class="card-body">
				<div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">
						<table id="example2"
								class="table table-bordered table-hover dataTable dtr-inline"
								aria-describedby="example2_info">
								<thead>
									<tr>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="Rendering engine: activate to sort column ascending"
											cursorshover="true">상담번호</th>
										<th class="sorting sorting_desc" tabindex="0"
											aria-controls="example1" rowspan="1" colspan="1"
											aria-label="Browser: activate to sort column ascending"
											cursorshover="true" aria-sort="descending">학생명</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="Platform(s): activate to sort column ascending"
											cursorshover="true">카테고리</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="Engine version: activate to sort column ascending"
											cursorshover="true">제목</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending"
											cursorshover="true">신청일</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending"
											cursorshover="true">답변일</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending"
											cursorshover="true">답변</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="nonFaceCounselList"
										items="${nonFaceCounselList}" varStatus="stat">
										<c:if test="${stat.count%2!=0 }">
											<tr class="odd">
										</c:if>
										<c:if test="${stat.count%2==0 }">
											<tr class="even">
										</c:if>
										<td class="dtr-control sorting_1" tabindex="0">${nonFaceCounselList.cnslCd}</td>
										<td>${nonFaceCounselList.stuNm}</td>
										<td>${nonFaceCounselList.cnslCate }</td>
										<td>${fn:substring(nonFaceCounselList.cnslTtl,0,5) }</td>
										<td><fmt:formatDate
												value="${nonFaceCounselList.cnslReg }" pattern="yyyy/MM/dd" /></td>
										<td><fmt:formatDate value="${nonFaceCounselList.cnslDt }"
												pattern="yyyy/MM/dd" /></td>
										<td>
										<c:if test="${nonFaceCounselList.cnslDt == null and nonFaceCounselList.cnslType == '비대면'}">
										<button name="answerInsert" id="answerInsert" class="btn btn-sm btn-secondary"
												value="${nonFaceCounselList.cnslCd}">답변작성</button>
										</c:if>
										<c:if test="${nonFaceCounselList.cnslDt != null and nonFaceCounselList.cnslType == '반려'}">
										<span style="color:red">반려처리</span>
										</c:if>
										<c:if test="${nonFaceCounselList.cnslDt != null and nonFaceCounselList.cnslType == '비대면'}">
											<button name="answerModify" id="answerModify" class="btn btn-sm btn-success"
												value="${nonFaceCounselList.cnslCd}">답변수정</button>
										</c:if>
										</td>
									</c:forEach>
								</tbody>
							</table>
						</div>
				</div>
		</div>
	</div>
	<!--  
						
						
						
						비대면 상담 리스트
						-->
	<div class="row" id="counselListTable">
		<div class="card">
		<div class="card-header">
			<h3 class="card-title">대면상담요청리스트</h3>
			</div>
			<div class="card-body">
				<div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4">
						<table id="example2"
								class="table table-bordered table-hover dataTable dtr-inline"
								aria-describedby="example2_info">
								<thead>
									<tr>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="Rendering engine: activate to sort column ascending"
											cursorshover="true">상담번호</th>
										<th class="sorting sorting_desc" tabindex="0"
											aria-controls="example1" rowspan="1" colspan="1"
											aria-label="Browser: activate to sort column ascending"
											cursorshover="true" aria-sort="descending">학생명</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="Platform(s): activate to sort column ascending"
											cursorshover="true">카테고리</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="Platform(s): activate to sort column ascending"
											cursorshover="true">제목</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending"
											cursorshover="true">신청일</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending"
											cursorshover="true">상담예약일</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending"
											cursorshover="true">상담기록확인</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="counselList" items="${counselList}"
										varStatus="stat">
										<c:if test="${stat.count%2!=0 }">
											<tr class="odd">
										</c:if>
										<c:if test="${stat.count%2==0 }">
											<tr class="even">
										</c:if>
										<td class="dtr-control sorting_1" tabindex="0">${counselList.cnslCd}</td>
										<!-- 클릭시 결재요청한 서류를 모달창으로 출력 -->
										<td>${counselList.stuNm}</td>
										<td>${counselList.cnslCate }</td>	
										<td>${fn:substring(counselList.cnslTtl,0,5) }</td>	
										<td><fmt:formatDate value="${counselList.cnslReg }"
												pattern="yyyy/MM/dd" /></td>
										<td><fmt:formatDate value="${counselList.cnslDt }"
												pattern="yyyy/MM/dd" /></td>
										<c:if test="${counselList.cnslRpl != null }">
										<td><button id="answerNoteModify" value="${counselList.cnslCd }" class="btn btn-sm btn-success">상담 완료</button></td>
										</c:if>
										<c:if test="${counselList.cnslRpl == null }">
										<td><button id="answerNoteWrite" value="${counselList.cnslCd }" class="btn btn-sm btn-info">상담 전</button></td>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
	</div>
</div>
<script type="text/javascript">
	function counselListUp() {
		$("#nonFaceCounselListTable").css("display", 'none');
		$("#counselListTable").css("display", "block");
	}
	function nonFaceCounselListUp() {
		$("#nonFaceCounselListTable").css("display", 'block');
		$("#counselListTable").css("display", "none");
	}
	function allListUp() {
		$("#nonFaceCounselListTable").css("display", 'block');
		$("#counselListTable").css("display", "block");
	}
	/*비대면 상담*/
	$(document).on('click','#answerInsert',function() {
				window.open("/counsel/professorside/answer?cnslCd="+ this.value, "answerInsert","width=1000, height=800, left=100, top=50");
			});
	$(document).on('click','#answerModify',function() {
				window.open("/counsel/professorside/answerModify?cnslCd="+ this.value, "answerModify","width=1000, height=800, left=100, top=50");
			});
	/*대면 상담*/
	$(document).on('click','#answerNoteWrite',function() {
				window.open("/counsel/professorside/answerNoteWriteUpdate?cnslCd="+ this.value, "answerNoteWrite","width=1000, height=800, left=100, top=50");
			});
	$(document).on('click','#answerNoteModify',function() {
				window.open("/counsel/professorside/answerNoteWriteUpdate?cnslCd="+ this.value, "answerNoteModify","width=1000, height=800, left=100, top=50");
			});
</script>
