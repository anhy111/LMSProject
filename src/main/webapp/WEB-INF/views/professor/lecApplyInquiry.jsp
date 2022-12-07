<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의계획서 조회</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
</head>
<body>
	<div>
    	<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 강의개설관리 <i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">강의계획서 조회</span>
  	</div>
  	<div class="row" id="keywardBox">
	  	<div class="col-2">
			<input type="text" class="form-control" placeholder="교번" id="proNo" name="proNo" value="${professor.proNo }" readonly="readonly">
		</div>
	  	<div class="col-2">
			<input type="text" class="form-control" placeholder="성명" id="empNm" name="empNm" value="${professor.empNm }" readonly="readonly">
		</div>
	  	<div class="col-2">
			<input type="text" class="form-control" placeholder="연락처" id="empTel" name="empTel" value="${professor.empTel }" readonly="readonly">
		</div>
	</div>
  	<div class="row" id="keywardBox">
	  	<div class="col-2">
			<input type="text" class="form-control" placeholder="소속" id="depNm" name="depNm" value="${professor.depNm }" readonly="readonly">
		</div>
	  	<div class="col-2">
			<input type="text" class="form-control" placeholder="직책" id="proPos" name="proPos" value="${professor.proPos }" readonly="readonly">
		</div>
	  	<div class="col-2">
			<input type="text" class="form-control" placeholder="재직상태" id="empRet" name="empRet" value="${professor.empRet }" readonly="readonly">
		</div>
	  	<div class="col-2">
			<input type="text" class="form-control" placeholder="생년월일" id="empReg" name="empReg" value="${professor.empReg }" readonly="readonly">
		</div>
		<sec:csrfInput/>
	</div>
	
	<br>
	
	<i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;강의계획서
	<p id="tellCnt">
		[총 <span id="cntSpan"></span>건]
	</p>
	
	<br>
	
	<div id="tgradeYellowBox" style="height:47px;">
		<label>년도/학기
			<select name="cateYrNSem" id="cateYrNSem" onchange="javascript:getListAgain(this);getCnt(this);">
				<option value="">전체</option>
			</select>
		</label>
		<span id="tgradeGreenText">&emsp;<i class="mdi mdi-square-medium"></i>&nbsp;임시저장한 강의계획서는 강의계획서 신청에서 조회할 수 있습니다.</span>
	</div>
	
	<br>
	
	<div id="grid"></div>
	
	<br>
	
</body>
<script type="text/javascript" defer="defer">
	window.onload = function() {
		console.log("여기까지 오긴하냐?");
		
		//스프링 시큐리티를 위한 토큰 처리(csrf) -> 불토엔 큰 코스로 픽스!
		let header = "${_csrf.headerName}";
		let token = "${_csrf.token}";
		
		console.log("header : " + header + ", token : " + token);
		
		//교수 개인정보 가져오기
		$.ajax({
			url : "/professor/proInfo",
			type : "POST",
			dataType : "JSON",
			beforeSend:function(xhr) {
				xhr.setRequestHeader(header,token);
			},
			success : function(data) {
				console.log("이건 오냐?");
				$('#proNo').val(data.proNo);
				$('#empNm').val(data.empNm);
				$('#empTel').val(data.empTel);
				$('#proPos').val(data.proPos);
				$('#depNm').val(data.depNm);
				$('#empRet').val(data.empRet);
				$('#empReg').val(data.empReg);

			}
		});
	}
</script>
</html>
