<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<% String no = String.valueOf(session.getAttribute("no")); %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
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

</script>

<div class="content container-fluid">
	<div class="row">
		<div class="col-md-8 offset-2">
			<div class="card card-outline card-primary p-5">
				<div class="card-header">
					<h3 class="card-title">비밀번호 변경</h3>
				</div>
				<div class="card-body">
					<div class="row mt-5 mb-2">
						<div class="col-4 offset-4">
							<input type="hidden" id="stuNo" value="<%=no%>" />
							<label for="oldPw" class="form-label">현재 비밀번호</label> 
							<input type="password" class="form-control" id="oldPw" name="oldPw" required  />
						</div>
					</div>
					<div class="row mt-3 mb-2">
						<div class="col-4 offset-4">
							<label for="newPw" class="form-label">새 비밀번호</label> 
							<input type="password" class="form-control" id="newPw" name="newPw" required  />
						</div>
					</div>
					<div class="row mt-3 mb-2">
						<div class="col-4 offset-4">
							<label for="newPwCheck" class="form-label">새 비밀번호 확인</label> 
							<input type="password" class="form-control" id="newPwCheck" name="newPwCheck" required  />
							<span id="alertPw"></span>
						</div>
					</div>
					<div class="row mt-3 mb-2">
						<div class="col-4 offset-4">
							<button type="button" class="btn btn-block btn-outline-warning" id="changePw" disabled>확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>