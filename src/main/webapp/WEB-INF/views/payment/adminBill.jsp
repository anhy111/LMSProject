<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#grid *{
text-align: center;
}
#check{
padding : 10px;
margin-bottom : 20px;
/* width : 96%; */
background-color: lightyellow;
border : 1px solid lightgrey;
color : green;
}
</style>

<div class="row">
	<div class="alert alert-light col" role="alert">
		<!-- 게시판 안내사항 -->
		<p>
			<strong>&#8251;&nbsp;고지안내</strong><br><br>
			등록금은 현재 재학중인 학생에게만 부여된다. 등록금은 장학금이 자동적으로 차감된 금액이 부과되며, 만약
			장학금액이 등록금액을 초과할 경우 등록금은 0원으로 처리된다.
		</p>
	</div>
</div>

<br>
<br>
<p id="noticeCheck" style="float: left;">
	<i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;등록금
	납부 고지대상
</p>
<br>
<br>
<div>
	<input type="button" id="btn1" class="btn btn-secondary btn-sm"
		value="등록금 고지" style="float: left">
	<button id="checkboxAll">전체선택</button>
	<p style="float: right; margin-right: 6px;">
		[미고지 <span style="color: #001353; font-weight: bold;" id="cntSpan"></span>건]
	</p>
</div>
<br>
<table class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
	<thead>
		<tr class="text-center">
			<th width="3%">No</th>
			<th width="10%">선택</th>
			<th width="10%">단과대</th>
			<th width="10%">학과</th>
			<th width="10%">학번</th>
			<th width="10%">학년</th>
			<th width="10%">학기</th>
			<th width="10%">이름</th>
			<th width="10%">고지현황</th>
		</tr>
	</thead>
	<tbody id="BillList" class="text-center">
	</tbody>
</table>

<script type="text/javascript" defer="defer">

	//스프링 시큐리티를 위한 토큰 처리(csrf) -> 불토엔 큰 코스로 픽스!
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";
	
	console.log("header : " + header + ", token : " + token);
	
	$.ajax({
		url:"/payment/adminBillList",
		contentType: "application/json;charset=utf-8",
		dataType:'json',
		type: "POST",
		beforeSend: function (xhr) {
			xhr.setRequestHeader(header, token);
		},
		success:function(data){
			console.log(data);
			let str ="";
			for(var i=0;i<data.length;i++){
				str += `
					<tr>
					<td>\${i+1}</td>
					<td><input class='checkboxAll' type='checkbox'></td>
					<td>\${data[i].colNm}</td>
					<td>\${data[i].depNm}</td>
					<td>\${data[i].stuNo}</td>
					<td>\${data[i].stuYr}</td>
					<td>\${data[i].paySem}</td>
					<td>\${data[i].stuNm}</td>
					<td class='checklecaAp'>\${data[i].payYn}</td>
					</tr>
				`
				
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
			}
			$("#BillList").html(str);
		}
	});

	let checkboxAll = "";
	
	$(function (){
		checkboxAll = document.querySelectorAll(".checkboxAll");
		$("#checkboxAll").on("click", function() {
			for (var i = 0; i < checkboxAll.length; i++) {
				checkboxAll[i].checked = true;
			}
		});
	})
	
	//count 불러오기
	$.ajax({
		url: "/payment/adminBillCount",
		type: "POST",
		contentType: "application/json;charset=utf-8",
		dataType: "JSON",
		beforeSend: function (xhr) {
			xhr.setRequestHeader(header, token);
		},
		success: function (res) {
			console.log("개수 : " + res)
			$("#cntSpan").text(res);
		}
	});
			
function submit(){
	var dataSet =[];
	$.each(test,function(i,v){
		var tmp = {};
		var stuCd = v.STU_CD;
		var depCd = v.DEP_CD;
		tmp.stuCd = stuCd;
		tmp.depCd = depCd;
		dataSet.push(tmp);
	})
	 $.ajax({
	        url : "/payment/insert",
	        type : "POST",
	        data : JSON.stringify(dataSet),
	        contentType: 'application/json',
	        beforeSend: function (xhr) {
				xhr.setRequestHeader(header, token);
			},
	        success : function(res){
	        	alert("등록금 요청이 완료되었습니다.")
	        	$('#grid').empty();
	        	gridList();
	        }
	    });
}
$(function(){
	
	$.ajax({
 		url : "/scholarship/insertGradeCheck",
 		method : "POST",
 		dataType : "json",
 		beforeSend: function (xhr) {
			xhr.setRequestHeader(header, token);
		},
 		success : function(result){
			if(result==0){
 			$('#btn1').remove();
 			var str ="<span style='color:red;'>&ensp;&ensp;*성적장학금을 수여하지 않은 상태이므로 등록금을 고지할 수 없습니다.</span>";
 			$('#noticeCheck').append(str);
			}
 		}
 	})	
	
	gridList();
	
	$('#btn1').on('click',function(){
		submit();
	})
});
</script>
</html>
