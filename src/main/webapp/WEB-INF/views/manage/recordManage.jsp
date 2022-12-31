<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


function loadSearchList(){
	
	let record = $("#record").val();
	let approval = $("#approval").val();
	let yr = $("#yr").val();
	let sem = $("#sem").val();
	let name = $("#name").val();
	
	
	let data = {
		rgbCd : record,
		recYn : approval,
		recYr : yr,
		recSem : sem,
		stuNm : name
	};


	$.ajax({
		url : "/manage/recordSearch",
		type : "post",
		data : JSON.stringify(data),
		contentType : "application/json; charset=utf-8",
		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success : function(result) {
			$("#list").html("");
			let str = "";
			
// 			console.log("result" + result);
			
			if(result.length == 0){
				str = "<tr class='text-center p-0'>";
				str += "<td colspan='11'>검색된 내용이 없습니다.</td>";
				str += "</tr>";
				$("#list").html(str);
				return;
			}
			$.each(result,function(index, student){
				
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
						<td>상담여부?</td>
						<td id="YOrN\${index}">\${student.recYn}</td>
						<td><button alt="\${student.recYn}"
								class="btn btn-block btn-outline-secondary btn-sm btnDetail"
								value="\${student.recCd}" data-toggle="modal" data-target="#modal-lg" >신청 상세</button></td>
					</tr> `;
					
			});
			$("#list").append(str);
			
			for(let i=0;i<result.length; i++){
				if($("#YOrN"+i).html()=="승인"){
					$("#YOrN"+i).css("color", "blue");
				}else if($("#YOrN"+i).html()=="반려"){
					$("#YOrN"+i).css("color", "red");
				}
			}
		}
	});
}

$(function(){
	
	loadSearchList();
	
	$("#search").on("click",loadSearchList);
	
	$(document).on("click", ".btnDetail", function(){
		
		let recCd = $(this).val();
		let data = {"recCd":recCd}
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

<!-- 학생 검색 -->
<div class="row mt-3 ml-1">
	<div class="form-group col-2 pl-0">
		<select id="record" class="form-control" style="width: 100%;">
			<option value="">학적 구분</option>
			<option value="RCD001">휴학</option>
			<option value="RCD003">복학</option>
			<option value="RCD004">자퇴</option>
			<option value="RCD005">졸업</option>
		</select>
	</div>
	<div class="form-group col-2">
		<select id="approval" class="form-control" style="width: 100%;">
			<option value="">승인 여부</option>
			<option value="AP001">승인</option>
			<option value="AP002">승인대기</option>
			<option value="AP003">반려</option>
		</select>
	</div>
	<div class="form-group col-2 ">
		<select id="yr" class="form-control" style="width: 100%;">
			<option value="">신청연도</option>
			<option value="2022">2022</option>
			<option value="2021">2021</option>
			<option value="2020">2020</option>
			<option value="2019">2019</option>
			<option value="2012">2012</option>
		</select>
	</div>
	<div class="form-group col-2 ">
		<select id="sem" class="form-control" style="width: 100%;">
			<option value="">신청 학기</option>
			<option value="1">1</option>
			<option value="2">2</option>
		</select>
	</div>
	<div class="form-gruop col-3">
		<input id="name" type="text" class="form-control" placeholder="학생 이름" />
	</div>

	<div class="form-group col-1">
		<button id="search" type="button" class="btn btn-primary" value="">검색</button>
	</div>
</div>

<div style="text-align:center;">
	<table class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
		<thead>
			<tr class="text-center">
				<th width="3%">No</th>
				<th width="10%">학번</th>
				<th width="10%">이름</th>
				<th width="10%">신청 연도/학기</th>
				<th width="10%">신청구분</th>
				<th width="10%">상담여부</th>
				<th width="10%">승인여부</th>
				<th width="10%">상세</th>
			</tr>
		</thead>
		<tbody id="list">
			
		</tbody>
	</table>
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

