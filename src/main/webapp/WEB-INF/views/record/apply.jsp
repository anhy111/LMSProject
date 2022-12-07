<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	var date = new Date();
	let year = date.getFullYear();
	let month = date.getMonth();
	var semester;

	if (month == '3' || month == '4' || month == '5' || month == '6')
		semester = 1;
	else if (month == '9' || month == '10' || month == '11' || month == '12')
		semester = 2;

	let lectureListYear = year + "년도 " + semester + "학기 강의목록";
	console.log(lectureListYear);

	$(function() {
		$("#lectureListYear").text(lectureListYear);
	})
</script>

<div class="col-md-6">
<form name="frm" id="frm" method="post" action="/record/applyPost">
	<div class="card card-primary">
		<div class="card-body">
		
			<input type="text"  name="stuNo" value="${stuNo }" />
			<div class="form-group">
				<label>학적구분:</label>
				<div class="input-group date" id="reservationdate"
					data-target-input="nearest">
					<select name="rgbCd" required>
						<option value="휴학">휴학</option>
						<option value="복학">복학</option>
						<option value="자퇴">자퇴</option>
						<option value="졸업">졸업</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label cursorshover="true">신청학기:</label>
				<div class="input-group date" id="reservationdatetime"
					data-target-input="nearest">
					
				</div>
			</div>


			<div class="form-group">
				<label cursorshover="true">단과대연락처:</label>
				<div class="input-group date" id="reservationdatetime"
					data-target-input="nearest">
					<input type="text"  name="colTel"  required class="form-control rounded-0" value=""/>
				</div>
			</div>

			<div class="form-group">
				<label cursorshover="true">단과대위치:</label>
				<div class="input-group date" id="reservationdatetime"
					data-target-input="nearest">
					<input type="text"  name="colAddr"  required class="form-control rounded-0" value=""/>
				</div>
			</div>

			
			<div class="form-group">
				<label cursorshover="true">단과대이미지:</label>
				<div class="input-group">
					<input  type="text"  required class="form-control rounded-1"  value="" name="colImgUrl" />
				</div>
			</div>
			

		
			<div id="spn1" class="card-footer">
			<div style="text-align:right">
				<button type="submit" class="btn bg-gradient-primary btn-sm">확인</button>
				<a href="/college/main" class="btn bg-gradient-warning btn-sm">목록</a>
			</div>
			</div>
		
			
		</div>
	</div>
	<sec:csrfInput/>
	</form>
</div>






