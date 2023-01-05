<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%	
	String name = String.valueOf(session.getAttribute("name")); 
	String no = String.valueOf(session.getAttribute("no"));
%>

<div class="login-box" style="position: inherit; top:250px;width:500px;">
	<div class="card" style="width:500px;height:400px">
		<div class="card-body login-card-body">
			<div class="login-logo">
				<a href="/login/login"><img src="/resources/upload/연수대가로.png" style="width: 300px;"></a>
			</div>
			<p class="login-box-msg mt-5" style="font-size: larger;"><strong><%=name%></strong> 님의 회원정보 중 마이페이지를 확인하기 위해 인증절차가 필요합니다.</p>
			<form action="/mypage/mypagePost" method="post">
				<div class="input-group mb-3 mt-3">
					<input type="hidden" name="memNo" value="<%=no%>">
					<input type="password" id="memPass" name="memPass" class="form-control" placeholder="password">
					<div class="input-group-append">
						<div class="input-group-text">
							<i class="fas fa-user-lock"></i>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<button type="submit" class="btn btn-primary btn-block">확인</button>
					</div>

				</div>
				<sec:csrfInput/>
			</form>
		</div>

	</div>
</div>

<script type="text/javascript">
$(function(){
	
	
	$(".btn").on("click", function(){
		
		let memPass= $("#memPass").val();
		
		console.log("memPass" + memPass);
		
	});
	
});

</script>


