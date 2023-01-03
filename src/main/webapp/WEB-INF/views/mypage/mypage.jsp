<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<% String no = String.valueOf(session.getAttribute("no")); %>
<script type="text/javascript">
$(function(){
	$("#btnZipCode").on("click",function(){
// 		alert("하이루");
		new daum.Postcode({
			oncomplete:function(data){
				$("input[name='stuZip']").val(data.zonecode); // 우편번호 5자리
				$("input[name='stuAddr1']").val(data.address); // 주소
				$("input[name='stuAddr2']").val(data.buildingName); // 상세 주소
			}
		}).open();
	});
});

function onSubmit(){
	Swal.fire(
            '수정 완료',
            '정상적으로 수정 되었습니다.',
            'success'
        ).then(function(){
			$("#mysub").submit();
    });
	
	
}
</script>
<script type="text/javascript">
$(function(){
	
	let $newPw = $("#newPw");
	let $newPwCheck = $("#newPwCheck");
	let $oldPw = $("#oldPw");
	let $stuNo = $("#stuNo");
	
	$("#newPwCheck").on("keyup", function() {
// 		alert("오나요??");
		
		console.log("newPw : " + newPw );
		
		if($newPw.val() == $newPwCheck.val()){
			$("#alertPw").text("비밀번호가 일치합니다.").css("color","green");
			$("#changePw").removeAttr("disabled");
			
		}else{
			$("#alertPw").text("비밀번호가 일치하지 않습니다.").css("color","red");
			$("#changePw").attr("disabled", true);
		}
		
	});
	
	$("#changePw").on("click", function(){
// 		alert("오나요??");
		
		console.log("newPw : " + $newPw.val());
		
		let data = {"oldPw": $oldPw.val(), "newPw":$newPw.val(), "stuNo":$stuNo.val() }
		let header = "${_csrf.headerName}";
		let token = "${_csrf.token}";
		
		console.log("data : " + JSON.stringify(data));
		
		$.ajax({
			type: 'post',
			url: '/mypage/changeStuPwPost',
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			beforeSend:function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success :function(data){
				console.log("성공이라해주라 " + data);
				if(data > 0){
			        Swal.fire({
			            icon: 'success',                         // Alert 타입
			            title: '변경 성공!',         // Alert 제목
			            text: '비밀번호가 정상적으로 변경되었습니다.',  // Alert 내용
			        }).then(function(){
			        	window.location.reload(true);			        	
			        });
			        
			        
				}else{
					Swal.fire({
			            icon: 'error',                         // Alert 타입
			            title: '변경 실패',         // Alert 제목
			            text: '비밀번호를 다시 한번 확인해주세요.',  // Alert 내용
			        });
					
					$oldPw.val("");
					$oldPw.focus();
					
				}
				
			},
			error:function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		
	});
	
	
});

google.charts.load("current", {packages:["corechart"]});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
  var data = google.visualization.arrayToDataTable([
    ['Task', 'Hours per Day'],
    ['Work',     11],
    ['Eat',      2],
    ['Commute',  2],
    ['Watch TV', 2],
    ['Sleep',    7]
  ]);

  var options = {
    title: '나의 전체 성적',
    pieHole: 0.4,
    width:600,
    height:600
  };

  var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
  chart.draw(data, options);
}

</script>

<style>
	.mycard {
		padding: 0px;
		border-radius: 0.25rem;
		min-width: 0px;
		text-align: left;
	}
</style>

<div class="mt-4">
	<ul class="nav nav-tabs" id="custom-content-below-tab" role="tablist">
		<li class="nav-item">
			<a class="nav-link active"
			id="custom-content-below-home-tab" data-toggle="pill"
			href="#custom-content-below-home" role="tab"
			aria-controls="custom-content-below-home" aria-selected="true">내 정보</a>
		</li>
		<li class="nav-item">
			<a class="nav-link"
			id="custom-content-below-profile-tab" data-toggle="pill"
			href="#custom-content-below-profile" role="tab"
			aria-controls="custom-content-below-profile" aria-selected="false">학사 정보</a>
		</li>
		<li class="nav-item">
			<a class="nav-link"
			id="custom-content-below-messages-tab" data-toggle="pill"
			href="#custom-content-below-messages" role="tab"
			aria-controls="custom-content-below-messages" aria-selected="false">비밀번호 변경</a>
		</li>
	</ul>
	<div class="tab-content" id="custom-content-below-tabContent">
		<div class="tab-pane fade active show" id="custom-content-below-home"
				role="tabpanel" aria-labelledby="custom-content-below-home-tab">
			<div style="margin-top:20px;">
				<form action="/mypage/stuUpdate" method="post" id="mysub">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-2 mt-4">
								<img src="/upload${student.stuPic}"
									class="img-thumbnail" alt="User Image">
							</div>
							<div class="col-md-10">
								<div class="container">
									<div class="row mt-1 mb-2">
										<div class="col-3">
											<label for="memNo" class="form-label">학번</label> 
											<input type="text" class="form-control" id="memNo" name="stuNo" value="${student.stuNo}" readonly />
										</div>
										<div class="col-3">
											<label for="memNm" class="form-label">이름</label> 
											<input type="text" class="form-control" id="memNm" name="stuNm" value="${student.stuNm}" readonly />
										</div>
										<div class="col-3">
											<label for="stuBir" class="form-label">생년월일</label> <input
												type="text" class="form-control" id="stuBir" name="stuBir"
												value="${student.stuBir}" readonly />
										</div>
										<div class="col-3">
											<label for="stuTel" class="form-label">전화번호</label> <input
												type="text" class="form-control" id="stuTel" name="stuTel"
												value="${student.stuTel}" readonly />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-3">
											<label for="colNm" class="form-label">단과대학</label> <input
												type="text" class="form-control" id="colNm" name="colNm" value="${student.colNm}" readonly />
										</div>
										<div class="col-3">
											<label for="depNm" class="form-label">학과</label> <input
												type="text" class="form-control" id="depNm" name="depNm" value="${student.depNm}" readonly />
										</div>
										<div class="col-3">
											<label for="stuYr" class="form-label">학년</label> <input
												type="text" class="form-control" id="stuYr" name="stuYr" value="${student.stuYr}" readonly />
										</div>
										<div class="col-3">
											<label for="stuSem" class="form-label">재학학기</label> <input
												type="text" class="form-control" id="stuSem" name="stuSem" value="${student.stuSem}" readonly />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-3">
											<div class="form-group">
												<label>은행</label> 
												<select class="form-control" id="stuBankCd" name="stuBankCd">
													<option><c:out value="${student.stuBankCd}"></c:out></option>
													<option value="BANK003">KEB하나은행</option>
													<option value="BANK004">SC제일은행</option>
													<option value="BANK005">국민은행</option>
													<option value="BANK006">신한은행</option>
													<option value="BANK002">신협은행</option>
													<option value="BANK007">한국시티은행</option>
													<option value="BANK008">기업은행</option>
													<option value="BANK001">농협</option>
												</select>
											</div>
										</div>
				
										<div class="col-3 offset-1">
											<label for="stuDepo" class="form-label">예금주</label> 
											<input type="text" class="form-control" id="stuDepo" name="stuDepo"
												value="${student.stuDepo}" readonly />
										</div>
										<div class="col-3 offset-1">
											<label for="stuAct" class="form-label">계좌번호</label> 
											<input type="text" class="form-control" id="stuAct" name="stuAct"
												value="${student.stuAct}" required />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-3">
											<label for="stuZip" class="form-label">우편번호</label>
											<div class="input-group">
												<input type="text" class="form-control" placeholder="우편번호 검색"
													value="${student.stuZip}" name="stuZip" readonly />
												<div class="input-group-append">
													<button type="button" class="btn btn-default" id="btnZipCode">
														<i class="fa fa-search"></i>
													</button>
												</div>
											</div>
										</div>
										<div class="col-4 offset-1">
											<label for="stuAddr1" class="form-label">기본주소</label> <input
												type="text" class="form-control" id="stuAddr1" name="stuAddr1"
												value="${student.stuAddr1}" required />
										</div>
										<div class="col-4">
											<label for="stuAddr2" class="form-label">상세주소</label> <input
												type="text" class="form-control" id="stuAddr2" name="stuAddr2"
												value="${student.stuAddr2}" required />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 mt-5" align="right">
						<button type="button" onclick="onSubmit()" class="btn btn-outline-warning">수정</button>
					</div>
					<sec:csrfInput/>
				</form>
			</div>
		</div>
		<div class="tab-pane fade" id="custom-content-below-profile" role="tabpanel" aria-labelledby="custom-content-below-profile-tab">
			<div class="row m-3">
				<div class="card collapsed-card mycard col-6">
					<div class="card-header">
						<h3 class="card-title">나의 장학 내역</h3>
						<div class="card-tools">
							<button type="button" class="btn btn-tool"
								data-card-widget="collapse">
								<i class="fas fa-plus"></i>
							</button>
						</div>
					</div>

					<div class="card-body table-responsive p-0" style="height: 230px;">
						<table class="table table-head-fixed text-nowrap">
							<thead>
								<tr>
									<th>no</th>
									<th>장학금 명</th>
									<th>수혜학기</th>
									<th>지급액</th>
									<th>추천인</th>
								</tr>
							</thead>
							<tbody id="sclList">
								<c:forEach var="list" items="${mySclList}" varStatus="stat">
									<tr>
										<td>${stat.count}</td>
										<td>${list.sclNm}</td>
										<td>${list.sclhYr}년 >${list.sclhSem}학기</td>
										<td>${list.sclhAmt}</td>
										<td>${list.empNm}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-6">
				</div>
				<div class="card collapsed-card mycard col-6">
					<div class="card-header">
						<h3 class="card-title">나의 상담 내역</h3>
						<div class="card-tools">
							<button type="button" class="btn btn-tool" data-card-widget="collapse">
								<i class="fas fa-plus"></i>
							</button>
						</div>
					</div>

					<div class="card-body table-responsive p-0" style="height: 230px;">
						<table class="table table-head-fixed text-nowrap">
							<thead>
								<tr>
									<th>no</th>
									<th>상담구분</th>
									<th>상담제목</th>
									<th>상담일자</th>
									<th>답변자</th>
								</tr>
							</thead>
							<tbody id="sclList">
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-6"></div>
			</div>
			<div class="row">
				<div id="donutchart" style="width: 900px; height: 500px;"></div>
			</div>
		</div>
		
		<div class="tab-pane fade" id="custom-content-below-messages"
			role="tabpanel" aria-labelledby="custom-content-below-messages-tab">
			<div class="row mt-5 mb-2">
				<div class="col-4 offset-4">
					<input type="hidden" id="stuNo" value="<%=no%>" /> <label
						for="oldPw" class="form-label">현재 비밀번호</label> <input
						type="password" class="form-control" id="oldPw" name="oldPw"
						required />
				</div>
			</div>
			<div class="row mt-3 mb-2">
				<div class="col-4 offset-4">
					<label for="newPw" class="form-label">새 비밀번호</label> <input
						type="password" class="form-control" id="newPw" name="newPw"
						required />
				</div>
			</div>
			<div class="row mt-3 mb-2">
				<div class="col-4 offset-4">
					<label for="newPwCheck" class="form-label">새 비밀번호 확인</label> <input
						type="password" class="form-control" id="newPwCheck"
						name="newPwCheck" required /> <span id="alertPw"></span>
				</div>
			</div>
			<div class="row mt-4 mb-2">
				<div class="col-4 offset-4">
					<button type="button" class="btn btn-block btn-outline-warning"
						id="changePw" disabled>확인</button>
				</div>
			</div>
		</div>
	</div>
</div>
