<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="/resources/css/suwon.css">

<style>
/* 기본 틀 잡기 (사이버캠퍼스 / 변동 가능 / suwon.css 파일에 넣었다가 주석 처리함) */
	.card {
		min-height: 780px;
		width: 100%;
		padding: 2%;
		border-top: 5px solid #112a63;
		border-radius: 10px 10px 0 0;
		max-width: 1400px;
		min-width: 1090px;
		margin: 0 auto;
		margin-bottom: 150px;
	}
	
	.card-body {
		width: 100%;
	}
	
	.form-control:disabled, .form-control[readonly] {
		background: #f5f5f5 !important;
	} 
	
	.quizWrapper {
		padding: 0 3%;
	}
	
	.table td {
		border-top: none;
	}
	
	.table thead th {
		padding: 15px !important;
		line-height: 7px !important;
		border-bottom: 1px solid #eef2f7 !important;
	}
	
/* 기본 틀 잡기 끝 */
</style>

<div class="col-lg-12">
			<div class="quizWrapper">
				<h1 class="header-title mb-3"></h1>
				
				<div>
					<div class="mb-3" style="float:left;margin-right: 20px;">
						<label for="example-disable" class="form-label">시험 제목</label> <input
							type="text" class="form-control" id="example-disable" disabled
							value="${data.testNm }">
					</div>
					
			<!-- 		<div class="clear"></div> -->
				
					<div class="mb-3" style="float:left;margin-right: 20px;'">
						<label for="example-disable" class="form-label">시험 시작일</label> <input
							type="text" class="form-control" id="example-disable" disabled
							value="<fmt:formatDate value="${data.testSdt }" pattern="yyyy-MM-dd HH:mm" />">
					</div>
			
			<!-- 		<div class="clear"></div> -->
				
					<div class="mb-3" style="float:left;margin-right: 20px;">
						<label for="example-disable" class="form-label">시험 종료일</label> <input
							type="text" class="form-control" id="example-disable" disabled
							value="<fmt:formatDate value="${data.testEdt }" pattern="yyyy-MM-dd HH:mm" />">
					</div>
					<div class="mb-3" style="float:left;margin-right: 20px;">
					<input type="hidden" value="${data.testPart}" id="testPart" name="testPart">
						<label for="example-disable" class="form-label">시험 구분</label> 
						<c:if test="${data.testPart == 'T01'}">
							<input type="text" class="form-control" value="중간고사" disabled >
						</c:if>
						<c:if test="${data.testPart == 'T02'}">
							<input type="text" class="form-control" value="기말고사" disabled >
						</c:if>
						
					</div>
					
					<div class="clear"></div>
				
					<div class="mb-3" style="width:100%;float:left;">
						<label for="example-disable" class="form-label">내용</label>
						<textarea class="form-control" id="example-disable" style="resize:none;" maxlength="200" rows="4" readonly>${data.testCon }</textarea>
					</div>
				</div>
				
				<div class="clear"></div>
				
				<div class="tab-content">
			         <div class="tab-pane show active" id="basic-example-preview">
			            <div class="table-responsive-sm">
			             
			            <!-- testList =>  TestQVO-->
			             	<c:forEach var="TestQ" items="${data.testQList}" varStatus="stat">
			             	<br><br>
			             	<!-- 보기 시작 -->
			                 <table class="table table-centered mb-0">
			                     <thead>
			                         <tr>
			                             <th>
			                             	<label>${stat.count}.&nbsp;</label>
											<span style="line-height : 25px;" > ${TestQ.teqCon }/ 답 : ${TestQ.teqAnswer}번</span>
			                             </th>
			                         </tr>
			                     </thead>
			                     <tbody>
			                         <tr>
			                             <td>
			                             	<div class="mt-3">
						          				<div class="custom-control custom-radio">
													<input type="radio" id="teqOp1_${stat.count}" name="${stat.count}" class="custom-control-input" 
													<c:if test="${TestQ.teqAnswer == 1 }">checked</c:if> onclick="return false;">&emsp;
													<label class="custom-control-label" for="teqOp1_${stat.count}">${TestQ.teqOption1 }</label>
												</div>
											</div>
			                             </td>
			                         </tr>
			                         <tr>
			                             <td>
			                             	<div class="mt-3">
						          				<div class="custom-control custom-radio">
													<input type="radio" id="teqOp2_${stat.count}" name="${stat.count}" class="custom-control-input" 
													<c:if test="${TestQ.teqAnswer == 2 }">checked</c:if> onclick="return false;">&emsp;
													<label class="custom-control-label" for="teqOp2_${stat.count}">${TestQ.teqOption2 }</label>
												</div>
											</div>
			                             </td>
			                         </tr>
			                         <tr>
			                             <td>
			                             	<div class="mt-3">
						          				<div class="custom-control custom-radio">
													<input type="radio" id="teqOp3_${stat.count}" name="${stat.count}" class="custom-control-input" 
													<c:if test="${TestQ.teqAnswer == 3 }">checked</c:if> onclick="return false;" >&emsp;
													<label class="custom-control-label" for="teqOp3_${stat.count}">${TestQ.teqOption3 }</label>
												</div>
											</div>
			                             </td>
			                         </tr>
			                         <tr>
			                             <td>
			                             	<div class="mt-3">
						          				<div class="custom-control custom-radio">
													<input type="radio" id="teqOp4_${stat.count}" name="${stat.count}" class="custom-control-input" 
													<c:if test="${TestQ.teqAnswer == 4 }">checked</c:if> onclick="return false;" >&emsp;
													<label class="custom-control-label" for="teqOp4_${stat.count}">${TestQ.teqOption4 }</label>
												</div>
											</div>
			                             </td>
			                         </tr>
			                     </tbody>
			                 </table>
			                 <!-- 보기 끝 -->
			                 <hr>
			                 </c:forEach>
			             </div> <!-- end table-responsive-->                     
			         </div> <!-- end preview-->
			     
			     </div>
				<div class="row">
					<div class="col-sm-10"></div>
					<div class="col-sm-2" align="right">
						<form action="/lectureBoard/test/testDelete" method="post" id="delFrm">
							<input type="hidden" name="testCd" value="${data.testCd}">
							<input type="hidden" name="lecaCd" value="${data.lecaCd}">
							<button type="button" class="btn btn-outline-danger" id="del" style="display: inline-block">삭제</button>
							<a href="/lectureBoard/test/test?lecaCd=${data.lecaCd }" class="btn btn-outline-info  goList">목록</a>
							<sec:csrfInput/>
						</form>
					</div>
				</div>
			</div>
	</div>

<script type="text/javascript">

const currentTime = new Date();

$(function(){
	$("#del").on("click",function(){
		Swal.fire({
			  title: '삭제하시겠습니까?',
			  text: "삭제하시면 다시 복구시킬 수 없습니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '삭제',
			  cancelButtonText: '취소'
		}).then((result) => {
			  if (result.value) {
	              //"삭제" 버튼을 눌렀을 때 작업할 내용을 이곳에 넣어주면 된다. 
	              $("#delFrm").submit();
		   };
		});
	});
})

</script>