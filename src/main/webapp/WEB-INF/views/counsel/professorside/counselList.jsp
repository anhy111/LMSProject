<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" type="text/css" href="/resources/css/dataTableTemplate.css">
<style>
tr.text-center td:hover{
opacity:0.6;
color:white;
background-color:gray;
transition: opacity 1s, color 1s, background-color 1;
cursor:pointer;
}


</style>
<div class="row">
	<div class="form-group col-12">
			<div class="card-header d-flex p-0">
				<ul class="nav nav-pills ml-auto p-2">
					<li class="nav-item"><a class="nav-link active" href="#tab_1"
						data-toggle="tab">대면</a></li>
					<li class="nav-item"><a class="nav-link" href="#tab_2"
						data-toggle="tab">비대면</a></li>
				</ul>
			</div>
					<div class=" alert alert-light" role="alert"
						style="font-size: 0.9em; padding: 1em; border: 1px solid #eee;">
						<p>
							<strong><b>※ 안내사항</b></strong> <br>
							<br> (1)&nbsp;상단탭의&nbsp;<strong style="color:blue">대면/비대면</strong>을 클릭하면 구분하여 확인 할 수 있습니다.<br>
							<br> (2)&nbsp;<strong>승인대기</strong>시에는 수정, 삭제 할 수 있으며<br>&nbsp;&nbsp;&nbsp;&nbsp;<strong>승인 및 반려</strong>처리가 되면 수정, 삭제할 수 없습니다.<br> 
							<br> (3)&nbsp;하단의 <strong>신청</strong> 버튼을 눌러 신청 할 수 있습니다.<br>
							<br> (4)&nbsp;<strong>기록 및 답변</strong>이 등록되면 확인/출력 할 수 있습니다.
						</p>
					</div>
			<div class="card-body">
				<div class="tab-content">
					<div class="tab-pane active" id="tab_1">	
						

				<table
					class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
					<thead>
						<tr class="text-center">
							<th width="4%">No</th>
							<th width="6%">학생명</th>
							<th width="6%">카테고리</th>
							<th width="8%">제목</th>
							<th width="12%">신청일</th>
							<th width="12%">상담예약일</th>
							<th width="6%">상담기록확인</th>
						</tr>
					</thead>

					<tbody>
											<c:forEach var="counselList" items="${counselList}" varStatus="status" end="${counselList.size() }">
							<tr class="text-center" data-toggle="modal" data-target="#">
								<td data-value="${counselList.cnslCd}">${status.end-status.index }</td>
								<td>${counselList.stuNm}</td>
								<td>${counselList.cnslCate }</td>
								<td>${fn:substring(counselList.cnslTtl,0,5) }</td>
								<td><fmt:formatDate value="${counselList.cnslReg }"
 										pattern="yy/MM/dd" /></td> 
								<td><fmt:formatDate value="${counselList.cnslDt }" 
									pattern="yy/MM/dd" /></td> 
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
	<div class="tab-pane" id="tab_2">
				<table
					class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
										<thead>
						<tr class="text-center">
							<th width="4%">No</th>
							<th width="6%">학생명</th>
							<th width="6%">카테고리</th>
							<th width="8%">제목</th>
							<th width="12%">신청일</th>
							<th width="12%">답변일</th>
							<th width="6%">답변</th>
						</tr>
					</thead>
					<tbody>
								<c:forEach var="nonFaceCounselList" items="${nonFaceCounselList}" varStatus="status" end="${nonFaceCounselList.size()}"> 
							<tr class="text-center" data-toggle="modal" data-target="#">
								<td data-value="${nonFaceCounselList.cnslCd}">${status.end-status.index }</td>
								<td>${nonFaceCounselList.stuNm}</td>
								<td>${nonFaceCounselList.cnslCate }</td>
								<td>${fn:substring(nonFaceCounselList.cnslTtl,0,5) }</td>
							<td><fmt:formatDate value="${nonFaceCounselList.cnslReg }"
 										pattern="yy/MM/dd" /></td> 
 								<td><fmt:formatDate value="${nonFaceCounselList.cnslDt }" 
 										pattern="yy/MM/dd" /></td> 
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
</div>
</div>
	

<script type="text/javascript">

</script>
