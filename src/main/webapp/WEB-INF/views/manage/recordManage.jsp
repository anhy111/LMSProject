<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">

let header = "${_csrf.headerName}";
let token = "${_csrf.token}";

function fn_add(data){
	
	$("#recYn").attr("value", data.recYn);
	$("#recPer").attr("value", data.recPer + "개월");
	$("#recDt").attr("value", data.recDt);
	$("#recYr").attr("value", data.recYr + "년 " + data.recSem + "학기");
	$("#depNm").attr("value", data.depNm);
	$("#rgbCd").attr("value", data.rgbCd);
	$("#stuNo").attr("value", data.stuNo);
	$("#stuNm").attr("value", data.stuNm);
	$("#stuTel").attr("value", data.stuTel);
	$("#recRsn").html(data.recRsn);
	
}

function fn_list(){
	
	$.ajax({
		type: 'get',
		url: '/manage/recordList',
		beforeSend:function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success :function(data){
// 			console.log("성공이라해주라 ", data);
			
			let str = "";
			
			$.each(data,function(index,student){
// 				console.log("index는?? " + index + " student는?? ", student);
				
				str += `
				<tr>
					<td class="dtr-control sorting_1" tabindex="0" style="text-align:center;">\${index+1}</td>
					<td class="detailStu">\${student.stuNo}</td>
					<td>\${student.stuNm}</td>
					<td>
						<div class="image">
							\${student.recYr}년 \${student.recSem}학기
						</div>
					</td>
					<td>\${student.rgbCd}</td>
					<td id="YOrN\${index}">\${student.recYn}</td>
					<td><button alt="\${student.recYn}"
							class="btn btn-block btn-outline-info btn-sm btnDetail"
							value="\${student.stuNo}" data-toggle="modal" data-target="#modal-lg" >상세</button></td>
				</tr> `;
				
			});
			
			$("#list").html(str);
			
			for(let i=0;i<data.length; i++){
				if($("#YOrN"+i).html()=="승인"){
					$("#YOrN"+i).css("color", "blue");
				}else if($("#YOrN"+i).html()=="반려"){
					$("#YOrN"+i).css("color", "red");
				}
			}
			
			
		},
		error:function(request, status, error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
	
}

$(function(){
	
	fn_list();
	
	$(document).on("click", ".btnDetail", function(){
		
		let stuNo = $(this).val();
		let data = {"stuNo":stuNo}
		let alt = $(this).attr("alt");
		
		
		if(alt == "승인"){
			$("#stuBtn1").css("display", "none");
			$("#stuBtn2").css("display", "block");
			$("#stuBtn3").css("display", "none");
		}else if(alt == "승인대기"){
			$("#stuBtn1").css("display", "block");
			$("#stuBtn2").css("display", "none");
			$("#stuBtn3").css("display", "none");
		}else if(alt == "반려"){
			$("#stuBtn1").css("display", "none");
			$("#stuBtn2").css("display", "none");
			$("#stuBtn3").css("display", "block");
		}
		
		
		$.ajax({
			type: 'post',
			url: '/manage/recordManagePost',
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			beforeSend:function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success :function(data){
// 				console.log("성공이라해주라 ", data.stuNo);
				
				fn_add(data)
				
			},
			error:function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
		
	});
	
	$("#Approval").on("click", function(){
		
		let Yn = $(this).val();
		let stuNo = $("#stuNo").val();
		let recRej = ""
		let data = {
				"Yn":Yn,
				"stuNo":stuNo,
				"recRej":recRej
		}
		console.log("예스or노?? 1이면승인 3면반려 2면승인대기=> " + Yn + " stuNo는 ?? " + stuNo + " data 가져왓 " + JSON.stringify(data));
		
		
		 Swal.fire({
	            title: '승인 하시겠습니까?',
	            icon: 'question',
	            showCancelButton: true,
	            confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '승인',
	            cancelButtonText: '취소'
		 }).then(function(dlt) {
			if(dlt.isConfirmed){
				$.ajax({
					type: 'post',
					url: '/manage/yesOrNo',
					contentType:"application/json;charset=utf-8",
					data:JSON.stringify(data),
					beforeSend:function(xhr){
						xhr.setRequestHeader(header, token);
					},
					success :function(data){
						console.log("뇸뇸 ", data);
						
						 Swal.fire(
				                    '승인 완료',
				                    '정상적으로 승인 되었습니다.',
				                    'success'
				                )
						
						fn_add(data);
						
						$("#stuBtn1").css("display", "none");
						$("#stuBtn2").css("display", "block");
						
						fn_list();
						
					},
					error:function(request, status, error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
					
				});
			
			}
		
		 });
		
	});
	
	$("#reject").on("click", function(){
		
		let Yn = $(this).val();
		let stuNo = $("#stuNo").val();
		let recRej = $(".recRej").val();
		console.log("반려사유 들어와주라  " + recRej);
		
		let data = {
				"Yn":Yn,
				"stuNo":stuNo,
				"recRej":recRej
		}
		console.log("예스or노?? 1이면승인 3면반려 2면승인대기=> " + Yn + " stuNo는 ?? " + stuNo + " data 가져왓 " + JSON.stringify(data));
		
		$.ajax({
			type: 'post',
			url: '/manage/yesOrNo',
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			beforeSend:function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success :function(data){
				console.log("reject뇸뇸 ", data);
				
				Swal.fire(
	                    '반려 완료',
	                    '정상적으로 반려 되었습니다.',
	                    'success'
	                )
				
				fn_add(data);
				
				$("#stuBtn1").css("display", "none");
				$("#stuBtn3").css("display", "block");
				
				fn_list();
				$(".recRej").val("");
				$(".close").click();
				
			},
			error:function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
		
	});
	
	$(".cancel").on("click", function(){
		
		let Yn = $(this).val();
		let stuNo = $("#stuNo").val();
		let recRej = ""
		let data = {
				"Yn":Yn,
				"stuNo":stuNo,
				"recRej":recRej
		}
		console.log("예스or노?? 1이면승인 3면반려 2면승인대기=> " + Yn + " stuNo는 ?? " + stuNo + " data 가져왓 " + JSON.stringify(data));
		
		 Swal.fire({
	            title: '취소 하시겠습니까?',
	            text: "승인 대기 상태로 돌아갑니다.",
	            icon: 'question',
	            showCancelButton: true,
	            confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '확인',
	            cancelButtonText: '취소'
		 }).then(function(dlt) {
			 if(dlt.isConfirmed){
				$.ajax({
					type: 'post',
					url: '/manage/yesOrNo',
					contentType:"application/json;charset=utf-8",
					data:JSON.stringify(data),
					beforeSend:function(xhr){
						xhr.setRequestHeader(header, token);
					},
					success :function(data){
						console.log("reject뇸뇸 ", data);
						
						 Swal.fire(
				                    '취소 완료',
				                    '정상적으로 취소 되었습니다.',
				                    'success'
				                )
						
						fn_add(data);
						
						$("#stuBtn1").css("display", "block");
						$("#stuBtn3").css("display", "none");
						$("#stuBtn2").css("display", "none");
						
						fn_list();
						
					},
					error:function(request, status, error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
					
				});
				
			 }
		
		 });
		
	});
	
	$("#msg").on("click", function(){
		
		let stuNo = $("#stuNo").val();
		let data = {"stuNo":stuNo}
		console.log("stuNo넘어오냐고 " + stuNo);
		
		$.ajax({
			type: 'post',
			url: '/manage/recordManagePost',
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			beforeSend:function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success :function(data){
				
				$("#message").html(data.recRej);
				
			},
			error:function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
		
		
	});
	
	
});

</script>
<div class="row">
	<div class="col-sm-10 offset-1">
		<div class="card">
			<div class="card-header">
				<h3 class="card-title">휴복학 신청 관리</h3>
			</div>
	
			<div class="card-body">
				<div id="example1_wrapper"></div>
				<div class="row">
					<div class="col-sm-12">
						<table id="example1"
							class="table table-bordered table-striped dataTable dtr-inline"
							aria-describedby="example1_info">
							<thead>
								<tr>
									<th class="sorting sorting_asc" tabindex="0"
										aria-controls="example1" rowspan="1" colspan="1"
										aria-sort="ascending"
										aria-label="Rendering engine: activate to sort column descending">번호</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Browser: activate to sort column ascending">학번</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Platform(s): activate to sort column ascending">이름</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Engine version: activate to sort column ascending">신청 연도/학기</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="CSS grade: activate to sort column ascending">신청구분</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="CSS grade: activate to sort column ascending">승인구분</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="CSS grade: activate to sort column ascending">상세</th>
								</tr>
							</thead>
							<tbody id="list">
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 모달 -->
<!-- 상세정보확인 -->
<div class="modal fade" id="modal-lg" style="display:none;" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">상세 정보</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="col-md-11">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-11 offset-1">
								<div class="container">
									<div class="row mt-1 mb-2">
										<div class="col-5">
											<label for="recYn" class="form-label">승인여부</label> <input
												type="text" class="form-control stu" id="recYn"
												name="recYn" readonly />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-5">
											<label for="rgbCd" class="form-label">신청구분</label> <input
												type="text" class="form-control" id="rgbCd" name="rgbCd"
												readonly />
										</div>
										<div class="col-5 offset-1">
											<label for="recPer" class="form-label">신청기간</label> <input
												type="text" class="form-control stu" id="recPer"
												name="recPer" readonly />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-5">
											<label for="recDt" class="form-label">신청일자</label> <input
												type="text" class="form-control" id="recDt" name="recDt"
												readonly />
										</div>
										<div class="col-5 offset-1">
											<label for="recYr" class="form-label">신청 연도/학기</label> <input
												type="text" class="form-control stu" id="recYr"
												name="recYr" readonly />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-5">
											<label for="depNm" class="form-label">학과</label> <input
												type="text" class="form-control stu" id="depNm"
												name="depNm" readonly />
										</div>
										<div class="col-5 offset-1">
											<label for="stuNo" class="form-label">학번</label> <input
												type="text" class="form-control stu" id="stuNo"
												name="stuNo" readonly />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-5">
											<label for="stuNm" class="form-label">이름</label> <input
												type="text" class="form-control stu" id="stuNm"
												name="stuNm" readonly />
										</div>
										<div class="col-5 offset-1">
											<label for="stuTel" class="form-label">연락처</label> <input
												type="text" class="form-control stu" id="stuTel"
												name="stuTel" readonly />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-11">
											<label for="recRsn" class="form-label">신청사유</label>
											<textarea id="recRsn" name="recRsn" class="form-control stu" rows="7" readonly></textarea>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer justify-content-align">
					<div id="stuBtn1" align="right" style="display: none">
						<button type="button" id="Approval" value="AP001"
							class="btn btn-outline-warning">승인</button>
						<button type="button" class="btn btn-outline-danger"
							data-toggle="modal" data-target="#modal-default">반려</button>
					</div>
					<div id="stuBtn2" align="right" style="display: none">
						<button type="button" value="AP002"
							class="btn btn-outline-danger cancel">승인 취소</button>
					</div>
					<div id="stuBtn3" align="right" style="display: none">
						<button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#modal-default2" id="msg">반려 사유</button>
						<button type="button" value="AP002" class="btn btn-outline-danger cancel">반려 취소</button>
					</div>
			</div>
		</div>
	</div>
	<!-- 반려사유 입력 -->
	<div class="modal fade" id="modal-default" style="display:none; z-index:1041" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">반려</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<label for="recRej" class="col-form-label">반려 사유를 입력해주세요.</label>
						<textarea class="form-control recRej" rows="7"></textarea>
					</div>
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" id="reject" value="AP003" class="btn btn-block btn-danger">반려</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 반려사유확인 -->
	<div class="modal fade" id="modal-default2" style="display:none;z-index:1041" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">반려 사유</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<textarea class="form-control" id="message" rows="7" readonly></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
