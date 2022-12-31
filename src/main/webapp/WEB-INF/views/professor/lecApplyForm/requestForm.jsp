<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의계획서 신청 폼</title>
<link rel="stylesheet" href="/resources/css/inquiry1.css">
<link rel="stylesheet" href="/resources/css/inquiry2.css">
</head>
<body>
	<div id="realFormBody">
	
	<span id="lecApplyTitle">강의계획서 등록</span>
	
	<div id="div4btns">
		<button type="button" class="btn btn-outline-secondary" onclick="insertData()">자동채우기</button>
		<button id="temporarySubmitBtn" type="button" class="btn btn-secondary">임시저장</button>
		<button id="realSubmitBtn" type="button" class="btn btn-secondary">제출</button>
	</div>
	
	<br><br>
	
	<ul class="nav nav-pills nav-justified form-wizard-header mb-3"
	style="width:100%;margin-left:1px;">
        <li class="nav-item">
            <a id="firstLecApplyLi" href="#account-2" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 pt-2 pb-2 active">
                <i class="mdi mdi-account-circle me-1"></i>
                <span class="d-none d-sm-inline">기본사항 작성</span>
            </a>
        </li>
        <li class="nav-item">
            <a id="secondLecApplyLi" href="#profile-tab-2" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 pt-2 pb-2">
                <i class="mdi mdi-pencil"></i>
                <span class="d-none d-sm-inline">세부사항 작성</span>
            </a>
        </li>
        <li class="nav-item">
            <a id="thirdLecApplyLi" href="#finish-2" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 pt-2 pb-2">
                <i class="mdi mdi-clock-time-nine-outline"></i>
                <span class="d-none d-sm-inline">시간표 선택</span>
            </a>
        </li>
    </ul>
	    
	<div id="blockNum1">
	    <p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;개인정보</p>
	    <table class="lecApplyTable" border="1">
	    	<tr>
	    		<th>담당교수</th>
	    		<td><input type="text" name="empNm" size=30 value="${professor.empNm }" disabled></td>
	    		<th>교수소속</th>
	    		<td><input type="text" name="empAddr1" size=30 value="${professor.empAddr1 }" disabled></td>
	    	</tr>
	    	<tr>
	    		<th>학과전화</th>
	    		<td><input type="text" name="depTel" size=30 value="${professor.depTel }" disabled></td>
	    		<th>교수전화</th>
	    		<td><input type="text" name="empTel" size=30 value="${professor.empTel }" disabled></td>
	    	</tr>
	    </table>
	    
	    <br><br>
	    <p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;강의 기본사항</p>
	    <table class="lecApplyTable" border="1" style="z-index: 9000;">
	    	<tr>
	    		<th>년도</th>
	    		<td>
	    			<select id="lecaYr">
	    				<option value="">선택</option>
	    			</select>
	    		</td>
	    		<th>학기</th>
	    		<td>
	    			<select id="lecaSem">
	    				<option value="">선택</option>
	    				<option value="1학기">1학기</option>
	    				<option value="2학기">2학기</option>
	    			</select>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>대상학년</th>
	    		<td>
	    			<select id="lecaTrg">
	    				<option value="">선택</option>
	    				<option value="1">1학년</option>
	    				<option value="2">2학년</option>
	    				<option value="3">3학년</option>
	    				<option value="4">4학년</option>
	    			</select>
	    		</td>
	    		<th>학점</th>
	    		<td>
	    			<select id="lecaCrd">
	    				<option value="">선택</option>
	    				<option value="1">1학점</option>
	    				<option value="2">2학점</option>
	    				<option value="3">3학점</option>
	    			</select>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>강의명</th>
	    		<td>
	    			<input type="text" id="lecaNm" size=30 placeholder="강의명을 입력해주세요.">
	    		</td>
	    		<th>이수구분</th>
	    		<td>
	    			<select id="lecaCate">
	    				<option value="">선택</option>
	    				<option value="전공필수">전공필수(전필)</option>
	    				<option value="전공선택">전공선택(전선)</option>
	    				<option value="교양필수">교양필수(교필)</option>
	    				<option value="교양선택">교양선택(교선)</option>
	    			</select>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>과목 카테고리</th>
	    		<td>
		    		<select id="subNm">
	    				<option value="">선택</option>
	    			</select>
	    		</td>
	    		<th>과목번호</th>
	    		<td>
	    			<input type="text" id="subCd" name="subCd" size=32 value="" readonly>
	    		</td>
	    	</tr>
	    </table>
	    
	    <div data-simplebar id="autoMaker" style="display:none; z-index:9001;"></div>
    </div>
    
    <div id="blockNum2">
    	<p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;강의 세부사항</p>
    	<table class="lecApplyTable" border="1" style="z-index: 9000;">
    		<tr>
	    		<th>수업개요</th>
	    		<td colspan="5">
	    			<textarea id="lecaCon" rows="3" cols="90"></textarea>
	    		</td>
	    	</tr>
    		<tr>
	    		<th>교재 및 <br>참고문헌</th>
	    		<td colspan="5">
	    			<textarea id="lecaBook" rows="3" cols="90"></textarea>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>성적평가방식</th>
	    		<td colspan="2">
	    			<select id="lecaGrade">
	    				<option value="1">GRADE</option>
	    				<option value="0">PASS/FAIL</option>
	    			</select>
	    		</td>
	    		<th>최대정원</th>
	    		<td colspan="2"><input type="number" id="lecaCap" name="lecaCap" size=5>&nbsp;명&emsp;&emsp;&emsp;&emsp;※&nbsp;사이버강의는 0입력</td>
	    	</tr>
	    	<tr>
	    		<th rowspan="2">평가방법(%)</th>
	    		<td style="width:116px; font-weight:bold; text-align:center;">중간고사</td>
	    		<td style="width:116px; font-weight:bold; text-align:center;">기말고사</td>
	    		<td style="width:116px; font-weight:bold; text-align:center;">과제</td>
	    		<td style="width:116px; font-weight:bold; text-align:center;">출결</td>
	    	</tr>
	    	<tr>
	    		<td style="width:116px; text-align:center;"><input type="text" id="lecaMp" size=5>&nbsp;%</td>
	    		<td style="width:116px; text-align:center;"><input type="text" id="lecaFp" size=5>&nbsp;%</td>
	    		<td style="width:116px; text-align:center;"><input type="text" id="lecaTp" size=5>&nbsp;%</td>
	    		<td style="width:116px; text-align:center;"><input type="text" id="lecaAp" size=5>&nbsp;%</td>
	    	</tr>
    	</table>
    	
    	<br><br>
	    
	    <p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;강의 계획</p>
	    <table id="lecWeekPlan" class="lecApplyTable" border="1" style="z-index: 9000;">
	    	<tr><th>1주차</th><td colspan="5"><textarea id="weekPlan1" rows="2" cols="90"></textarea></td></tr>
	    	<tr><th>2주차</th><td colspan="5"><textarea id="weekPlan2" rows="2" cols="90"></textarea></td></tr>
	    	<tr><th>3주차</th><td colspan="5"><textarea id="weekPlan3" rows="2" cols="90"></textarea></td></tr>
	    	<tr><th>4주차</th><td colspan="5"><textarea id="weekPlan4" rows="2" cols="90"></textarea></td></tr>
	    	<tr><th>5주차</th><td colspan="5"><textarea id="weekPlan5" rows="2" cols="90"></textarea></td></tr>
	    	<tr><th>6주차</th><td colspan="5"><textarea id="weekPlan6" rows="2" cols="90"></textarea></td></tr>
	    	<tr><th>7주차</th><td colspan="5"><textarea id="weekPlan7" rows="2" cols="90"></textarea></td></tr>
	    	<tr><th>8주차</th><td colspan="5"><textarea id="weekPlan8" rows="2" cols="90">중간고사</textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>9주차</th><td colspan="5"><textarea id="weekPlan9" rows="2" cols="90"></textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>10주차</th><td colspan="5"><textarea id="weekPlan10" rows="2" cols="90"></textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>11주차</th><td colspan="5"><textarea id="weekPlan11" rows="2" cols="90"></textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>12주차</th><td colspan="5"><textarea id="weekPlan12" rows="2" cols="90"></textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>13주차</th><td colspan="5"><textarea id="weekPlan13" rows="2" cols="90"></textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>14주차</th><td colspan="5"><textarea id="weekPlan14" rows="2" cols="90"></textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>15주차</th><td colspan="5"><textarea id="weekPlan15" rows="2" cols="90"></textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>16주차</th><td colspan="5"><textarea id="weekPlan16" rows="2" cols="90">기말고사</textarea></td></tr>
	    </table>
	    <div class="d-grid">
		    <button type="button" id="showMoreTrs" class="btn btn-secondary" style="width:250px;">더 보기</button>
		    <button type="button" id="showLessTrs" class="btn btn-secondary" style="width:250px; display:none;">닫기</button>
		</div>
    </div>
    
    <div id="blockNum3">
    	<p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;시간표 선택</p>
    	<div class="row pl-4">
	    	<div class="col-2 ">
		  		<select id="building" class="select2bs4 select2-hidden-accessible col-2 offset-1" style="width: 100%;" aria-hidden="true">
					<option value="0">건물</option>
					<c:forEach var="building" items="${buildingList}">
					<option value="${building.bldCd}">${building.bldSnm}</option>
					</c:forEach>
				</select>
			</div>
	    	<div class="col-2">
		  		<select id="room" class="select2bs4 select2-hidden-accessible col-2 offset-1" style="width: 100%;" aria-hidden="true">
					<option value="0">강의실</option>
				</select>
			</div>
		</div>
    	<div id="blockNum3TimeTable" style="float : left; width : 400px;">
    		<table id="timeTableChoice" border="1">
    			<tr><th style="width : 70px;"></th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th></tr>
    			<tr><th>1교시</th><td></td><td></td><td></td><td></td><td></td></tr>
    			<tr><th>2교시</th><td></td><td></td><td></td><td></td><td></td></tr>
   				<tr><th>3교시</th><td></td><td></td><td></td><td></td><td></td></tr>
   				<tr><th>4교시</th><td></td><td></td><td></td><td></td><td></td></tr>
   				<tr><th>5교시</th><td></td><td></td><td></td><td></td><td></td></tr>
   				<tr><th>6교시</th><td></td><td></td><td></td><td></td><td></td></tr>
   				<tr><th>7교시</th><td></td><td></td><td></td><td></td><td></td></tr>
   				<tr><th>8교시</th><td></td><td></td><td></td><td></td><td></td></tr>
   				<tr><th>9교시</th><td></td><td></td><td></td><td></td><td></td></tr>
    		</table>
		    <button type="button" id="timeTableBtn" class="btn btn-primary" style="width:250px; margin : 10px 65px;">시간 선택하기</button>
    	</div>
    	<div id="blockNum3Time" style="width : 400px; height : 300px;">
    		<p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;희망 시간</p>
    		<textarea id="textArea4time" rows="5" cols="45" disabled>시간 선택하기 버튼을 누르면 자동으로 채워집니다.</textarea>
    		<div class="form-group text-right p-0 m-0">
    		<button type="button" id="dataInit" class="btn btn-secondary btn-sm mr-5">초기화</button>
    		</div>
    		<p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;비고</p>
    		<textarea id="lecaNote" rows="9" cols="45"></textarea>
    	</div>
    </div>
    
    <div id="div4transitionBtns" style="clear : both;">
	    <button id="previousBtn" type="button" class="btn btn-primary">이전</button>
		<button id="nextBtn" type="button" class="btn btn-primary">다음</button>
	</div>
    
    </div>
</body>
<script src="/resources/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/adminlte/plugins/select2/js/select2.full.min.js"></script>
<script src="/resources/adminlte/dist/js/demo.js"></script>
<script type="text/javascript">

	//스프링 시큐리티를 위한 토큰 처리(csrf) -> 불토엔 큰 코스로 픽스!
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";
	
	console.log("header : " + header + ", token : " + token);
	
	var lecTimeTable = [];
	

	function roomSelectEvent(){
		if($("#building").val() == 0){
			alert("건물을 선택해주세요");
			return;
		}
		if($("#room").val() == 0){
			alert("강의실을 선택해주세요");
			return;
		}
		
		let timeTable = $('#timeTableChoice');
		
		let str = '';
		let room = $("#room").val();
		let building = $("#building").val();
		let buildingText = $("#building option:selected").text() + " ";
		let roomText = $("#room option:selected").text() + " ";
		let data = [];	// json형식으로 시간표 저장
		for(let j = 0; j <= 4; j++) {
			for(let i = 1; i <= 9; i++) {
				let cellObj = timeTable.find("tr").eq(i).find("td").eq(j);
				
				if(cellObj.hasClass("highlighted")) {
					
					switch(j) {
					case 0:
						data.push({
							roomCd : room,
							roomNo : roomText
							bldCd : building,
							
							wk : "m",
							time : i + ""
						}); 
						break;
					case 1:
						data.push({
							roomCd : room,
							wk : "t",
							time : i + ""
						});
						break;
					case 2:
						data.push({
							roomCd : room,
							wk : "w",
							time : i + ""
						});
						break;
					case 3:
						data.push({
							roomCd : room,
							wk : "h",
							time : i + ""
						});
						break;
					case 4:
						data.push({
							roomCd : room,
							wk : "f",
							time : i + ""
						});
						break;
					default:
						break;
					}
				}
			}
		}
		
		// 이미 저장되어있는 시간표가 있더라도 버튼을 다시 누르면 그 시간표로 덮어쓰기
		for(let i=0; i<lecTimeTable.length; i++){
			if(room == lecTimeTable.roomCd){
				lecTimeTable.remove(i);
			}
		}
		
		if(lecTimeTable.length + data.length > $("#lecaCrd").val()){
			alert("학점만큼 시간을 선택해주세요");
			timeTableInit();
			return;
		}
		
		
		// 시간이 겹치면 데이터를 넣지 않는다
		for(let i=0; i<data.length; i++){
			let check = false;
			for(let j=0; j<lecTimeTable.length; j++){
				
				
				if(lecTimeTable[j].roomCd == data[i].roomCd
					&& lecTimeTable[j].wk == data[i].wk
					&& lecTimeTable[j].time == data[i].time){
					check = true;
				}
			}
			if(!check){
				lecTimeTable.push(data[i]);
			}
		}
		
		// "시간 선택하기 알림 텍스트시에는 초기화"
		if($('#textArea4time').html().substr(0,1) == '시'){
			$('#textArea4time').html("");
		}
		$('#textArea4time').append(str);
		console.log("data : " , data );
		console.log("lecTimeTable : ", lecTimeTable);
		
	}
	
	function timeTableInit(){
		$('#timeTableChoice td').removeClass("highlighted");
	}
	
	function timeDataInit(){
		data = [];
		$('#textArea4time').html("");
	}
	
	function insertData() {
		$('#lecaYr').val('2022');
		$('#lecaSem').val('2학기');
		$('#lecaNm').val('고급 JAVA 프로그래밍');
		$('#lecaCon').val('자바 프로그래밍의 기초적인 내용에 대해 학습함으로써 컴퓨터공학과 프로그래밍의 기본 원리를 이해한다.');
		$('#lecaTrg').val('3');
		$('#lecaCrd').val('3');
		$('#subNm').val('경제학');
		$('#subCd').val('1');
		$('#lecaCap').val('20');
		$('#lecaBook').val('교재 : 명품 JAVA Programming  / 황기태·김효수 저 / 생능출판');
		$('#lecaCate').val('전공필수');
		$('#lecaGrade').val('1');
		$('#lecaMp').val('30');
		$('#lecaFp').val('30');
		$('#lecaTp').val('10');
		$('#lecaAp').val('20');
		$('#weekPlan1').val('자바에 대한 동기 유발');
		$('#weekPlan2').val('Java 개발 환경 이해');
		$('#weekPlan3').val('반복문과 배열 그리고 예외처리');
		$('#weekPlan4').val('클래스와 객체');
		$('#weekPlan5').val('상속');
		$('#weekPlan6').val('모듈과 패키지 개념, 자바 기본 패키지');
		$('#weekPlan7').val('제네릭과 컬렉션');
		$('#weekPlan9').val('입출력 스트림과 파일 입출력');
		$('#weekPlan10').val('GUI 프로그래밍');
		$('#weekPlan11').val('자바의 이벤트 처리');
		$('#weekPlan12').val('기본적인 스윙 컴포넌트와 활용');
		$('#weekPlan13').val('그래픽');
		$('#weekPlan14').val('프로젝트');
		$('#weekPlan15').val('프로젝트');
		$('#weekPlan16').val('기말고사');
		$('#lecaNote').val('화요일 오전, 목요일 오전은 타 대학 강의가 있습니다.');
	}
	
window.onload = function() {
	//Initialize Select2 Elements
	$('.select2').select2();

	//Initialize Select2 Elements
	$('.select2bs4').select2({
		theme : 'bootstrap4'
	});
	
	$("#dataInit").on("click",function(){
		timeDataInit();
	})
	
	var date = new Date();
	let year = date.getFullYear();
	
	console.log("year : " + year);
	
	str = '<option value="'+ year + '">' + year + '년</option>';
	
	$("#lecaYr").append(str);
	
	//검색어 자동완성 이벤트///////////////////////////////////////////////////////////////////////////////////////////
	
	//과목명 리스트 불러오기
	$.ajax({
		url : "/professor/lecApplyForm/getSubList",
		type : "POST",
		dataType : "JSON",
		contentType : "application/json",
		beforeSend: function (xhr) {
			xhr.setRequestHeader(header, token);
		},
		success : function(res) {
			str = '';

			$.each(res, function (i, v) {
				str += '<option value=' + v.subNm + '>' + v.subNm + '</option>';
			});

			$('#subNm').append(str);
			
		}
	});
	
	let subNm2 = "";
	
	$("#subNm").on("change", function() {
		console.log("과목명 : " + $("#subNm").val());
		subNm2 = $("#subNm").val();
		
		//과목번호 리스트 불러오기
		$.ajax({
			url : "/professor/lecApplyForm/getSubCdList",
			type : "POST",
			data : JSON.stringify(subNm2),
			dataType : "JSON",
			contentType : "application/json;charset=utf-8",
			beforeSend: function (xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(res) {
				
				console.log("res : " + res);
				
				$('#subCd').val(res);
				
			}
		});
		
	});
	
	//더보기 버튼을 누르면
	$('#showMoreTrs').on('click', function() {
		$('.switchTr').show();
		
    	$('#showMoreTrs').hide();
    	$('#showLessTrs').show();
	});
	//닫기 버튼을 누르면
	$('#showLessTrs').on('click', function() {
		$('.switchTr').hide();
		
    	$('#showLessTrs').hide();
    	$('#showMoreTrs').show();
	});
	
	//시간표 드래그 이벤트/////////////////////////////////////////////////////////////////////////////
	
	var isMouseDown = false, isHighlighted;
	
	$('#timeTableChoice td')
	.mousedown(function() {
		isMouseDown = true;
		$(this).toggleClass("highlighted");
		
		isHighlighted = $(this).hasClass("highlighted")
		
		return false;
	})
	.mouseover(function() {
		if(isMouseDown) {
			$(this).toggleClass("highlighted", isHighlighted);
		}
	})
	.bind("selectstart", function() {
		return false;
	});
	
	$(document)
	.mouseup(function() {
		isMouseDown = false;
	});
	
	//블록 클릭 시 div 변경 이벤트////////////////////////////////////////////////////////////////////////////
	if($('#firstLecApplyLi').hasClass("active")) {
		$('#blockNum1').show();
		$('#blockNum2').hide();
		$('#blockNum3').hide();
		$('#previousBtn').attr('disabled', true);
		$('#nextBtn').attr('disabled', false);
	}else if($('#secondLecApplyLi').hasClass("active")) {
		$('#blockNum1').hide();
		$('#blockNum2').show();
		$('#blockNum3').hide();
		$('#previousBtn').attr('disabled', false);
		$('#nextBtn').attr('disabled', false);
	}else if($('#thirdLecApplyLi').hasClass("active")) {
		$('#blockNum1').hide();
		$('#blockNum2').hide();
		$('#blockNum3').show();
		$('#previousBtn').attr('disabled', false);
		$('#nextBtn').attr('disabled', true);
	}
	
	$('#firstLecApplyLi').on('click', function() {
		$('#blockNum1').show();
		$('#blockNum2').hide();
		$('#blockNum3').hide();
		$('#previousBtn').attr('disabled', true);
		$('#nextBtn').attr('disabled', false);
	});
	$('#secondLecApplyLi').on('click', function() {
		$('#blockNum1').hide();
		$('#blockNum2').show();
		$('#blockNum3').hide();
		$('#previousBtn').attr('disabled', false);
		$('#nextBtn').attr('disabled', false);
	});
	$('#thirdLecApplyLi').on('click', function() {
		$('#blockNum1').hide();
		$('#blockNum2').hide();
		$('#blockNum3').show();
		$('#previousBtn').attr('disabled', false);
		$('#nextBtn').attr('disabled', true);
	});
	//////////////////////////////////////////////////////////////////////
	$('#previousBtn').on('click', function() {
		if($('#secondLecApplyLi').hasClass("active")) {
			$('#firstLecApplyLi').trigger('click');
		}else if($('#thirdLecApplyLi').hasClass("active")) {
			$('#secondLecApplyLi').trigger('click');
		}
	});
	$('#nextBtn').on('click', function() {
		if($('#firstLecApplyLi').hasClass("active")) {
			$('#secondLecApplyLi').trigger('click');
		}else if($('#secondLecApplyLi').hasClass("active")) {
			$('#thirdLecApplyLi').trigger('click');
		}
	});
	
	// 시간표 건물 선택시 강의실 목록 띄워줌
	$("#building").on("change",function(){
		let data = {
			bldCd : this.value
		};
		
		$.ajax({
			url : "/professor/lecApplyForm/roomByBuildingList",
			type : "get",
			data : data,
			success : function(result){
				let str = "";
				if(!result.length){
					str += "<option value='0'>강의실</option>";
					str += "<option value='0'>강의실이 없습니다.</option>";
				} else{
					str += "<option value='0'>강의실</option>";
					$.each(result,function(p_inx, p_val){
						str += `<option value='\${p_val.roomCd}'>\${p_val.roomNo}</option>`;
					});
				}
				$("#room").html(str);
				timeTableInit();
			}
		})
	});
	
	// 시간표 강의실 선택시 존재하는 강의는 선택불가
	$("#room").on("change",function(){
		let data = {
			roomCd : this.value
		};
		
		$.ajax({
			url : "/professor/lecApplyForm/timeTableByRoomList",
			type : "get",
			data : data,
			success : function(result){
				timeTableInit();
			}
		});
		
	});
	
	//시간표 작성
	$('#timeTableBtn').on('click', function() {
		roomSelectEvent();
	});
	
	//임시저장 버튼 클릭 시
	$('#temporarySubmitBtn').on('click', function() {
		
		let u_lecaCd = '${lecApplyList[0].lecaCd}';
		var weekPlan = [];
		
		for(let i=1; i<=16; i++){
			weekPlan.push({wpNo : i,lecaCd : u_lecaCd, wpCon : $('#weekPlan'+i).val()})
		}
		
		let dataObject = {
				lecaYr : $('#lecaYr').val(),
				lecaSem : $('#lecaSem').val(), 
				lecaNm : $('#lecaNm').val(),
				lecaCon : $('#lecaCon').val(),
				lecaTrg : $('#lecaTrg').val(),
				lecaCrd : $('#lecaCrd').val(),
				subNm : $('#subNm').val(),
				subCd : $('#subCd').val(),
				lecaCap : $('#lecaCap').val(),
				lecaBook : $('#lecaBook').val(), 
				lecaCate : $('#lecaCate').val(),
				lecaGrade : $('#lecaGrade').val(),
				lecaTt : $("#textArea4time").val(),
				lecaMp : $('#lecaMp').val(),
				lecaFp : $('#lecaFp').val(),
				lecaTp : $('#lecaTp').val(),
				lecaAp : $('#lecaAp').val(),
				weekPlanList : weekPlan,
				lecaNote : $('#lecaNote').val()
		}
		
		$.ajax({
			url : "/professor/lecApplyForm/temporarySubmit",
			type : "POST",
			data : JSON.stringify(dataObject),
			dataType : "JSON",
			beforeSend: function (xhr) {
				xhr.setRequestHeader(header, token);
			},
			contentType : "application/json;charset=utf-8",
			success : function(res) {
				if(res == 1) {
					alert("임시저장이 완료되었습니다.");
				}else {
					alert("다시 시도해주세요.");
				}
				
				opener.parent.location.reload();
				window.close();
			}
		});
	});
	
	//제출 버튼 클릭 시
	$('#realSubmitBtn').on('click', function() {
		
		let u_lecaCd = '${lecApplyList[0].lecaCd}';
		var weekPlan = [];
		
		for(let i=1; i<=16; i++){
			weekPlan.push({wpNo : i,lecaCd : u_lecaCd, wpCon : $('#weekPlan'+i).val()})
		}
		
		let dataObject = {
				lecaYr : $('#lecaYr').val(),
				lecaSem : $('#lecaSem').val(),
				lecaNm : $('#lecaNm').val(),
				lecaCon : $('#lecaCon').val(),
				lecaTrg : $('#lecaTrg').val(),
				lecaCrd : $('#lecaCrd').val(),
				subNm : $('#subNm').val(),
				subCd : $('#subCd').val(),
				lecaCap : $('#lecaCap').val(),
				lecaBook : $('#lecaBook').val(),
				lecaCate : $('#lecaCate').val(),
				lecaGrade : $('#lecaGrade').val(),
				lecaTt : $("#textArea4time").val(),
				lecaMp : $('#lecaMp').val(),
				lecaFp : $('#lecaFp').val(),
				lecaTp : $('#lecaTp').val(),
				lecaAp : $('#lecaAp').val(),
				weekPlanList : weekPlan,
				lecaNote : $('#lecaNote').val()
			}
	
			console.log("제출값 담기 : " + JSON.stringify(dataObject));
		
			$.ajax({
				url : "/professor/lecApplyForm/lecApplySubmit",
				type : "POST",
				data : JSON.stringify(dataObject),
				dataType : "JSON",
				beforeSend: function (xhr) {
					xhr.setRequestHeader(header, token);
				},
				contentType : "application/json;charset=utf-8",
				success : function(res) {
					console.log("제출값 담기 : " + res);
					
					if(res > 0) {
						alert("제출이 완료되었습니다.");
					}else {
						alert("다시 시도해주세요.");
					}
					
					opener.parent.location.reload();
					window.close();
				}
			});
	});
	
}

</script>
</html>