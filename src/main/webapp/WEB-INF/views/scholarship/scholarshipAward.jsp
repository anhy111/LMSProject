<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장학금 수여</title>
<style>
#leftDiv{
width : 69%;
float: left;
}
#tabDiv{
width : 30%;
margin-left: 1%;
/* margin-right : 4%; */
float: right;
}
.colortd {
background-color: #E0ECF8;
}
.colorwhite{
background-color: white;
}
#detailTab th{
text-align: center;
}
#detailTab tr{
height: 40px;
}
#btn1{
float: right;
margin-right: 10px;
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
</head>
<body>
	<div>
		<i class="mdi mdi-home" style="font-size: 1.3em"></i>
		<i class="dripicons-chevron-right"></i>등록 및 장학 
		<i class="dripicons-chevron-right"></i><span>장학</span> 
		<i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">장학금 수여</span>
	</div>
	<br>
	<div id="check">
		<span>성적장학금은 각 학과별 학년에따라 석차 1,2,3등 순으로 수석, 우수, 격려장학금을 수여한다.
		<br>
		- 수석장학금 등록금 100%
		<br>
		- 우수장학금 등록금 50%
		<br>
		- 격려장학금 등록금 30%
		</span>
		<br>
	</div>
	<br>
	<div id="leftDiv">
	<p id="checkP"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;성적장학금 대상 학생<button type="button" class="btn btn-secondary btn-sm" id="btn1">장학금 수여</button></p>
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
										aria-label="Browser: activate to sort column ascending">
										학번</th>
									<th class="sorting" tabindex="0" aria-controls="example2"
										rowspan="1" colspan="1"
										aria-label="Platform(s): activate to sort column ascending">
										단과대학</th>
									<th class="sorting" tabindex="0" aria-controls="example2"
										rowspan="1" colspan="1"
										aria-label="Engine version: activate to sort column ascending">
										학과</th>
									<th class="sorting" tabindex="0" aria-controls="example2"
										rowspan="1" colspan="1"
										aria-label="CSS grade: activate to sort column ascending">
										학년</th>
									<th class="sorting" tabindex="0" aria-controls="example2"
										rowspan="1" colspan="1"
										aria-label="CSS grade: activate to sort column ascending">
										이름</th>
									<th class="sorting" tabindex="0" aria-controls="example2"
										rowspan="1" colspan="1"
										aria-label="CSS grade: activate to sort column ascending">
										성적</th>
									<th class="sorting" tabindex="0" aria-controls="example2"
										rowspan="1" colspan="1"
										aria-label="CSS grade: activate to sort column ascending">
										등수</th>
									<th class="sorting" tabindex="0" aria-controls="example2"
										rowspan="1" colspan="1"
										aria-label="CSS grade: activate to sort column ascending">
										장학금(원)</th>
								</tr>
							</thead>
							<tbody id="SchList">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<p><i class="mdi mdi-record-circle" style="color: #001353;display:inline-block;margin-left:13px;"></i>&ensp;학생 성적 상세</p>
	<div id="tabDiv">
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
										학점</th>
									<th class="sorting" tabindex="0" aria-controls="example2"
										rowspan="1" colspan="1"
										aria-label="Browser: activate to sort column ascending">
										구분</th>
									<th class="sorting" tabindex="0" aria-controls="example2"
										rowspan="1" colspan="1"
										aria-label="Platform(s): activate to sort column ascending">
										강의명</th>
									<th class="sorting" tabindex="0" aria-controls="example2"
										rowspan="1" colspan="1"
										aria-label="Platform(s): activate to sort column ascending">
										성적</th>
								</tr>
							</thead>
							<tbody id="StuInfoList">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	//스프링 시큐리티를 위한 토큰 처리(csrf) -> 불토엔 큰 코스로 픽스!
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";
	
	console.log("header : " + header + ", token : " + token);
	
	let trs = "";
	let tdValues = "";
	
	$(document).ready(function () {
		
		//장학금 수여대상자 목록
		$.ajax({
			url:"/scholarship/scholarshipAwardList",
			contentType: "application/json;charset=utf-8",
			dataType:'json',
			type: "POST",
			beforeSend: function (xhr) {
				xhr.setRequestHeader(header, token);
			},
			success:function(data){
				let str ="";
				for(var i=0;i<data.length;i++){
					
					let sclhAmt = data[i].sclhAmt;
					let numWithCommas = addCommas(sclhAmt);
					
					str += `
						<tr class='studentGrade' style='cursor:pointer;'>
						<td>\${i+1}</td>
						<td>\${data[i].stuNo}</td>
						<td>\${data[i].colNm}</td>
						<td>\${data[i].depNm}</td>
						<td>\${data[i].stuYr}</td>
						<td>\${data[i].stuNm}</td>
						<td>\${data[i].totalAvg}</td>
						<td>\${data[i].ranking}</td>
						<td>\${numWithCommas}</td>
						</tr>
					`
				}
				$("#SchList").html(str);
				
				//콤마찍긔
				function addCommas(num) {
				  return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				}
				
				//행 클릭 시 학생 상세정보 띄우긔
				trs = document.querySelectorAll('.studentGrade');
			    for (var i = 0; i < trs.length; i++) {
			        trs[i].addEventListener('click', function () {
			        	tdValues = Array.from(this.querySelectorAll('td')).map(td => td.textContent);

			        	let stuNo = tdValues[1];
			        	
			        	//중복수여 췤
			    		$.ajax({
			    	 		url : "/scholarship/scholarshipCheck",
			    	 		method : "POST",
			    	 		contentType: "application/json;charset=utf-8",
			    	 		data: stuNo,
			    	 		dataType : "json",
			    	 		beforeSend: function (xhr) {
			    				xhr.setRequestHeader(header, token);
			    			},
			    	 		success : function(result){
			    				if(result>0){
			    	 			$('#btn1').hide();
			    	 			var str ="<span style='color:red;'>&ensp;&ensp;*이미 성적장학금을 수여하였습니다.</span>";
			    	 			$('#checkP').append(str);
			    				}
			    	 		}
			    	 	});
			        	
				        	//학생성적상세
				    		$.ajax({
				    			url:"/scholarship/studentInfoList",
				    			contentType: "application/json;charset=utf-8",
				    			data: stuNo,
				    			dataType:'json',
				    			type: "POST",
				    			beforeSend: function (xhr) {
				    				xhr.setRequestHeader(header, token);
				    			},
				    			success:function(data){
				    				let str ="";
				    				for(var i=0;i<data.length;i++){
				    					str += `
				    						<tr>
				    						<td>\${data[i].lecaCrd}</td>
				    						<td>\${data[i].lecaCate}</td>
				    						<td>\${data[i].lecaNm}</td>
				    						<td>\${data[i].slScore}</td>
				    						</tr>
				    					`
				    				}
				    				$("#StuInfoList").html(str);
				    				
				    			}
				    		});
			        });
			    }
			}
		});
		
		$('#btn1').on('click',function(){
			const number = tdValues[8].replaceAll(",", "");
			let insertScholarship = {
					sclCd : tdValues[7],
					stuNo : tdValues[1],
					sclhAmt : number,
			};
			var submitCheck = confirm("성적장학금을 수여하시겠습니까?");
			if(submitCheck){
				$.ajax({
					url : "/scholarship/scholarshipConfer",
					type : "POST",
					data : JSON.stringify(insertScholarship),
					dataType:'json',
					beforeSend: function (xhr) {
	    				xhr.setRequestHeader(header, token);
	    			},
					contentType: 'application/json;charset=utf-8',
					success : function(result){
		             	if(result>0){
		             	alert("성적장학금이 수여되었습니다.");
		             	}
		             }
				})
			}
		});
		
	});
</script>
</html>