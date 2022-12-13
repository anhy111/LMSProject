<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의계획서 폼 작성</title>
<link rel="stylesheet" href="/resources/css/inquiry1.css">
<link rel="stylesheet" href="/resources/css/inquiry2.css">
</head>
<body>
	<div id="realFormBody">
	
	<span id="lecApplyTitle">강의계획서 상세</span>
	
	<div id="div4btns">
		<button id="close" onclick="fn_close()" type="button" class="btn btn-secondary">닫기</button>
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
	    			<input type="text" name="lecaYr" size=30 value="${lecApplyList[0].lecaYr }년" disabled>
	    		</td>
	    		<th>학기</th>
	    		<td>
	    			<input type="text" name="lecaSem" size=30 value="${lecApplyList[0].lecaSem }" disabled>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>대상학년</th>
	    		<td>
	    			<input type="text" name="lecaTrg" size=30 value="${lecApplyList[0].lecaTrg }학년" disabled>
	    		</td>
	    		<th>학점</th>
	    		<td>
	    			<input type="text" name="lecaCrd" size=30 value="${lecApplyList[0].lecaCrd }학점" disabled>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>강의명</th>
	    		<td>
	    			<input type="text" name="lecaNm" size=30 value="${lecApplyList[0].lecaNm }" disabled>
	    		</td>
	    		<th>이수구분</th>
	    		<td>
	    			<input type="text" name="lecaCate" size=30 value="${lecApplyList[0].lecaCate }" disabled>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>과목 카테고리</th>
	    		<td>
		    		<input type="text" name="subNm" size=30 value="${lecApplyList[0].subNm }" disabled>
	    		</td>
	    		<th>학수번호</th>
	    		<td>
	    			<input type="text" name="subCd" size=30 value="${lecApplyList[0].subCd }" disabled>
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
	    			<textarea id="lecaCon" name="lecaCon" rows="3" cols="90" disabled>${lecApplyList[0].lecaCon }</textarea>
	    		</td>
	    	</tr>
    		<tr>
	    		<th>교재 및 <br>참고문헌</th>
	    		<td colspan="5">
	    			<textarea id="lecaBook" name="lecaBook" rows="3" cols="90" disabled>${lecApplyList[0].lecaBook }</textarea>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>성적평가방식</th>
	    		<td colspan="2">
	    			<input type="text" name="lecaGrade" size=30 value="${lecApplyList[0].lecaGrade }" disabled>
	    		</td>
	    		<th>최대정원</th>
	    		<td colspan="2">
	    			<input type="text" id="lecaCap" name="lecaCap" value="${lecApplyList[0].lecaCap }" disabled>명
	    		</td>
	    	</tr>
	    	<tr>
	    		<th rowspan="2">평가방법(%)</th>
	    		<td style="width:116px; font-weight:bold; text-align:center;">중간고사</td>
	    		<td style="width:116px; font-weight:bold; text-align:center;">기말고사</td>
	    		<td style="width:116px; font-weight:bold; text-align:center;">과제</td>
	    		<td style="width:116px; font-weight:bold; text-align:center;">출결</td>
	    	</tr>
	    	<tr>
	    		<td style="width:116px; text-align:center;"><input type="text" id="lecaMp" name="lecaMp" value="${lecApplyList[0].lecaMp }" size=5 disabled>%</td>
	    		<td style="width:116px; text-align:center;"><input type="text" id="lecaFp" name="lecaFp" value="${lecApplyList[0].lecaFp }" size=5 disabled>%</td>
	    		<td style="width:116px; text-align:center;"><input type="text" id="lecaTp" name="lecaTp" value="${lecApplyList[0].lecaTp }" size=5 disabled>%</td>
	    		<td style="width:116px; text-align:center;"><input type="text" id="lecaAp" name="lecaAp" value="${lecApplyList[0].lecaAp }" size=5 disabled>%</td>
	    	</tr>
    	</table>
    	
    	<br><br>
	    
	    <p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;강의 계획</p>
	    <table id="lecWeekPlan" class="lecApplyTable" border="1" style="z-index: 9000;">
	    	<tr><th>1주차</th><td colspan="5"><textarea id="weekPlan1" rows="2" cols="90" disabled>${weekPlanList[0].wpCon }</textarea></td></tr>
	    	<tr><th>2주차</th><td colspan="5"><textarea id="weekPlan2" rows="2" cols="90" disabled>${weekPlanList[1].wpCon }</textarea></td></tr>
	    	<tr><th>3주차</th><td colspan="5"><textarea id="weekPlan3" rows="2" cols="90" disabled>${weekPlanList[2].wpCon }</textarea></td></tr>
	    	<tr><th>4주차</th><td colspan="5"><textarea id="weekPlan4" rows="2" cols="90" disabled>${weekPlanList[3].wpCon }</textarea></td></tr>
	    	<tr><th>5주차</th><td colspan="5"><textarea id="weekPlan5" rows="2" cols="90" disabled>${weekPlanList[4].wpCon }</textarea></td></tr>
	    	<tr><th>6주차</th><td colspan="5"><textarea id="weekPlan6" rows="2" cols="90" disabled>${weekPlanList[5].wpCon }</textarea></td></tr>
	    	<tr><th>7주차</th><td colspan="5"><textarea id="weekPlan7" rows="2" cols="90" disabled>${weekPlanList[6].wpCon }</textarea></td></tr>
	    	<tr><th>8주차</th><td colspan="5"><textarea id="weekPlan8" rows="2" cols="90" disabled>중간고사</textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>9주차</th><td colspan="5"><textarea id="weekPlan9" rows="2" cols="90" disabled>${weekPlanList[7].wpCon }</textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>10주차</th><td colspan="5"><textarea id="weekPlan10" rows="2" cols="90" disabled>${weekPlanList[8].wpCon }</textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>11주차</th><td colspan="5"><textarea id="weekPlan11" rows="2" cols="90" disabled>${weekPlanList[9].wpCon }</textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>12주차</th><td colspan="5"><textarea id="weekPlan12" rows="2" cols="90" disabled>${weekPlanList[10].wpCon }</textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>13주차</th><td colspan="5"><textarea id="weekPlan13" rows="2" cols="90" disabled>${weekPlanList[11].wpCon }</textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>14주차</th><td colspan="5"><textarea id="weekPlan14" rows="2" cols="90" disabled>${weekPlanList[12].wpCon }</textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>15주차</th><td colspan="5"><textarea id="weekPlan15" rows="2" cols="90" disabled>${weekPlanList[13].wpCon }</textarea></td></tr>
	    	<tr class="switchTr" style="display:none;"><th>16주차</th><td colspan="5"><textarea id="weekPlan16" rows="2" cols="90" disabled>기말고사</textarea></td></tr>
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
	
	function fn_close() {
		window.close();
	}
</script>
</html>