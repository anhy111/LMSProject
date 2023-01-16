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
	    				<option value="1">1학기</option>
	    				<option value="2">2학기</option>
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
	    		<td style="width:116px; text-align:center;"><input type="number" id="lecaMp" min="1" max="999">&nbsp;%</td>
	    		<td style="width:116px; text-align:center;"><input type="number" id="lecaFp"  min="1" max="999">&nbsp;%</td>
	    		<td style="width:116px; text-align:center;"><input type="number" id="lecaTp"  min="1" max="999">&nbsp;%</td>
	    		<td style="width:116px; text-align:center;"><input type="number" id="lecaAp"  min="1" max="999">&nbsp;%</td>
	    	</tr>
    	</table>
    	<div class="row">
    		<span id="evaluationText" class="col-12 text-center">&nbsp;</span>
    	</div>
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
    		<div class="row mb-2">
    			<div class="col-3 offset-1 text-right">
    				<span style=" height:13px; background-color: red; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
    				<span style="font-size: 13px;">&nbsp;: 승인</span>
    			</div>	
    			<div class="col-3">
    				<span style="height:13px; background-color: yellow; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
    				<span style="font-size: 13px;">&nbsp;: 승인대기</span>
    			</div>	
    			<div class="col-3" >
    				<span style="height:13px; background-color: #001f3f; border: 1px solid black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
    				<span style="font-size: 13px;">&nbsp;: 희망시간</span>
    			</div>	
    		</div>
		    <button type="button" id="timeTableBtn" class="btn btn-primary" style="width:250px; margin : 10px 65px;">시간 선택하기</button>
    	</div>
    	<div id="blockNum3Time" style="width : 400px; height : 300px;">
    		<p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;희망 시간</p>
    		<textarea id="textArea4time" rows="5" cols="45" disabled>시간 선택하기 버튼을 누르면 자동으로 채워집니다.</textarea>
    		<div class="form-group text-right p-0 m-0">
    		<button type="button" id="dataInit" class="btn btn-secondary btn-sm mr-5">초기화</button>
    		</div>
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
	var alreadyLecApplyList;
	var evlValidation = false;
	
	// 강의계획서 제출 또는 임시저장시 유효성 검사
	function validation(){
		
		if( $('#lecaYr').val() == "" ||  $('#lecaSem').val() == ""){
			Swal.fire({
				  icon: 'warning',
				  title: '연도와 학기를 선택해주세요.',
				})
			return false;
		}else if( $('#lecaTrg').val() == ""){
			Swal.fire({
				  icon: 'warning',
				  title: '대상 학년을 선택해주세요.',
				})
			return false;
		}else if( $('#lecaCrd').val() == ""){
			Swal.fire({
				  icon: 'warning',
				  title: '학점을 선택해주세요.',
				})
			return false;
		}else if( $('#lecaNm').val() == ""){
			Swal.fire({
				  icon: 'warning',
				  title: '강의명을 입력해주세요.',
				})
			return false;
		}else if( $('#lecaCate').val() == ""){
			Swal.fire({
				  icon: 'warning',
				  title: '이수구분을 선택해주세요.',
				})
			return false;
		}else if( $('#subCd').val() == ""){
			Swal.fire({
				  icon: 'warning',
				  title: '과목을 선택해주세요.',
				})
			return false;
		}else if( $('#lecaCon').val() == ""){
			Swal.fire({
				  icon: 'warning',
				  title: '수업 개요를 입력해주세요.',
				})
			return false;
		}else if( $('#lecaBook').val() == ""){
			Swal.fire({
				  icon: 'warning',
				  title: '교재 및 참고문헌을 입력해주세요.',
				})
			return false;
		}else if( $('#lecaGrade').val() == ""){
			Swal.fire({
				  icon: 'warning',
				  title: '평가방식을 선택해주세요.',
				})
			return false;
		}else if( $('#lecaCap').val() <= 0 || $('#lecaCap').val() == ""){
			Swal.fire({
				  icon: 'warning',
				  title: '올바른 수강인원을 입력해주세요.',
				})
			return false;
		}else if( lecTimeTable.length != $('#lecaCrd').val()){
			Swal.fire({
				  icon: 'warning',
				  title: '학점만큼 시간을 선택해주세요.',
				})
			return false;
		}else if(!evlValidation){
			Swal.fire({
				  icon: 'warning',
				  title: '평가방법 비율이 올바르지 않습니다.',
				})
			return false;
		}
		
		for(let i=1; i<=16; i++){
			if($('#weekPlan'+i).val() == ""){
				Swal.fire({
					  icon: 'warning',
					  title: '주차계획을 입력해주세요.',
					})
				return false;
			}
		}
		return true;
	}
	
	// 강의계획서 평가비율 합산 유효성검사
	function evaluationStandardValidation(){
		let lecaMp = $('#lecaMp').val() == "" ? 0 : $('#lecaMp').val()*1;
		let lecaFp = $('#lecaFp').val() == "" ? 0 : $('#lecaFp').val()*1;
		let lecaTp = $('#lecaTp').val() == "" ? 0 : $('#lecaTp').val()*1;
		let lecaAp = $('#lecaAp').val() == "" ? 0 : $('#lecaAp').val()*1;
		let sum = lecaMp + lecaFp + lecaTp + lecaAp;
		if(sum != 100){
			$("#evaluationText").text("과제비율은 합산 100%로 입력해주세요")
								.css("color","red");
			evlValidation = false;
		}else{
			$("#evaluationText").text("과제비율이 합산 100%입니다.")
								.css("color","blue");
			evlValidation = true;
		}
	}
	
	// 시간표 배열을 매개변수로 받아서 클래스를 입혀 색을 칠해줌
	function displayTimeTable(p_timeTable, p_class){
		let room = $("#room").val();
		let timeTable = $('#timeTableChoice');
		
		for(let i=0; i<p_timeTable.length; i++){
			if(room == p_timeTable[i].roomCd){
				let x;
				switch(p_timeTable[i].wk){
				case "월":
					x = 0;
					break;
				case "화":
					x = 1;
					break;
				case "수":
					x = 2;
					break;
				case "목":
					x = 3;
					break;
				case "금":
					x = 4;
					break;
				}
				timeTable.find("tr").eq(p_timeTable[i].time).find("td").eq(x).toggleClass(p_class);
			}
		}
	}
	
	// 이미 존재하는 시간표를 ajax로 불러옴
	function loadAlreadyTimeTable(){
		let lecaSem = $("#lecaSem").val();
		let lecaYr = $("#lecaYr").val();
		if( lecaSem == "" || lecaYr == "" ){
			return;
		}
		
		let data = {
			lecaSem : lecaSem,
			lecaYr : lecaYr
		}
		
		$.ajax({
			url : "/professor/lecApplyForm/alreadyTimeTableList",
			type : "get",
			data : data,
			success : function(result){
				alreadyLecApplyList = result;
				$("#room").trigger("change");
			}
		})
	}
	
	// 시간 선택시
	function roomSelectEvent(){
		if($("#building").val() == 0){
			Swal.fire({
				  icon: 'warning',
				  title: '건물을 선택해주세요.',
				})
			return;
		}
		if($("#room").val() == 0){
			Swal.fire({
				  icon: 'warning',
				  title: '강의실을 선택해주세요.',
				})
			return;
		}
		
		let timeTable = $('#timeTableChoice');
		
		let str = '';
		let room = $("#room").val();
		let building = $("#building").val();
		let buildingText = $("#building option:selected").text();
		let roomText = $("#room option:selected").text();
		let data = [];	// json형식으로 시간표 저장
		for(let j = 0; j <= 4; j++) {
			for(let i = 1; i <= 9; i++) {
				let cellObj = timeTable.find("tr").eq(i).find("td").eq(j);
				
				if(cellObj.hasClass("highlighted")) {
					
					switch(j) {
					case 0:
						data.push({ roomCd : room, roomNo : roomText, bldCd : building, bldNm : buildingText, wk : "월", time : i + ""}); 
						break;
					case 1:
						data.push({ roomCd : room, roomNo : roomText, bldCd : building, bldNm : buildingText, wk : "화", time : i + ""}); 
						break;
					case 2:
						data.push({ roomCd : room, roomNo : roomText, bldCd : building, bldNm : buildingText, wk : "수", time : i + ""}); 
						break;
					case 3:
						data.push({ roomCd : room, roomNo : roomText, bldCd : building, bldNm : buildingText, wk : "목", time : i + ""}); 
						break;
					case 4:
						data.push({ roomCd : room, roomNo : roomText, bldCd : building, bldNm : buildingText, wk : "금", time : i + ""}); 
						break;
					default:
						break;
					}
				}
			}
		}
		
		// 이미 저장되어있는 같은 강의실의 시간표가 있더라도 버튼을 누르면 그 시간표로 덮어쓰기
		for(let i=lecTimeTable.length-1; i >= 0; i--){
			if(room == lecTimeTable[i].roomCd){
				lecTimeTable.splice(i,1);
			}
		}
		
		// 학점 선택했는지 유효성검사
		if($("#lecaCrd").val() == ""){
			Swal.fire({
				  icon: 'warning',
				  title: '학점을 선택해주세요.',
				})
			timeTableInit();
			return;
		}
		
		// 학점만큼 시간을 선택했는지 유효성검사
		if(lecTimeTable.length + data.length > $("#lecaCrd").val()){
			Swal.fire({
				  icon: 'warning',
				  title: '학점만큼 시간을 선택해주세요.',
				})
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
					break;
				}
			}
			if(!check){
				lecTimeTable.push(data[i]);
			}
		}
		
		// "시간 선택하기" 알림 텍스트시에는 초기화하고 텍스트 넣어주기
		if($('#textArea4time').html().substr(0,1) == '시'){
			$('#textArea4time').html("");
		}
		$('#textArea4time').html(lecTimeTableToText(lecTimeTable));
		
	}
	
	// 사용자에게 보여줄 희망시간 포맷함수
	function lecTimeTableToText(p_timeTable){
		let str = "";
		for(let i=0; i<p_timeTable.length; i++){
			str += p_timeTable[i].bldNm + " " + p_timeTable[i].roomNo + " " + p_timeTable[i].wk + " " + p_timeTable[i].time + "교시\n";
		}
		return str;
	}
	
	// 강의실 변경시 테이블 비워주고, 입력 또는 이미 존재하는 시간표 표시하기
	function timeTableInit(){
		$('#timeTableChoice td').removeClass("highlighted")
								.removeClass("approve")
								.removeClass("pendingApprove");
		
		// 기존에 선택된 교시는 색칠해주기
		displayTimeTable(lecTimeTable,"highlighted");
		$.each(alreadyLecApplyList,function(p_inx, lecApply){
			if(lecApply.lecaApproval == '승인대기'){
				displayTimeTable(JSON.parse(lecApply.lecaTt),"pendingApprove");
			}else if(lecApply.lecaApproval == '승인'){
				displayTimeTable(JSON.parse(lecApply.lecaTt),"approve");
			}
		})
	}
	
	// 초기화버튼 클릭시 저장시간표와 표시되는 시간표 초기화
	function lecTimeTableInit(){
		lecTimeTable.splice(0);
		$('#textArea4time').html("");
	}
	
	// 자동 채우기
	function insertData() {
		$('#lecaYr').val('2023');
		$('#lecaSem').val('1');
		$('#lecaNm').val('케인즈는 왜 위대한가?');
		$('#lecaCon').val('경제학의 위대한 업적을 남긴 케인스주의에 대해 이해하는것에 중점을 두었다.');
		$('#lecaTrg').val('3');
		$('#lecaCrd').val('3');
		$('#subNm').val('경제학');
		$('#subCd').val('1');
		$('#lecaCap').val('20');
		$('#lecaBook').val('교재 : 케인스의 일반이론  / 존 메이너드 케인스·류동민 저 / 두리미디어');
		$('#lecaCate').val('전공필수');
		$('#lecaGrade').val('1');
		$('#lecaMp').val('30');
		$('#lecaFp').val('30');
		$('#lecaTp').val('10');
		$('#lecaAp').val('30').trigger("change");
		$('#weekPlan1').val('경제학의 시초란?');
		$('#weekPlan2').val('케인스가 태어난 시기의 세계정세');
		$('#weekPlan3').val('왜 자유방임주의가 잘못되었나');
		$('#weekPlan4').val('수정자본주의의 중요성');
		$('#weekPlan5').val('거시경제학의 기초가 된 이유');
		$('#weekPlan6').val('거시경제와 미시경제의 차이점');
		$('#weekPlan7').val('케인스주의와 거시경제의 연관점이 어찌 되는가');
		$('#weekPlan9').val('오늘날 자유방임주의로 다시 돌아서는 이유');
		$('#weekPlan10').val('수정자본주의의 한계점');
		$('#weekPlan11').val('새로운 패러다임의 경제이론');
		$('#weekPlan12').val('신자유주의와 수정자본주의의 충돌');
		$('#weekPlan13').val('케인스주의가 실패한 이론인가');
		$('#weekPlan14').val('기말과제');
		$('#weekPlan15').val('기말과제');
		$('#weekPlan16').val('기말고사');
	}
	
window.onload = function() {
	//Initialize Select2 Elements
	$('.select2').select2();

	//Initialize Select2 Elements
	$('.select2bs4').select2({
		theme : 'bootstrap4'
	});
	
	$("#dataInit").on("click",function(){
		lecTimeTableInit();
	});
	
	var date = new Date();
	let year = date.getFullYear();
	
	console.log("year : " + year);
	
	str = '<option value="'+ year + '">' + year + '년</option>';
	
	$("#lecaYr").append(str);
	
	$("#lecaMp").on("keyup",evaluationStandardValidation);
	$("#lecaFp").on("keyup",evaluationStandardValidation);
	$("#lecaTp").on("keyup",evaluationStandardValidation);
	$("#lecaAp").on("keyup",evaluationStandardValidation);
	
	$("#lecaMp").on("change",evaluationStandardValidation);
	$("#lecaFp").on("change",evaluationStandardValidation);
	$("#lecaTp").on("change",evaluationStandardValidation);
	$("#lecaAp").on("change",evaluationStandardValidation);
	
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
		if( $(this).hasClass("approve") || $(this).hasClass("pendingApprove") ){
			return false;
		}
		$(this).toggleClass("highlighted");
		
		isHighlighted = $(this).hasClass("highlighted");
		
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
	$("#room").on("change", timeTableInit);
	
	// 연도와 학기가 선택되면 다른 시간표를 불러온다.
	$("#lecaSem").on("change", loadAlreadyTimeTable);
	$("#lecaYr").on("change", loadAlreadyTimeTable);
	
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
				lecaTt : JSON.stringify(lecTimeTable),
				lecaMp : $('#lecaMp').val(),
				lecaFp : $('#lecaFp').val(),
				lecaTp : $('#lecaTp').val(),
				lecaAp : $('#lecaAp').val(),
				weekPlanList : weekPlan,
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
					Swal.fire({
						  icon: 'success',
						  title: '임시저장이 완료되었습니다.',
						})
				}else {
					Swal.fire({
						  icon: 'error',
						  title: '다시 시도해주세요.',
						})
				}
				
				opener.parent.location.reload();
				window.close();
			}
		});
	});
	
	//제출 버튼 클릭 시
	$('#realSubmitBtn').on('click', function() {
		
		if(!validation()){
			return;
		}
		
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
				lecaTt : JSON.stringify(lecTimeTable),
				lecaMp : $('#lecaMp').val(),
				lecaFp : $('#lecaFp').val(),
				lecaTp : $('#lecaTp').val(),
				lecaAp : $('#lecaAp').val(),
				weekPlanList : weekPlan,
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
						Swal.fire({
							  icon: 'success',
							  title: '제출이 완료되었습니다.',
							})
					}else {
						Swal.fire({
							  icon: 'error',
							  title: '다시 시도해주세요.',
							})
					}
					
					opener.parent.location.reload();
					window.close();
				}
			});
	});
	
}

</script>
</html>