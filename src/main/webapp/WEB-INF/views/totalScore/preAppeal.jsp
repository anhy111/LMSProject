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

	var memFnm;

	function gradeAppeal(lecaCd) {
		
		//이의신청 여부 확인하기
		$.ajax({
			url : "/tgrade/checkObjection",
			type : "POST",
			data : {lecaCd : lecaCd},
			dataType : "JSON",
			success : function(res) {
				if(res == 1) { //null인 경우
					
					//이의신청 하지 않은 경우 과목 정보 불러오기
					$.ajax({
						url : "/tgrade/getCourseInfo",
						type : "POST",
						data : {lecaCd : lecaCd},
						dataType : "JSON",
						success : function(res) {
							$('#lec_yrNsem').val(res.lecaBook);
							$('#lec_subCd').val(res.subCd);
							$('#lec_lecNm').val(res.lecaNm);
							$('#lec_proNm').val(res.lecaNote);
							$('#lec_lecCd').val(res.lecCd);
						}
					});
				}else {
					alert("이미 이의신청한 과목입니다.");
				}
			}
		});
	}

	window.onload = function() {
		
		//로딩중 화면 띄우기
		loadingWithMask();
		setTimeout(closeLoadingWithMask, 700);
		
		var result = '${result}';
		
		if(result != null) {
			if(result == '1') {
				alert("해당 과목의 이의신청이 완료되었습니다.");
			}else if(result == '0') {
				alert("다시 시도해주세요.");
			}
		}
		
		//개인정보 가져오기
		$.ajax({
			url : "/tgrade/getInfo",
			type : "POST",
			dataType : "JSON",
			success : function(res) {
				//학번(memCd), 이름(memNm), 생년월일(memReg1), 연락처(memTel),
				//단과대학/전공(memNme), 입학정보(memAddr1), 변동(memAddr2), 수강신청학년(memMl)
				$('#stuCd').val(res.memCd);
				$('#memName').val(res.memNm);
				$('#memReg1').val(res.memReg1);
				$('#memTel').val(res.memTel);
				$('#college').val(res.memNme);
				$('#admission').val(res.memAddr1);
				$('#admChange').val(res.memAddr2);
				$('#yrNsem').val(res.memMl);
				
				memFnm = res.memFnm;
			}
		});
		
		//년도 및 학기 불러오기
		$.ajax({
			url : "/tgrade/getNow",
			type : "GET",
			dataType : "JSON",
			success : function(res) {
				$("#tgradePreYear").val(res.YEAR);
				$("#tgradePreSemester").val(res.SEMESTER);
			}
		});
		
		$.ajax({
			url : "/tgrade/getPreCnt",
			type : "POST",
			dataType : "JSON",
			success : function(res) {
				
				$("#cntSpan").text(res);
			}
		});
		
		//전체 성적 불러오기
		$.ajax({
			url : "/tgrade/getPreList",
			type : "POST",
			dataType : "JSON",
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
					columns : [
						{header : '과목번호', filter : 'select', name : 'subCd', align : 'center', width : 90},
						{header : '교과목명', filter : 'select', name : 'lecaNm'},
						{header : '학점', filter : 'select', name : 'lecaCrd', align : 'center', width : 60},
						{header : '성적평가', filter : 'select', name : 'lecaGrade', align : 'center', width : 100},
						{header : '등급', filter : 'select', name : 'lecaNote', align : 'center', width : 60},
						{header : '결석', name : 'lecCd', align : 'center', width : 50},
						{header : '평점', name : 'lecaRoom', align : 'center', width : 50},
						{header : '성적이의신청', name : 'btn', align : 'center', width : 100}
					],
					columnOptions : {
						resizable : true
					}
				});
			}
		});
		
		//백분율환산기준표 띄우기
		$('#percentageTable').on('click', function() {
			window.open("/tgrade/crdStandardPdf");
		});
		
		//사진 띄우기
		$('#photoBtn').on('click', function() {
			
			//memFnm : 이미지 이름.확장자
			if(memFnm == null) {
				alert("등록된 사진이 없습니다.");
			}else {
				
				const img = new Image();
				img.src = "/resources/profileImg/" + memFnm;
				console.log("width : " + img.width + ", height : " + img.height);
				
				window.open(
						"/tgrade/getPhoto?memFnm=" + memFnm,
						"photo",
						"width = 175, height = 210, left = 300, top = 150, history = no, resizable = no, status = no, scrollbars = yes, menubar = no"
				);
			}
		});
		
		$('#preAppealSubmitBtn').on('click', function() {
			$('#preAppealForm').submit();
		});
		
		$('#autoInsertBtn').on('click', function() {
			var str = '제가 생각한 것보다 성적이 낮게 나와 연락드립니다. 감사합니다.';
			
			$('#lec_title').val("성적 이의 신청합니다.");
			$('.note-editable').html(str);
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
				<input type="text" class="infoText" name="stuCd" id="stuCd" readonly="readonly" style="width:68.5%;">
				<button type="button" class="btn btn-secondary photoBtn" id="photoBtn">
				<p class="photoP">사진</p>
				</button>
			</td>
			<th>성명</th>
			<td>
				<input type="text" class="infoText" name="memName" id="memName" readonly="readonly">
			</td>
			<th>입학정보</th>
			<td>
				<input type="text" class="infoText" name="admission" id="admission" readonly="readonly">
			</td>
			<th>연락처</th>
			<td>
				<input type="text" class="infoText" name="memTel" id="memTel" readonly="readonly">
			</td>
			<th></th>
		</tr>
		<tr>
			<td colspan="9" style="background: #F3F8FF; height: 5px;"></td>
		</tr>
		<tr>
			<th>소속</th>
			<td>
				<input type="text" class="infoText" name="college" id="college" readonly="readonly">
			</td>
			<th>학년</th>
			<td>
				<input type="text" class="infoText" name="yrNsem" id="yrNsem" readonly="readonly">
			</td>
			<th>변동</th>
			<td>
				<input type="text" class="infoText" name="admChange" id="admChange" readonly="readonly">
			</td>
			<th>생년월일</th>
			<td>
				<input type="text" class="infoText" name="memReg1" id="memReg1" readonly="readonly">
			</td>
			<th></th>
		</tr>
		<tr>
			<td colspan="9" style="background: #F3F8FF; height: 10px;"></td>
		</tr>
  	</table>
	
	<br><br>
	
	<div id="tgradeYellowBox" style="height:47px;">
		<label>년도
			<input type="text" name="yrNsem" id="tgradePreYear" readonly="readonly">
		</label>
		<label>학기
			<input type="text" name="yrNsem" id="tgradePreSemester" readonly="readonly">
		</label>
		<span id="tgradeGreenText">&emsp;<i class="mdi mdi-square-medium"></i>&nbsp;증명 마감된 과목에 한해 성적이 표기됩니다.</span>
	</div>
	
	<br>
	
	<div id="gridNgrade">
		<div class="divDiv" style="margin-right : 3%;">
			<i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;취득성적
			<button type="button" class="btn btn-secondary" id="percentageTable">백분율환산기준표</button>
			<p id="tellCnt">
				[총 <span id="cntSpan"></span>건]
			</p>
			
			<div id="grid"></div>
		</div>
		<div class="divDiv">
			<i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;이의신청
			<button type="button" class="btn btn-primary" id="preAppealSubmitBtn">신청하기</button>
			<button type="button" class="btn btn-outline-secondary" id="autoInsertBtn">자동 채우기</button>
			<p>
			</p>
			
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
				<form action="/tgrade/sendAppeal" method="post" id="preAppealForm">
					<tr>
						<th>제목</th>
						<td colspan="3">
							<input class="infoText1" type="text" name="objTtl" id="lec_title">
						</td>
					</tr>
					<tr style="background:white;">
						<td colspan="4" style="padding-bottom:5px;">
								<textarea id="summernote" name="objCon"></textarea>
								<input class="infoText1"  type="text" name="lecCd" id="lec_lecCd" hidden="hidden" />
						</td>
					</tr>
				</form>
			</table>
		</div>	
	</div>
</div>
<script type="text/javascript" defer="defer">
	//$('#summernote').summernote('code', '<p>안녕하세요, 교수님.</p><p>컴퓨터융합학과 201836475 김신형입니다.</p><p>제가 생각한 것보다 성적이 낮게 나와 연락드립니다. 감사합니다.</p>');

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