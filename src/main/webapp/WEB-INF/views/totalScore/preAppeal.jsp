<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 이의 신청</title>

<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<script type="text/javascript" src="/resources/js/spinner.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<link rel="stylesheet" href="/resources/css/preAppeal.css" type="text/css">
<link rel="stylesheet" href="/resources/css/topTable.css" type="text/css">
<link rel="stylesheet" href="/resources/css/suwon.css" type="text/css">
</head>
<script type="text/javascript" defer="defer">
let header = "${_csrf.headerName}";
let token = "${_csrf.token}";

	function gradeAppeal(lecaCd) {
		
		//이의신청 여부 확인하기
		$.ajax({
			url : "/totalScore/checkObjection",
			type : "POST",
			data : {lecaCd : lecaCd},
			dataType : "JSON",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(res) {
				if(res == 1) { //null인 경우
					//이의신청 하지 않은 경우 과목 정보 불러오기
					$.ajax({
						url : "/totalScore/getCourseInfo",
						type : "POST",
						data : {lecaCd : lecaCd},
						dataType : "JSON",
						beforeSend : function(xhr){
							xhr.setRequestHeader(header, token);
						},
						success : function(res) {
							$('#lec_yrNsem').val(res.lecaYr+"/"+res.lecaSem);
							$('#lec_subCd').val(res.lecaCd);
							$('#lec_lecNm').val(res.lecaNm);
							$('#lec_proNm').val(res.proNm);
							$('#lec_lecaCd').val(res.lecaCd);
						}
					});
				}else {
					alert("이미 이의신청한 과목입니다.");
				}
			}
		});
	}

	window.onload = function() {
		
		
// 		var result = '${result}';
		
// 		if(result != null) {
// 			if(result == '1') {
// 				alert("해당 과목의 이의신청이 완료되었습니다.");
// 			}else if(result == '0') {
// 				alert("다시 시도해주세요.");
// 			}
// 		}
		
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
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			dataType : "JSON",
			success : function(res) {
				
				$("#cntSpan").text(res);
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
				
				$.each(res, function(i,v){
					res[i]['btn'] = '<button class="btn btn-outline-secondary btn-sm" style="font-family:Nunito,sans-serif;" onclick="gradeAppeal(' + v.lecaCd + ')">신청</button>';
				});
				
				grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : res,
					scrollX : true,
					scrollY : true,
					bodyHeight : 420,
					rowHeaders : ['rowNum'],
					columns : 
						[
							{header : '과목번호', filter : 'select', name : 'lecaCd', align : 'center'},
							{header : '교과목명', filter : 'select', name : 'lecaNm'},
							{header : '학점', filter : 'select', name : 'lecaCrd', align : 'center'},
							{header : '성적평가', filter : 'select', name : 'lecaGrade', align : 'center'},
							{header : '등급', filter : 'select', name : 'lecaNote', align : 'center'},
							{header : '평점', filter : 'select', name : 'lecaRoom', align : 'center'},
							{header : '성적이의 신청', name : 'btn', align : 'center', width : 100}
						],
					columnOptions : {
						resizable : true
					}
				});
			}
		});
		
		
		
		$('#preAppealSubmitBtn').on('click', function() {
			$('#preAppealForm').submit();
		});
		
		$('#autoInsertBtn').on('click', function() {
			var str = '학기 내내 시험 1등 했는데 왜 A+가 아닌지 의문입니다. 확인 부탁드립니다.';
			
			$('#lec_title').val("성적 이의 신청합니다.");
			$('#objCon').html(str);
		});
	}
</script>
<body>
<div id="tgradePreAppealPage">
	<div>
    	<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 성적 <i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">성적 이의 신청</span>
  	</div>
  	
  	<br>
  	
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
	
	<br><br>
	
	<div id="tgradeYellowBox" style="height:47px;">
			<input type="text" name="yrNsem" id="tgradePreYear" value="${now.YEAR}" readonly="readonly">
		<label>년도
		</label>
			<input type="text" name="yrNsem" id="tgradePreSemester" value="${now.SEMESTER}" readonly="readonly">
		<label>학기
		</label>
		<span id="tgradeGreenText">&emsp;<i class="mdi mdi-square-medium"></i>&nbsp;증명 마감된 과목에 한해 성적이 표기됩니다.</span>
	</div>
	
	<br>
	
	<div id="gridNgrade">
		<div class="divDiv" style="margin-right : 3%;">
			<i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;취득성적
			<p id="tellCnt">
				[총 <b><span id="cntSpan" style="color:red;"></span></b>건]
			</p>
			
			<div id="grid"></div>
		</div>
		<div class="divDiv">
			<i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;이의신청
			<button type="button" class="btn btn-primary" id="preAppealSubmitBtn">신청하기</button>
			<button type="button" class="btn btn-outline-secondary" id="autoInsertBtn">자동 채우기</button>
			<p>
			</p>
			
				<form action="/totalScore/sendAppeal" method="POST" id="preAppealForm">
			<table id="appealGrade" border="1" style="height:460px;">
				<tr>
					<th>년도/학기</th>
					<td><input class="infoText1"  type="text" name="lec_yrNsem" id="lec_yrNsem" readonly="readonly"></td>
					<th>과목번호</th>
					<td><input class="infoText1"  type="text" name="lec_subCd" id="lec_subCd" readonly="readonly"></td>
				</tr>
				<tr>
					<th>강의명</th>
					<td colspan="3"><input class="infoText1"  type="text" name="lec_lecNm" id="lec_lecNm" readonly="readonly"></td>
				</tr>
				<tr>
					<th>교수명</th>
					<td colspan="3"><input class="infoText1"  type="text" name="lec_proNm" id="lec_proNm" readonly="readonly"></td>
				</tr>
					<tr>
						<th>제목</th>
						<td colspan="3">
							<input class="infoText1" type="text" name="objTtl" id="lec_title">
						</td>
					</tr>
					<tr style="background:white;">
						<td colspan="4" style="padding-bottom:5px;">
						<textarea class="form-control" rows="8" id="objCon" name="objCon" placeholder="Enter ..."></textarea>
						<input class="infoText1"  type="hidden" name="lecaCd" id="lec_lecaCd" />
						</td>
					</tr>
					<sec:csrfInput/>
			</table>
				</form>
		</div>	
	</div>
</div>
<script type="text/javascript" defer="defer">

	$('#summernote').summernote({
	  placeholder: '',
	  tabsize: 2,
	  height: 190,
	  toolbar: [
	    ['style', ['style']],
	    ['fontname', ['fontname']],
        ['fontsize', ['fontsize']],
	    ['font', ['bold', 'underline', 'clear']],
	    ['color', ['color']],
	    ['para', ['ul', 'ol', 'paragraph']],
	    ['table', ['table']],
	    ['insert', ['link', 'picture', 'video']],
	    ['view', ['fullscreen', 'codeview', 'help']]
	  ],
	  fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
      fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	});
</script>
</body>
</html>