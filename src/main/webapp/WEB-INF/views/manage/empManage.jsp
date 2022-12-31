<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
function fn_add(data){
	
	$("#empImg").attr("src", "/upload"+data.empPic);
	$("#empNo").attr("value", data.empNo);
	$("#empNm").attr("value", data.empNm);
	$("#empNme").attr("value", data.empNme);
	$("#empBir").attr("value", data.empBir);
	$("#empTel").attr("value", data.empTel);
	$("#empTel2").attr("value", data.empTel2);
	$("#empJoin").attr("value", data.empJoin);
	//id로 select 선택하고 value가 'test2'인 option 선택
	$('#empDiv').val(data.empDiv).prop("selected",true);
	$('#empPos').val(data.empPos).prop("selected",true);
	$('#proPos').val(data.proPos).prop("selected",true);
	$('#colCd').val(data.colCd).prop("selected",true).trigger('change');
	$('#depCd').val(data.depCd).prop("selected",true);
	$('#empBankCd').val(data.empBankCd).prop("selected",true);
	$("#empDepo").attr("value", data.empDepo);
	$("#empAct").attr("value", data.empAct);
	$("#empZip").attr("value", data.empZip);
	$("#empAddr1").attr("value", data.empAddr1);
	$("#empAddr2").attr("value", data.empAddr2);
// 	$("#pic").html(data.stuPic)
	
}

$(function(){
	
	$("input[type='file']").on('change',function(){
	    $(this).next('.custom-file-label').html(event.target.files[0].name);
	});
	
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";
	
	$(".btnDetail").on("click", function(){
		
		let empNo = $(this).val();
		let data = {"empNo":empNo}
		console.log("상세정보 가져왓 " + empNo + " data 가져왓 " + JSON.stringify(data));
		
		$("#stuBtn1").css("display", "block");
		$("#stuBtn2").css("display", "none");
		$(".stu").attr("readonly", true);
		$(".stu").attr("disabled", true);
		
		$.ajax({
			type: 'post',
			url: '/manage/detailEmp',
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			beforeSend:function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success :function(data){
				console.log("성공이라해주라 ", data.empPos + "  입사일은 ? ", data.empJoin);
				
				if(data.empPos != 'E_POS007' && data.empPos != 'E_POS008'){
					$(".pro").css("display", "none");
					$(".modal-body").css("height", 620);
				}else{
					$(".pro").css("display", "flex");
					$(".modal-body").css("height", 730);
				}
				
				$("#stuBtn1").css("display", "block");
				fn_add(data);
				
			},
			error:function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
		
	});
	
	$("#edit").on("click", function(){
		
		$("#stuBtn2").css("display", "block");
		$("#stuBtn1").css("display", "none");
		
		$(".stu").removeAttr("readonly");
		$(".stu").removeAttr("disabled");
		
		
	});
	
	$("#cancel").on("click", function(){
		$("#stuBtn1").css("display", "block");
		$("#stuBtn2").css("display", "none");
		
		$(".stu").attr("readonly", true);
		$(".stu").attr("disabled", true);
		
	});
	
	$().ready(function () {
		$("#delete").on("click", function(){
			
			let empNo = $("#empNo").val();
			let data = {"empNo":empNo}
			console.log("학번 오나? " + empNo + " data 오나?? " + JSON.stringify(data));
			
		 Swal.fire({
	            title: '정말로 삭제 하시겠습니까?',
	            text: "한번 삭제한 내용은 되돌릴 수 없습니다.",
	            icon: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '삭제',
	            cancelButtonText: '취소'
		 }).then(function(dlt) {
			if(dlt.isConfirmed){
				$.ajax({
					type: 'post',
					url: '/manage/deleteEmp',
					contentType:"application/json;charset=utf-8",
					data:JSON.stringify(data),
					beforeSend:function(xhr){
						xhr.setRequestHeader(header, token);
					},
					success :function(data){
						console.log("delete성공이라해주라 ", data);
						
		                Swal.fire(
		                    '삭제 완료',
		                    '정상적으로 삭제 되었습니다.',
		                    'success'
		                ).then(function(){
				        	window.location.reload(true);			        	
				        });
			            
					},
					error:function(request, status, error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						 Swal.fire(
						      	"삭제 실패",
						        "에러 났어요!", // had a missing comma
						        "error"
						      )
					}
					
					});
				}
	        });
		});
		
	});
	
	$("#btnZipCode").on("click",function(){
		alert("하이루");
		new daum.Postcode({
			oncomplete:function(data){
				$("input[name='empZip']").val(data.zonecode); // 우편번호 5자리
				$("input[name='empAddr1']").val(data.address); // 주소
				$("input[name='empAddr2']").val(data.buildingName); // 상세 주소
			}
		}).open();
	});
	
	$("#updateEmp").on("click",function(){
		
// 		alert("오나요,,")
// 		$('input#stuPic')[0].files[0] 
		
		let empNo = $("#empNo").val();
		let empNm = $("#empNm").val();
		let empNme = $("#empNme").val();
		let empBir = $("#empBir").val();
		let empTel = $("#empTel").val();
		let empTel2 = $("#empTel2").val();
		let empJoin = $("#empJoin").val();
		let empDiv = $("#empDiv").val();
		let empPos = $("#empPos").val();
		let proPos = $("#proPos").val();
		let colCd = $("#colCd").val();
		let depCd = $("#depCd").val();
		let empBankCd = $("#empBankCd").val();
		let empDepo = $("#empDepo").val();
		let empAct = $("#empAct").val();
		let empZip = $("#empZip").val();
		let empAddr1 = $("#empAddr1").val();
		let empAddr2 = $("#empAddr2").val();
		
		console.log("변수 잘 들어오나 ! empNo : " + empNo + " empNm : " + empNm + " empNme : " + empNme + " empBir : " + empBir + " empTel : " + empTel + 
				" empTel2 : " + empTel2 + " empJoin : " + empJoin + " empDiv : " + empDiv + " empPos : " + empPos + 
				" proPos : " + proPos + " colCd : " + colCd + " depCd : " + depCd + " empBankCd : " + empBankCd + " empDepo : " + empDepo + " empAct : " + empAct
				+ " empZip : " + empZip + " empAddr1 : " + empAddr1 + " empAddr2 : " + empAddr2);
		
		let formData = new FormData();
		let inputFile = $("input[name='empPic']");
		let files = inputFile[0].files;
		
		console.log("files : " + files);
		
		//가상폼인 formdata에 각각의 이미지를 넣쟈
		for(let i=0;i<files.length;i++){
			//uploadFile[]
			formData.append("uploadFile",files[i]);
		}
		
		formData.append("empNo",empNo);
		formData.append("empNm",empNm);
		formData.append("empNme",empNme);
		formData.append("empBir",empBir);
		formData.append("empTel",empTel);
		formData.append("empTel2",empTel2);
		formData.append("empJoin",empJoin);
		formData.append("empDiv",empDiv);
		formData.append("empPos",empPos);
		formData.append("proPos",proPos);
		formData.append("colCd",colCd);
		formData.append("depCd",depCd);
		formData.append("empBankCd",empBankCd);
		formData.append("empDepo",empDepo);
		formData.append("empAct",empAct);
		formData.append("empZip",empZip);
		formData.append("empAddr1",empAddr1);
		formData.append("empAddr2",empAddr2);
		
		
		$.ajax({
			url:"/manage/updateEmp",
			processData:false,
			contentType:false,
			data:formData,
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader(header, token);
			},
			type:"post",
			success:function(data){
				console.log("파일 업로드 성공인가요 ? data : " + data);
				
				Swal.fire({
		            icon: 'success',                         // Alert 타입
		            title: '수정 성공!',         // Alert 제목
		            text: '정상적으로 수정되었습니다.',  // Alert 내용
		        })
				
				fn_add(data);
				
				$("#stuBtn1").css("display", "block");
				$("#stuBtn2").css("display", "none");
				
				$(".stu").attr("readonly", true);
				$(".stu").attr("disabled", true);
				
			}
		});
		
		
	});
	
	$("#colCd").on("change",function(){
		
		let data = {
				colCd : this.value
		};
		
		$.ajax({
			url:"/student/lectureApply/departmentByCollege",
			type:"get",
			data:data,
			contentType : "application/json;utf-8",
			async:false,
			success:function(result){
				let str = "";
				console.log(result);
				if(!result.length){
					str += "<option value=''>학과</option>";
					str += "<option value=''>학과가 없습니다</option>";
				} else{
					str += "<option value=''>학과</option>";
					$.each(result,function(p_inx, p_val){
						str += `<option value='\${p_val.depCd}'>\${p_val.depNm}</option>`;
					});
				}
				$("#depCd").html(str);
			}
		});
		
	});
	
	
});


</script>

<div class="row">
	<div class="alert alert-light col" role="alert">
		<!-- 게시판 안내사항 -->
		<p>
			<strong>
			교직원들의 상세 내역을 볼 수 있습니다.
			</strong>
		</p>
	</div>
</div>

<div style="text-align:center;">
	<table class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
	<thead>
		<tr>
			<th width="3%">No</th>
			<th width="10%">교번</th>
			<th width="10%">이름</th>
			<th width="10%">부서</th>
			<th width="10%">직책</th>
			<th width="10%">상세</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="employeeList" items="${employeeList}" varStatus="stat">
			<tr>
				<td>${stat.count}</td>
				<td>${employeeList.empNo}</td>
				<td>
					<div class="image">
						<img src="/upload${employeeList.empPic}" class="img-circle" alt="User Image" style="max-width:20px;">
						${employeeList.empNm}
					</div> 
				</td>
				<td>${employeeList.empDiv}</td>
				<td>${employeeList.empPos}</td>
				<td>
					<button class="btn btn-block btn-outline-secondary btn-sm btnDetail" 
						value="${employeeList.empNo}" data-toggle="modal" data-target="#modal-lg">교직원 상세</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>

<!-- 모달 -->
<div class="modal fade" id="modal-lg" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">교직원 상세</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="col-sm-12">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-4">
								<img class="img-thumbnail" width="200px;" height="300px;" id="empImg">
							</div>
							<div class="col-md-8">
								<div class="container">
									<div class="row mt-1 ">
										<div class="col-6">
											<label for="empNo" class="form-label">교번</label> 
											<input type="text" class="form-control" id="empNo" name="empNo" readonly />
										</div>
									</div>
									<div class="row mt-2" style="height:75px;">
										<div class="col-6">
											<label for="empNm" class="form-label">이름</label> <input
												type="text" class="form-control stu" id="empNm"
												name="empNm" readonly />
										</div>
										<div class="col-6">
											<label for="empNme" class="form-label">영문 이름</label> <input
												type="text" class="form-control stu" id="empNme"
												name="empNme" readonly />
										</div>
									</div>
									<div class="row mt-2" style="height:75px;">
										<div class="col-6">
											<label>부서</label> 
											<select class="form-control stu" id="empDiv" name="empDiv" disabled>
												<c:forEach var="division" items="${division}">
													<option value="${division.comdCd}">${division.comdNm}</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-6">
											<label>직책</label> 
											<select class="form-control stu" id="empPos" name="empPos" disabled>
												<c:forEach var="ePosition" items="${ePosition}">
													<option value="${ePosition.comdCd}">${ePosition.comdNm}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-3 mb-2 pro" >
						<div class="col-4">
							<label>보직</label> <select class="form-control stu" id="proPos"
								name="proPos" disabled>
								<c:forEach var="pPosition" items="${pPosition}">
									<option value="${pPosition.comdCd}">${pPosition.comdNm}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-4">
							<label for="colCd" class="form-label">단과대학</label> <select
								class="form-control stu" id="colCd" name="colCd" disabled>
								<c:forEach var="college" items="${collegeList}">
									<option value="${college.colCd}">${college.colNm}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-4">
							<label for="depCd" class="form-label">학과</label> <select
								id="depCd" name="depCd" class="form-control stu" disabled>
								<option value="">학과</option>
							</select>
						</div>
					</div>
					<div class="row mt-3 mb-2">
						<div class="col-4">
							<label for="empBir" class="form-label">생년월일</label> <input
								type="text" class="form-control stu" id="empBir"
								name="empBir" readonly />
						</div>
						<div class="col-4">
							<label for="empTel" class="form-label">연락처</label> <input
								type="text" class="form-control stu" id="empTel"
								name="empTel" readonly />
						</div>
						<div class="col-4">
							<label for="empTel2" class="form-label">비상 연락처</label> <input
								type="text" class="form-control stu" id="empTel2"
								name="empTel2" readonly />
						</div>
					</div>
					<div class="row mt-3 mb-2">
						<div class="col-4">
							<label>은행</label> <select class="form-control stu"
								id="empBankCd" name="empBankCd" disabled>
								<c:forEach var="bank" items="${bank}">
									<option value="${bank.comdCd}">${bank.comdNm}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-4">
							<label for="empDepo" class="form-label">예금주</label> <input
								type="text" class="form-control stu" id="empDepo"
								name="empDepo" readonly />
						</div>
						<div class="col-4">
							<label for="empAct" class="form-label">계좌번호</label> <input
								type="text" class="form-control stu" id="empAct"
								name="empAct" readonly />
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-4">
							<label for="empZip" class="form-label">우편번호</label>
							<div class="input-group">
								<input type="text" class="form-control stu" id="empZip"
									name="empZip" readonly />
								<div class="input-group-append">
									<button type="button" class="btn btn-default"
										id="btnZipCode">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</div>
						<div class="col-4">
							<label for="empJoin" class="form-label">입사일</label> <input
								type="date" class="form-control stu" id="empJoin"
								name="empJoin" readonly />
						</div>
						<div class="col-4">
							<div class="row">
								<div class="col-6">
									<label for="empPic" class="form-label">사진 등록</label>
								</div>
							</div>
							<div class="row" style="margin-left: 0px;">
								<div class="custom-file col-12">
									<input type="file" class="custom-file-input stu" id="empPic"
										name="empPic" disabled /> <label class="custom-file-label"
										for="empPic">Choose file</label>
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-2 mb-5">
						<div class="col-6">
							<label for="empAddr1" class="form-label">기본주소</label> <input
								type="text" class="form-control stu" id="empAddr1"
								name="empAddr1" readonly />
						</div>
						<div class="col-6">
							<label for="empAddr2" class="form-label">상세주소</label> <input
								type="text" class="form-control stu" id="empAddr2"
								name="empAddr2" readonly />
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer justify-content-align">
				<div id="stuBtn1" align="right" style="display: none">
					<button type="button" class="btn btn-outline-warning" id="edit">수정</button>
					<button type="button" id="delete" class="btn btn-outline-danger">삭제</button>
				</div>
				<div id="stuBtn2" align="right" style="display: none">
					<button type="button" id="updateEmp"
						class="btn btn-outline-success">확인</button>
					<button type="button" id="cancel" class="btn btn-outline-danger">취소</button>
				</div>
			</div>
		</div>
	</div>
</div>
