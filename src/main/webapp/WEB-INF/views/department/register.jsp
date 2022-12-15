<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="card mb-0 col-6">
				<div class="container-fluid">
					<h5>학과 등록</h5>
					※학과의 학과장 및 조교는 학과 등록 후 학과 수정페이지에서 설정할 수 있습니다.
					<div class="card-body">
						<form action="/department/register" method="post" onsubmit="return onSubmit();">
							<div class="row">
								<div class="form-group col-4">
									<label>단과대학:</label> <select id="college" name="colCd"
										class="select2bs4 select2-hidden-accessible"
										style="width: 100%;">
										<option value="">모든단과대학</option>
										<c:forEach var="college" items="${collegeList}">
											<option value="${college.colCd}">${college.colNm}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-8">
									<label>학과명:</label>
									<div class="input-group date" id="reservationdate"
										data-target-input="nearest">
										<input type="text" name="depNm" 
											class="form-control rounded-0" value="" required/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-8">
									<label >학과소개:</label>
									<div class="input-group date" id="reservationdatetime"
										data-target-input="nearest">
										<textarea name="depDes" rows="8"
											class="form-control rounded-0" required></textarea>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-8">
									<label >최대정원:</label>
									<div class="input-group date" id="reservationdatetime"
										data-target-input="nearest">
										<input type="number" name="depCap" 
											class="form-control rounded-0" value="" required/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-8">
									<label >연락처:</label>
									<div class="input-group date" id="reservationdatetime"
										data-target-input="nearest">
										<input type="text" name="depTel" 
											class="form-control rounded-0" value="" required/>
									</div>
								</div>
							</div>
							<div class="row">
								<button type="submit" class="btn bg-gradient-primary btn-sm col-1 offset-6">확인</button>
								<a href="/department/list" class="btn bg-gradient-warning btn-sm col-1">목록</a>
							</div>
							<sec:csrfInput />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script
	src="/resources/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/adminlte/plugins/select2/js/select2.full.min.js"></script>
<script src="/resources/adminlte/dist/js/adminlte.min.js"></script>
<script src="/resources/adminlte/dist/js/demo.js"></script>
<script type="text/javascript">
	$(function() {
		//Initialize Select2 Elements
		$('.select2').select2();

		//Initialize Select2 Elements
		$('.select2bs4').select2({
			theme : 'bootstrap4'
		});
	});
	
	function onSubmit(){
		let college = $("#college").val();
		if(!college){
			alert("단과대학을 선택해주세요");
			return false;
		}
		return true;
	}
</script>