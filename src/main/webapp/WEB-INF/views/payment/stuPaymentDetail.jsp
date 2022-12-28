<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록금 납부 내역</title>
<style>
.center{
text-align: center;
}
.right{
text-align: right;
}
#detailTab{
font-size : 20px;
margin-top : 10px;
width: 90%;
height: 350px;
margin: auto;
}
#footer{
font-size : 30px;
font-weight: bold;
height : 100px;
}
#header{
padding-top : 10px;
padding-bottom: 10px; 
font-size : 25px;
text-align: center;
font-weight: bold;
}

#detail{
width : 900px;
height : 400px;
}

#btnDiv{
width : 900px;
}
.noticeBill{
	margin-left : 30px;
}

#small{
text-align: left;
}
#stuPaymentListSelect{
	display : inline-block;
}
/* .btn-primary{ */
/* 	background : #001353; */
/* 	border : #001353; */
/* 	box-shadow : #001353; */
/* } */
/* .btn-primary:hover{ */
/* 	background : #2a5388; */
/* 	border : #2a5388; */
/* 	box-shadow : #2a5388; */
/* } */
#noticeBill{
	margin-left : 15px;
	margin-top : -7px;
}
/* .confirmBill{ */
/* 	padding : 5px; */
/* } */
/* .confirmBill:hover{ */
/* 	background : white; */
/* } */

.comfirmBill{
	font-family:Nunito,sans-serif;
}

</style>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<link rel="stylesheet" href="/resources/css/suwon.css" />
</head>
<body>
<div>
<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i>등록/장학  <i class="dripicons-chevron-right"></i><span style="font-weight: bold;">등록금 납부 내역</span>
</div>
<br><br>
<p id="stuPaymentListSelect"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;납부내역 목록</p>
<p style="float: right; margin-right: 6px;">[총 <span style="color : #001353; font-weight: bold;" id="cntSpan"></span>건]</p>	
	<div class="card-body">
		<div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4">
			<div class="row">
				<div class="col-sm-12">
					<table id="example2"
						class="table table-bordered table-hover dataTable dtr-inline"
						aria-describedby="example2_info">
						<thead>
							<tr>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Browser: activate to sort column ascending">
									년도</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Platform(s): activate to sort column ascending">
									둥록금</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Engine version: activate to sort column ascending">
									장학금</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending">
									실납부액</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending">
									납부여부</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending">
									확인서출력</th>
							</tr>
						</thead>
						<tbody id="PayList">
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" defer="defer">
	//스프링 시큐리티를 위한 토큰 처리(csrf) -> 불토엔 큰 코스로 픽스!
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";
	
	$(document).ready(function () {
	
		//등록금 납부내역 리스트
		$.ajax({
			url: "/payment/stuPaymentList",
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
					
					let colFee = data[i].colFee;
					let numWithCommas1 = addCommas(colFee);
					console.log(numWithCommas1);
					
					let sclhAmt = data[i].sclhAmt;
					let numWithCommas2 = addCommas(sclhAmt);
					console.log(numWithCommas2);
					
					let payAmt = data[i].payAmt;
					let numWithCommas3 = addCommas(payAmt);
					console.log(numWithCommas3);
					
					str += `
						<tr>
						<td>\${data[i].payDate}</td>
						<td>\${numWithCommas1}</td>
						<td>\${numWithCommas2}</td>
						<td>\${numWithCommas3}</td>
						<td class='checklecaAp'>\${data[i].payYn}</td>
						<td><button class='inquirydetail' value='\${data[i].lecaCd}'>납부확인서</button></td>
						</tr>
					`
				}
				$("#PayList").html(str);
				
				//콤마찍긔
				function addCommas(num) {
				  return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				}
	
				//승인, 승인대기, 반려 글자색 변경
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
			}
		});
	})

</script>
</html>