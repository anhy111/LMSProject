<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
function fn_add(data){
	
	$("#lecaCd").attr("value", data.lecaCd);
	$("#proNo").attr("value", data.proNo);
	$("#empNm").attr("value", data.empNm);
	$("#lecaNm").attr("value", data.lecaNm);
	$("#lecaCate").attr("value", data.lecaCate);
	$("#lecHcnt").attr("value", data.lecHcnt);
	$("#evlScore").attr("value", data.evlScore);
	$("#lecaSem").attr("value", data.lecaYr + "년 " + data.lecaSem);
	$("#count").attr("value", data.count);
	
}

$(function(){
	
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";
	
	$(".btnDetail").on("click", function(){
		
		let lecaCd = $(this).val()
		console.log(lecaCd + " 임미둥");
		let data = {"lecaCd":lecaCd}
		
		$.ajax({
			type:'post',
			url:'/manage/evaluationCon',
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			beforeSend:function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success :function(data){
				console.log("성공이라해주라 ", data.evlEtcList);
				fn_add(data);
				
				let str = "";
				
				for(let i=0; i < data.evlEtcList.length; i++){
					console.log("오라고 제발 ㅠ  " + data.evlEtcList[i] )
					
					str += `
					<tr>
						<td>\${i+1}</td>
						<td>\${data.evlEtcList[i]}</td>
					</tr>
					`
				}
				
				$("#list").html(str);
				
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
				<h3 class="card-title">교수 평가 조회</h3>
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
										aria-label="Browser: activate to sort column ascending">강의번호</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Platform(s): activate to sort column ascending">강의명</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Browser: activate to sort column ascending">단과대명</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Browser: activate to sort column ascending">학과명</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Engine version: activate to sort column ascending">담당교수</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Engine version: activate to sort column ascending">이수구분</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Engine version: activate to sort column ascending">평가점수</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="CSS grade: activate to sort column ascending">상세</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="evaluationList" items="${evaluationList}" varStatus="stat">
									<td class="dtr-control sorting_1" tabindex="0" style="text-align:center;">${stat.count}</td>
									<td>${evaluationList.lecaCd}</td>
									<td>${evaluationList.lecaNm}</td>
									<td>${evaluationList.colNm}</td>
									<td>${evaluationList.depNm}</td>
									<td>${evaluationList.empNm}</td>
									<td>${evaluationList.lecaCate}</td>
									<td>${evaluationList.evlScore}</td>
									<td>
										<button class="btn btn-block btn-outline-info btn-sm btnDetail" 
											value="${evaluationList.lecaCd}" data-toggle="modal" data-target="#modal-xl">상세</button>
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

<!-- 모달 -->
<!-- 상세정보확인 -->
<div class="modal fade" id="modal-xl" style="display:none;" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">교수 평가 상세</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="col-md-11 offset-1">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
								<div class="container">
									<div class="row mt-1 mb-2">
										<div class="col-3">
											<label for="lecaNm" class="form-label">강의명</label> 
											<input type="text" class="form-control stu" id="lecaNm"
												name="lecaNm" readonly />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-3">
											<label for="lecaCd" class="form-label">강의코드</label> 
											<input type="text" class="form-control stu" id="lecaCd"
												name="lecaCd" readonly />
										</div>
										<div class="col-3 offset-1">
											<label for="proNo" class="form-label">교번</label> 
											<input type="text" class="form-control stu" id="proNo"
												name="proNo" readonly />
										</div>
										<div class="col-3 offset-1">
											<label for="empNm" class="form-label">교수명</label> 
											<input type="text" class="form-control stu" id="empNm"
												name="empNm" readonly />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-3">
											<label for="lecaSem" class="form-label">개설연도/학기</label> 
											<input type="text" class="form-control stu" id="lecaSem"
												name="lecaSem" readonly />
										</div>
										<div class="col-3 offset-1">
											<label for="lecaCate" class="form-label">이수구분</label> 
											<input type="text" class="form-control stu" id="lecaCate"
												name="lecaCate" readonly />
										</div>
										<div class="col-3 offset-1">
											<label for="lecHcnt" class="form-label">수강생 수</label> 
											<input type="text" class="form-control stu" id="lecHcnt"
												name="lecHcnt" readonly />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-3">
											<label for="count" class="form-label">응답자 수</label> 
											<input type="text" class="form-control stu" id="count"
												name="count" readonly />
										</div>
										<div class="col-3 offset-1">
											<label for="recYn" class="form-label">응답 비율</label> 
											<input type="text" class="form-control stu" id="recYn"
												name="recYn" readonly />
										</div>
										<div class="col-3 offset-1">
											<label for="evlScore" class="form-label">평가 점수</label> 
											<input type="text" class="form-control stu" id="evlScore"
												name="evlScore" readonly />
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row mt-5">
							<div class="col-11">
								<div class="card">
									<div class="card-body table-responsive p-0" style="height: 300px;">
										<table class="table table-head-fixed text-nowrap">
											<thead>
												<tr>
													<th>no</th>
													<th>평가 내용</th>
												</tr>
											</thead>
											<tbody id="list">
												
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
