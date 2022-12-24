<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장학금 목록</title>
</head>
<body>
	<div>
		<i class="mdi mdi-home" style="font-size: 1.3em"></i>
		<i class="dripicons-chevron-right"></i>등록 및 장학 
		<i class="dripicons-chevron-right"></i><span>장학</span> 
		<i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">장학금 목록</span>
	</div>
	<br>
	<p id="stuPaymentListSelect"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;장학금 목록</p>
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
									장학금명</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Platform(s): activate to sort column ascending">
									장학금액</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Engine version: activate to sort column ascending">
									수여인원</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending">
									상세설명</th>
							</tr>
						</thead>
						<tbody id="SchList">
						</tbody>
					</table>
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
	
	$.ajax({
		url:"/scholarship/scholarshipInquiry",
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
				
				let sclAmt = data[i].sclAmt;
				let numWithCommas = addCommas(sclAmt);
				console.log(numWithCommas);
				
				str += `
					<tr>
					<td>\${i+1}</td>
					<td>\${data[i].sclNm}</td>
					<td>\${numWithCommas}</td>
					<td>\${data[i].sclCap}</td>
					<td>\${data[i].sclDetail}</td>
					</tr>
				`
			}
			$("#SchList").html(str);
			
			//콤마찍긔
			function addCommas(num) {
			  return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
		}
	});
</script>
</html>