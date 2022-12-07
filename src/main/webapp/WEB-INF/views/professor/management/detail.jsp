<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="col-md-6">
	<div class="card card-primary">
		<div class="card-body">

			<div class="form-group">
				<label cursorshover="true">증명사진:</label>
				<div class="input-group">
					<input type="text" name="stuPic" readOnly
						class="form-control rounded-1" value="${studentDetail.stuPic }" />
				</div>
			</div>

			<div class="form-group">
				<label>학과명:</label>
				<div class="input-group date" id="reservationdate"
					data-target-input="nearest">
					<input type="text" name="depNm" readonly
						class="form-control rounded-0" value="${studentDetail.depNm }" />
				</div>
			</div>

			<div class="form-group">
				<label cursorshover="true">학번:</label>
				<div class="input-group">
					<input type="text" name="stuNo" readOnly
						class="form-control rounded-1" value="${studentDetail.stuNo }" />
				</div>
			</div>

			<div class="form-group">
				<label>학년:</label>
				<div class="input-group date" id="reservationdate"
					data-target-input="nearest">
					<input type="text" name="stuYr" readonly
						class="form-control rounded-0" value="${studentDetail.stuYr }" />
				</div>
			</div>

			<div class="form-group">
				<label cursorshover="true">재학학기:</label>
				<div class="input-group date" id="reservationdatetime"
					data-target-input="nearest">
					<input type="text" name="stuSem" readonly
						class="form-control rounded-0" value="${studentDetail.stuSem }" />
				</div>
			</div>


			<div class="form-group">
				<label cursorshover="true">이름(한글/영문):</label>
				<div class="input-group date" id="reservationdatetime"
					data-target-input="nearest">
					<input type="text" name="stuNm" readonly
						class="form-control rounded-0" value="${studentDetail.stuNm }" />
					<input type="text" name="stuNme" readonly
						class="form-control rounded-0" value="${studentDetail.stuNme }" />
				</div>
			</div>

			<div class="form-group">
				<label cursorshover="true">생년월일:</label>
				<div class="input-group date" id="reservationdatetime"
					data-target-input="nearest">
					<input type="text" name="stuReg" readonly
						class="form-control rounded-0" value="${studentDetail.stuReg }" />
				</div>
			</div>

			<div class="form-group">
				<label cursorshover="true">전화번호:</label>
				<div class="input-group date" id="reservationdatetime"
					data-target-input="nearest">
					<input type="text" name="stuTel" readonly
						class="form-control rounded-0" value="${studentDetail.stuTel }" />
				</div>
			</div>

			<div class="form-group">
				<label cursorshover="true">주소:</label>
				<div class="input-group date" id="reservationdatetime"
					data-target-input="nearest">
					<input type="text" name="stuAddr1" readonly
						class="form-control rounded-0" value="${studentDetail.stuAddr1 }" />
					<input type="text" name="stuAddr2" readonly
						class="form-control rounded-0" value="${studentDetail.stuAddr2 }" />
				</div>
			</div>


	
			<div id="spn1" class="card-footer">
				<div style="text-align: right">
					<a href="/professor/management/main"
						class="btn bg-gradient-warning btn-sm">목록</a>
				</div>
			</div>
		</div>
	</div>
</div>






