<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
	<div class="alert alert-light col" role="alert">
		<!-- 게시판 안내사항 -->
		<p>
			<strong>※&nbsp;성적장학금</strong>은 각<strong>&nbsp;학과</strong>&nbsp;<strong>학년</strong>별&nbsp;석차순,
			
			<br><br><strong style="color:blue;">수석, 우수, 격려</strong>장학금을 수여함
			
			<br><br>
			<i class="fas fa-check-square"></i>수석장학금 등록금의&nbsp;<strong>100%</strong><br>
			<br>
			<i class="fas fa-check-square"></i>우수장학금 등록금의&nbsp;<strong>50%</strong><br>
			<br>
			<i class="fas fa-check-square"></i>격려장학금 등록금의&nbsp;<strong>30%</strong>
		</p>
	</div>
</div>

<div class="row">
	<div class="col-8">
		<div class="mb-2">
			<label id="checkP">&ensp;성적장학금 대상 학생</label>
			<span style='color:red;float:right;' id="checkScl"></span>
			<button type="button" class="btn btn-primary btn-sm" id="btn1" style="float:right; display:none;">장학금 수여</button>
		</div>
		<table class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
			<thead>
				<tr class="text-center">
					<th width="5%">No</th>
					<th width="10%">학번</th>
					<th width="15%">단과대학</th>
					<th width="15%">학과</th>
					<th width="5%">학년</th>
					<th width="10%">이름</th>
					<th width="10%">성적</th>
					<th width="10%">등수</th>
					<th width="10%">장학금(원)</th>
				</tr>
			</thead>
			<tbody id="SchList" class="text-center">
			</tbody>
		</table>
	</div>

	<div class="col-4">
		<div class="mb-2">
			<label>&ensp;학생 성적 상세</label>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<table class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
					<thead>
						<tr class="text-center">
							<th width="2%">학점</th>
							<th width="5%">구분</th>
							<th width="10%">강의명</th>
							<th width="10%">성적</th>
						</tr>
					</thead>
					<tbody id="StuInfoList" class="text-center">
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>


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
			url:"/scholarship/admin/scholarshipAwardList",
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
							<td style="text-align:right">\${numWithCommas}</td>
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
			        	let str ="";
			        	
			        	//중복수여 췤
			    		$.ajax({
			    	 		url : "/scholarship/admin/scholarshipCheck",
			    	 		method : "POST",
			    	 		contentType: "application/json;charset=utf-8",
			    	 		data: stuNo,
			    	 		dataType : "json",
			    	 		beforeSend: function (xhr) {
			    				xhr.setRequestHeader(header, token);
			    			},
			    	 		success : function(result){
			    	 			
			    	 			console.log("result는?? " + result);
			    	 			
			    				if(result>0){
				    	 			$('#btn1').hide();
				    	 			str ="&ensp;&ensp;*이미 성적장학금을 수여하였습니다.";
				    	 			$('#checkScl').html(str);
			    				}else{
			    					$('#btn1').show();
			    					$('#checkScl').html("");
			    				}
			    	 		}
			    	 	});
			        	
			        	//학생성적상세
			    		$.ajax({
			    			url:"/scholarship/admin/studentInfoList",
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
			var submitCheck = Swal.fire({
				  icon: 'warning',
				  title: '성적장학금을 수여합니까?',
				  showDenyButton: true,
				  showCancelButton: false,
				  confirmButtonText: '승인',
				  denyButtonText: `취소`,
				}).then((result) => {
				  if (result.isConfirmed) {
					  $.ajax({
							url : "/scholarship/admin/scholarshipConfer",
							type : "POST",
							data : JSON.stringify(insertScholarship),
							dataType:'json',
							beforeSend: function (xhr) {
			    				xhr.setRequestHeader(header, token);
			    			},
							contentType: 'application/json;charset=utf-8',
							success : function(result){
				             	if(result>0){
				             		Swal.fire({
				             			  icon: 'success',
				             			  title: '성적장학금이 수여되었습니다.',
				             			}).then((result) => {
							             	window.location.reload();
				             			})
				             	}
				             }
						})
				  } else if (result.isDenied) {
				    Swal.fire('취소되었습니다.', '', 'info')
				  }
				})
		});
		
	});
</script>
