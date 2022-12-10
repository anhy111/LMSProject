<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">

		var date = new Date();
		let year = date.getFullYear();
		let month = date.getMonth();
		var semester;
		
		if (month == '3' || month == '4' || month == '5' || month == '6') semester = 1;
		else if (month == '9' || month == '10' || month == '11' || month == '12') semester = 2;
		
		let lectureListYear = year + "년도 " + semester + "학기";
		let lectureListNextYearFirstSemester;

	$(document).ready(function(){
		CKEDITOR.replace("content");
			setApplyTerm();
			armyTermDisabled();
			selectLeaveOptionDisabed();
			
		$("#recordCategory").on("change",function(){
			if($("#recordCategory").val() == "휴학"){
				selectLeaveOptionAbed();
				$("#leaveCategory").show();
				setPeriodAbled();
				$("#leaveCategory").on("change",function(){
					if($("#leaveCategory option:selected").val() == "입대휴학"){
						armyTermAbled();
					}else{
						armyTermDisabled();
					}
				})
			}
			if($("#recordCategory").val() == "복학"){ 
				reset();
			}
			if($("#recordCategory").val() == "자퇴"){
				reset();
			} 
			if($("#recordCategory").val() == "졸업"){
				reset();
			}
			
		})
	})
	
	//현재 학기가 2학기일경우 데이터를 다음년도 1학기로 바꿔주는 함수
	function setApplyTerm(){
		if(semester == 2){
			var nextYear = year + 1;
			if(!(nextYear - year == 1)){nextYear--;}
			lectureListNextYearFirstSemester = nextYear +"년도 " + 1 + "학기";
			var term = "<input type='text' name='recSem' value=' " + lectureListNextYearFirstSemester +  " 'readonly/>"
			$(".applyTerm").append(term);
		}
	}
	
	function armyTermDisabled(){
		$("#selectTerm option:eq(0)").prop("selected",true);
		$("#armyTerm").hide();
		$("#selectTerm option:eq(1)").show();
		$("#selectTerm option:eq(2)").show();
		$("#selectTerm option:eq(3)").show();
		}
	function armyTermAbled(){
		$("#selectTerm option:eq(0)").prop("selected",true); 
		$("#armyTerm").show();
		$("#selectTerm option:eq(1)").hide();
		$("#selectTerm option:eq(2)").hide();
		$("#selectTerm option:eq(3)").hide();
	}
	
	function selectLeaveOptionDisabed(){$("#selectLeave").hide();}
	function selectLeaveOptionAbed(){$("#selectLeave").show();}
	
	function setPeriodDisabled(){$("#periodOfTerm").hide();}
	function setPeriodAbled(){$("#periodOfTerm").show();}
		
	function reset(){
			$("#leaveCategory option:eq(0)").prop("selected",true);
			$("#selectTerm option:eq(0)").prop("selected",true); 
			selectLeaveOptionDisabed();
			setPeriodDisabled();
	}
</script>

<div class="col-md-6">
<form name="frm" id="frm" method="post" action="/record/applyPost">
	<div class="card card-primary">
		<div class="card-body">
				<div class="form-group">
					<label>학번:</label> 
					<div class="input-group date" id="reservationdate"
						data-target-input="nearest">
						<input type="text"  name="stuNo" value="${stuNo }" readonly />
					</div>
				</div>
			
			<div class="form-group">
				<label cursorshover="true">신청학기:</label>
				<div class="input-group date applyTerm" id="reservationdatetime"
					data-target-input="nearest">
				</div>
			</div>
						
			<div class="form-group col-4" data-select2-id="191">
				<label>학적구분</label>
				<select  id="recordCategory" name="rgbCd" class="form-control select2 select2-hidden-accessible" style="width: 100%;" data-select2-id="1" tabindex="-1" aria-hidden="true">
					<option selected="selected" >카테고리선택</option>
					<option id="leave"  value="휴학">휴학</option>
					<option id="return"  value="복학">복학</option>
					<option id="quit" value="자퇴">자퇴</option>
					<option id="graduation" value="졸업">졸업</option>
				</select>
			</div>
				<!-- 휴학선택시 보이는 옵션 -->
			<div id="selectLeave" class="form-group col-4" data-select2-id="191">	
				<label>휴학구분</label>
				<select  id="leaveCategory" name="rgbCd" class="form-control select2 select2-hidden-accessible" style="width: 100%;" data-select2-id="1" tabindex="-1" aria-hidden="true">
					<option selected="selected" >카테고리선택</option>
					<option class="leaveChild general" value="일반휴학">일반휴학</option>
					<option class="leaveChild army" value="입대휴학">입대휴학</option>
					<option class="leaveChild speacial" value="특별휴학">특별휴학</option>
					<option class="leaveChild etc" value="기타휴학">기타휴학</option>
				</select>
			</div>

			<div id="periodOfTerm" class="form-group" data-select2-id="191">
				<label cursorshover="true">기간:</label>
				<div class="input-group date" id="reservationdatetime"
					data-target-input="nearest">
				<select  id="selectTerm" name="recPer" class="form-control select2 select2-hidden-accessible" style="width: 100%;" data-select2-id="1" tabindex="-1" aria-hidden="true">
						<!-- 휴학유형에 따라 선택 할 수 있는 옵션값이 달라짐 -->
						<option selected>기간선택</option>
						<option value="6">한학기</option>
						<option value="12">1년</option>
						<option value="24">2년</option>
						<option id="armyTerm" value="18">입대휴학</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label cursorshover="true">신청사유:</label>
				<div class="input-group date" id="reservationdatetime"
					data-target-input="nearest">
					<textarea id="content" name="recRsn"  rows="5" cols="500"></textarea>
				</div>
			</div>

		
			<div id="spn1" class="card-footer">
			<div style="text-align:right">
				<!-- 확인시 신청 내역으로 -->
				<button type="submit" class="btn bg-gradient-primary btn-sm">확인</button> 
				<!-- 작성내용 초기화 -->
				<a href="#" class="btn bg-gradient-danger btn-sm">취소</a>
				<a href="/college/main" class="btn bg-gradient-warning btn-sm">메인</a>
			</div>
			</div>
		
		</div>
	</div>
	<sec:csrfInput/>
	</form>
</div>






