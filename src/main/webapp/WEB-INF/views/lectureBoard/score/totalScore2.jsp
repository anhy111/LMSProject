<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="/resources/css/tui-grid.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/suwon.css">
<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<style>

/* 기본 틀 잡기 (사이버캠퍼스 / 변동 가능 / suwon.css 파일에 넣었다가 주석 처리함) */
.card-body {
	width: 100%;
}

/* 기본 틀 잡기 끝 */
#grid {
	width: 100%;
	min-height: 400px;
}

#grid td, #grid2 td {
	padding: 4px;
	background: #fff;
}

#grid th, #grid2 th {
	background: #f4f7fd;
}

#grid2 {
	width: 100%;
	min-height: 491px;
	display: none;
}

#noData>p {
	text-align: center;
	color: #999;
	line-height: 480px;
	margin: 0;
}

.clear {
	clear: both;
}

.topBorder {
	border-top: 2px solid #112a63;
}

.lecApplyName {
	margin-bottom: 20px;
	width: 300px;
	float: left;
}

.scoreMiddleWrap td {
	padding: 4px;
	text-align: center;
	background: #f4f7fd;
}

.informDetailTop table {
	border: 1px solid #e0e0e0;
	width: 100%;
	text-align: center;
}

.informDetailBot table {
	border: 1px solid #e0e0e0;
	width: 100%;
	text-align: center;
}

.fitTable table {
	width: 100%;
	border-top: none !important;
	border: 1px solid #e0e0e0;
}

.abbottom table {
	width: 95%;
	height: 67px;
	border: 1px solid #e0e0e0;
}

.abbottom td {
	text-align: center;
}

#scoreTable th {
	background: #f4f7fd;
}

.gradeSelect option {
	background: #fff;
	color: #333;
	padding: 3px 0;
	text-align: center;
}
</style>
<script type="text/javascript" defer="defer">
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";

	var stuNo = 0;

	$(function() {
		var lecCd = $('#lecCd').val();
		var lecaCd = $('#lecaCd').val();
		getGrid(lecaCd);
	})

	// 학생 성적 + 정보 리스트 불러오기
	function getGrid(lecaCd) {
		$.ajax({
			url : "/lectureBoard/lecStuTotScore",
			type : 'post',
			data : {
				"lecaCd" : lecaCd
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			contentType : "application/json;charset=utf-8",
			dataType : 'JSON',
			success : function(result) {
				$('#grid').empty();

				grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : result,
					scrollX : true,
					scrollY : true,
					minBodyHeight : 400,
					bodyHeight : 400,
					columns : [ {
						header : '단과대학',
						name : 'colNm',
						fileter : 'select',
						align : 'center'
					}, {
						header : '학과',
						name : 'depNm',
						fileter : 'select',
						align : 'center'
					}, {
						header : '학년',
						name : 'stuYrs',
						fileter : 'select',
						align : 'center'
					}, {
						header : '학번',
						name : 'stuNo',
						fileter : 'select',
						align : 'center'
					}, {
						header : '이름',
						name : 'stuNm',
						fileter : 'select',
						align : 'center'
					}

					],
					rowHeaders : [ 'rowNum' ],
					columnOptions : {
						resizable : true
					}
				});

				grid.on('click', function(object) {
					stuNo = grid.getRow(object.rowKey).stuNo;
					var data = {
						'stuNo' : stuNo
					};
					$
							.ajax({
								url : "/lectureBoard/stuDetail",
								type : "post",
								data : data,
								beforeSend : function(xhr) {
									xhr.setRequestHeader(header, token);
								},
								contentType : "application/json;charset=utf-8",
								dataType : 'JSON',
								success : function(result) {
									console.log(result.stuNo)
									$("#stuImg").attr("src",
											"/upload" + result.stuPic);
									$("#stuNo").val(result.stuNo), $("#stuNm")
											.val(result.stuNm),
											$("#department").val(result.depNm),
											$("#stuNme").val(result.stuNme),
											$("#stuYr").val(result.stuYr), $(
													"#stuSem").val(
													result.stuSem),
											$("#stuZip").val(result.stuZip), $(
													"#btnZipCode").val(
													result.btnZipCode), $(
													"#stuBir").val(
													result.stuBir),
											$("#stuTel").val(result.stuTel), $(
													"#stuAddr1").val(
													result.stuAddr1), $(
													"#stuAddr2").val(
													result.stuAddr2)
								}
							})
					$('.modal').modal({
						backdrop : 'static'
					});

				})
			}
		})
		// 학생 리스트 ajax 끝
	}
</script>

<div class="col-lg-12">

	<%-- 	<input type="hidden" value="${data.lecCd }" id="lecCd"> --%>
	<%--    check--%>
	<input type="hidden" value="${data.lecaCd }" id="lecaCd">


	<div class="card-body">
		<div id="bodyWrapper">
			<h4 class="lecApplyName">${data.lecaNm }</h4>
			<div class="clear topBorder"></div>
			<div class="scoreTopWrap">
				<p style="margin-top: 30px;">
					<i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;수강생
					목록
				</p>
				<div class="col-sm-12 alert alert-light bg-light border-0"
					role="alert"
					style="font-size: 0.9em; padding: 15px 30px 15px; 20 px; border: 1px solid #eee;"
					id="subInfo">
					<br>
					<h4>
						<b>※수강생 목록 안내 사항</b>
					</h4>
					<p>
						1. 학생을 선택해 학생의 상세정보를 확인 할  수 있습니다.
					</p>
					<p>
						2. 학생의 개인 정보를 타인에게 유출할 시 정보 보호법 위반으로 처벌될 수 있습니다.
					</p>
				</div>

				<div id="grid"></div>
			</div>
		</div>
	</div>
</div>

<!-- 모달 -->
<div class="modal fade" id="modal-lg" style="display: none;"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">학생 상세 정보</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="col-sm-12">
					<div class="container-fluid">
						<div class="row">
							<div class="col-4" style="text-align: center;">
								<img class="img-thumbnail" width="180px;" height="250px;"
									id="stuImg">
							</div>
							<div class="col-8">
								<div class="container">
									<div class="row mt-1">
										<div class="col-6">
											<label for="stuNo" class="form-label">학번</label> <input
												type="text" class="form-control" id="stuNo" name="stuNo"
												readonly />
										</div>
										<div class="col-6">
											<label for="stuNm" class="form-label">이름</label> <input
												type="text" class="form-control stu" id="stuNm" name="stuNm"
												readonly />
										</div>
									</div>
									<div class="row mt-2" style="height: 75px;">
										<div class="col-6">
											<label for="department" class="form-label">학과</label> <input
												id="department" type="text" class="form-control stu"
												readonly>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-3 mb-2">
						<div class="col-4">
							<label for="stuNme" class="form-label">영문 이름</label> <input
								type="text" class="form-control stu" id="stuNme" name="stuNme"
								readonly />
						</div>
						<div class="col-4">
							<label>학년</label> <input type="text" class="form-control stu"
								id="stuYr" name="stuYr" readonly>
						</div>
						<div class="col-4">
							<label>학기</label> <input type="text" class="form-control stu"
								id="stuSem" name="stuSem" readonly>
						</div>
					</div>
					<div class="row mt-3 mb-2">
						<div class="col-4">
							<label for="stuZip" class="form-label">우편번호</label>
							<div class="input-group">
								<input type="text" class="form-control stu" id="stuZip"
									name="stuZip" readonly />
								<div class="input-group-append">
									<button type="button" class="btn btn-default" id="btnZipCode">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</div>
						<div class="col-4">
							<label for="stuBir" class="form-label">생년월일</label> <input
								type="text" class="form-control stu" id="stuBir" name="stuBir"
								readonly />
						</div>
						<div class="col-4">
							<label for="stuTel" class="form-label">전화번호</label> <input
								type="text" class="form-control stu" id="stuTel" name="stuTel"
								readonly />
						</div>
					</div>
					<div class="row mt-3 mb-2">
						<div class="col-6" style="">
							<label for="stuAddr1" class="form-label">기본주소</label> <input
								type="text" class="form-control stu" id="stuAddr1"
								name="stuAddr1" readonly />
						</div>
						<div class="col-6">
							<label for="stuAddr2" class="form-label">상세주소</label> <input
								type="text" class="form-control stu" id="stuAddr2"
								name="stuAddr2" readonly />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
