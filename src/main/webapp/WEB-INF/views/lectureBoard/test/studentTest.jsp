<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="/resources/css/suwon.css">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" defer="defer">
</script>
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
	}
	
	.card-body {
		width: 100%;
	}
	
/* 기본 틀 잡기 끝 */

	.emphasisR {
		color: red;
	}
	
	.table-responsive-sm {
		margin-bottom: 40px;
		min-height: 500px;
	}
</style>
<%
      Date date = new Date();
   	  date.setDate(date.getDate()-1);
      SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy.MM.dd");
      String simDate = simpleDate.format(date);
%>

<c:set var="date" value="<%= simDate %>" />

<div class="quizWrapper">
	<div class="col-lg-12">
			<div class="card-body">
				<h4>${data.lecaNm }&emsp;&#45;&emsp;과목 시험</h4>
					<div class="alert alert-light" role="alert" style="font-size: 0.9em;padding: 35px;border: 1px solid #eee;">
						<p>
							<strong>&#8251; 시험 응시자 안내 사항</strong>
							<br>
							시험은 수업 담당 교수님이 직접 출제합니다.<br>
							수강생들은 시험 <strong>시작시간</strong>과 <strong>종료시간</strong>을 엄수하여주시길 바랍니다.
							<br><br>
							(1) 시험은 한 문항당 5점씩 채점되며, 제출을 완료하면 자동 채점됩니다. 총점은 백분율로 계산하여 보여집니다.<br>
							(2) 한 시험당 문항은 최대 10개로 제한되어 있습니다.<br>
							(3) 풀지 않은 문항이 있을 경우 시험 제출 할 수 없습니다.  응시자는 이를 확인하여 모든 답을 체크할 수 있도록 해야합니다.<br>
							(4) 시험을 제출 한 후 수정이 불가 하오니 신중히 제출하시기 바랍니다.<br>
							(5) 응시 한 후 제출한 시험의 답을 확인할 수 있습니다.<br>
							<br><br>
							<i class="emphasisR">&#8251;&#8251; 제출 마감시간이 되면 문제 풀이 유무와 상관 없이 제출되며, 풀지 않은 문항은 자동으로 0점 처리됩니다.</i>
						</p>
					</div>
					<p style="display: inline-block;margin-top:15px;margin-left: 30px;">총&nbsp;<span style="color: red;">${fn:length(list) }</span>건의 게시물이 있습니다.</p>
					<div class="tab-content">
						<div class="tab-pane show active" id="hoverable-rows-preview">
							<div class="table-responsive-sm">
							
							
								<table class="table mb-0" style="border-bottom: 1px solid #eef2f7">
									<thead>
										<tr style="border-top: 2px solid #112a63">
										<th style="width: 5%; text-align: center;">NO</th>
										<th style="width: 40%;text-align: center;">제목</th>
										<th style="width: 15%;text-align: center;">시험 시작</th>
										<th style="width: 15%;text-align: center;">시험 종료</th>
									</tr>
									</thead>
									<tbody>
									<c:if test="${empty list}">
									
									<tr>
										<td colspan="7" style="text-align: center;color: #888;">예정된 시험이 없습니다.</td>
									</tr>
								
									</c:if>
									<c:if test="${not empty list}">
										<c:forEach var="list" items="${list }" varStatus="i" end="${list.size() }">
										<fmt:formatDate var="testReg" value="${list.testReg }" pattern="yyyy.MM.dd"/>
											<tr>
												<td style="text-align: center;">${i.end - i.index}</td>
												<td>
													<c:if test="${ date <= testReg }">
						                              <span class="badge badge-outline-warning badge-pill" style="float:left;">NEW</span>
						                            </c:if>
							                            <!-- 기본 주소 -->
														<a href="/lectureBoard/test/submitCheck?testCd=${list.testCd}&&lecaCd=${list.lecaCd}" style="color:#6c757d;">	
														${list.testNm }
														</a>
								                    
												</td>
												<td style="text-align: center;color: #888;"> 
														<fmt:formatDate value="${list.testSdt }" pattern="MM.dd HH:mm" />
												</td>
												<td style="text-align: center;color: #888;">
														<fmt:formatDate value="${list.testEdt }" pattern="MM.dd HH:mm" />
												</td>
											</tr>
										</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div id="pageBarBtn" style="text-align:center;">
					    <button type="button" class="btn btn-light" disabled="" onclick="#"><i class="uil-angle-double-left"></i></button>
					    <button type="button" class="btn btn-light" disabled="" onclick="#"><i class="uil uil-angle-left"></i></button>
					         	
					         		
						    <button type="button" class="btn btn-primary" onclick="#">
						    	1
					    	</button>
						
					    <button type="button" class="btn btn-light" onclick="#"><i class="uil uil-angle-right"></i></button>
					    <button type="button" class="btn btn-light" disabled="" onclick="#"><i class="uil-angle-double-right"></i></button>
					</div>
				</div>
			</div>
		</div>
