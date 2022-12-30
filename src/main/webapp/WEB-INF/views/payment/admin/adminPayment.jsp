<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<div class="row p-0">
	<div class="col-4 offset-8 text-right">
		<table id='allPayCnt' class="table table-bordered">
			<tr>
				<td>납부되는 등록금 총액</td>
				<td><fmt:formatNumber value="${payment.paySumfee}" pattern="#,###" /> (원)</td>
			</tr>
			<tr>
				<td>납부된 등록금 총액</td>
				<td><fmt:formatNumber value="${payment.paySumamt}" pattern="#,###" /> (원)</td>
			</tr>
		</table>
	</div>
</div>

<div class="row">
	<div class="align-self-end col-2 mb-2" style="text-align:end;">
		<label class="m-0" style="float:left;"> &ensp;전체 학생 등록금 납부 조회 </label>
	</div>
	<div class="col-10 align-self-end mb-2" style="text-align:end;">
		<p class="m-0" style="float:right;">
			[총 <span style="color: #001353; font-weight: bold;" id="cntSpan"></span>건]
		</p>
	</div>
</div>

<table class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
	<thead>
		<tr class="text-center">
			<th width="5%">No</th>
			<th width="15%">단과대학</th>
			<th width="10%">학번</th>
			<th width="10%">이름</th>
			<th width="10%">등록금</th>
			<th width="10%">장학금(원)</th>
			<th width="10%">납부총액(원)</th>
			<th width="10%">납부일</th>
			<th width="10%">납부상태</th>
		</tr>
	</thead>
	<tbody id="PaymentList" class="text-center">
	</tbody>
</table>
				
<script type="text/javascript" defer="defer">
	
	//스프링 시큐리티를 위한 토큰 처리(csrf) -> 불토엔 큰 코스로 픽스!
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";
	
	console.log("header : " + header + ", token : " + token);
	
	$.ajax({
		url:"/payment/admin/adminPaymentList",
		dataType:'json',
		type: "POST",
		beforeSend: function (xhr) {
			xhr.setRequestHeader(header, token);
		},
		success:function(data){
			console.log("data : " + data);
			//개수표현
			$('#cntSpan').text(data.length);
			
			let str ="";
			for(var i=0;i<data.length;i++){
				if (data[i].payDt == null) {
					data[i].payDt = "-";
				}
				let fee = data[i].colFee;
				let numWithCommas1 = addCommas(fee);
				console.log(numWithCommas1);
				
				let sclhAmt = data[i].sclhAmt;
				let numWithCommas2 = addCommas(sclhAmt);
				console.log(numWithCommas2);
				
				let payAmt = data[i].payAmt;
				let numWithCommas3 = addCommas(payAmt);
				console.log(numWithCommas3);
				
				str += `
					<tr>
					<td>\${i+1}</td>
					<td>\${data[i].colNm}</td>
					<td>\${data[i].stuNo}</td>
					<td>\${data[i].stuNm}</td>
					<td>\${numWithCommas1}</td>
					<td>\${numWithCommas2}</td>
					<td>\${numWithCommas3}</td>
					<td>\${data[i].payDt}</td>
					<td class='checklecaAp'>\${data[i].payYn}</td>
					</tr>
				`
			}
			$("#PaymentList").html(str);
			
			//완납, 미납 글자색 변경
			$(function(){
				for(var i=0; i<data.length;i++){
					console.log($(".checklecaAp").eq(i).html());
					if($(".checklecaAp").eq(i).html() == '미납'){
						$(".checklecaAp").eq(i).css("color","red");
					}else if($(".checklecaAp").eq(i).html() == '완납'){
						$(".checklecaAp").eq(i).css("color","blue");
					}
				}
			});
			
			//콤마찍긔
			function addCommas(num) {
			  return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
		}
	});
</script>
