<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% 
int stuNo = (int)session.getAttribute("no");  
%>
<style>
  a:hover + .textbox {
    display: block; /* make the textbox visible when hovering over the a tag */
  }
</style>
<div class="container">
	<div class="col-12">
		<h1>
			<label>상담신청리스트</label>
		</h1>
	</div>
		<div class="col-6" style="float: left;">
			<button onclick="counselListUp()" class="btn btn-md btn-outline-primary">대면상담</button>
			<button onclick="nonFaceCounselListUp()"class="btn btn-md btn-outline-success">비대면상담</button>
			<button onclick="allListUp()"class="btn btn-md btn-outline-secondary">전체리스트</button>
			<a class="btn btn-md btn-outline-warning" href="/counsel/studentside/applyInsert?stuNo=<%=stuNo  %>"  >상담신청</a>
		</div>
	<br><br>
	<div class="row" id="counselListTable">
		<div class="card">
		<div class="card-header">
			<h3 class="card-title"><b>대면상담리스트</b></h3>
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
									cursorshover="true">상담코드</th>
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
									cursorshover="true">신청일자</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending"
									cursorshover="true">상담예약일</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending"
									cursorshover="true">상담기록</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending"
									cursorshover="true">담당교수</th>
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
								<td>${counselList.cnslCate }</td>
								<td>${fn:substring(counselList.cnslTtl,0,6) }</td>
								<td><fmt:formatDate value="${counselList.cnslReg }"
										pattern="yyyy/MM/dd" /></td>
								<td><fmt:formatDate value="${counselList.cnslDt }"
										pattern="yyyy/MM/dd" /></td>
								<c:if test="${counselList.cnslRpl != null }">
								<td><button class="checkAnswerNote btn btn-sm btn-success" value="${counselList.cnslCd }">상담 기록 확인</button></td>
								</c:if>
								<c:if test="${counselList.cnslRpl == null }">
								<td><span style="color:blue;">대기</span></td>
								</c:if>
								<td>${counselList.empNm }</td>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 
	
	
	 -->
	<div class="row" id="nonFaceCounselListTable">
		<div class="card">
		<div class="card-header">
		<h3 class="card-title"><b>비대면상담리스트</b></h3>
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
											cursorshover="true">상담코드</th>
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
											cursorshover="true">신청일자</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending"
											cursorshover="true">답변상태</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending"
											cursorshover="true">답변등록일자</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending"
											cursorshover="true">담당교수</th>
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
										<!-- 클릭시 결재요청한 서류를 모달창으로 출력 -->
										<td>${nonFaceCounselList.cnslCate }</td>
										<c:if test="${nonFaceCounselList.cnslRpl == null}">
										<td><a class="contHover" style="color:black;">${fn:substring(nonFaceCounselList.cnslTtl,0,4) }</a><button class="contLink btn btn-sm btn-secondary"  data-value="${nonFaceCounselList.cnslCd}" style="display:none;">내용수정</button></td>
										</c:if>
										<c:if test="${nonFaceCounselList.cnslRpl != null}">
										<td>${fn:substring(nonFaceCounselList.cnslTtl,0,4) }</td>
										</c:if>
										<td><fmt:formatDate
												value="${nonFaceCounselList.cnslReg }" pattern="yyyy/MM/dd" /></td>
										<td>
										<c:if test="${nonFaceCounselList.cnslRpl == null}">
										<span style="color:blue;">대기</span> 
										</c:if>
										<c:if test="${nonFaceCounselList.cnslType == '반려' and nonFaceCounselList.cnslRpl != null and nonFaceCounselList.cnslRpl != ''}">
										<button class="rejectLink btn btn-sm btn-danger" data-value="${nonFaceCounselList.cnslCd}">반려</button> 
										</c:if>
										<c:if test="${nonFaceCounselList.cnslType == '비대면' and nonFaceCounselList.cnslRpl != null and nonFaceCounselList.cnslRpl != ''}">
										<button class="answerLink btn btn-sm btn-success"  data-value="${nonFaceCounselList.cnslCd}" >답변확인</button>
										</c:if>
										</td>
										<td><fmt:formatDate value="${nonFaceCounselList.cnslDt }"
												pattern="yyyy/MM/dd" /></td>
										<td>${nonFaceCounselList.empNm }</td>
									</c:forEach>
								</tbody>
							</table>
						</div>
				</div>
		</div>
	</div>
	
	<!-- 
	 
	  -->
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
	function allListUp(){
		$("#nonFaceCounselListTable").css("display", 'block');
		$("#counselListTable").css("display", "block");
	}
	
	const contLinks = document.querySelectorAll('.contLink');
	const contHovers = document.querySelectorAll('.contHover');
	const answerLinks = document.querySelectorAll('.answerLink');
	const answerHovers = document.querySelectorAll('.answerHover');
	const checkAnswerNotes = document.querySelectorAll(".checkAnswerNote");
	const rejectLinks = document.querySelectorAll(".rejectLink");
	
// 	contHovers.forEach((hover, index)=>{
// 	  hover.addEventListener('mouseenter', function() {
// 		  contHovers[index].style.display = 'none';
// 		  contLinks[index].style.display='block';
// 		  });

// 	  hover.addEventListener('mouseleave', function() {
// 		contHovers[index].style.display = 'block';
// 		contLinks[index].style.display = 'none';
// 		  });
// 	});

contHovers.forEach((hover, index)=>{
  hover.addEventListener('mouseenter', function() {
    setTimeout(function() {
      contHovers[index].style.display = 'none';
      contLinks[index].style.display='block';
    }, 500);  // delay of 1 second (1000 milliseconds)
  });

  hover.addEventListener('mouseleave', function() {
    setTimeout(function() {
      contHovers[index].style.display = 'block';
      contLinks[index].style.display = 'none';
    }, 500);  // delay of 1 second (1000 milliseconds)
  });
});
	
	contLinks.forEach((link, index)=>{
		
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