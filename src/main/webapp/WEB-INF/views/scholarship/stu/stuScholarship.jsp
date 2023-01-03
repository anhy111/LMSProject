<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
	<div class="alert alert-light col" role="alert">
		<strong>-수석장학금 : 각 학과별 내 학년별 석차 1등에게 수여하는 장학금. 등록금의 100%를 지급한다.</strong><br>
		<strong>-우수장학금 : 각 학과별 내 학년별 석차 2등에게 수여하는 장학금. 등록금의 50%를 지급한다.</strong><br>
		<strong>-격려장학금 : 각 학과별 내 학년별 석차 3등에게 수여하는 장학금. 등록금의 30%를 지급한다.</strong><br>
		<strong>-교수추천장학금 : 동 학과의 교수님에게 추천을 받은 사람에게 수여하는 장학금. 30만원을 지급한다.</strong>
	</div>
</div>

<div class="row">
	<div class="align-self-end col-2 mb-2" style="text-align:end;">
		<label class="m-0" style="float: left;">
			&ensp;장학금 수혜 이력
		</label>
	</div>
	<div class="col-10 align-self-end mb-2" style="text-align:end;">
		<p class="m-0" style="float: right;">
			[총 <span style="color: #001353; font-weight: bold;" id="cntSpan"></span>건]
		</p>
	</div>
</div>

<div class="row">
	<div class="col-sm-12">
		<table class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
			<thead>
				<tr class="text-center">
					<th width="5%">년도</th>
					<th width="5%">학기</th>
					<th width="10%">장학명</th>
					<th width="10%">금액(원)</th>
				</tr>
			</thead>
			<tbody id="scholarshipList" class="text-center">
			</tbody>
		</table>
	</div>
</div>
</body>
<script type="text/javascript" defer="defer">
	//스프링 시큐리티를 위한 토큰 처리(csrf) -> 불토엔 큰 코스로 픽스!
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";
	
	$(document).ready(function () {
		//학생 장학금 수혜내역 리스트
		$.ajax({
			url: "/scholarship/stu/stuScholarshipList",
			type: "POST",
			contentType: "application/json;charset=utf-8",
			dataType: "JSON",
			beforeSend: function (xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function (data) {
				//개수표현
				$('#cntSpan').text(data.length);
				let str ="";
				for(var i=0;i<data.length;i++){
					
					let sclhAmt = data[i].sclhAmt;
					let numWithCommas = addCommas(sclhAmt);
					
					str += `
						<tr class='ScholarshipForm' style='cursor:pointer'>
						<td class='checksclhCd' value='\${data[i].sclhCd}'>\${data[i].sclhYr}</td>
						<td>\${data[i].sclhSem}학기</td>
						<td>\${data[i].sclNm}</td>
						<td>\${numWithCommas}</td>
						</tr>
					`
				}
				$("#scholarshipList").html(str);
				
				//콤마찍긔
				function addCommas(num) {
				  return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				}
				
				//행 클릭 시 상세페이지 띄우긔
				$(document).on('click','.ScholarshipForm',function(e){
		        	let eqSeq = $(this).index();
		        	let sclhCd = $(".checksclhCd").get(eqSeq).getAttribute('value');
		        	console.log("여기만떠줭 sclhCd : " + sclhCd);
		        	
					var pwidth = 1400;
					var pheight = 800;
					
					var pleft = (window.screen.width/2) - (pwidth/2);
					var ptop = (window.screen.height/2) - (pheight/2);
					
					window.open('/scholarship/stuScholarshipForm/scholarshipBenefitCertificate?sclhCd='+sclhCd,'ScholarshipForm','width='+ pwidth +',height='+ pheight +',top='+ ptop +',left='+ pleft);

				});
			}
		});
	});
	
</script>
</html>