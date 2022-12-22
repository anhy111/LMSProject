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
	$('#colCd').val(data.colNm);
	$('#department').val(data.depNm);
	$('#stuYr').val(data.stuYr);
	$('#stuSem').val(data.stuSem);
	$("#stuBir").attr("value", data.stuBir);
	//id로 select 선택하고 value가 'test2'인 option 선택
	$("#stuTel").attr("value", data.stuTel);
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
		
		let stuNo = $(this).val();
		let data = {"detailStu":stuNo}
		console.log("상세정보 가져왓 " + stuNo + " data 가져왓 " + JSON.stringify(data));
		
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
										aria-label="CSS grade: activate to sort column ascending">담당교수</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										aria-label="CSS grade: activate to sort column ascending">상세</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${list}" varStatus="stat">
									<tr>
									<td class="dtr-control sorting_1" tabindex="0">${stat.count}</td>
									<td class="detailStu">${list.stuNo}</td>
									<td>
										<div class="image">
											<img src="/upload${list.stuPic}" class="img-circle" alt="User Image" style="max-width:20px;">
											${list.stuNm}
										</div> 
									</td>
									<td>${list.empNm}</td>
									<td>
										<button class="btn btn-block btn-outline-info btn-sm btnDetail" 
											value="${list.stuNo}" data-toggle="modal" data-target="#modal-lg" >상세</button>
									</td>
									</tr>
								</c:forEach>
							</tbody>
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
				<div class="col-sm-10 offset-1">
					<div class="container-fluid">
						<div class="row">
							<div class="col-4 offset-1">
								<img class="img-thumbnail" width="180px;" height="250px;" id="stuImg">
							</div>
							<div class="col-6 offset-1">
								<div class="container">
									<div class="row mt-1 mb-2">
										<div class="col-10">
											<label for="stuNo" class="form-label">학번</label> 
											<input type="text" class="form-control" id="stuNo" name="stuNo" readonly />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-10">
											<label for="stuNm" class="form-label">이름</label> 
											<input type="text" class="form-control stu" id="stuNm" name="stuNm" readonly />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-10">
											<label for="stuNme" class="form-label">영문 이름</label> 
											<input type="text" class="form-control stu" id="stuNme" name="stuNme" readonly />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-3 mb-2">
						<div class="col-6">
							<label>학년</label> 
							<input type="text" class="form-control stu" id="stuYr" name="stuYr" readonly />
						</div>
						<div class="col-6">
							<label>학기</label> 
							<input type="text" class="form-control stu" id="stuSem" name="stuSem" readonly />
						</div>
					</div>
					<div class="row mt-3 mb-2">
						<div class="form-group col-6">
							<label for="colCd" class="form-label">단과대학</label>
							<input type="text" class="form-control stu" id="colCd" name="colCd" readonly />
						</div>
						<div class="col-6">
							<label for="department" class="form-label">학과</label> 
							<input type="text" class="form-control stu" id="department" name="depCd" readonly />
						</div>
					</div>
					<div class="row mt-3 mb-2">
						<div class="col-6">
							<label for="stuBir" class="form-label">생년월일</label> 
							<input type="text" class="form-control stu" id="stuBir" name="stuBir" readonly />
						</div>
						<div class="col-6">
							<label for="stuTel" class="form-label">전화번호</label> 
							<input type="text" class="form-control stu" id="stuTel" name="stuTel" readonly />
						</div>
					</div>
					<div class="row mt-4 mb-2">
						<div class="col-5">
							<label for="stuZip" class="form-label">우편번호</label>
							<input type="text" class="form-control stu" id="stuZip" name="stuZip" readonly />
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-6">
							<label for="stuAddr1" class="form-label">기본주소</label> 
							<input type="text" class="form-control stu" id="stuAddr1" name="stuAddr1" readonly />
						</div>
						<div class="col-6">
							<label for="stuAddr2" class="form-label">상세주소</label> 
							<input type="text" class="form-control stu" id="stuAddr2" name="stuAddr2" readonly />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
