<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%
	String no = String.valueOf(session.getAttribute("no"));
%>
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
	$("#lecaSem").attr("value", data.lecaYr + "년 " + data.lecaSem +"학기");
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
<style>
	.mycard {
		padding: 0px;
		border-radius: 0.25rem;
		min-width: 0px;
		text-align: left;
	}
</style>

<div class="row">
	<div class="alert alert-light col" role="alert">
		<!-- 게시판 안내사항 -->
		<p>
			<strong>
			학생들이 평가한 강의 내역을 확인하실 수 있습니다.
			</strong>
		</p>
	</div>
</div>

<div class="row">
	<div class="col-sm-12">
		<table class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
			<thead>
				<tr class="text-center">
					<th width="1%">No</th>
					<th width="10%">강의번호</th>
					<th width="10%">강의명</th>
					<th width="10%">개설연도/학기</th>
					<th width="10%">이수구분</th>
					<th width="10%">평가점수</th>
					<th width="10%">상세</th>
				</tr>
			</thead>
			<tbody class="text-center">
				<c:forEach var="mineEvlList" items="${mineEvlList}" varStatus="stat">
					<tr>
						<td>${stat.count}</td>
						<td>${mineEvlList.lecaCd}</td>
						<td>${mineEvlList.lecaNm}</td>
						<td>${mineEvlList.lecaYr}년 ${mineEvlList.lecaSem}학기</td>
						<td>${mineEvlList.lecaCate}</td>
						<td>${mineEvlList.evlScore}</td>
						<td>
							<button class="btn btn-block btn-outline-secondary btn-sm btnDetail" 
								value="${mineEvlList.lecaCd}" data-toggle="modal" data-target="#modal-lg">상세</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<!-- 모달 -->
<!-- 상세정보확인 -->
<div class="modal fade" id="modal-lg" style="display:none;" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">강의 평가 상세</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="col-md-12">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
								<div class="container">
									<div class="row mt-1 mb-2">
										<div class="col-4">
											<label for="lecaNm" class="form-label">강의명</label> 
											<input type="text" class="form-control stu" id="lecaNm" name="lecaNm" readonly />
										</div>
										<div class="col-4">
											<label for="evlScore" class="form-label">평가 점수</label> 
											<input type="text" class="form-control stu" id="evlScore" name="evlScore" readonly />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-4">
											<label for="lecaCd" class="form-label">강의코드</label> 
											<input type="text" class="form-control stu" id="lecaCd"
												name="lecaCd" readonly />
										</div>
										<div class="col-4">
											<label for="proNo" class="form-label">교번</label> 
											<input type="text" class="form-control stu" id="proNo"
												name="proNo" readonly />
										</div>
										<div class="col-4">
											<label for="empNm" class="form-label">교수명</label> 
											<input type="text" class="form-control stu" id="empNm"
												name="empNm" readonly />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-4">
											<label for="lecaSem" class="form-label">개설연도/학기</label> 
											<input type="text" class="form-control stu" id="lecaSem"
												name="lecaSem" readonly />
										</div>
										<div class="col-4">
											<label for="lecaCate" class="form-label">이수구분</label> 
											<input type="text" class="form-control stu" id="lecaCate"
												name="lecaCate" readonly />
										</div>
										<div class="col-4">
											<label for="lecHcnt" class="form-label">수강생 수</label> 
											<input type="text" class="form-control stu" id="lecHcnt"
												name="lecHcnt" readonly />
										</div>
									</div>
<!-- 									<div class="row mb-2"> -->
<!-- 										<div class="col-4"> -->
<!-- 											<label for="count" class="form-label">응답자 수</label>  -->
<!-- 											<input type="text" class="form-control stu" id="count" -->
<!-- 												name="count" readonly /> -->
<!-- 										</div> -->
<!-- 										<div class="col-4"> -->
<!-- 											<label for="recYn" class="form-label">응답 비율</label>  -->
<!-- 											<input type="text" class="form-control stu" id="recYn" -->
<!-- 												name="recYn" readonly /> -->
<!-- 										</div> -->
<!-- 									</div> -->
								</div>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-12">
								<div class="card mycard">
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
