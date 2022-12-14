<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
	<div class="col-sm-7">
		<div class="card col-sm-11 offset-1">
			<div class="card-header">
				<h3 class="card-title">휴복학 신청 관리</h3>
			</div>
	
			<div class="card-body">
				<div id="example1_wrapper"></div>
				<div class="row">
					<div class="col-sm-12">
						<table id="example1"
							class="table table-bordered table-striped dataTable dtr-inline"
							aria-describedby="example1_info">
							<thead>
								<tr>
									<th class="sorting sorting_asc" tabindex="0"
										aria-controls="example1" rowspan="1" colspan="1"
										aria-sort="ascending"
										aria-label="Rendering engine: activate to sort column descending">번호</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Browser: activate to sort column ascending">학번</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Platform(s): activate to sort column ascending">이름</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Engine version: activate to sort column ascending">신청년도/학기</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="CSS grade: activate to sort column ascending">신청구분</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="CSS grade: activate to sort column ascending">승인구분</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="CSS grade: activate to sort column ascending">상세</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${list}" varStatus="stat">
									<td class="dtr-control sorting_1" tabindex="0" style="text-align:center;">${stat.count}</td>
									<td class="detailStu">${list.stuNo}</td>
									<td>${list.stuNm}</td>
									<td>
										<div class="image">
											${list.recYr}년 ${list.recSem}학기
										</div>
									</td>
									<td>${list.rgbCd}</td>
									<td>${list.recYn}</td>
									<td><button
											class="btn btn-block btn-outline-info btn-sm btnDetail"
											value="${list.stuNo}">상세</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-5">
		<div class="col-md-11">
			<div class="card card-outline card-primary">
				<div class="card-header">
					<h3 class="card-title">상세 정보</h3>
				</div>
				<div class="card-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-11 offset-1">
								<div class="container">
									<div class="row mt-1 mb-2">
										<div class="col-5">
											<label for="stuNo" class="form-label">신청일자</label> 
											<input type="text" class="form-control" id="stuNo" name="stuNo" readonly />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-5">
											<label for="stuNm" class="form-label">학번</label> 
											<input type="text" class="form-control stu" id="stuNm" name="stuNm" readonly />
										</div>
										<div class="col-5 offset-1">
											<label for="stuNme" class="form-label">이름</label>
											 <input type="text" class="form-control stu" id="stuNme" name="stuNme" readonly />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-5">
											<label>학년</label> 
											<select class="form-control stu" id="stuYr" name="stuYr" disabled>
												<option value="1">1학년</option>
												<option value="2">2학년</option>
												<option value="3">3학년</option>
												<option value="4">4학년</option>
												<option value="5">5학년</option>
												<option value="6">6학년</option>
											</select>
										</div>
										<div class="col-5 offset-1">
											<label>학기</label> 
											<select class="form-control stu" id="stuSem" name="stuSem" disabled>
												<option value="1">1학기</option>
												<option value="2">2학기</option>
											</select>
										</div>
									</div>
									<div class="row mt-3 mb-2">
										<div class="form-group col-4 offset-1">
											<label for="colCd" class="form-label">단과대학</label> 
											<select id="colCd" class="form-control stu"  disabled>
												<option value="0">단과대학</option>
					<%-- 								<c:forEach var="college" items="${collegeList}"> --%>
					<%-- 									<option value="${college.colCd}">${college.colNm}</option> --%>
					<%-- 								</c:forEach> --%>
											</select>
										</div>
										<div class="col-4 offset-1">
											<label for="department" class="form-label">학과</label> 
											<select id="department" class="form-control stu" disabled>
												<option value="">학과</option>
											</select>
					
										</div>
									</div>
									<div class="row mt-3 mb-2">
										<div class="col-4 offset-1">
											<label for="stuBir" class="form-label">생년월일</label> <input
												type="text" class="form-control stu" id="stuBir" name="stuBir" readonly />
										</div>
										<div class="col-4 offset-1">
											<label for="stuTel" class="form-label">전화번호</label> <input
												type="text" class="form-control stu" id="stuTel" name="stuTel" readonly />
										</div>
									</div>
									<div class="row mt-4 mb-2">
										<div class="col-4">
											<div class="form-group">
												<label>은행</label> <select class="form-control stu" id="stuBankCd" name="stuBankCd" disabled >
					<%-- 									<c:forEach var="detail" items="#{commonDetailList}"> --%>
					<%-- 										<option value="${detail.comdCd}">${detail.comdNm}</option> --%>
					<%-- 									</c:forEach> --%>
												</select>
											</div>
										</div>
					
										<div class="col-3 offset-1">
											<label for="stuDepo" class="form-label">예금주</label> <input
												type="text" class="form-control stu" id="stuDepo" name="stuDepo" readonly />
										</div>
										<div class="col-3 offset-1">
											<label for="stuAct" class="form-label">계좌번호</label> <input
												type="text" class="form-control stu" id="stuAct" name="stuAct" readonly />
										</div>
									</div>
									<div class="row mt-4 mb-2">
										<div class="col-3">
											<label for="stuZip" class="form-label">우편번호</label>
											<div class="input-group">
												<input type="text" class="form-control stu" id="stuZip" name="stuZip" readonly />
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
											<label for="stuAddr1" class="form-label">기본주소</label> <input
												type="text" class="form-control stu" id="stuAddr1" name="stuAddr1" readonly />
										</div>
										<div class="col-6">
											<label for="stuAddr2" class="form-label">상세주소</label> <input
												type="text" class="form-control stu" id="stuAddr2" name="stuAddr2" readonly />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div id="stuBtn1" align="right" style="display:none" >
						<button type="button" class="btn btn-outline-warning" id="edit" >수정</button>
						<button type="button" id="delete" class="btn btn-outline-danger">삭제</button>
					</div>
					<div id="stuBtn2" align="right" style="display: none">
						<button type="button" id="updateStu" class="btn btn-outline-success">확인</button>
						<button type="button" id="cancel" class="btn btn-outline-danger">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>