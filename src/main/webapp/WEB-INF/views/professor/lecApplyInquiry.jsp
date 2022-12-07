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
		
		//년도 및 학기 불러오기
		$.ajax({
			url : "/professor/getYrNSem",
			type : "POST",
			dataType : "JSON",
			beforeSend:function(xhr) {
				xhr.setRequestHeader(header,token);
			},
			success : function(res) {
				str = '';
				
				$.each(res, function(i, v) {
					str += '<option value="'+ v.lecaYr + v.lecaSem + '">' + v.lecaYr + '/' + v.lecaSem + '학기</option>';
				});
				
				$('#cateYrNSem').append(str);
			}
		});
		
		//강의계획서 리스트 가져오기
		$.ajax({
			url : "/lecApply/getList",
			type : "POST",
			contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			beforeSend:function(xhr) {
				xhr.setRequestHeader(header,token);
			},
			success : function(res) {
				
				$.each(res, function(i,v){
					res[i]['btn'] = '<button class="btn btn-outline-secondary btn-sm" style="font-family:Nunito,sans-serif;" onclick="getSyllabus(' + v.lecaCd +')">강의계획서</button>';
				});
				
				grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : res,
					scrollX : true,
					scrollY : true,
					bodyHeight : 340,
					columns : [
						{header : '년도/학기', name : 'lecaCon', filter : 'select', width:120, align : 'center'},
						{header : '학년', name : 'lecaTrg', filter : 'select', width : 70, align : 'center'},
						{header : '과목번호', name : 'subCd', filter : 'select', width : 110, align : 'center'},
						{header : '과목명', name : 'lecaNm', filter : 'select', width : 280},
						{header : '제한인원', name : 'lecaMax', width : 90, align : 'center'},
						{header : '개설이수구분', name : 'lecaCate', width : 120, align : 'center'},
						{header : '학점', name : 'lecaCrd', width : 70, align : 'center'},
						{header : '강의시간/강의실', name : 'lecaTt', width : 310},
						{header : '성적평가방식', name : 'lecaGrade', width : 110, align : 'center'},
						{header : '승인여부', name : 'lecaBook', filter : 'select', width : 120, align : 'center'},
						{header : '자세히 보기', name : 'btn', width : 150, align : 'center'}
					],
					columnOptions: {
				        resizable: true
				    }
				});
				
				//승인 - 그대로, 승인완료 - 파랑, 반려 - 빨강
				var dataSet = grid.getData();
				$.each(dataSet, function(i1, v1) {
					if(v1.lecaBook == '승인') {
						grid.addCellClassName(v1.rowKey, 'lecaBook', "addFontColorBlue");
					}else if(v1.lecaBook == '반려') {
						grid.addCellClassName(v1.rowKey, 'lecaBook', "addFontColorRed");
					}
				});
			}
		});
		
	}
</script>
</html>
