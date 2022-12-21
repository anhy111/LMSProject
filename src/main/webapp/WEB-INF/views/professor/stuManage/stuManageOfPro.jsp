<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
function fn_add(data){
	
	$("#stuImg").attr("src", "/upload"+data.stuPic);
	$("#stuNo").attr("value", data.stuNo);
	$("#stuNm").attr("value", data.stuNm);
	$("#stuNme").attr("value", data.stuNme);
	$('#colCd').val(data.colCd).prop("selected",true).trigger('change');
	$('#department').val(data.depCd).prop("selected",true);
	$('#stuYr').val(data.stuYr).prop("selected",true);
	$('#stuSem').val(data.stuSem).prop("selected",true);
	$("#stuBir").attr("value", data.stuBir);
	$("#stuTel").attr("value", data.stuTel);
	//id로 select 선택하고 value가 'test2'인 option 선택
	$('#stuBankCd').val(data.stuBankCd).prop("selected",true);
	$("#stuTel").attr("value", data.stuTel);
	$("#stuDepo").attr("value", data.stuDepo);
	$("#stuAct").attr("value", data.stuAct);
	$("#stuZip").attr("value", data.stuZip);
	$("#stuAddr1").attr("value", data.stuAddr1);
	$("#stuAddr2").attr("value", data.stuAddr2);
// 	$("#pic").html(data.stuPic)
	
}

$(function(){
	
	$("input[type='file']").on('change',function(){
	    $(this).next('.custom-file-label').html(event.target.files[0].name);
	});
	
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";
	
	$(".btnDetail").on("click", function(){
// 		alert("오나요?");
		
		let detailStu = $(this).val();
		let data = {"detailStu":detailStu}
		console.log("상세정보 가져왓 " + detailStu + " data 가져왓 " + JSON.stringify(data));
		
		$("#stuBtn1").css("display", "block");
		$("#stuBtn2").css("display", "none");
		
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
				
				$("#stuBtn1").css("display", "block");
				
				fn_add(data);
				
			},
			error:function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
		
	});
	
});


</script>
<div class="row">
	<div class="col-sm-10 offset-1">
		<div class="card">
			<div class="card-header">
				<h3 class="card-title">학생 목록 조회</h3>
			</div>
		
			<div class="card-body">
				<div id="example1_wrapper">
				</div>
				<div class="row">
					<div class="col-sm-12">
						<table id="example1"
							class="table table-bordered table-striped dataTable dtr-inline table-sm text-center"
							aria-describedby="example1_info">
							<thead>
								<tr>
									<th class="sorting sorting_asc" tabindex="0"
										aria-controls="example1"
										aria-sort="ascending"
										aria-label="Rendering engine: activate to sort column descending">번호</th>
									<th class="sorting" tabindex="0" aria-controls="example1" 
										aria-label="Browser: activate to sort column ascending">학번</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										aria-label="Platform(s): activate to sort column ascending">이름</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										aria-label="Engine version: activate to sort column ascending">단과대학</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										aria-label="Engine version: activate to sort column ascending">학과</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										aria-label="CSS grade: activate to sort column ascending">담당교수</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										aria-label="CSS grade: activate to sort column ascending">상세</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${list}" varStatus="stat">
									<td class="dtr-control sorting_1" tabindex="0">${stat.count}</td>
									<td class="detailStu">${list.stuNo}</td>
									<td>
										<div class="image">
											<img src="/upload${list.stuPic}" class="img-circle" alt="User Image" style="max-width:20px;">
											${list.stuNm}
										</div> 
									</td>
									<td>${list.colNm}</td>
									<td>${list.depNm}</td>
									<td>${list.empNm}</td>
									<td>
										<button class="btn btn-block btn-outline-info btn-sm btnDetail" 
											value="${list.stuNo}" data-toggle="modal" data-target="#modal-lg" >상세</button>
									</td>
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
</div>

<div class="modal fade" id="modal-lg" style="display: none;"aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">학생 상세 정보</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="col-sm-12">
					<div class="col-md-11">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-4">
									<img class="img-thumbnail" width="200px;" height="300px;"
										id="stuImg">
								</div>
								<div class="col-md-8">
									<div class="container">
										<div class="row mt-1 mb-2">
											<div class="col-5 offset-1">
												<label for="stuNo" class="form-label">학번</label> <input
													type="text" class="form-control" id="stuNo" name="stuNo"
													readonly />
											</div>
										</div>
										<div class="row mb-2">
											<div class="col-5 offset-1">
												<label for="stuNm" class="form-label">이름</label> <input
													type="text" class="form-control stu" id="stuNm"
													name="stuNm" readonly />
											</div>
											<div class="col-5 offset-1">
												<label for="stuNme" class="form-label">영문 이름</label> <input
													type="text" class="form-control stu" id="stuNme"
													name="stuNme" readonly />
											</div>
										</div>
										<div class="row mb-2">
											<div class="col-5 offset-1">
												<label for="stuPic" class="form-label">사진 변경</label>
											</div>
										</div>
										<div class="row">
											<div class="custom-file col-9 offset-1">
												<input type="file" class="custom-file-input stu"
													id="stuPic" name="stuPic" disabled> <label
													class="custom-file-label" for="stuPic">Choose
													file</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row mt-3 mb-2">
							<div class="col-4 offset-1">
								<label>학년</label> <select class="form-control stu" id="stuYr"
									name="stuYr" disabled>
									<option value="1">1학년</option>
									<option value="2">2학년</option>
									<option value="3">3학년</option>
									<option value="4">4학년</option>
									<option value="5">5학년</option>
									<option value="6">6학년</option>
								</select>
							</div>
							<div class="col-4 offset-1">
								<label>학기</label> <select class="form-control stu" id="stuSem"
									name="stuSem" disabled>
									<option value="1">1학기</option>
									<option value="2">2학기</option>
								</select>
							</div>
						</div>
						<div class="row mt-3 mb-2">
							<div class="form-group col-4 offset-1">
								<label for="colCd" class="form-label">단과대학</label> <select
									id="colCd" class="form-control stu" disabled>
									<option value="0">단과대학</option>
									<c:forEach var="college" items="${collegeList}">
										<option value="${college.colCd}">${college.colNm}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-4 offset-1">
								<label for="department" class="form-label">학과</label> <select
									id="department" class="form-control stu" disabled>
									<option value="">학과</option>
								</select>

							</div>
						</div>
						<div class="row mt-3 mb-2">
							<div class="col-4 offset-1">
								<label for="stuBir" class="form-label">생년월일</label> <input
									type="text" class="form-control stu" id="stuBir"
									name="stuBir" readonly />
							</div>
							<div class="col-4 offset-1">
								<label for="stuTel" class="form-label">전화번호</label> <input
									type="text" class="form-control stu" id="stuTel"
									name="stuTel" readonly />
							</div>
						</div>
						<div class="row mt-4 mb-2">
							<div class="col-4">
								<div class="form-group">
									<label>은행</label> <select class="form-control stu"
										id="stuBankCd" name="stuBankCd" disabled>
										<c:forEach var="detail" items="#{commonDetailList}">
											<option value="${detail.comdCd}">${detail.comdNm}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-3 offset-1">
								<label for="stuDepo" class="form-label">예금주</label> <input
									type="text" class="form-control stu" id="stuDepo"
									name="stuDepo" readonly />
							</div>
							<div class="col-3 offset-1">
								<label for="stuAct" class="form-label">계좌번호</label> <input
									type="text" class="form-control stu" id="stuAct"
									name="stuAct" readonly />
							</div>
						</div>
						<div class="row mt-4 mb-2">
							<div class="col-3">
								<label for="stuZip" class="form-label">우편번호</label>
								<div class="input-group">
									<input type="text" class="form-control stu" id="stuZip"
										name="stuZip" readonly />
									<div class="input-group-append">
										<button type="button" class="btn btn-default"
											id="btnZipCode">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="row mb-2">
							<div class="col-6" style="">
								<label for="stuAddr1" class="form-label">기본주소</label> <input
									type="text" class="form-control stu" id="stuAddr1"
									name="stuAddr1" readonly />
							</div>
							<div class="col-6">
								<label for="stuAddr2" class="form-label">상세주소</label> <input
									type="text" class="form-control stu" id="stuAddr2"
									name="stuAddr2" readonly />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
