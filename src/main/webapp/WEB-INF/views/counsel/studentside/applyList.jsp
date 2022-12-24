<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css" href="/resources/css/dataTableTemplate.css">
<%
	int stuNo = (int) session.getAttribute("no");
%>
<style>
.contHoverTd {position: relative;}

.contHover {display: none;}

.contHoverTd:hover .contHover {
	position: absolute;
	top: -5px;
	right: 0px;
	opacity: 1;
	width: 175px;
	height: 50px;
	display: block;
	text-align: center;
	line-height: 50px;
	opacity: 0.8;
}
</style>
<div class="container">
	<div class="col-12">
		<h1>
			<label>상담신청리스트</label>
		</h1>
	</div>
	<div class="col-6">
		<button onclick="counselListUp()"
			class="btn btn-md btn-outline-primary">대면상담</button>
		<button onclick="nonFaceCounselListUp()"
			class="btn btn-md btn-outline-success">비대면상담</button>
		<button onclick="allListUp()" class="btn btn-md btn-outline-secondary">전체리스트</button>
		<a class="btn btn-md btn-outline-warning"
			href="/counsel/studentside/applyInsert?stuNo=<%=stuNo%>">상담신청</a>
	</div>
	<br> <br>
	<div class="row" id="counselListTable">
		<div class="card">
			<div class="card-header">
				<h3 class="card-title">
					<b>대면상담리스트</b>
				</h3>
			</div>
			<div class="card-body table-responsive col-11 p-0"
				style="height: 300px;">
				<table
					class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
					<thead>
						<tr class="text-center">
							<th width="4%">상담코드</th>
							<th width="8%">카테고리</th>
							<th width="18%">제목</th>
							<th width="12%">신청일자</th>
							<th width="12%">상담예약일</th>
							<th width="6%">상담기록</th>
							<th width="4%">담당교수</th>
						</tr>
					</thead>
					<tbody id="notSaveLecture">
						<c:forEach var="counselList" items="${counselList}">
							<tr>
								<td>${counselList.cnslCd}</td>
								<!-- 클릭시 결재요청한 서류를 모달창으로 출력 -->
								<td style="text-align: center;">${counselList.cnslCate }</td>

								<c:if test="${counselList.cnslRpl == null }">
									<td class="contHoverTd">${fn:substring(counselList.cnslTtl,0,5) }<a
										class="contHover"
										style="color: white; background-color: green;"
										data-value="${counselList.cnslCd}">내용수정</a>
									</td>
								</c:if>
								<c:if test="${counselList.cnslRpl != null }">
									<td>${fn:substring(counselList.cnslTtl,0,5) }
									</td>
								</c:if>
								<td><fmt:formatDate value="${counselList.cnslReg }"
										pattern="yyyy/MM/dd" /></td>
								<td><fmt:formatDate value="${counselList.cnslDt }"
										pattern="yyyy/MM/dd" /></td>
								<c:if test="${counselList.cnslRpl != null }">
									<td><button class="checkAnswerNote btn btn-sm btn-success"
											value="${counselList.cnslCd }">상담 기록 확인</button></td>
								</c:if>
								<c:if test="${counselList.cnslRpl == null }">
									<td><span style="color: blue;">대기</span></td>
								</c:if>
								<td>${counselList.empNm }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- 
	
	
	 -->
	<div class="row" id="nonFaceCounselListTable">
		<div class="card">
			<div class="card-header">
				<h3 class="card-title">
					<b>비대면상담리스트</b>
				</h3>
			</div>
			<div class="card-body table-responsive col-11 p-0"
				style="height: 300px;">
				<table
					class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
					<thead>
						<tr class="text-center">
							<th width="4%">상담코드</th>
							<th width="8%">카테고리</th>
							<th width="18%">제목</th>
							<th width="12%">신청일자</th>
							<th width="6%">답변상태</th>
							<th width="12%">답변등록일</th>
							<th width="4%">담당교수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="nonFaceCounselList" items="${nonFaceCounselList}">
							<tr>
								<td>${nonFaceCounselList.cnslCd}</td>
								<!-- 클릭시 결재요청한 서류를 모달창으로 출력 -->
								<td>${nonFaceCounselList.cnslCate }</td>
								<c:if test="${nonFaceCounselList.cnslRpl == null}">
									<td class="contHoverTd">${fn:substring(nonFaceCounselList.cnslTtl,0,5) }<a
										class="contHover"
										style="color: white; background-color: green;"
										data-value="${nonFaceCounselList.cnslCd}">내용수정</a></td>
								</c:if>
								<c:if test="${nonFaceCounselList.cnslRpl != null}">
									<td>${fn:substring(nonFaceCounselList.cnslTtl,0,5) }</td>
								</c:if>
								<td><fmt:formatDate value="${nonFaceCounselList.cnslReg }"
										pattern="yyyy/MM/dd" /></td>
								<td>
								<c:if test="${nonFaceCounselList.cnslRpl == null}">
										<span style="color: blue;">대기</span>
									</c:if>
									 <c:if test="${nonFaceCounselList.cnslType == '반려' and nonFaceCounselList.cnslRpl != null and nonFaceCounselList.cnslRpl != ''}">
										<button class="rejectLink btn btn-sm btn-danger"
											data-value="${nonFaceCounselList.cnslCd}">반려</button>
									</c:if> 
									<c:if test="${nonFaceCounselList.cnslType == '비대면' and nonFaceCounselList.cnslRpl != null and nonFaceCounselList.cnslRpl != ''}">
										<button class="answerLink btn btn-sm btn-success"
											data-value="${nonFaceCounselList.cnslCd}">답변확인</button>
									</c:if>
									</td>
								<td><fmt:formatDate value="${nonFaceCounselList.cnslDt }"
										pattern="yyyy/MM/dd" /></td>
								<td>${nonFaceCounselList.empNm }</td>
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
	function allListUp(){
		$("#nonFaceCounselListTable").show();
		$("#counselListTable").show();
	}
	
	const contHovers = document.querySelectorAll('.contHover');
	const answerLinks = document.querySelectorAll('.answerLink');
	const answerHovers = document.querySelectorAll('.answerHover');
	const checkAnswerNotes = document.querySelectorAll(".checkAnswerNote");
	const rejectLinks = document.querySelectorAll(".rejectLink");
	

	contHovers.forEach((link, index)=>{
		
	 //제목 클릭시 내용 수정
	  link.addEventListener('click', function() {
		  const value = this.dataset.value;
		  window.open("/counsel/studentside/applyModify?cnslCd="+ value, "applyModify","width=1000, height=800, left=100, top=50");
		  //alert(value);
		});
	});
	
	answerLinks.forEach((link,index)=>{
	  //제목 클릭시 답변 확인
	  link.addEventListener('click', function() {
		  const value = this.dataset.value;
		  window.open("/counsel/studentside/checkAnswer?cnslCd="+ value, "checkAnswer","width=1000, height=800, left=100, top=50");
		  //alert(value);
		});
	});
	
	rejectLinks.forEach((link, index)=>{
		//제목 클릭시 반려 사유 확인
		link.addEventListener("click",function(){
			const value= this.dataset.value;
			window.open("/counsel/studentside/checkReject?cnslCd="+ value, "checkAnswer","width=1000, height=800, left=100, top=50");
		})
	})
	// 클릭시 교수가 작성한 상담 기록서 확인 및 다운
	checkAnswerNotes.forEach((note, index)=>	{
		note.addEventListener('click',function(){
			const value = this.value
		  window.open("/counsel/studentside/answerNote?cnslCd="+ value, "checkAnswerNote","width=1000, height=800, left=100, top=50");
		})
	});
	
</script>