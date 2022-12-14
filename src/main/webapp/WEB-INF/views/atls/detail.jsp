<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의상세정보</title>
<link rel="stylesheet" href="/resources/css/inquiry1.css">
<link rel="stylesheet" href="/resources/css/inquiry2.css">
</head>
<body>
	<div id="realFormBody">

		<span id="lecApplyTitle">강의계획서 상세</span>

		<div id="div4btns">
			<button id="close" onclick="fn_close()" type="button"
				class="btn btn-secondary">닫기</button>
		</div>

		<br>
		<br>

		<div id="blockNum1">
			<p>
				<i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;강의
				기본사항
			</p>
			<table class="lecApplyTable" border="1" style="z-index: 9000;">
				<tr>
					<th>년도</th>
					<td><input type="text" name="lecaYr" size=30
						value="${lecApplyList[0].lecaYr }년" disabled></td>
					<th>학기</th>
					<td><input type="text" name="lecaSem" size=30
						value="${lecApplyList[0].lecaSem }" disabled></td>
				</tr>
				<tr>
					<th>대상학년</th>
					<td><input type="text" name="lecaTrg" size=30
						value="${lecApplyList[0].lecaTrg }학년" disabled></td>
					<th>학점</th>
					<td><input type="text" name="lecaCrd" size=30
						value="${lecApplyList[0].lecaCrd }학점" disabled></td>
				</tr>
				<tr>
					<th>강의명</th>
					<td><input type="text" name="lecaNm" size=30
						value="${lecApplyList[0].lecaNm }" disabled></td>
					<th>이수구분</th>
					<td><input type="text" name="lecaCate" size=30
						value="${lecApplyList[0].lecaCate }" disabled></td>
				</tr>
				<tr>
					<th>과목 카테고리</th>
					<td><input type="text" name="subNm" size=30
						value="${lecApplyList[0].subNm }" disabled></td>
					<th>학수번호</th>
					<td><input type="text" name="subCd" size=30
						value="${lecApplyList[0].subCd }" disabled></td>
				</tr>
			</table>

			<div data-simplebar id="autoMaker"
				style="display: none; z-index: 9001;"></div>
		</div>

	</div>
</body>
<script type="text/javascript">

	function fn_close() {
		window.close();
	}
</script>
</html>