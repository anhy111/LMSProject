<!--  추가/변경시 최종프로젝트 게시판에 공지(필수) -->
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<%
	Date date = new Date();
date.setDate(date.getDate() - 6);
SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy.MM.dd");
String simDate = simpleDate.format(date);
%>

<!-- 공통 css 파일 임포트  -->
<link rel="stylesheet" type="text/css" href="/resources/css/boardTemplate.css">

<div class="col-lg-12">
	<div class="card" style="min-height: 700px;">
		<div class="card-body">
			<h4>
				<!-- 게시판 타이틀 -->
			</h4>
			<div class="alert alert-light" role="alert">
				<!-- 게시판 소개글 -->
				<p>
					<!-- 소개글 내용 -->
				</p>
			</div>
			<form action="#" method="post">
				<button type="submit" class="btn btn-primary btn-sm"
					style="float: right;">등록</button>
				<sec:csrfInput />
			</form>
			<p
				style="display: inline-block; margin-top: 15px; margin-left: 30px;">
				총&nbsp;<span style="color: red;">${fn:length(list) }</span>건의 게시물이 있습니다
			</p>
			<div class="tab-content">
				<div class="tab-pane show active" id="hoverable-rows-preview">
					<div class="table-responsive-sm">
						<table class="table mb-0" style="border-bottom: 1px solid #eef2f7">
							<thead class="table-light">
								<tr style="border-top: 2px solid #112a63">
									<th style="width: 10%; text-align: center;"><!-- 순번 --></th>
									<th style="width: 10%; text-align: center;"><!-- column 1 --></th>
									<th style="width: 10%; text-align: center;"><!-- column 2 --></th>
									<th style="width: 10%; text-align: center;"><!-- column 3 --></th>
									<th style="width: 10%; text-align: center;"><!-- column 4 --></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${list}" varStatus="status">

									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>