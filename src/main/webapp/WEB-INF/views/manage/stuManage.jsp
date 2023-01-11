<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
function fn_add(data){
	
	$("#stuImg").attr("src", "/upload"+data.stuPic);
	$("#stuNo").attr("value", data.stuNo);
	$("#stuNm").attr("value", data.stuNm);
	$("#stuNme").attr("value", data.stuNme);
	$('#colCd').val(data.colCd).prop("selected",true).trigger('change');
	$('#department').val(data.depCd).prop("selected",true);
	$('#stuYr').val(data.stuYr).prop("selected",true);
	$('#stuSem').val(data.stuSem).prop("selected",true);
	$("#stuBir").attr("value", data.stuBir);
	$("#stuTel").attr("value", data.stuTel);
	//id로 select 선택하고 value가 'test2'인 option 선택
	$('#stuBankCd').val(data.stuBankCd).prop("selected",true);
	$("#stuTel").attr("value", data.stuTel);
	$("#stuDepo").attr("value", data.stuDepo);
	$("#stuAct").attr("value", data.stuAct);
	$("#stuZip").attr("value", data.stuZip);
	$("#stuAddr1").attr("value", data.stuAddr1);
	$("#stuAddr2").attr("value", data.stuAddr2);
// 	$("#pic").html(data.stuPic)
	
}

$(function(){
	
	$("input[type='file']").on('change',function(){
	    $(this).next('.custom-file-label').html(event.target.files[0].name);
	});
	
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";
	
	$(document).on("click", ".btnDetail", function(){
// 		alert("오나요?");
		
		let detailStu = $(this).val();
		let data = {"detailStu":detailStu}
		console.log("상세정보 가져왓 " + detailStu + " data 가져왓 " + JSON.stringify(data));
		
		$("#stuBtn1").css("display", "block");
		$("#stuBtn2").css("display", "none");
		$(".stu").attr("readonly", true);
		$(".stu").attr("disabled", true);
		
		$.ajax({
			type: 'post',
			url: '/manage/detailStu',
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			beforeSend:function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success :function(data){
				console.log("성공이라해주라 ", data.stuPic);
				
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
	
	$(document).ready(function () {
		$("#delete").on("click", function(){
			
			let stuNo = $("#stuNo").val();
			let data = {"stuNo":stuNo}
			console.log("학번 오나? " + stuNo + " data 오나?? " + JSON.stringify(data));
			
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
					url: '/manage/deleteStu',
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
				$("input[name='stuZip']").val(data.zonecode); // 우편번호 5자리
				$("input[name='stuAddr1']").val(data.address); // 주소
				$("input[name='stuAddr2']").val(data.buildingName); // 상세 주소
			}
		}).open();
	});
	
	$("#updateStu").on("click",function(){
		
// 		alert("오나요,,")
// 		$('input#stuPic')[0].files[0] 
		
		let stuNo = $("#stuNo").val();
		let stuYr = $("#stuYr").val();
		let stuSem = $("#stuSem").val();
		let stuNm = $("#stuNm").val();
		let stuNme = $("#stuNme").val();
		let stuTel = $("#stuTel").val();
		let stuZip = $("#stuZip").val();
		let stuAddr1 = $("#stuAddr1").val();
		let stuAddr2 = $("#stuAddr2").val();
		let stuBankCd = $("#stuBankCd").val();
		let stuDepo = $("#stuDepo").val();
		let stuAct = $("#stuAct").val();
		let stuBir = $("#stuBir").val();
		let depCd = $("#department").val();
		
		console.log("변수 잘 들어오나 ! stuNo : " + stuNo + " stuYr : " + stuYr + " stuSem : " + stuSem + " stuNm : " + stuNm + " stuNme : " + stuNme + 
				" stuTel : " + stuTel + " stuZip : " + stuZip + " stuAddr1 : " + stuAddr1 + " stuAddr2 : " + stuAddr2 + 
				" stuBankCd : " + stuBankCd + " stuDepo : " + stuDepo + " stuAct : " + stuAct + " stuBir : " + stuBir);
		
// 		let data = {
// 			"stuNo":stuNo,
// 			"stuYr":stuYr,
// 			"stuSem":stuSem,
// 			"stuNm":stuNm,
// 			"stuNme":stuNme,
// 			"stuTel":stuTel,
// 			"stuZip":stuZip,
// 			"stuAddr1":stuAddr1,
// 			"stuAddr2":stuAddr2,
// 			"stuBankCd":stuBankCd,
// 			"stuDepo":stuDepo,
// 			"stuAct":stuAct,
// 			"stuBir":stuBir,
// 			"depCd":depCd,
// 			"stuPic":stuPic
// 		}
		
// 		console.log("data 들어오나 함 보꽈 ! " + JSON.stringify(data))
		
		let formData = new FormData();
		let inputFile = $("input[name='stuPic']");
		let files = inputFile[0].files;
		
		console.log("files : " + files);
		
		//가상폼인 formdata에 각각의 이미지를 넣쟈
		for(let i=0;i<files.length;i++){
			//uploadFile[]
			formData.append("uploadFile",files[i]);
		}
		
		formData.append("stuNo",stuNo);
		formData.append("stuYr",stuYr);
		formData.append("stuSem",stuSem);
		formData.append("stuNm",stuNm);
		formData.append("stuNme",stuNme);
		formData.append("stuTel",stuTel);
		formData.append("stuZip",stuZip);
		formData.append("stuAddr1",stuAddr1);
		formData.append("stuAddr2",stuAddr2);
		formData.append("stuBankCd",stuBankCd);
		formData.append("stuDepo",stuDepo);
		formData.append("stuAct",stuAct);
		formData.append("stuBir",stuBir);
		formData.append("depCd",depCd);
		
		
		$.ajax({
			url:"/manage/updateStu",
			processData:false,
			contentType:false,
			data:formData,
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader(header, token);
			},
			type:"post",
			success:function(result){
				console.log("파일 업로드 성공인가요 ? result : " + result);
				
				Swal.fire({
		            icon: 'success',                         // Alert 타입
		            title: '수정 성공!',         // Alert 제목
		            text: '정상적으로 수정되었습니다.',  // Alert 내용
		        })
				
				fn_add(result);
				
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
				$("#department").html(str);
			}
		});
		
	});
});
</script>

<!-- 학생 검색 -->
<div class="row mt-3 ml-1">
	<div class="form-group col-2 pl-0">
		<select id="college" class="select2bs4 select2-hidden-accessible" style="width: 100%;" aria-hidden="true">
			<option value="">단과대학</option>
			<c:forEach var="college" items="${collegeList}">
				<option value="${college.colCd}">${college.colNm}</option>
			</c:forEach>
		</select>
	</div>
	<div class="form-group col-2">
		<select id="department" class="select2bs4 select2-hidden-accessible" style="width: 100%;" aria-hidden="true">
			<option value="">학과</option>
		</select>
	</div>
	<div class="form-group col-2 ">
		<select id="yr" class="select2bs4 select2-hidden-accessible" style="width: 100%;" aria-hidden="true">
			<option value="">입학 연도</option>
			<option value="2023">2023</option>
			<option value="2022">2022</option>
			<option value="2021">2021</option>
			<option value="2020">2020</option>
			<option value="2019">2019</option>
			<option value="2012">2012</option>
		</select>
	</div>
	<div class="form-gruop col-3">
		<input id="name" type="text" class="form-control" placeholder="학생 이름" />
	</div>

	<div class="form-group col-1">
		<button id="search" type="button" class="btn btn-primary" value="">검색</button>
	</div>
</div>

<!-- 학생목록 -->
<div style="text-align:center; overflow:scroll; height:600px">
	<table class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
		<thead>
			<tr class="text-center">
				<th width="3%">No</th>
				<th width="10%">학번</th>
				<th width="10%">이름</th>
				<th width="15%">단과대학</th>
				<th width="10%">학과</th>
				<th width="10%">담당교수</th>
				<th width="12%">학생 상세</th>
			</tr>
		</thead>
		<tbody id="stuList">
			<c:forEach var="list" items="${list}" varStatus="stat">
				<tr>
					<td>${stat.count}</td>
					<td class="detailStu">${list.stuNo}</td>
					<td>
						<div class="image">
							<img src="/upload${list.stuPic}" class="img-circle" alt="User Image" style="max-width: 20px;"> 
							${list.stuNm}
						</div>
					</td>
					<td>${list.colNm}</td>
					<td>${list.depNm}</td>
					<td>${list.empNm}</td>
					<td>
						<button class="btn btn-block btn-outline-secondary btn-sm btnDetail"
							value="${list.stuNo}" data-toggle="modal" data-target="#modal-lg">상세</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<!-- 모달 -->
<div class="modal fade" id="modal-lg" style="display: none;"aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">학생 상세 정보</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="col-sm-12">
					<div class="container-fluid">
						<div class="row">
							<div class="col-4" style="text-align:center;">
								<img class="img-thumbnail" width="180px;" height="250px;" id="stuImg">
							</div>
							<div class="col-8">
								<div class="container">
									<div class="row mt-1">
										<div class="col-6">
											<label for="stuNo" class="form-label">학번</label> 
											<input type="text" class="form-control" id="stuNo" name="stuNo" readonly />
										</div>
										<div class="col-6">
											<label for="stuNm" class="form-label">이름</label> 
											<input type="text" class="form-control stu" id="stuNm" name="stuNm" readonly />
										</div>
									</div>
									<div class="row mt-2" style="height:75px;">
										<div class="form-group col-6">
											<label for="colCd" class="form-label">단과대학</label> <select
												id="colCd" class="form-control stu" disabled>
												<option value="0">단과대학</option>
												<c:forEach var="college" items="${collegeList}">
													<option value="${college.colCd}">${college.colNm}</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-6">
											<label for="department" class="form-label">학과</label> <select
												id="department" class="form-control stu" disabled>
												<option value="">학과</option>
											</select>
										</div>
									</div>
									<div class="row" style="height:28px;">
										<div class="col-5">
											<label for="stuPic" class="form-label">사진 변경</label>
										</div>
									</div>
									<div class="row" style="margin-left:0px;">
										<div class="custom-file col-9">
											<input type="file" class="custom-file-input stu" id="stuPic" name="stuPic" disabled> 
											<label class="custom-file-label" for="stuPic">Choose file</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-3 mb-2">
						<div class="col-4">
							<label for="stuNme" class="form-label">영문 이름</label> 
							<input type="text" class="form-control stu" id="stuNme" name="stuNme" readonly />
						</div>
						<div class="col-4">
							<label>학년</label> <select class="form-control stu" id="stuYr"
								name="stuYr" disabled>
								<option value="1">1학년</option>
								<option value="2">2학년</option>
								<option value="3">3학년</option>
								<option value="4">4학년</option>
								<option value="5">5학년</option>
								<option value="6">6학년</option>
							</select>
						</div>
						<div class="col-4">
							<label>학기</label> <select class="form-control stu"
								id="stuSem" name="stuSem" disabled>
								<option value="1">1학기</option>
								<option value="2">2학기</option>
							</select>
						</div>
					</div>
					<div class="row mt-3 mb-2">
						<div class="col-4">
							<label for="stuZip" class="form-label">우편번호</label>
							<div class="input-group">
								<input type="text" class="form-control stu" id="stuZip"
									name="stuZip" readonly />
								<div class="input-group-append">
									<button type="button" class="btn btn-default"
										id="btnZipCode">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</div>
						<div class="col-4">
							<label for="stuBir" class="form-label">생년월일</label> <input
								type="text" class="form-control stu" id="stuBir"
								name="stuBir" readonly />
						</div>
						<div class="col-4">
							<label for="stuTel" class="form-label">전화번호</label> <input
								type="text" class="form-control stu" id="stuTel"
								name="stuTel" readonly />
						</div>
					</div>
					<div class="row mt-3 mb-2">
						<div class="col-6" style="">
							<label for="stuAddr1" class="form-label">기본주소</label> <input
								type="text" class="form-control stu" id="stuAddr1"
								name="stuAddr1" readonly />
						</div>
						<div class="col-6">
							<label for="stuAddr2" class="form-label">상세주소</label> <input
								type="text" class="form-control stu" id="stuAddr2"
								name="stuAddr2" readonly />
						</div>
					</div>
					<div class="row mt-3 mb-2">
						<div class="col-4">
							<div class="form-group">
								<label>은행</label> <select class="form-control stu"
									id="stuBankCd" name="stuBankCd" disabled>
									<c:forEach var="detail" items="#{commonDetailList}">
										<option value="${detail.comdCd}">${detail.comdNm}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-3">
							<label for="stuDepo" class="form-label">예금주</label> <input
								type="text" class="form-control stu" id="stuDepo"
								name="stuDepo" readonly />
						</div>
						<div class="col-5">
							<label for="stuAct" class="form-label">계좌번호</label> <input
								type="text" class="form-control stu" id="stuAct"
								name="stuAct" readonly />
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer justify-content-align">
				<div id="stuBtn1" style="display: none">
					<button type="button" class="btn btn-outline-warning" id="edit">수정</button>
					<button type="button" id="delete" class="btn btn-outline-danger" style="display: none">삭제</button>
				</div>
				<div id="stuBtn2" style="display: none">
					<button type="button" id="updateStu" class="btn btn-outline-success">확인</button>
					<button type="button" id="cancel" class="btn btn-outline-secondary">취소</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="/resources/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/adminlte/plugins/select2/js/select2.full.min.js"></script>
<!-- <script src="/resources/adminlte/dist/js/adminlte.min.js"></script> -->
<script src="/resources/adminlte/dist/js/demo.js"></script>
<script type="text/javascript">

var header = "${_csrf.headerName}";
var token = "${_csrf.token}";

$(function() {
	//Initialize Select2 Elements
	$('.select2').select2();

	//Initialize Select2 Elements
	$('.select2bs4').select2({
		theme : 'bootstrap4'
	});

	$("#search").on("click",loadSearchStuList);
	
	$("#college").on("change",function(){
		
		let data = {
				colCd : this.value
		};
		
		$.ajax({
			url:"/student/lecture/departmentByCollege",
			type:"get",
			data:data,
			contentType : "application/json;utf-8",
			success:function(result){
				let str = "";
				console.log(result);
				if(!result.length){
					str += "<option value=''>학과</option>";
					str += "<option value=''>학과가 없습니다</option>";
				} else{
					str += "<option value=''>학과</option>";
					$.each(result,function(p_inx, p_val){
						str += `<option value='\${p_val.depNm}'>\${p_val.depNm}</option>`;
					});
				}
				$("#department").html(str);
			}
		});
		
	});
	
	loadSearchStuList();
});

function loadSearchStuList(){
	
	let college = $("#college").val();
	let department = $("#department").val();
	let yr = $("#yr").val();
	let name = $("#name").val();
	
	
	let data = {
		colNm : college,
		depNm :  department,
		stuNo : yr,
		stuNm : name
	};


	$.ajax({
		url : "/manage/stuSearch",
		type : "post",
		data : JSON.stringify(data),
		contentType : "application/json; charset=utf-8",
		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success : function(result) {
			$("#stuList").html("");
			let str = "";
			
// 			console.log("result" + result);
			
			if(result.length == 0){
				str = "<tr class='text-center p-0'>";
				str += "<td colspan='11'>검색된 학생이 없습니다.</td>";
				str += "</tr>";
				$("#stuList").html(str);
				return;
			}
			$.each(result,function(p_inx, student){
				
				str += `<tr class="text-center">
							<td>\${p_inx+1}</td>
							<td>\${student.stuNo}</td>
							<td>
								<div class="image">
									\${student.stuNm}
								</div>
							</td>
							<td>\${student.colNm}</td>
							<td>\${student.depNm}</td>
							<td>\${student.empNm}</td>
							<td>
								<button class="btn btn-block btn-outline-secondary btn-sm btnDetail"
									value="\${student.stuNo}" data-toggle="modal" data-target="#modal-lg">상세</button>
							</td>
						</tr>`
			});
			$("#stuList").append(str);
		}
	});
}

</script>