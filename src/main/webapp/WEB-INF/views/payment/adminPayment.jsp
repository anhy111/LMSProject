<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<style>
#allPayCnt td:first-child{
	text-align : left;
	padding :7px;
	padding-right : 50px;
	background : #EFF5FB;
}
#allPayCnt td:last-child{
	text-align : right;
	padding :7px;
	padding-left: 70px;
}
.addFontColorRed {
	color: rgb(225, 39, 64);
}

.addFontColorBlue {
	color : blue;
}
</style>
</head>
<body>
	<div>
		<i class="mdi mdi-home" style="font-size: 1.3em"></i>
		<i class="dripicons-chevron-right"></i> 등록 및 장학 
		<i class="dripicons-chevron-right"></i> <span>등록금</span>
		<i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">등록금납부관리</span>
	</div>
	<br>
	<br>
	<p style="float: left;">
		<i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;전체
		학생 등록금 납부 조회
	</p>
	<p style="float: right; margin-right: 6px;">
		[총 <span style="color: #001353; font-weight: bold;" id="cntSpan"></span>건]
	</p>
	<br>
	<div class="card-body">
		<div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4">
			<div class="row">
				<div class="col-sm-12">
					<table id="example2"
						class="table table-bordered table-hover dataTable dtr-inline"
						aria-describedby="example2_info">
						<thead>
							<tr>
								<th class="sorting sorting_asc" tabindex="0"
									aria-controls="example2" rowspan="1" colspan="1"
									aria-sort="ascending"
									aria-label="Rendering engine: activate to sort column descending">
									NO.</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Engine version: activate to sort column ascending">
									단과대학</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Engine version: activate to sort column ascending">
									학번</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending">
									이름</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending">
									등록금(원)</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending">
									장학금(원)</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending">
									납부총액(원)</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending">
									납부일</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending">
									납부상태</th>
							</tr>
						</thead>
						<tbody id="PaymentList">
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<table id='allPayCnt' border="1">
		<tr>
			<td>올해 납부되는 등록금 총액</td>
			<td><fmt:formatNumber value="${paymentVO.payCd }"
					pattern="#,###" /> (원)</td>
		</tr>
		<tr>
			<td>현재 납부된 등록금 총액</td>
			<td><fmt:formatNumber value="${paymentVO.payAmt }"
					pattern="#,###" /> (원)</td>
		</tr>
	</table>
</body>
<script type="text/javascript" defer="defer">
	
	//스프링 시큐리티를 위한 토큰 처리(csrf) -> 불토엔 큰 코스로 픽스!
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";
	
	console.log("header : " + header + ", token : " + token);
	
	$.ajax({
		url:"/payment/adminPaymentList",
		dataType:'json',
		type: "POST",
		beforeSend: function (xhr) {
			xhr.setRequestHeader(header, token);
		},
		success:function(data){
			console.log("data : " + data);
			let str ="";
			for(var i=0;i<data.length;i++){
				str += `
					<tr>
					<td>\${i+1}</td>
					<td>\${data[i].colNm}</td>
					<td>\${data[i].stuNo}</td>
					<td>\${data[i].stuNm}</td>
					<td>\${data[i].payAmt}</td>
					<td>\${data[i].paySem}</td>
					<td>\${data[i].stuNm}</td>
					<td>\${data[i].payYn}</td>
					</tr>
				`
			}
			$("#PaymentList").html(str);
		}
	});
</script>
</html>