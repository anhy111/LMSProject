<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function(){
	
	$(".btnDetail").on("click", function(){
// 		alert("오나요?");
		
		let header = "${_csrf.headerName}";
		let token = "${_csrf.token}";
		let detailStu = $(this).val();
		let data = {"detailStu":detailStu}
		console.log("상세정보 가져왓 " + detailStu + " data 가져왓 " + JSON.stringify(data));
		
		
		$.ajax({
			type: 'post',
			url: '/manage/detailStu',
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			beforeSend:function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success :function(data){
				console.log("성공이라해주라 ", data.stuPic);
				
				$("#stuPic").attr("src", "/resources/upload/img/"+data.stuPic);
				$("#stuNo").attr("value", data.stuNo);
				$("#stuNm").attr("value", data.stuNm);
				$("#colNm").attr("value", data.colNm);
				$("#depNm").attr("value", data.depNm);
				$("#stuYr").attr("value", data.stuYr);
				$("#stuSem").attr("value", data.stuSem);
				$("#stuBir").attr("value", data.stuBir);
				$("#stuTel").attr("value", data.stuTel);
				$("#stuBankCd").attr("value", data.stuBankCd);
				$("#stuTel").attr("value", data.stuTel);
				$("#stuDepo").attr("value", data.stuDepo);
				$("#stuAct").attr("value", data.stuAct);
				$("#stuZip").attr("value", data.stuZip);
				$("#stuAddr1").attr("value", data.stuAddr1);
				$("#stuAddr2").attr("value", data.stuAddr2);
				
				
			},
			error:function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
		
	});
	
	
});


</script>
<div class="row" style="margin-right:0px;">
	<div class="col-sm-7">
		<div class="card col-sm-11 offset-1">
			<div class="card-header">
				<h3 class="card-title">학생 목록 조회</h3>
			</div>
		
			<div class="card-body">
				<div id="example1_wrapper">
				</div>
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
										aria-label="Engine version: activate to sort column ascending">단과대학</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Engine version: activate to sort column ascending">학과</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="CSS grade: activate to sort column ascending">담당교수</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="CSS grade: activate to sort column ascending">상세</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${list}" varStatus="stat">
									<td class="dtr-control sorting_1" tabindex="0" style="text-align:center;">${stat.count}</td>
									<td class="detailStu">${list.stuNo}</td>
									<td>
										<div class="image">
											<img src="/resources/upload/img/${list.stuPic}" class="img-circle" alt="User Image" style="max-width:20px;">
											${list.stuNm}
										</div> 
									</td>
									<td>${list.colNm}</td>
									<td>${list.depNm}</td>
									<td>${list.empNm}</td>
									<td><button class="btn btn-block btn-outline-info btn-sm btnDetail" value="${list.stuNo}">상세</button></td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<th rowspan="1" colspan="1">번호</th>
									<th rowspan="1" colspan="1">학번</th>
									<th rowspan="1" colspan="1">이름</th>
									<th rowspan="1" colspan="1">단과대학</th>
									<th rowspan="1" colspan="1">학과</th>
									<th rowspan="1" colspan="1">담당교수</th>
									<th rowspan="1" colspan="1">상세</th>
								</tr>
							</tfoot>
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
					<h3 class="card-title">학생 상세 정보</h3>
				</div>
				<div class="card-body">
					<form action="/mypage/stuUpdate" method="post">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-4">
									<img
										class="img-thumbnail" width="200px;" height="300px;" id="stuPic">
								</div>
								<div class="col-md-8">
									<div class="container">
										<div class="row mt-1 mb-2">
											<div class="col-4 offset-1">
												<label for="memNo" class="form-label">학번</label> 
												<input
													type="text" class="form-control" id="stuNo" name="stuNo" readonly />
											</div>
											<div class="col-4 offset-1">
												<label for="memNm" class="form-label">이름</label> <input
													type="text" class="form-control" id="stuNm" name="stuNm" readonly />
											</div>
										</div>
										<div class="row mb-2">
											<div class="col-4 offset-1">
												<label for="colNm" class="form-label">단과대학</label> <input
													type="text" class="form-control" id="colNm" name="colNm" readonly />
											</div>
											<div class="col-4 offset-1">
												<label for="depNm" class="form-label">학과</label> <input
													type="text" class="form-control" id="depNm" name="depNm" readonly />
											</div>
										</div>
										<div class="row mb-2">
											<div class="col-4 offset-1">
												<label for="stuYr" class="form-label">학년</label> <input
													type="text" class="form-control" id="stuYr" name="stuYr" readonly />
											</div>
											<div class="col-4 offset-1">
												<label for="stuSem" class="form-label">재학학기</label> <input
													type="text" class="form-control" id="stuSem" name="stuSem" readonly />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row mt-5 mb-2">
							<div class="col-4 offset-1">
								<label for="stuBir" class="form-label">생년월일</label> <input
									type="text" class="form-control" id="stuBir" name="stuBir" readonly />
							</div>
							<div class="col-4 offset-1">
								<label for="stuTel" class="form-label">전화번호</label> <input
									type="text" class="form-control" id="stuTel" name="stuTel" readonly />
							</div>
						</div>
						<div class="row mt-4 mb-2">
							<div class="col-3">
								<div class="form-group">
									<label>은행</label> <select class="form-control" id="stuBankCd"
										name="stuBankCd" readonly>
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
								<label for="stuDepo" class="form-label">예금주</label> <input
									type="text" class="form-control" id="stuDepo" name="stuDepo" readonly />
							</div>
							<div class="col-3 offset-1">
								<label for="stuAct" class="form-label">계좌번호</label> <input
									type="text" class="form-control" id="stuAct" name="stuAct" readonly />
							</div>
						</div>
						<div class="row mt-4 mb-2">
							<div class="col-3">
								<label for="stuZip" class="form-label">우편번호</label>
								<div class="input-group">
									<input type="text" class="form-control" id="stuZip" name="stuZip" readonly />
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
									type="text" class="form-control" id="stuAddr1" name="stuAddr1" readonly />
							</div>
							<div class="col-6">
								<label for="stuAddr2" class="form-label">상세주소</label> <input
									type="text" class="form-control" id="stuAddr2" name="stuAddr2" readonly />
							</div>
						</div>
						<div class="col-12" align="right">
							<button type="submit" class="btn btn-outline-warning">수정</button>
						</div>
						<sec:csrfInput />
					</form>
				</div>
			</div>
		</div>


	</div>
</div>

