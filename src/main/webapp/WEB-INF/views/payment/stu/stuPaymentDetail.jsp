<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/dataTableTemplate.css">
<div class="card-header" style="padding-right:0px;">
	<p style="float: left; margin-right: 6px;"id="stuPaymentListSelect"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;등록금납부이력</p>
	<p style="float: right;">[총 <span style="color : red; font-weight: bold;" id="cntSpan"></span>건]</p>
</div>
<table class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
	<thead>
		<tr class="text-center">
			<th width="10%">년도</th>
			<th width="10%">등록금</th>
			<th width="10%">장학금</th>
			<th width="10%">실납부액</th>
			<th width="10%">납부여부</th>
		</tr>
	</thead>
		<tbody id="stuPayList">
		</tbody>
</table>
<div id="btn" style="padding-top:10px;">
</div>

<script type="text/javascript" defer="defer">
	//스프링 시큐리티를 위한 토큰 처리(csrf) -> 불토엔 큰 코스로 픽스!
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";
	
	$(document).ready(function () {
		function checkBillCnt(){
			$.ajax({
				url : '/payment/stu/billCount',
				type : 'POST',
				dataType : 'json',
				beforeSend: function (xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function(res) {
					if (res == 1) {
						var str1 = "";
						var str2 = "";
						str1 +=" &nbsp;<span id='noticeSpan' style='color:red;'>*납부해야할 등록금이 있습니다.</span>"
						str2 +="<button onclick='payingTuition()' class='btn btn-primary' id='noticeBill' style='float:right;'>등록금고지서</button>"
						$('#stuPaymentListSelect').append(str1);
						$('#btn').append(str2);
					}
				}
			})
		}
		
		checkBillCnt();
		
		//등록금 납부내역 리스트
		$.ajax({
			url: "/payment/stu/stuPaymentList",
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
					
					let sclhAmt = data[i].sclhAmt;
					let numWithCommas2 = addCommas(sclhAmt);
					
					let payAmt = data[i].payAmt;
					let numWithCommas3 = addCommas(payAmt);
					
					str += `
						<tr class='paymentForm' style='cursor:pointer'>
						<td class='checkpayCd' value='\${data[i].payCd}'>\${data[i].payDate}</td>
						<td style="text-align:right">\${numWithCommas1}</td>
						<td style="text-align:right">\${numWithCommas2}</td>
						<td style="text-align:right">\${numWithCommas3}</td>
						<td class='checklecaAp' value='\${data[i].payYn }'>\${data[i].payYn}</td>
						</tr>
					`
				}
				$("#stuPayList").html(str);
				
				//콤마찍긔
				function addCommas(num) {
				  return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				}
	
				//승인, 승인대기, 반려 글자색 변경
				$(function(){
					for(var i=0; i<data.length;i++){
						if($(".checklecaAp").eq(i).html() == '미납'){
							$(".checklecaAp").eq(i).css("color","red");
						}else if($(".checklecaAp").eq(i).html() == '완납'){
							$(".checklecaAp").eq(i).css("color","blue");
						}
					}
				});
				
				//행 클릭 시 상세페이지 띄우긔
				$(document).on('click','.paymentForm',function(e){
		        	let eqSeq = $(this).index();
		        	let payCd = $(".checkpayCd").get(eqSeq).getAttribute('value');
		        	let payYn = $(".checklecaAp").get(eqSeq).getAttribute('value');
		        	console.log("여기만떠줭 payCd : " + payCd);
		        	console.log("여기만떠줭 payYn : " + payYn);
		        	
		        	if(payYn == "완납"){
						var pwidth = 1400;
						var pheight = 800;
						
						var pleft = (window.screen.width/2) - (pwidth/2);
						var ptop = (window.screen.height/2) - (pheight/2);
						
						window.open('/payment/stuForm/paymentConfirmation?payCd='+payCd,'paymentForm','width='+ pwidth +',height='+ pheight +',top='+ ptop +',left='+ pleft);

					}else{
						alert("현재 등록금 미납 상태 이므로 수납서를 확인할 수 없습니다.");
					}
				});
			}
		});
	})
	
	function payingTuition(){
		var result;
		var pwidth = 1400;
		var pheight = 800;
		
		var pleft = (window.screen.width/2) - (pwidth/2);
		var ptop = (window.screen.height/2) - (pheight/2);
		
		result = window.open("/payment/stuForm/payingTuition",'b','width='+ pwidth +',height='+ pheight +',top='+ ptop +',left='+ pleft); 
		
		console.log("result", result);
		if(result!=null){
			result.addEventListener('unload', function(){
				
			});
		}
	}
</script>