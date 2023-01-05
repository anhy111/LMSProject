<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				$("input[name='empZip']").val(data.zonecode); // 우편번호 5자리
				$("input[name='empAddr1']").val(data.address); // 주소
				$("input[name='empAddr2']").val(data.buildingName); // 상세 주소
			}
		}).open();
	});
	
	let empBank = '${employee.empBankCd}';
	console.log("empBank" + empBank);
	
	$("select[id=empBankCd] option:contains('${employee.empBankCd}')").attr("selected","selected");
	
	let $newPw = $("#newPw");
	let $newPwCheck = $("#newPwCheck");
	let $oldPw = $("#oldPw");
	let $memNo = $("#memNo");
	
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
		
		let data = {"oldPw": $oldPw.val(), "newPw":$newPw.val(), "memNo":$memNo.val() }
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
			id="custom-content-below-messages-tab" data-toggle="pill"
			href="#custom-content-below-messages" role="tab"
			aria-controls="custom-content-below-messages" aria-selected="false">비밀번호 변경</a>
		</li>
	</ul>
	<div class="tab-content" id="custom-content-below-tabContent">
		<div class="tab-pane fade active show" id="custom-content-below-home"
				role="tabpanel" aria-labelledby="custom-content-below-home-tab">
			<div style="margin-top:20px;">
				<form action="/mypage/empUpdate" method="post" id="mysub">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-2 mt-4">
								<img src="/upload${employee.empPic}"class="img-thumbnail" alt="User Image">
							</div>
							<div class="col-md-10">
								<div class="container">
									<div class="row mt-1 mb-2">
										<div class="col-3">
											<label for="memNo" class="form-label">교번</label> 
											<input type="text" class="form-control" id="memNo" name="empNo" value="${employee.empNo}" readonly />
										</div>
										<c:if test="${employee.empPos=='전임교수'||employee.empPos=='비전임교수'}">
											<div class="col-3">
												<label for="proPos" class="form-label">보직</label> 
												<input type="text" class="form-control" id="memNo" name="proPos" value="${employee.proPos}" readonly />
											</div>
											<div class="col-3">
												<label for="colNm" class="form-label">단과대학</label> 
												<input type="text" class="form-control" id="colNm" name="colNm" value="${employee.colNm}" readonly />
											</div>
											<div class="col-3">
												<label for="depNm" class="form-label">학과</label> 
												<input type="text" class="form-control" id="depNm" name="depNm" value="${employee.depNm}" readonly />
											</div>
										</c:if>
									</div>
									<div class="row mb-2">
										<div class="col-3">
											<label for="memNm" class="form-label">이름</label> 
											<input type="text" class="form-control" id="memNm" name="empNm" value="${employee.empNm}" readonly />
										</div>
										<div class="col-3">
											<label for="empDiv" class="form-label">부서</label> <input
												type="text" class="form-control" id="empDiv" name="empDiv"
												value="${employee.empDiv}" readonly />
										</div>
										<div class="col-3">
											<label for="empPos" class="form-label">직책</label> <input
												type="text" class="form-control" id="empPos" name="empPos"
												value="${employee.empPos}" readonly />
										</div>
										<div class="col-3">
											<label for="empJoin" class="form-label">입사일</label> 
											<input type="text" class="form-control" id="empJoin" value="<fmt:formatDate value="${employee.empJoin}" pattern='yy/MM/dd'/>" readonly />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-3">
											<label for="empBir" class="form-label">생년월일</label> <input
												type="text" class="form-control" id="empBir" name="empBir" value="${employee.empBir}" readonly />
										</div>
										<div class="col-3">
											<label for="empTel" class="form-label">연락처</label> <input
												type="text" class="form-control" id="empTel" name="empTel" value="${employee.empTel}" readonly />
										</div>
										<div class="col-3">
											<label for="empTel2" class="form-label">비상 연락처</label> <input
												type="text" class="form-control" id="empTel2" name="empTel2" value="${employee.empTel2}" />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-3">
											<div class="form-group">
												<label>은행</label> 
												<select class="form-control" id="empBankCd" name="empBankCd">
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
											<label for="empDepo" class="form-label">예금주</label> 
											<input type="text" class="form-control" id="empDepo" name="empDepo"
												value="${employee.empDepo}" readonly />
										</div>
										<div class="col-3 offset-1">
											<label for="empAct" class="form-label">계좌번호</label> 
											<input type="text" class="form-control" id="empAct" name="empAct"
												value="${employee.empAct}" required />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-3">
											<label for="empZip" class="form-label">우편번호</label>
											<div class="input-group">
												<input type="text" class="form-control" placeholder="우편번호 검색"
													value="${employee.empZip}" name="empZip" readonly />
												<div class="input-group-append">
													<button type="button" class="btn btn-default" id="btnZipCode">
														<i class="fa fa-search"></i>
													</button>
												</div>
											</div>
										</div>
										<div class="col-4 offset-1">
											<label for="empAddr1" class="form-label">기본주소</label> <input
												type="text" class="form-control" id="empAddr1" name="empAddr1"
												value="${employee.empAddr1}" required />
										</div>
										<div class="col-4">
											<label for="empAddr1" class="form-label">상세주소</label> <input
												type="text" class="form-control" id="empAddr2" name="empAddr2"
												value="${employee.empAddr2}" required />
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
		
		<div class="tab-pane fade" id="custom-content-below-messages"
			role="tabpanel" aria-labelledby="custom-content-below-messages-tab">
			<div class="row mt-5 mb-2">
				<div class="col-4 offset-4">
					<input type="hidden" id="memNo" value="<%=no%>" /> <label
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
