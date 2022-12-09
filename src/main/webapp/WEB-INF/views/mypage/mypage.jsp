<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<style>
div {
/* 	border: 1px solid red; */
}
</style>
<script type="text/javascript">
$(function(){
	$("#btnZipCode").on("click",function(){
		alert("하이루");
		new daum.Postcode({
			oncomplete:function(data){
				$("input[name='stuZip']").val(data.zonecode); // 우편번호 5자리
				$("input[name='stuAddr1']").val(data.address); // 주소
				$("input[name='stuAddr2']").val(data.buildingName); // 상세 주소
			}
		}).open();
	});
});
</script>
<div class="content container-fluid">
	<div class="row">
		<div class="col-md-8 offset-2">
			<div class="card card-outline card-primary p-5">
				<div class="card-header">
					<h3 class="card-title">내 정보 확인</h3>
				</div>
				<div class="card-body">
					<form action="/mypage/stuUpdate" method="post">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-3">
									<img src="/resources/upload/img/${student.stuPic}"
										class="img-thumbnail" alt="User Image">
								</div>
								<div class="col-md-9">
									<div class="container">
										<div class="row mt-1 mb-2">
											<div class="col-4 offset-1">
												<label for="memNo" class="form-label">학번</label> 
												<input type="text" class="form-control" id="memNo" name="stuNo" value="${student.stuNo}" readonly />
											</div>
											<div class="col-4 offset-1">
												<label for="memNm" class="form-label">이름</label> 
												<input type="text" class="form-control" id="memNm" name="stuNm" value="${student.stuNm}" readonly />
											</div>
										</div>
										<div class="row mb-2">
											<div class="col-4 offset-1">
												<label for="colNm" class="form-label">단과대학</label> <input
													type="text" class="form-control" id="colNm" name="colNm" value="${student.colNm}" readonly />
											</div>
											<div class="col-4 offset-1">
												<label for="depNm" class="form-label">학과</label> <input
													type="text" class="form-control" id="depNm" name="depNm" value="${student.depNm}" readonly />
											</div>
										</div>
										<div class="row mb-2">
											<div class="col-4 offset-1">
												<label for="stuYr" class="form-label">학년</label> <input
													type="text" class="form-control" id="stuYr" name="stuYr" value="${student.stuYr}" readonly />
											</div>
											<div class="col-4 offset-1">
												<label for="stuSem" class="form-label">재학학기</label> <input
													type="text" class="form-control" id="stuSem" name="stuSem" value="${student.stuSem}" readonly />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row mt-5 mb-2">
							<div class="col-4 offset-1">
								<label for="stuBir" class="form-label">생년월일</label> 
								<input type="text" class="form-control" id="stuBir" name="stuBir" value="${student.stuBir}" readonly />
							</div>
							<div class="col-4 offset-1">
								<label for="stuTel" class="form-label">전화번호</label> 
								<input type="text" class="form-control" id="stuTel" name="stuTel" value="${student.stuTel}" readonly />
							</div>
						</div>
						<div class="row mt-4 mb-2">
							<div class="col-3">
								<div class="form-group">
									<label>은행</label> 
									<select class="form-control" id="stuBankCd" name="stuBankCd" value="${student.stuBankCd}" >
										<option value="1">KEB하나은행</option>
										<option value="2">SC제일은행</option>
										<option value="3">국민은행</option>
										<option value="4">신한은행</option>
										<option value="5">우리은행</option>
										<option value="6">한국시티은행</option>
										<option value="7">기업은행</option>
										<option value="8">농협</option>
									</select>
								</div>
							</div>
	
							<div class="col-3 offset-1">
								<label for="stuDepo" class="form-label">예금주</label> 
								<input type="text" class="form-control" id="stuDepo" name="stuDepo" value="${student.stuDepo}" readonly />
							</div>
							<div class="col-3 offset-1">
								<label for="stuAct" class="form-label">계좌번호</label> 
								<input type="text" class="form-control" id="stuAct" name="stuAct" value="${student.stuAct}" required />
							</div>
						</div>
						<div class="row mt-4 mb-2">
							<div class="col-3">
								<label for="stuZip" class="form-label">우편번호</label> 
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="우편번호 검색" value="${student.stuZip}" name="stuZip" readonly />
									<div class="input-group-append">
										<button type="button" class="btn btn-default" id="btnZipCode">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</div>
	
						</div>
						<div class="row mb-2">
							<div class="col-6" style="">
								<label for="stuAddr1" class="form-label">기본주소</label> 
								<input type="text" class="form-control" id="stuAddr1" name="stuAddr1" value="${student.stuAddr1}" required />
							</div>
							<div class="col-6">
								<label for="stuAddr2" class="form-label">상세주소</label> 
								<input type="text" class="form-control" id="stuAddr2" name="stuAddr2" value="${student.stuAddr2}" required />
							</div>
						</div>
						<div class="col-12" align="right">
							<button type="submit" class="btn btn-outline-warning">수정</button>
						</div>
						<sec:csrfInput/>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 학사정보 -->
	<div class="row">
		<div class="col-md-8 offset-2">
			<div class="card card-primary">
				<div class="card-header">
					<h3 class="card-title">나의 학사 정보</h3>
					<div class="card-tools">
						<button type="button" class="btn btn-tool"
							data-card-widget="collapse" title="Collapse">
							<i class="fas fa-minus"></i>
						</button>
					</div>
				</div>
				<div class="card-body">
					<div class="form-group">
						<label for="inputName">Project Name</label> <input type="text"
							id="inputName" class="form-control" value="AdminLTE">
					</div>
					<div class="form-group">
						<label for="inputDescription">Project Description</label>
						<textarea id="inputDescription" class="form-control" rows="4">Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terr.</textarea>
					</div>
					<div class="form-group">
						<label for="inputStatus">Status</label> <select id="inputStatus"
							class="form-control custom-select">
							<option disabled="">Select one</option>
							<option>On Hold</option>
							<option>Canceled</option>
							<option selected="">Success</option>
						</select>
					</div>
					<div class="form-group">
						<label for="inputClientCompany">Client Company</label> <input
							type="text" id="inputClientCompany" class="form-control"
							value="Deveint Inc">
					</div>
					<div class="form-group">
						<label for="inputProjectLeader">Project Leader</label> <input
							type="text" id="inputProjectLeader" class="form-control"
							value="Tony Chicken">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>