<!--  추가/변경시 최종프로젝트 게시판에 공지(필수) -->
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<!-- 공통 css 파일 임포트  -->
<link rel="stylesheet" type="text/css" href="/resources/css/dataTableTemplate.css">

<div class="container">
	<div class="row">
		<div class="card">
			<div class="card-header">
				<h3 class="card-title">
					<!-- 테이블 제목 -->
				</h3>
			</div>
			<div class="card-body table-responsive col-11 p-0"
				style="height: 300px;width:1600px;">
				<table class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
					<thead>
						<tr class="text-center">
							<th width="10%"><!-- column 1 --></th>
							<th width="10%"><!-- column 2 --></th>
							<th width="10%"><!-- column 3 --></th>
							<th width="10%"><!-- column 4 --></th>
							<th width="10%"><!-- column 5 --></th>
						</tr>
					</thead>
						<tbody>
							<c:forEach var="" items="${items }">
						<tr>
							<td><!-- column 1 data --></td>
							<td><!-- column 2 data --></td>
							<td><!-- column 3 data --></td>
							<td><!-- column 4 data --></td>
							<td><!-- column 5 data --></td>
						</tr>
						</c:forEach>
						</tbody>
					</table>
			</div>
		</div>
			<div class="col-12" style="text-align: end;">
			<a class="col-sm-1 btn btn-md btn-primary" href="#" >등록</a>
			<a class="col-sm-1 btn btn-md btn-primary" href="#">삭제</a>
			<a class="col-sm-1 btn btn-md btn-primary" href="#">목록</a>
			</div>
	</div>
</div>