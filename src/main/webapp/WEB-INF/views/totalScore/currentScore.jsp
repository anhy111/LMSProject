<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당학기 성적 정보</title>

<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<script type="text/javascript" src="/resources/js/spinner.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<style type="text/css">
	#personalGradeInfo, #tgradeYellowBox {
		border : 1px solid lightgray;
		margin : 10px;
		padding : 10px;
	}
	#tgradeYellowBox {
		background : lightyellow;
	}
	#tgradeYellowBox  input{
		width : 80px;
		margin-left : 7px;
		margin-right : 7px;
		padding-left : 10px;
	}
	#tgradeGreenText {
		color : green;
	}
	#tgradeTable {
		width : 98%;
		height : 70px;
		border : 1px solid lightgray;
		border-collapse: collapse;
		margin : 10px;
		text-align : center;
		background-color : white;
	}
	#tgradeTable td, #tgradeTable th{
		padding-top : 5px;
		padding-bottom : 5px;
	}
	#tgradeTable tr:first-child, #tgradeTable tr:nth-child(2){
		background : rgb(244,247,253);
		color : black;
	}
	#tgradePreListRound{
		width : 90%;
		margin-left : auto;
		margin-right : auto;
	}
	.tgradePreListSelect{
		display:inline-block;
	}
	#personalGradeInfo{
		border: 1px solid lightgray;
		margin: 10px;
		padding: 10px;
		background: #f4f7fd;
		width: 100%;
		min-width: 1200px;
		max-width: 1400px;
		margin: 0 auto;
	}
	#personalGradeInfo div{
		display : inline-block;
	}
	#personalGradeInfo div:nth-child(2){
		margin-left : 254px;
	}
	#personalGradeInfo input{
		width : 180px;
	 	height: 33px;
	 	background: #F2F2F2;
	 	border: 1px solid gray;
	 	border-radius : 5px;
 		padding-left : 5px;
	}
	#personalGradeInfo label{
		text-align : right;
		width : 130px;
	}
	#grid td{
		background : #f9f9f9;
	}
	#percentageTable{
		float : right;
		margin-right : 10px;
	}
</style>
</head>
<script type="text/javascript" defer="defer">
let header = "${_csrf.headerName}";
let token = "${_csrf.token}";

	window.onload = function() {
		
		
		//개인정보 가져오기
		$.ajax({
			url : "/totalScore/getInfo",
			type : "POST",
			dataType : "JSON",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(res) {
				//학번(memCd), 이름(memNm), 생년월일(stuBir), 연락처(stuTel),
				//단과대학/전공(memNme), 입학정보(memAddr1), 변동(memAddr2), 수강신청학년(memMl)
				$('#stuNo').val(res.stuNo);
				$('#stuNm').val(res.stuNm);
				$('#stuBir').val(res.stuBir);
				$('#stuTel').val(res.stuTel);
				$('#depNm').val(res.depNm);
				$('#stuRgb').val(res.stuRgb);
				$('#stuSem').val(res.stuSem);
				$('#yrNsem').val(res.stuYr);
				
			}
		});
		
		$.ajax({
			url : "/totalScore/getPreCnt",
			type : "POST",
			dataType : "JSON",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(res) {
				
				$("#tgradePreSub").text(res);
			}
		});
		
		//전체 성적 불러오기
		$.ajax({
			url : "/totalScore/getPreList",
			type : "POST",
			dataType : "JSON",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(res) {
				
				grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : res,
					scrollX : true,
					scrollY : true,
					bodyHeight : 250,
					columns : [
						{header : '년도/학기', filter : 'select', name : 'lecaCon', align : 'center'},
						{header : '과목번호', filter : 'select', name : 'lecaCd', align : 'center'},
						{header : '교과목명', filter : 'select', name : 'lecaNm'},
						{header : '이수구분', filter : 'select', name : 'lecaCate', align : 'center'},
						{header : '학점', filter : 'select', name : 'lecaCrd', align : 'center'},
						{header : '성적평가', filter : 'select', name : 'lecaGrade', align : 'center'},
						{header : '등급', filter : 'select', name : 'lecaNote', align : 'center'},
						{header : '평점', filter : 'select', name : 'lecaRoom', align : 'center'}
					],
					columnOptions : {
						resizable : true
					}
				});
			}
		});
	}
</script>
<body>
<div id="tgradePreListRound">
	<div>
    	<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 성적 <i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">현재 학기 성적 조회</span>
  	</div>

	<div id = "personalGradeInfo">
		<table id="stuInfoTable">
  		<tr>
			<td colspan="9" style="background: #F3F8FF; height: 10px;"></td>
		</tr>
		<tr>
			<th>학번</th>
			<td>
				<input type="text" class="infoText" name="stuNo" id="stuNo" readonly="readonly" style="width:50%;">
			</td>
			<th>성명</th>
			<td>
				<input type="text" class="infoText" name="stuNm" id="stuNm" readonly="readonly">
			</td>
			<th>학적</th>
			<td>
				<input type="text" class="infoText" name="stuRgb" id="stuRgb" readonly="readonly">
			</td>
			<th>연락처</th>
			<td>
				<input type="text" class="infoText" name="stuTel" id="stuTel" readonly="readonly">
			</td>
			<th></th>
		</tr>
		<tr>
			<td colspan="9" style="background: #F3F8FF; height: 5px;"></td>
		</tr>
		<tr>
			<th>소속</th>
			<td>
				<input type="text" class="infoText" name="depNm" id="depNm" readonly="readonly">
			</td>
			<th>학년</th>
			<td>
				<input type="text" class="infoText" name="yrNsem" id="yrNsem" readonly="readonly">
			</td>
			<th>학기</th>
			<td>
				<input type="text" class="infoText" name="stuSem" id="stuSem" readonly="readonly">
			</td>
			<th>생년월일</th>
			<td>
				<input type="text" class="infoText" name="stuBir" id="stuBir" readonly="readonly">
			</td>
			<th></th>
		</tr>
		<tr>
			<td colspan="9" style="background: #F3F8FF; height: 10px;"></td>
		</tr>
  	</table>
	</div>
	
	<br><br>
	
	<p class="tgradePreListSelect"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;취득성적</p>
	&nbsp;&nbsp;총 <span class="tgradePreCnt" id="tgradePreSub" style="color:red;"></span>건
	<div id="tgradeYellowBox" style="height:47px;">
			<input type="text" name="yrNsem" id="tgradePreYear" readonly="readonly" value="${now.YEAR}">
		<label>년도
		</label>
			<input type="text" name="yrNsem" id="tgradePreSemester" readonly="readonly" value="${now.SEMESTER}">
		<label>학기
		</label>
		<span id="tgradeGreenText">&emsp;<i class="mdi mdi-square-medium"></i>&nbsp;증명 마감된 과목에 한해 성적이 표기됩니다.</span>
	</div>
	<br>
	<div id="grid"></div>
	
	<br><br>
	
	<p class="tgradePreListSelect"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;집계정보</p>
	<table id="tgradeTable" border="1">
		<tr>
			<th colspan="2"></th>
			<th colspan="4">교양영역</th>
			<th colspan="4">전공영역</th>
		</tr>
		<tr>
			<td>신청학점</td>
			<td>취득학점</td>
			<td>교필</td>
			<td>교선</td>
			<td>소계</td>
			<td>평균 평점</td>
			<td>전필</td>
			<td>전선</td>
			<td>소계</td>
			<td>평균 평점</td>
		</tr>
		<tr>
			<td>${info.JP + info.JS + info.KP + info.KS}</td>
			<td>${info.JP + info.JS + info.KP + info.KS}</td>
			<td>${info.KP}</td>
			<td>${info.KS}</td>
			<td>${info.KSUM}</td>
			<td>${info.KAV}</td>
			<td>${info.JP}</td>
			<td>${info.JS}</td>
			<td>${info.JSUM}</td>
			<td>${info.JAV}</td>
		</tr>
	</table>
</div>
</body>
</html>