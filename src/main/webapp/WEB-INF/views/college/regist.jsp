<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>


<div class="col-md-6">
<form name="frm" id="frm" method="post" action="/college/registPost">
	<div class="card card-primary">
		<div class="card-body">
		
			<input type="text"  name="colCd" value="" />
			<div class="form-group">
				<label>단과대학명:</label>
				<div class="input-group date" id="reservationdate"
					data-target-input="nearest">
					<input type="text"  name="colNm"  required class="form-control rounded-0"  value=""/>
				</div>
			</div>

			<div class="form-group">
				<label cursorshover="true">단과대설명:</label>
				<div class="input-group date" id="reservationdatetime"
					data-target-input="nearest">
					<textarea  name="colDes"   required class="form-control rounded-0" ></textarea>
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






