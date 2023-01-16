<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
		border-radius: 10px 10px 0 0 ;
		max-width: 1400px;
		min-width: 1090px;
		margin: 0 auto;
	}

	.card-body {
		width: 100%;
	}

	/* 기본 틀 잡기 끝 */

	.quizNotice {
		background: #eee;
		width: 100%;
		height: auto;
		padding: 5%;
		margin-bottom: 10px;
	}

	.emphasisR {
		color: red;
	}

	.table-responsive-sm {
		margin-bottom: 40px;
		min-height: 500px;
	}

	.table {
		border-bottom: 1px solid #eef2f7;
	}
</style>

<%
      Date date = new Date();
   	  date.setDate(date.getDate()-6);
      SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy.MM.dd");
      String simDate = simpleDate.format(date);
%>
<c:set var="date" value="<%= simDate %>" />

<div class="quizWrapper">
	<div class="col-lg-12">
				<h4>${data.lecaNm}&emsp;&#45;&emsp;과목 시험</h4>
				<div class="alert alert-light" role="alert" style="font-size: 0.9em;padding: 35px;border: 1px solid #eee;">
					<p>
						<strong>&#8251; 시험 제출자 안내 사항</strong>
						<br><br>
						(1) 반드시 <strong>기간을 먼저 설정</strong>한 후, 시험을 등록하는 것을 권장합니다.<br>
						&emsp;- 시험 기간 미설정시, 등록 직후 바로 시험에 응시 가능합니다.<br>
						&emsp;- <strong>기간을 설정하지 않고 문제를 등록하여 문제 유출이 되는 경우가 종종 발생합니다.</strong><br>
						<br>
						(2) 시험은 한 문항당 4지 선다 방식으로 등록할 수 있습니다.<br>
						&emsp;- <strong>정답 란에는 1~4까지의 숫자</strong>만 입력이 가능합니다.<br>
						<br>
						(3) 시험 생성 시 문제 개수는 최대 10문제로 설정할 수 있습니다.<br>
						&emsp;- 하단의 + 버튼과 문제의 -버튼을 통해 문항 수를 제어할 수 있습니다.<br>
						<br>
						(4) 모바일 앱, 웹에서 가능하지만 권장하지 않으며, 안정적인 PC웹에서 응시를 권장합니다.<br>
						&emsp;- 모바일의 경우 무선 네트워크 환경이 불안정할 경우
						시험 응시 도중 문제가 발생할 수 있기 때문입니다.시간 제한,시도 횟수 제한 등이 설정된
						평가활동은 안정적으로 수행할 수 있도록 PC에서 시도하는 것을 권장드립니다(대부분 대학에서도
						위와 같은 사항을 고지).
						<br><br>
						(5) 시험 문제 배점 및 자동 평가 대한 안내<br>
						&emsp;- 시험은 <strong>한 문항당 5점</strong>씩 채점되며, 수강생이 제출을 완료하면 <strong>자동 채점</strong>됩니다. 총점은 백분율로 계산하여 보여집니다.
					</p>
				</div>
				<form action="/lectureBoard/test/testRegistPage?lecaCd=${data.lecaCd}" method="post">
					<button type="submit" class="btn btn-primary btn-sm" style="float: right;">등록</button>
					<sec:csrfInput/>
				</form>
				<p style="display: inline-block;margin-top:15px;margin-left: 30px;">총&nbsp;<span style="color:red;">${fn:length(list) }</span>건의 게시물이 있습니다</p>
				<div class="tab-content">
					<div class="tab-pane show active" id="hoverable-rows-preview">
						<div class="table-responsive-sm">
							<table class="table mb-0" style="border-bottom: 1px solid #eef2f7">
								<thead class="table-light">
									<tr style="border-top: 2px solid #112a63">
										<th style="width: 5%; text-align: center;">NO</th>
										<th style="width: 40%;text-align: center;">제목</th>
										<th style="width: 15%;text-align: center;">시험 시작</th>
										<th style="width: 15%;text-align: center;">시험 종료</th>
										<th style="width: 15%;text-align: center;">등록일</th>
									</tr>
								</thead>
								<tbody>
								<c:if test="${empty list}">

								<tr style="border-bottom: 1px solid #112a63">
									<td colspan="5" style="text-align: center;color: #888;">예정된 시험이 없습니다.</td>
								</tr>

								</c:if>
								<c:if test="${not empty list}">
	
									<c:forEach var="list" items="${list }" varStatus="status" end="${list.size()}">
									<fmt:formatDate var="testReg" value="${list.testReg }" pattern="yyyy.MM.dd"/>
										<tr>
											<td style="text-align: center;">${status.end - status.index}</td>
											<td>
												<c:if test="${ date <= testReg }">
					                              <span class="badge badge-outline-warning badge-pill" style="float:left;">NEW</span>
					                           </c:if>
												<a href="/lectureBoard/test/testDetail?testCd=${list.testCd}&&lecaCd=${list.lecaCd}" style="color:#6c757d;">
													${list.testNm }
												</a>
											</td>
											<td style="text-align: center;">
												<fmt:formatDate value="${list.testSdt }" pattern="MM.dd HH:mm" />
											</td>
											<td style="text-align: center;">
												<fmt:formatDate value="${list.testEdt }" pattern="MM.dd HH:mm" />
											</td>
											<td style="text-align: center;">${testReg }</td>
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

<script type="text/javascript">

function a(){
	function bv(){

	}
}


</script>
