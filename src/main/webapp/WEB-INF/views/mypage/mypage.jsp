<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
div {
/* 	border: 1px solid red; */
}
</style>
<div class="content container-fluid">
	<div class="row">
		<div class="col-md-8 offset-2">
			<div class="card p-5">
				<form>
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
											<input type="text" class="form-control" id="memNo" value="${student.stuNo}" readonly />
										</div>
										<div class="col-4 offset-1">
											<label for="memNm" class="form-label">이름</label> 
											<input type="text" class="form-control" id="memNm" value="${student.stuNm}" readonly />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-4 offset-1">
											<label for="colNm" class="form-label">단과대학</label> <input
												type="text" class="form-control" id="colNm" value="${student.colNm}" readonly />
										</div>
										<div class="col-4 offset-1">
											<label for="depNm" class="form-label">학과</label> <input
												type="text" class="form-control" id="depNm" value="${student.depNm}" readonly />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-4 offset-1">
											<label for="stuYr" class="form-label">학년</label> <input
												type="text" class="form-control" id="stuYr" value="${student.stuYr}" readonly />
										</div>
										<div class="col-4 offset-1">
											<label for="stuSem" class="form-label">재학학기</label> <input
												type="text" class="form-control" id="stuSem" value="${student.stuSem}" readonly />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-5 mb-2">
						<div class="col-4 offset-1">
							<label for="stuBir" class="form-label">생년월일</label> 
							<input type="text" class="form-control" id="stuBir" value="${student.stuBir}" readonly />
						</div>
						<div class="col-4 offset-1">
							<label for="stuTel" class="form-label">전화번호</label> 
							<input type="text" class="form-control" id="stuTel" value="${student.stuTel}" readonly />
						</div>
					</div>
					<div class="row mt-4 mb-2">
						<div class="col-3">
							<label for="stuZip" class="form-label">우편번호</label> 
							<input type="text" class="form-control" id="stuZip" value="${student.stuZip}" />
						</div>
						<div class="col-3 offset-1">
							<label for="stuAddr1" class="form-label">기본주소</label> 
							<input type="text" class="form-control" id="stuAddr1" value="${student.stuAddr1}" />
						</div>
						<div class="col-3 offset-1">
							<label for="stuAddr2" class="form-label">상세주소</label> 
							<input type="text" class="form-control" id="stuAddr2" value="${student.stuAddr2}" />
						</div>
					</div>
					<div class="row mt-4 mb-2">
<!-- 						<div class="col-3"> -->
<!-- 							<label for="stuBankCd" class="form-label">은행</label>  -->
<%-- 							<input type="text" class="form-control" id="stuBankCd" value="${student.stuBankCd}" /> --%>
<!-- 						</div> -->
						<div class="col-3">
							<div class="form-group">
								<label>은행</label> 
								<select class="form-control" id="stuBankCd" value="${student.stuBankCd}" >
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
							<input type="text" class="form-control" id="stuDepo" value="${student.stuDepo}" readonly />
						</div>
						<div class="col-3 offset-1">
							<label for="stuAct" class="form-label">계좌번호</label> 
							<input type="text" class="form-control" id="stuAct" value="${student.stuAct}" />
						</div>
					</div>
<!-- 					<div class="col-6"> -->
<!-- 						<label for="inputAddress" class="form-label">Address</label> <input -->
<!-- 							type="text" class="form-control" id="inputAddress" -->
<!-- 							placeholder="1234 Main St"> -->
<!-- 					</div> -->
<!-- 					<div class="col-6"> -->
<!-- 						<label for="inputAddress2" class="form-label">Address 2</label> <input -->
<!-- 							type="text" class="form-control" id="inputAddress2" -->
<!-- 							placeholder="Apartment, studio, or floor"> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-6"> -->
<!-- 						<label for="inputCity" class="form-label">City</label> <input -->
<!-- 							type="text" class="form-control" id="inputCity"> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-4"> -->
<!-- 						<label for="inputState" class="form-label">State</label> <select -->
<!-- 							id="inputState" class="form-select"> -->
<!-- 							<option selected="">Choose...</option> -->
<!-- 							<option>...</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-2"> -->
<!-- 						<label for="inputZip" class="form-label">Zip</label> <input -->
<!-- 							type="text" class="form-control" id="inputZip"> -->
<!-- 					</div> -->
<!-- 					<div class="col-12"> -->
<!-- 						<div class="form-check"> -->
<!-- 							<input class="form-check-input" type="checkbox" id="gridCheck"> -->
<!-- 							<label class="form-check-label" for="gridCheck"> Check me -->
<!-- 								out </label> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<div class="col-12">
						<button type="submit" class="btn btn-primary">Sign in</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>