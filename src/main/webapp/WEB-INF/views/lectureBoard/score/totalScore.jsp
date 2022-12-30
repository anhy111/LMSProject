<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<link rel="stylesheet" href="/resources/css/suwon.css">
<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
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
		padding-bottom: 150px;
	}
	
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
	
	#noData {
		width: 100%;
		min-height: 491px;
		background: #f4f7fd;
		border-top: 1px solid #e0e0e0;
	}
	
	#noData > p {
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
	
	.attenTopWrap{
		min-height: 480px;
	    box-sizing: border-box;
	    width: 100%;
	}
	
	.scoreMiddleWrap {
		margin-top: 20px;
	}
	
	.scoreMiddleWrap td {
		padding: 4px;
		text-align: center;
		background: #f4f7fd;
	}
	
	.wkHr {
		text-align: center;
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
	
	.W, .ww {
		background: #fff !important;
		padding: 4px;
	}
	
	.H {
		height: 30px;
	}
	
	.inputCustum {
		width: 30px;
	    border: none;
	    background: transparent;
	}
	
	.f9 {
		background: #f9f9f9 !important;
		border-radius: 0.1rem;
	}
	
	
	.fitTable {
		width : 100%;
		border-top: 1px solid #e0e0e0;
	}
	
	.fitTable table {
		width: 100%;
		border-top: none !important;
		border: 1px solid #e0e0e0;
	}
	
	.infoAttend {
		float: left;
	}
	
	.infoAttend:not(:last-child):after {
			content: "|";
			color: #bbb;
			margin: 0 10px;		
}


	.abbottom {
		margin-top: 10px;
	}
	
	.abbottom table {
		width: 95%;
		height: 67px;
		border: 1px solid #e0e0e0;
	}
	.sI {
		width: 95%;
	}
	
	.abbottom td {
		text-align: center;
	}
	
	#tNoCome {
		text-align: right;
		color: red;
		font-weight: 700;
		padding-right: 15px;
    	font-size: 1.1em;
	}
	
	.frontInput {
		width: 43%;
		display: inline-block;
		text-align: center;
		font-weight: 700;
	}
	
	#atenCome{
		color: #0d47a1;
	}
	#atenLate{
		color : #f57f17;
	} 
	#atenAbsent{
		color : #b71c1c;
	} 
	#atenOfiAbsent{
		color : #1b5e20;
	}
	.totat {
		color: #333;
	}
	
	#scoreTable {
		width: 100%;
		border-bottom: 1px solid #e0e0e0;
		text-align: center;
		height: 40px;
		color: #333;
		font-weight: 700;
	}
	
	#scoreTable th {
		background: #f4f7fd;
	}
	
	.gradeSelect::-ms-expand { 
		display: none;
	}
	
	.gradeSelect {
	  -o-appearance: none;
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  appearance: none;
	  border-radius: 0.1rem !important;
	}
	
	.gradeSelect {
	  width: 60px;
	  height: 27px;
 	  padding: 0 13px; 
	  border-radius: 4px;
	  outline: 0 none;
	  color: red;
	  text-align: center;
	  border: 1px solid #9b9b9b;
	  font-weight: 900;
	}
	
	.gradeSelect option {
	  background: #fff;
	  color: #333;
	  padding: 3px 0;
	  text-align: center;
	}
	.criWrapper {
		width: 50%;
		float: left;
	}
	
	.detailScoreWrapper {
		width: 50%;
		float: left;
	}
	.midWrap {
		width : 100%;
		min-height: 605px;
	}
</style>
<script type="text/javascript" defer="defer">
let header = "${_csrf.headerName}";
let token = "${_csrf.token}";
	
	var stuNo = 0;

$(function() {
	
	
	var lecCd = $('#lecCd').val();
	var lecaCd = $('#lecaCd').val();
	console.log($('#lecaCd').val());
	getGrid(lecaCd);
	
	
	
	// 성적  상태 변화
	$(document).on('change', '#slScore', function() {
		console.log(this.value);
		
		slScore = $('#slScore').val();
		console.log("stuNo : " + stuNo + " slScore : " + slScore + " lecaCd : " + lecaCd);
		
		$.ajax({
			url : "/lectureBoard/stuGradeUpdate",
			type : 'post',
			data : {
				"stuNo" : stuNo,
				"slScore" : slScore,
				"lecaCd" : lecaCd
			},
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			dataType : 'JSON',
			success : function(result) {
				memNm = $('#memNm').val();
				
				alert(memNm + " 학생의 성적 부여가 완료되었습니다.");
				
				// 최초 리스트 불러오기
				getGrid(lecaCd);
			}
		})
		
	})
	
})
//$function end

// 학생 성적 + 정보 리스트 불러오기
	function getGrid(lecaCd) {
		$.ajax({
			url : "/lectureBoard/lecStuTotScore",
			type : 'post',
			data : {
				"lecaCd" : lecaCd
			},
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			contentType:"application/json;charset=utf-8",
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
					columns : [
						{header : '단과대학', name : 'colNm',      fileter : 'select', width : 170, align : 'center'},
						{header : '학과',    name : 'depNm',      fileter : 'select', width : 120, align : 'center'},
						{header : '학년',    name : 'stuYrs',     fileter : 'select', width : 80,  align : 'center'},
						{header : '학번',    name : 'stuNo',      fileter : 'select', width : 120, align : 'center'},
						{header : '이름',    name : 'stuNm',      fileter : 'select', width : 120, align : 'center'},
						{header : '중간평가', name : 'mtestScore', fileter : 'select', width : 80,  align : 'right' },
						{header : '기말평가', name : 'ftestScore', fileter : 'select', width : 80,  align : 'right' },
						{header : '과제',    name : 'taskScore',  fileter : 'select', width : 80,  align : 'right' },
						{header : '출결',    name : 'attendScore',fileter : 'select', width : 80,  align : 'right' },
						{header : '총점',    name : 'totalScore', fileter : 'select', width : 80,  align : 'right' },
						{header : '성적',    name : 'grade',      fileter : 'select', width : 80,  align : 'center'},
						{header : '최종성적', name : 'totalGrade', fileter : 'select',              align : 'center'}
					],
					rowHeaders : ['rowNum'],
					columnOptions : {resizable : true}
				
				});
				
				grid.on('click', function(object) {
					
								
					stuNo = grid.getRow(object.rowKey).stuNo;
					
					console.log(stuNo);
					console.log(lecaCd);
					console.log(object);
					
					$('.W').empty();
					
					detail(parseInt(stuNo), parseInt(lecaCd), object);
					
				})
			}
		})
		// 학생 리스트 ajax 끝
	}

//학생 성적 상세 리스트 ajax
	function scoreDetail(stuNo, lecaCd, object) {
		$.ajax({
			url : "/lectureBoard/lecStuScoreDetail",
			type : 'post',
			data : {
				"stuNo" : stuNo,
				"lecaCd" : lecaCd
			},
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			dataType : 'JSON',
			success : function(result) {
				$('#grid2').empty();
				
				totalGrade = grid.getRow(object.rowKey).totalGrade;
				
				console.log("totalGrade >> " + totalGrade);
				
				imsiGrade = grid.getRow(object.rowKey).grade;
				
				$('.imsiGrade').text(imsiGrade);
				
				
				$('#slScore option').each(function() {
					if($(this).text() == totalGrade) {
						$(this).prop('selected', true);
					}
				})
					
				
				grid2 = new tui.Grid({
					el : document.getElementById('grid2'),
					data : result,
					scrollX : true,
					scrollY : true,
					minBodyHeight : 450,
					bodyHeight : 450,
					columns : [
						{header : '구분', name :'div', fileter : 'select', width : 150, align : 'center'},
						{header : '평가 명', name : 'evelNm', fileter : 'select', width : 300, align : 'center'},
						{header : '점수/총점', name : 'score', fileter : 'select', align : 'right'}
					],
					columnOptions : {resizable : true}
				});
			}
		})

	}

	//학생 상세 ajax 
	function detail(stuNo, lecaCd, object) {
		$.ajax({
			url : "/lectureBoard/attendDetail",
			data : { 
					"stuNo" : stuNo,
					"lecaCd"	: lecaCd,
			},
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			type : 'post',
			dataType : 'JSON',
			success : function(result) {
// 				console.log("됐냐? ",JSON.stringify(result));
				
				$('#slScore').attr('disabled', false);
				
				$('#noData').css('display','none');
				$('#grid2').css('display','block');
				
				$('#memCd').val(result.studentDetail.stuNo);
				$('#memNm').val(result.studentDetail.stuNm);
				
				colNm = grid.getRow(object.rowKey).colNm;
				depNm = grid.getRow(object.rowKey).depNm;
				
				cd = colNm + ' ' + depNm;
				
				console.log("소속 : " + cd);
				
				$('#colNmdepNm').val(cd);
				
				var atc = parseInt(result.attendence.atenAttend);
				var atl = parseInt(result.attendence.atenLate);
				var ata = parseInt(result.attendence.atenAbsent);
				var ate = parseInt(result.attendence.atenEarly);
				var atoa = parseInt(result.attendence.atenOffically);
				var totat = atc + atl + ata + atoa + ate;
				
				$('#atenCome').val(atc);
				$('#atenLate').val(atl);
				$('#atenAbsent').val(ata);
				$('#atenEarly').val(ate);
				$('#atenOfiAbsent').val(atoa);
				$('.totat').val(totat);
				
				// 총결석일
				lateCnt = $('#atenLate').val();
				AbsentCnt = $('#atenAbsent').val();
				absentCnt(lateCnt, AbsentCnt);
				
				$.each(result.attenDetail, function(i,v) {
					wk = v.atenWk;
					hr = v.atenHr;
					
					console.log("atendWk + hr : " + wk + " / " + hr);
	
					var ac = '';
					if(v.atenCate == 'A001') {
						ac += '○';
					}else if(v.atenCate == 'A002') {
						ac += '△';
					}else if(v.atenCate == 'A003') {
						ac += '⨉';
					}else if(v.atenCate == 'A004') {
						ac += '☆';
					}else if(v.atenCate == 'A005') {
						ac += '◎';
					}
					
					
					$('#hr_' + wk + '_' + hr).html(ac);
				})
				
				stuScoreandMaxScore(parseInt(lecaCd), result.studentDetail.stuNo);
				scoreDetail(result.studentDetail.stuNo, parseInt(lecaCd), object);
			}
		})
	}

	// 결석 일수 세기
	function absentCnt(lateCnt, AbsentCnt) {
		
		count = parseInt(lateCnt/3) + parseInt(AbsentCnt);
		
		$('#tNoCome').html(count);
		
	}
	
	// 세부 점수 ajax 
	function stuScoreandMaxScore(lecaCd, stuNo) {
		$.ajax({
			url : "/lectureBoard/stuScoreandMaxScore",
			data : {
				"lecaCd" : lecaCd,
				"stuNo" : stuNo,
			},
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			type : 'post',
			dataType : 'JSON',
			success : function(result) {
				
				console.log("stuScore : " + result.stuCurScore);
				console.log("totalScore : " + result.lecScore);
				
				$('.stuScore').text(result.stuCurScore);
				$('.totalScore').text(result.lecScore);
			}
		})
	}
</script>

<div class="col-lg-12">
	
<%-- 	<input type="hidden" value="${data.lecCd }" id="lecCd"> --%>
	<input type="hidden" value="${data.lecaCd }" id="lecaCd">
	
		<!-- 성적 리스트 조회 -->
		<div class="card-body">
			<div id="bodyWrapper">
				<h4	class="lecApplyName">${data.lecaNm }&emsp;&#45;&emsp;성적 처리</h4>
				
				<div class="clear topBorder"></div>
				
				<div class="scoreTopWrap">				
					<p style="margin-top: 30px;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;수강생 목록</p>
					<div id="grid"></div>
					
				</div>
				
		<!-- 리스트 조회 끝 -->
		<!-- 상세 정보와 성적 상세 및 기준표 -->
		<div class="midWrap">
			<div class="criWrapper">
					<!-- 강의 성적 처리 기준 -->
					<p style="margin-top: 30px;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;성적 처리 기준</p>
					<div class="abbottom">
							<table border="1">
					                <tr style="background: #f4f7fd;text-align: center;">
					                    <td style="width:20%;">중간고사</td>
					                    <td style="width:20%;">기말고사</td>
					                    <td style="width:20%;">과제</td>
					                    <td style="width:20%;">출결</td>
					                </tr>
					                <tr>
					                    <td>${data.lecaMp }</td>
					                    <td>${data.lecaFp }</td>
					                    <td>${data.lecaTp }</td>
					                    <td>${data.lecaAp }</td>
					                </tr>
					        </table>
					</div>
			
			
					<!-- 학생 정보 -->
					<p style="margin-top: 30px;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;학생 기초 정보</p>
					<div class="informDetailTop sI">
						<table class="mb-3" border="1">
							<tr>
								<td style="width: 15%;background: #f4f7fd;">소속</td>
								<td class="ww" colspan="3">
									<input type="text" id="colNmdepNm" class="form-control f9" disabled placeholder="학생을 선택하세요" />
								</td>
							</tr>
							<tr>
								<td style="width: 15%;background: #f4f7fd;">학번</td>
								<td class="ww">
									<input type="text" id="memCd" name="stuCd" class="form-control f9" disabled placeholder="학생을 선택하세요" />
								</td>
								<td style="width: 15%;background: #f4f7fd;">이름</td>
								<td class="ww">
									<input type="text" id="memNm" class="form-control f9" disabled placeholder="학생을 선택하세요" />
								</td>
							</tr>
						</table>
					</div>
					
					<!-- 성적 부여 안내 -->
					<div class="alert alert-light bg-light border-0 sI" role="alert" style="font-size: 0.9em;line-height: 26px;height: 278px;">
                        <p style="margin-bottom: 0;text-align: center;font-weight: 700;font-size: 1.1em;">성적 전산처리 시스템 안내</p>
                        <hr>
						(1)&nbsp;전체 교과목은 절대평가를 원칙으로 하며 수업계획서에 입력한 성적 평가 기준에 따라 총점이 책정됩니다.<br>
						(2)&nbsp;최종성적을 부여하기 전 총점을 기준으로 집계된 수강생별 성적을 확인하십시오.<br>
						(3)&nbsp;학생의 성적 상세 내역(평가 ·과제 · 퀴즈)과 출결 현황을 확인하여 결과적으로 최종 성적을 부여할 수 있습니다.(기준에 따라 공정하게 평가하여 주시기 바랍니다.)<br>
						(4)&nbsp;성적 처리 기간동안 성적을 부여할 수 있으며, 처리 즉시 수강생이 확인할 수 있음을 유념하시길 바랍니다.<br>
                    </div>
			</div>
			<div class="detailScoreWrapper">
				<p style="margin-top: 30px;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;성적 상세 내역</p>
				<div id="grid2"></div>
				<div id="noData">
					<p>학생의 상세 성적 내역을 확인하려면 위 수강생 목록에서 수강생을 클릭하세요.</p>
				</div>
				<table id="scoreTable">
					<tr>
						<th style="width : 15%;">점수</th>
						<td style="width : 20%;">
							<span class="stuScore"></span>&emsp;/&emsp;
							<span class="totalScore"></span>
						</td>
						<th style="width : 15%;">성적</th>
						<td class="imsiGrade"  style="width : 15%;"></td>
						<th style="width : 20%;">최종 성적</th>
						<td class="totalGrade" style="width : 15%;">
							<select name="slScore" id="slScore" class="gradeSelect" disabled>
								<option value="null" class="defaultSelect" selected>-</option>
								<option value="4.5">4.5</option>
								<option value="4">4</option>
								<option value="3.5">3.5</option>
								<option value="3">3</option>
								<option value="2.5">2.5</option>
								<option value="2">2</option>
								<option value="1.5">1.5</option>
								<option value="1">1</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- 상세 정보와 성적 상세 및 기준표 끝-->
		<!-- 성적 리스트 조회 -->
				
				<div class="scoreMiddleWrap">				

					<p style="margin-top: 30px;display: inline-block;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;출결 현황</p>

					<p style="margin-top: 30px;display: inline-block;float: right;">
						<strong class="infoAttend">출석&nbsp;○</strong>
						<strong class="infoAttend">지각&nbsp;△</strong>
						<strong class="infoAttend">결석&nbsp;⨉</strong>
						<strong class="infoAttend">공결&nbsp;◎</strong>
					</p>
					<div class="informDetailTop">
						<table class="mb-2" border="1">
							<tr>
								<td  style="text-align: center;height: 40px;font-weight: 700;font-size: 1.1em;">출결</td>
							</tr>
							<tr>
								<td>출석</td>
								<td class="ww">
									<input type="text" id="atenCome" class="form-control f9 frontInput" style="font-size:9px;" disabled placeholder="유효 출석일수" />
									&nbsp;/&nbsp;<input type="text" class="form-control f9 totat frontInput" style="font-size:9px;" disabled placeholder="총 출석 일수" />
								</td>
								<td>지각</td>
								<td class="ww">
									<input type="text" id="atenLate" class="form-control f9 frontInput" style="font-size:9px;" disabled placeholder="지각일수"/>
									&nbsp;/&nbsp;<input type="text" class="form-control f9 totat frontInput" style="font-size:9px;" disabled placeholder="총 출석 일수" />
								</td>
								<td>결석</td>
								<td class="ww">
									<input type="text" id="atenAbsent" class="form-control f9 frontInput" style="font-size:9px;" disabled placeholder="결석일수"/>
									&nbsp;/&nbsp;<input type="text" class="form-control f9 totat frontInput" style="font-size:9px;" disabled placeholder="총 출석 일수" />
								</td>
								<td>조퇴</td>
								<td class="ww">
									<input type="text" id="atenEarly" class="form-control f9 frontInput" style="font-size:9px;" disabled placeholder="조퇴 일수"/>
									&nbsp;/&nbsp;<input type="text" class="form-control f9 totat frontInput" style="font-size:9px;" disabled placeholder="총 조퇴 일수" />
								</td>
								<td>공결</td>
								<td class="ww">
									<input type="text" id="atenOfiAbsent" class="form-control f9 frontInput" style="font-size:9px;" disabled placeholder="공결일수"/>
									&nbsp;/&nbsp;<input type="text" class="form-control f9 totat frontInput" style="font-size:9px;" disabled placeholder="총 출석 일수" />
								</td>
							</tr>
							<tr>
								<td colspan="2" style="height: 40px;font-weight: 700;font-size: 1.1em;">총 결석일</td>
								<td colspan="6" id="tNoCome" class="ww"></td>
							</tr>
						</table>
					</div>
					<div class="fitTable">
						<c:forEach var="j" begin="1" end="9" step="8">
							<table class="mb-0" border="1">
								<!-- 1~16주까지 보여주는 곳 -->
								<tr>
									<c:forEach var="i" begin="${j }" end="${j+7}" step="1">
										<td class="wkHr" colspan="${data.lecaCrd}">${i }</td>
									</c:forEach>
								</tr>
								<!-- 1~학점 만큼 차시를 보여주는 곳 -->
								<tr>
									<c:forEach begin="${j}" end="${j+7}" step="1">
										<c:forEach var="i" begin="1" end="${data.lecaCrd }" step="1">
											<td class="" style="width:50px;">${i }</td>
										</c:forEach>
									</c:forEach>
								</tr>
								<!-- 1~8주차 출결 현황 작성하는 곳 -->
								<tr>
									<c:forEach begin="${j}" end="${j+7}" step="1" var="k">
										<c:forEach var="i" begin="1" end="${data.lecaCrd }" step="1">
											<td class="W H" id="hr_${k}_${i}" data-wk="${k}" data-hr="${i}">
											</td>
										</c:forEach>
									</c:forEach>
								</tr>
							</table>
						</c:forEach>
					</div>
					
					
					
				</div>
				<!-- 리스트 조회 끝 -->
				
			</div>
		</div>
	</div>
	
