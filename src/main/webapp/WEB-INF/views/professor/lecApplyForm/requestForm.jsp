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
	    			<select id="lecaYr" id="lecaYr"></select>
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
	    				<option value="L101">전공필수(전필)</option>
	    				<option value="L102">전공선택(전선)</option>
	    				<option value="L104">교양필수(교필)</option>
	    				<option value="L103">교양선택(교선)</option>
	    			</select>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>과목 카테고리</th>
	    		<td>
		    		<input type="text" id="search_area" name="subNm" size=30 placeholder="과목명을 검색해주세요.">
		    		<i id="searchIcon" class="dripicons-search" style="font-size : 1.2em;"></i>
	    		</td>
	    		<th>학수번호</th>
	    		<td><input type="text" id="subCd" name="subCd" size=32 placeholder="카테고리 선택 시 자동으로 입력됩니다." readonly disabled></td>
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
	    				<option value="E101">GRADE</option>
	    				<option value="E102">PASS/FAIL</option>
	    			</select>
	    		</td>
	    		<th>최대정원</th>
	    		<td colspan="2"><input type="text" id="lecaCap" name="lecaCap" size=5>&nbsp;명&emsp;※&nbsp;사이버강의는 0입력</td>
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
    		
    		<br><br>
    		
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
<script type="text/javascript">
	
window.onload = function() {
	
	//검색어 자동완성 이벤트///////////////////////////////////////////////////////////////////////////////////////////
	
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
	
	$('#timeTableBtn').on('click', function() {
		
		$('#textArea4time').empty();
		
		timeTable = $('#timeTableChoice');
		
		str = '';
		
		for(j = 0; j <= 4; j++) {
			for(i = 1; i <= 9; i++) {
				cellObj = timeTable.find("tr").eq(i).find("td").eq(j);
				
				if(cellObj.hasClass("highlighted")) {
					
					if(j == 0) {
						str += "월요일 " + i + "교시\n";
					}else if(j == 1) {
						str += "화요일 " + i + "교시\n";
					}else if(j == 2) {
						str += "수요일 " + i + "교시\n";
					}else if(j == 3) {
						str += "목요일 " + i + "교시\n";
					}else if(j == 4) {
						str += "금요일 " + i + "교시\n";
					}
				}
			}
		}
		//alert(str);
		$('#textArea4time').append(str);
	});
	
}

		//제출 버튼 클릭 시
		$('#realSubmitBtn').on('click', function() {
			let dataObject = {
					lecaYr : $('#lecaYr').val(),
					lecaSem : $('#lecaSem').val(),
					lecaTrg : $('#lecaTrg').val(),
					lecaCrd : $('#lecaCrd').val(),
					lecaNm : $('#lecaNm').val(),
					subCd : $('#subCd').val(),
					lecaCon : $('#lecaCon').val(),
					lecaCate : $('#lecaCate').val(),
					lecaBook : $('#lecaBook').val(),
					lecaGrade : $('#lecaGrade').val(),
					lecaCap : $('#lecaCap').val(),
					lecaMp : $('#lecaMp').val(),
					lecaFp : $('#lecaFp').val(),
					lecaTp : $('#lecaTp').val(),
					lecaAp : $('#lecaAp').val(),
					weekPlan1 : $('#weekPlan1').val(),
					weekPlan2 : $('#weekPlan2').val(),
					weekPlan3 : $('#weekPlan3').val(),
					weekPlan4 : $('#weekPlan4').val(),
					weekPlan5 : $('#weekPlan5').val(),
					weekPlan6 : $('#weekPlan6').val(),
					weekPlan7 : $('#weekPlan7').val(),
					weekPlan8 : $('#weekPlan8').val(),
					weekPlan9 : $('#weekPlan9').val(),
					weekPlan10 : $('#weekPlan10').val(),
					weekPlan11 : $('#weekPlan11').val(),
					weekPlan12 : $('#weekPlan12').val(),
					weekPlan13 : $('#weekPlan13').val(),
					weekPlan14 : $('#weekPlan14').val(),
					weekPlan15 : $('#weekPlan15').val(),
					weekPlan16 : $('#weekPlan16').val(),
					lecaTt : $('#textArea4time').val(),
					lecaNote : $('#lecaNote').val()
				}
				
				$.ajax({
					url : "/professor/lecApplyForm/lecApplySubmit",
					type : "POST",
					data : JSON.stringify(dataObject),
					dataType : "JSON",
					contentType : "application/json;charset=utf-8",
					success : function(res) {
						if(res == 17) {
							alert("제출이 완료되었습니다.");
						}else {
							alert("다시 시도해주세요.");
						}
						
						opener.parent.location.reload();
						window.close();
					}
				});
		});
</script>
</html>