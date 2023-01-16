<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
/* 기본 틀 잡기 끝 */

	.scoreDiv {
		background: #fff;
		margin: 20px 0;
		padding: 20px;
		height: 115px;
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
</style>

<div class="col-lg-12">
		<div class="card-body">
			<div class="quizWrapper">
				<h1 class="header-title mb-3"></h1>
				
				<div>
					<div class="mb-3" style="width:40%;float:left;">
						<label for="example-disable" class="form-label">퀴즈 제목</label>
						<input type="text" class="form-control" id="example-disable" disabled value="${data.testNm}">
							
					</div>
					
			<!-- 		<div class="clear"></div> -->
				
					<div class="mb-3" style="width:20%;float:left;margin:0 10%;'">
						<label for="example-disable" class="form-label">퀴즈 시작</label>
						 <input type="text" class="form-control" id="example-disable" disabled
							value="<fmt:formatDate value="${data.testSdt}" pattern="yyyy-MM-dd HH:mm" />">
					</div>
			
			<!-- 		<div class="clear"></div> -->
				
					<div class="mb-3" style="width:20%;float:left;">
						<label for="example-disable" class="form-label">퀴즈 종료</label>
						<input type="text" class="form-control" id="example-disable" disabled
							value="<fmt:formatDate value="${data.testEdt}" pattern="yyyy-MM-dd HH:mm" />">
					</div>
					
					<div class="clear"></div>
				
					<div class="mb-3" style="width:100%;float:left;">
						<label for="example-disable" class="form-label">내용</label>
						<textarea class="form-control" id="example-disable" style="resize:none;padding: 15px;" maxlength="200" rows="4" readonly>${data.testCon }</textarea>
					</div>
				</div>
					<div class="clear"></div>
				
				<div class="tab-content">
			         <div class="tab-pane show active" id="basic-example-preview">
			            <div class="table-responsive-sm">
			             
			            <!-- testList =>  TestQ-->
			             	<c:forEach var="testQ" items="${data.testQList}" varStatus="stat">
			             	<br><br>
			                 <table class="table table-centered mb-0">
			                     <thead>
			                         <tr>
			                             <th>
			                             	<label>${stat.count}.&nbsp;</label>
											<span style="line-height: 25px;">${testQ.teqCon}&emsp;/&emsp;답 :  ${testQ.teqAnswer}번</span>
											<input type="hidden" class="stuAn_${stat.count }" value="${data.stdList[stat.index].stdAnswer}" />
											<input type="hidden" class="proAn_${stat.count }" value="${testQ.teqAnswer}" />
			                             </th>
			                         </tr>
			                     </thead>
			                     <tbody>
			                         <tr>
			                             <td>
			                             	<div class="mt-3">
						          				<div class="custom-control custom-radio">
													<input type="radio" id="teqOp1_${stat.count}" name="${stat.count}" class="custom-control-input" 
													<c:if test="${data.stdList[stat.index].stdAnswer == 1 }">checked</c:if>
													onclick="return false;" />&emsp;
													<label class="custom-control-label" for="teqOp1_${stat.count}" >
														<span
																<c:choose>
																	<c:when test="${data.stdList[stat.index].stdAnswer != testQ.teqAnswer && testQ.teqAnswer == 1 }">
																		style="color:red;"
																	</c:when>
																	<c:when test="${testQ.teqAnswer == data.stdList[stat.index].stdAnswer && data.stdList[stat.index].stdAnswer == 1 }">
																		style="color:blue;"
																	</c:when> 
																</c:choose>
														>${testQ.teqOption1 }
													</span>
													</label>
												</div>
											</div>
			                             </td>
			                         </tr>
			                         <tr>
			                             <td>
			                             	<div class="mt-3">
						          				<div class="custom-control custom-radio">
													<input type="radio" id="teqOp2_${stat.count}" name="${stat.count}" class="custom-control-input" 
													<c:if test="${data.stdList[stat.index].stdAnswer == 2 }">checked</c:if> 
													onclick="return false;">&emsp;
													<label class="custom-control-label" for="teqOp2_${stat.count}" >
														<span
																<c:choose>
																	<c:when test="${data.stdList[stat.index].stdAnswer != testQ.teqAnswer && testQ.teqAnswer == 2 }">
																		style="color:red;"
																	</c:when>
																	<c:when test="${testQ.teqAnswer == data.stdList[stat.index].stdAnswer && data.stdList[stat.index].stdAnswer == 2}">
																		style="color:blue;"
																	</c:when> 
																</c:choose>
														>${testQ.teqOption2 }
														</span>
													</label>
												</div>
											</div>
			                             </td>
			                         </tr>
			                         <tr>
			                             <td>
			                             	<div class="mt-3">
						          				<div class="custom-control custom-radio">
													<input type="radio" id="teqOp3_${stat.count}" name="${stat.count}" class="custom-control-input" 
													<c:if test="${data.stdList[stat.index].stdAnswer == 3 }">checked</c:if>
													onclick="return false;" >&emsp;
													<label class="custom-control-label" for="teqOp3_${stat.count}" >
														<span
																<c:choose>
																	<c:when test="${data.stdList[stat.index].stdAnswer != testQ.teqAnswer && testQ.teqAnswer == 3 }">
																		style="color:red;"
																	</c:when>
																	<c:when test="${testQ.teqAnswer == data.stdList[stat.index].stdAnswer && data.stdList[stat.index].stdAnswer == 3 }">
																		style="color:blue;"
																	</c:when> 
																</c:choose>
														>${testQ.teqOption3 }
														</span>
													</label>
												</div>
											</div>
			                             </td>
			                         </tr>
			                         <tr>
			                             <td>
			                             	<div class="mt-3">
						          				<div class="custom-control custom-radio">
													<input type="radio" id="teqOp4_${stat.count}" name="${stat.count}" class="custom-control-input" 
													<c:if test="${data.stdList[stat.index].stdAnswer == 4 }">checked</c:if>
													onclick="return false;" >&emsp;
													<label class="custom-control-label" for="teqOp4_${stat.count}" >
														<span
																<c:choose>
																	<c:when test="${data.stdList[stat.index].stdAnswer != testQ.teqAnswer && testQ.teqAnswer == 4 }">
																		style="color:red;"
																	</c:when>
																	<c:when test="${testQ.teqAnswer == data.stdList[stat.index].stdAnswer && data.stdList[stat.index].stdAnswer == 4 }">
																		style="color:blue;"
																	</c:when> 
																</c:choose>
														>${testQ.teqOption4 }
														</span>
													</label>
												</div>
											</div>
			                             </td>
			                         </tr>
			                     </tbody>
			                 </table>
			                 <hr>
			<%--                  </c:forEach> --%>
			                 </c:forEach>
			             </div> <!-- end table-responsive-->                     
			         </div> <!-- end preview-->
			     	
			     	<div class="scoreDiv">
				     	<div class="mb-3" style="width:20%;float:left;margin-right: 55px;">
							<label for="example-disable" class="form-label">맞은 개수</label> <input
								type="text" class="form-control" id="rightLength" disabled />
						</div>
				     	
				     	<div class="mb-3" style="width:20%;float:left;">
							<label for="example-disable" class="form-label">틀린 개수</label> <input
								type="text" class="form-control" id="wrongLength" disabled
								value="${data.stuTest.stScore }">
						</div>
				     	
				     	<div class="mb-3" style="width:50%;float:right;">
							<label for="example-disable" class="form-label">점수</label> <input
								type="text" class="form-control" disabled id="stuScore"
								value="${data.stuTest.stScore }">
						</div>
			     	</div>
			     
			     </div>
				<div class="row" align="right">
				<div class="col-sm-11"></div>
				<div class="col-sm-1">
				<a href="/lectureBoard/test/studentTest?lecaCd=${data.lecaCd }" class="btn btn-outline-primary btn-sm">목록</a>
				</div>
				</div>
			</div>
		</div>
</div>


<script type="text/javascript" defer="defer">
	$(function () {
		var length = '<c:out value="${fn:length(data.testQList)}" />';
		var stuScore = $('#stuScore').val();
			
		
		var rightCnt = (stuScore / 100) * length;
		$('#rightLength').val(Math.round(rightCnt));
		
		$('#wrongLength').val(Math.round(length - rightCnt));
	})

</script>
