<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<% 
Date nowTime = new Date();
SimpleDateFormat date = new SimpleDateFormat("yyyy년   MM월   dd일"); 

String name = String.valueOf(session.getAttribute("name"));
int depCd = (int)session.getAttribute("department");
%>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script src="/resources/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/adminlte/plugins/select2/js/select2.full.min.js"></script>
<script src="/resources/adminlte/dist/js/demo.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/schRcmd.css">
<link rel="stylesheet" type="text/css" href="/resources/css/dataTableTemplate.css">
<script type="text/javascript">

let header = "${_csrf.headerName}";
let token = "${_csrf.token}";

function fn_add(data){
	
	$("#stuImg").attr("src", "/upload"+data.stuPic);
	$("#stuNo").attr("value", data.stuNo);
	$(".stuNo").html(data.stuNo);
	$("#stuNm").attr("value", data.stuNm);
	$(".stuNm").html(data.stuNm);
	$("#stuNme").attr("value", data.stuNme);
	$('#colCd').val(data.colNm);
	$('#department').val(data.depNm);
	$('.depNm').html(data.depNm);
	$('#stuYr').val(data.stuYr);
	$('#stuSem').val(data.stuSem);
	$("#stuBir").attr("value", data.stuBir);
	//id로 select 선택하고 value가 'test2'인 option 선택
	$("#stuTel").attr("value", data.stuTel);
	$("#stuZip").attr("value", data.stuZip);
	$("#stuAddr1").attr("value", data.stuAddr1);
	$("#stuAddr2").attr("value", data.stuAddr2);
	$("#proNo").attr("value", data.proNo);
	
}

function loadSearchStuList(){
	
	let yr = $("#yr").val();
	let name = $("#name").val();
	let depCd = '${depCd}';
	
	
	let data = {
		stuNo : yr,
		stuNm : name,
		depCd : depCd
	};


	$.ajax({
		url : "/professor/myStuSearch",
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
			$.each(result,function(index, student){
				
				str += `<tr class="text-center">
							<td>\${index+1}</td>
							<td>\${student.stuNo}</td>
							<td>
								<div class="image">
									\${student.stuNm}
								</div>
							</td>
							<td>\${student.empNm}</td>
							<td>
								<button class="btn btn-block btn-outline-secondary btn-sm btnDetail"
									value="\${student.stuNo}" data-toggle="modal" data-target="#modal-lg">학생 상세</button>
							</td>
						</tr>`
			});
			$("#stuList").append(str);
			
		}
	});
}

$(function(){
	
	//Initialize Select2 Elements
	$('.select2').select2();

	//Initialize Select2 Elements
	$('.select2bs4').select2({
		theme : 'bootstrap4'
	});

	$("#search").on("click",loadSearchStuList);
	
	loadSearchStuList();
	
	$("input[type='file']").on('change',function(){
	    $(this).next('.custom-file-label').html(event.target.files[0].name);
	});
	
	$(document).on("click", ".btnDetail", function(){
// 		alert("오나요?");
		
		let stuNo = $(this).val();
		let data = {"detailStu":stuNo}
		console.log("상세정보 가져왓 " + stuNo + " data 가져왓 " + JSON.stringify(data));
		
		$.ajax({
			type: 'post',
			url: '/professor/detailStu',
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			beforeSend:function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success :function(data){
// 				console.log("성공이라해주라 ", data.stuSclList[0].sclhRcmd);
				fn_add(data);
				
				let str = "";
				if(data.stuSclList != null && data.stuSclList.length != 0){
					for(let i=0; i < data.stuSclList.length; i++){
						console.log("오라고 제발 ㅠ  " + data.stuSclList[i].empNm );
						
						str += `
						<tr>
							<td>\${i+1}</td>
							<td>\${data.stuSclList[i].sclNm}</td>
							<td>\${data.stuSclList[i].sclhYr}년 \${data.stuSclList[i].sclhSem}학기</td>
							<td>\${data.stuSclList[i].sclhAmt}</td>
							<td>\${data.stuSclList[i].empNm}</td>
						</tr>
						
						`
					}
				}else{
					
					str = `
					<tr>
						<td colspan='5'>받은 장학금 내역이 없습니다.</td>
					</tr>
					`
				}
				
				$("#sclList").html(str);
				
			},
			error:function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
		
	});
	$().ready(function () {
		$("#recommendation").on("click", function(){
	// 		alert("하이")
	
			let stuNo = $(".stuNo").val();
			let proNo = $("#proNo").val();
			let sclhRcmd = $("#sclhRcmd").val();
			
			console.log("stuNo: " + stuNo + " proNo: " + proNo + " sclhRcmd: " + sclhRcmd)
	
			let data = {
				"stuNo":stuNo,
				"proNo":proNo,
				"sclhRcmd":sclhRcmd
			}
			Swal.fire({
	            title: '본 학생을 추천 하시겠습니까?',
	            text: "",
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
						url: '/professor/recommendationStu',
						contentType:"application/json;charset=utf-8",
						data:JSON.stringify(data),
						beforeSend:function(xhr){
							xhr.setRequestHeader(header, token);
						},
						success :function(data){
							console.log("insert성공이라해주라 ", data);
							
			                Swal.fire(
			                    '추천 완료',
			                    '정상적으로 장학생 추천 되었습니다.',
			                    'success'
			                ).then(function(){
			                	$("#sclhRcmd").html("");
					        	window.location.reload(true);			        	
					        });
				            
						},
						error:function(request, status, error){
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							 Swal.fire(
							      	"추천 실패",
							        "에러 났어요!", // had a missing comma
							        "error"
							      )
						}
						
					});
				
				}
				
			});
			
		});
		
	});
	
	
	$("#savePdfBtn").on("click", function(){
		//저장 영역 div id
		html2canvas($('#sclPdf')[0], {
			//logging : true,		// 디버그 목적 로그
			//proxy: "html2canvasproxy.php",
			allowTaint : true, // cross-origin allow
			useCORS : true, // CORS 사용한 서버로부터 이미지 로드할 것인지 여부
			scale : 2
		// 기본 96dpi에서 해상도를 두 배로 증가
		}).then(
				function(canvas) {
					// 캔버스를 이미지로 변환
					var imgData = canvas.toDataURL('image/png');
					var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
					var pageHeight = imgWidth * 1.414; // 출력 페이지 세로 길이 계산 A4 기준
					var imgHeight = canvas.height * imgWidth / canvas.width;
					var heightLeft = imgHeight;
					var margin = 10; // 출력 페이지 여백설정
					var doc = new jsPDF('p', 'mm');
					var position = 10;
					// 첫 페이지 출력
					doc.addImage(imgData, 'PNG', margin, position, imgWidth,
							imgHeight);
					heightLeft -= pageHeight;
					// 파일 저장
					doc.save('장학생_추천서.pdf');
				});
	});
});

</script>
<style>
	.mycard {
		padding: 0px;
		border-radius: 0.25rem;
		min-width: 0px;
		text-align: left;
	}
</style>

<div class="row">
	<div class="alert alert-light col" role="alert">
		<!-- 게시판 안내사항 -->
		<p>
			<strong>
			학생 상세보기를 통해 장학생 추천을 진행할 수 있습니다.
			</strong>
		</p>
	</div>
</div>

<!-- 학생 검색 -->
<div class="row mt-3 ml-1">
	<div class="form-group col-2 ">
		<select id="yr" class="select2bs4 select2-hidden-accessible" style="width: 100%;" aria-hidden="true">
			<option value="">입학 연도</option>
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

<div style="text-align:center; overflow:scroll; width:1450px; height:600px;">
	<table class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
		<thead>
			<tr class="text-center">
				<th width="1%">No</th>
				<th width="10%">학번</th>
				<th width="10%">이름</th>
				<th width="10%">담당교수</th>
				<th width="10%">학생 상세</th>
			</tr>
		</thead>
		<tbody id="stuList">
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
				<div class="col-12">
					<div class="container-fluid">
						<div class="row">
							<div class="col-4">
								<img class="img-thumbnail" width="180px;" height="250px;" id="stuImg">
							</div>
							<div class="col-8 mycard">
								<div class="container">
									<div class="row mt-1 mb-2">
										<div class="col-6">
											<label for="stuNo" class="form-label">학번</label> 
											<input type="text" class="form-control stuNo" id="stuNo" name="stuNo" readonly />
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-6">
											<label for="stuNm" class="form-label">이름</label> 
											<input type="text" class="form-control stu stuNm" id="stuNm" name="stuNm" readonly />
										</div>
										<div class="col-6">
											<label for="stuNm" class="form-label">직전학기 성적</label> 
											<input type="text" class="form-control stu stuNm" id="" name="" readonly />
										</div>
									</div>
									<div class="row mb-2">
										<div class="form-group col-6">
											<label for="colCd" class="form-label">단과대학</label> <input
												type="text" class="form-control stu" id="colCd" name="colCd"
												readonly />
										</div>
										<div class="col-6">
											<label for="department" class="form-label">학과</label> <input
												type="text" class="form-control stu" id="department"
												name="depCd" readonly />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12">
					<div class="card collapsed-card mt-2 mb-4 mycard">
						<div class="card-header">
							<h3 class="card-title">상세 정보</h3>
							<div class="card-tools">
								<button type="button" class="btn btn-tool"
									data-card-widget="collapse">
									<i class="fas fa-plus"></i>
								</button>
							</div>
						</div>

						<div class="card-body" style="display: none;">
							<div class="row mt-2 mb-2">
								<div class="col-4">
									<label>학년</label> <input type="text" class="form-control stu"
										id="stuYr" name="stuYr" readonly />
								</div>
								<div class="col-4">
									<label>학기</label> <input type="text" class="form-control stu"
										id="stuSem" name="stuSem" readonly />
								</div>
								<div class="col-4">
									<label for="stuNme" class="form-label">영문 이름</label> 
									<input type="text" class="form-control stu" id="stuNme" name="stuNme"
										readonly />
								</div>
							</div>
							<div class="row mt-3 mb-2">
								<div class="col-4">
									<label for="stuZip" class="form-label">우편번호</label> <input
										type="text" class="form-control stu" id="stuZip" name="stuZip"
										readonly />
								</div>
								<div class="col-4">
									<label for="stuBir" class="form-label">생년월일</label> <input
										type="text" class="form-control stu" id="stuBir" name="stuBir"
										readonly />
								</div>
								<div class="col-4">
									<label for="stuTel" class="form-label">전화번호</label> <input
										type="text" class="form-control stu" id="stuTel" name="stuTel"
										readonly />
								</div>
							</div>
							<div class="row mt-3 mb-2">
								<div class="col-6">
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
						</div>
					</div>
					<div class="card collapsed-card mt-4 mb-4 mycard">
						<div class="card-header">
							<h3 class="card-title">장학 내역</h3>
							<div class="card-tools">
								<button type="button" class="btn btn-tool"
									data-card-widget="collapse">
									<i class="fas fa-plus"></i>
								</button>
							</div>
						</div>

						<div class="card-body table-responsive p-0"
							style="height: 230px;">
							<table class="table table-head-fixed text-nowrap">
								<thead>
									<tr>
										<th>no</th>
										<th>장학금 명</th>
										<th>수혜학기</th>
										<th>지급액</th>
										<th>추천인</th>
									</tr>
								</thead>
								<tbody id="sclList">
								</tbody>
							</table>
						</div>
					</div>
					
					<div id="stuBtn" align="right">
						<button type="button" id="recommendationStu" class="btn btn-outline-success" 
							data-toggle="modal" data-target="#modal-default">장학생 추천</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 추천사유-->
<!-- 	<div class="modal fade" id="modal-default" -->
<!-- 		style="display: none; z-index: 1041" aria-hidden="true"> -->
<!-- 		<div class="modal-dialog modal-dialog-centered"> -->
<!-- 			<div class="modal-content"> -->
<!-- 				<div class="modal-header"> -->
<!-- 					<h4 class="modal-title">장학생 추천</h4> -->
<!-- 					<button type="button" class="close" data-dismiss="modal" -->
<!-- 						aria-label="Close"> -->
<!-- 						<span aria-hidden="true">×</span> -->
<!-- 					</button> -->
<!-- 				</div> -->
<!-- 				<div class="modal-body"> -->
<!-- 					<div class="mb-3"> -->
<!-- 						<label for="sclhRcmd" class="col-form-label">장학생 추천 사유를 입력해주세요.</label> -->
<!-- 						<textarea class="form-control sclhRcmd" rows="7"></textarea> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="modal-footer justify-content-between"> -->
<!-- 					<button type="button" id="recommendation" -->
<!-- 						class="btn btn-block btn-success">추천</button> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<div class="modal fade" id="modal-default"
		style="display: none; z-index: 1041" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">장학생 추천</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body" style="padding:0px;">
					<div id="sclPdf">
						<div class="hpa" style="width: 210mm; height: 296.99mm;">
							<div class="hcD" style="left: 20mm; top: 25mm;">
								<div class="hcI">
									<div class="hls ps19"
										style="line-height: 8.29mm; white-space: nowrap; left: 0mm; top: -0.44mm; height: 8.82mm; width: 170mm;">
										<span class="hrt cs12">장학생 추천서</span>
									</div>
									<div class="hls ps20"
										style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 13.90mm; height: 4.23mm; width: 170mm;"></div>
									<div class="hls ps20" style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 20.67mm; height: 4.23mm; width: 170mm;">
										<div style="position:absolute;right: 90px;">
											<span class="hrt cs9" style="position:static;">학과 :</span>
											<span class="hrt cs9 depNm"></span>
										</div>
										<span class="htC" style="left: 1.06mm; width: 11.99mm; height: 100%;"></span>
										<span class="htC" style="left: 1.06mm; width: 11.99mm; height: 100%;"></span>
									</div>
									<div class="hls ps20"
										style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 27.45mm; height: 4.23mm; width: 170mm;">
										<div style="position:absolute;right: 90px;">
											<span class="hrt cs9" style="position:static;">학번 :</span>
											<span class="hrt cs9 stuNo"></span>
										</div>
										<span class="htC" style="left: 1.06mm; width: 11.99mm; height: 100%;"></span>
										<span class="htC" style="left: 1.06mm; width: 11.99mm; height: 100%;"></span>
									</div>
									<div class="hls ps20"
										style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 34.22mm; height: 4.23mm; width: 170mm;">
										<div style="position:absolute;right: 90px;">
											<span class="hrt cs9" style="position:static;">성명 :</span>
											<span class="hrt cs9 stuNm"></span>
										</div>
										<span class="htC" style="left: 1.06mm; width: 11.99mm; height: 100%;"></span>
										<span class="htC" style="left: 1.06mm; width: 11.99mm; height: 100%;"></span>
									</div>
									<div class="hls ps20"
										style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 40.99mm; height: 4.23mm; width: 170mm;"></div>
									<div class="hls ps0"
										style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 47.77mm; height: 4.23mm; width: 170mm;">
										<span class="hrt cs9">◎ 추천 사유 :</span>
									</div>
									<div class="hls ps0"
										style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 54.54mm; height: 4.23mm; width: 0mm;"></div>
									<div class="hls ps0"
										style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 120.96mm; height: 4.23mm; width: 170mm;"></div>
									<div class="hls ps0"
										style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 127.73mm; height: 4.23mm; width: 170mm;">
										<span class="hrt cs9">위와 같이 장학생을 추천합니다.&nbsp;</span>
									</div>
									<div class="hls ps19"
										style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 134.51mm; height: 4.23mm; width: 170mm;"></div>
									<div class="hls ps19"
										style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 141.28mm; height: 4.23mm; width: 170mm;"></div>
									<div class="hls ps20"
										style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 148.05mm; height: 4.23mm; width: 170mm;">
										<span class="hrt cs10">추천교수 : &nbsp;</span>
										<span class="hrt cs10" id="empNm"><%=name %></span>
										<span class="htC" style="left: 1.06mm; width: 9.17mm; height: 100%;"></span>
										<span class="htC" style="left: 1.06mm; width: 11.99mm; height: 100%;"></span>
										<img alt="" src="/resources/upload/img/교수도장sh.jpg">
										<span class="hrt cs10">(인)</span>
									</div>
									<div class="hls ps20"
										style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 154.83mm; height: 4.23mm; width: 170mm;"></div>
									<div class="hls ps20"
										style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 161.60mm; height: 4.23mm; width: 170mm;">
										<span class="hrt cs10">학과장 : &nbsp;</span>
										<span class="htC" style="left: 1.06mm; width: 11.99mm; height: 100%;"></span>
										<span class="htC" style="left: 1.06mm; width: 11.99mm; height: 100%;"></span>
										<span class="htC" style="left: 1.06mm; width: 11.99mm; height: 100%;"></span>
										<span class="hrt cs10">(인)</span>
									</div>
									<div class="hls ps19"
										style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 181.92mm; height: 4.23mm; width: 170mm;"></div>
									<div class="hls ps19"
										style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 188.69mm; height: 4.23mm; width: 170mm;"></div>
									<div class="hls ps19"
										style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 195.47mm; height: 4.23mm; width: 170mm;"></div>
									<div class="hls ps19"
										style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 202.24mm; height: 4.23mm; width: 170mm;"></div>
									<div class="hls ps19"
										style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 209.01mm; height: 4.23mm; width: 170mm;"></div>
									<div class="hls ps19"
										style="line-height: 4.44mm; white-space: nowrap; left: 0mm; top: 215.73mm; height: 5.29mm; width: 170mm;">
	<!-- 									<span class="hrt cs11">2023년&nbsp;</span> -->
	<!-- 									<span class="htC" style="left: 1.32mm; width: 5.51mm; height: 100%;"></span> -->
	<!-- 									<span class="hrt cs11">&nbsp;월</span> -->
	<!-- 									<span class="htC" style="left: 1.32mm; width: 3.53mm; height: 100%;"></span> -->
	<!-- 									<span class="hrt cs11">&nbsp;&nbsp;일</span> -->
										<span class="hrt cs11"><%= date.format(nowTime) %></span>
									</div>
									<div class="hls ps19"
										style="line-height: 21.71mm; white-space: nowrap; left: 0mm; top: 224.47mm; height: 21.71mm; width: 170mm;">
										<div class="hsR"
											style="top: 0mm; left: 0mm; margin-bottom: 0mm; margin-right: 0mm; width: 86.99mm; height: 21.71mm; display: inline-block; position: relative; vertical-align: middle; background-repeat: no-repeat;"></div>
									</div>
								</div>
							</div>
							<div class="htb"
								style="left: 21mm; width: 170.97mm; top: 80.75mm; height: 66.42mm;">
								<textarea rows="10" cols="90" placeholder="취득한 자격증과 학과 전공과의 연관성" id="sclhRcmd"></textarea>
							</div>
							<div style="text-align:center; margin-top: 125%;">
								<img alt="" src="/resources/upload/img/yeonSu_logo.png">
							</div>
							<input type="hidden" id="proNo">
						</div>
					</div>
				</div>
				
				<div class="modal-footer justify-content-between">
					<button type="button" id="savePdfBtn" class="btn btn-outline-danger">PDF 다운</button>
					<button type="button" id="recommendation" class="btn btn-outline-success">추천</button>
				</div>
			</div>
		</div>
	</div>
</div>