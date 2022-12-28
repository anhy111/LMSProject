<!--  추가/변경시 최종프로젝트 게시판에 공지(필수) -->
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<!-- 공통 css 파일 임포트  -->
<link rel="stylesheet" type="text/css" href="/resources/css/dataTableTemplate.css">
	<div>
    	<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 강의개설관리 <i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">강의계획서 조회</span>
  	</div>
  	<div class="row" id="keywardBox">
	  	<div class="col-2">
			<input type="text" class="form-control" placeholder="교번" id="proNo" name="proNo" readonly="readonly">
		</div>
	  	<div class="col-2">
			<input type="text" class="form-control" placeholder="성명" id="empNm" name="empNm" readonly="readonly">
		</div>
	  	<div class="col-2">
			<input type="text" class="form-control" placeholder="연락처" id="empTel" name="empTel" readonly="readonly">
		</div>
	</div>
  	<div class="row" id="keywardBox">
	  	<div class="col-2">
			<input type="text" class="form-control" placeholder="소속" id="depNm" name="depNm" readonly="readonly">
		</div>
	  	<div class="col-2">
			<input type="text" class="form-control" placeholder="직책" id="proPos" name="proPos" readonly="readonly">
		</div>
	  	<div class="col-2">
			<input type="text" class="form-control" placeholder="재직상태" id="empRet" name="empRet" readonly="readonly">
		</div>
	  	<div class="col-2">
			<input type="text" class="form-control" placeholder="생년월일" id="empReg" name="empReg" readonly="readonly">
		</div>
		<sec:csrfInput/>
	</div>

	<br>

	<i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;강의계획서
	<p id="tellCnt">
		[총 <span id="cntSpan"></span>건]
	</p>

	<br>

	<div id="tgradeYellowBox" style="height:47px;">
		<label>년도/학기
			<select name="cateYrNSem" id="cateYrNSem" onchange="javascript:getListAgain(this);getCnt(this);">
				<option value="">전체</option>
			</select>
		</label>
		<button type="button" class="btn btn-primary" id="newLecApplyBtn">신규강의계획서 작성</button>
	</div>

	<!-- 계획서 리스트 -->
	<div class="card">
		<div class="card-body">
			<div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">
				<div class="row">
					<div class="col-sm-12">
						<table id="example1"
							class="table table-bordered table-striped dataTable dtr-inline"
							aria-describedby="example1_info">
							<thead>
								<tr>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Rendering engine: activate to sort column ascending"
										cursorshover="true">년도/학기</th>
									<th class="sorting sorting_desc" tabindex="0"
										aria-controls="example1" rowspan="1" colspan="1"
										aria-label="Browser: activate to sort column ascending"
										cursorshover="true" aria-sort="descending">학년</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Engine version: activate to sort column ascending"
										cursorshover="true">강의명</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Engine version: activate to sort column ascending"
										cursorshover="true">제한인원</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="CSS grade: activate to sort column ascending"
										cursorshover="true">개설이수구분</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="CSS grade: activate to sort column ascending"
										cursorshover="true">학점</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="CSS grade: activate to sort column ascending"
										cursorshover="true">강의시간/강의실</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="CSS grade: activate to sort column ascending"
										cursorshover="true">성적평가방식</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="CSS grade: activate to sort column ascending"
										cursorshover="true">계획서 상태</th>
								</tr>
							</thead>
							<tbody id="proList">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">

	//스프링 시큐리티를 위한 토큰 처리(csrf) -> 불토엔 큰 코스로 픽스!
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";
	
	let trs,lecaCds,tdValues = "";
	
	//년도/학기별 리스트 다시 뿌리기
	function getListAgain(yrNsem) {
		
		getCnt(yrNsem);
		
		yrNsem = $(yrNsem).val();
		
		let dataObject = {
			yrNsem : yrNsem
		};
		
		//proList 비우고 다시 불러오기
		$.ajax({
			url: "/professor/lecApply/getListAgain",
			type: "POST",
			data : JSON.stringify(dataObject),
			contentType: "application/json;charset=utf-8",
			dataType: "JSON",
			beforeSend: function (xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function (data) {
				$('#proList').empty();
				let str ="";
				for(var i=0;i<data.length;i++){
					str += `
						<tr class='detailForm' style='cursor:pointer;'>
						<td class='checklecaCd' value='\${data[i].lecaCd}'>\${data[i].lecaYs}</td>
						<td>\${data[i].lecaTrg }</td>
						<td>\${data[i].lecaNm }</td>
						<td>\${data[i].lecaCap }</td>
						<td>\${data[i].lecaCate }</td>
						<td>\${data[i].lecaCrd }</td>
						<td>\${data[i].lecaTc }</td>
						<td>\${data[i].lecaGrade }</td>
						<td class='checklecaAp' value='\${data[i].lecaApproval }'>\${data[i].lecaApproval }</td>
						</tr>
					`
				}
				$("#proList").html(str);

				//승인, 승인대기, 반려 글자색 변경
				$(function(){
					for(var i=0; i<data.length;i++){
						if($(".checklecaAp").eq(i).html() == '반려'){
							$(".checklecaAp").eq(i).css("color","red");
						}else if($(".checklecaAp").eq(i).html() == '승인'){
							$(".checklecaAp").eq(i).css("color","blue");
						}
					}
				});
				
				//행 클릭 시 상세페이지 띄우긔
				$(document).on('click','.detailForm',function(e){
					console.log("e",e)
		        	let eqSeq = $(this).index();
		        	let lecaCd = $(".checklecaCd").get(eqSeq).getAttribute('value');
		        	let lecaApproval = $(".checklecaAp").get(eqSeq).getAttribute('value');
		        	console.log("여기만떠줭 lecaCd : " + lecaCd);
		        	console.log("여기만떠줭 lecaApproval : " + lecaApproval);
                        if (lecaApproval == '승인') {
                            window.open('/professor/lecApplyForm/inquiryForm?lecaCd='+lecaCd, 'detailForm', 'width=1000, height=800, left=100, top=50');
								return;
                        } else if(lecaApproval == '승인대기'){
                            window.open('/professor/lecApplyForm/inquiryForm?lecaCd='+lecaCd, 'detailForm', 'width=1000, height=800, left=100, top=50');
								return;
                        } else if(lecaApproval == '임시저장'){
                            window.open('/professor/lecApplyForm/tempForm?lecaCd='+lecaCd, 'detailForm', 'width=1000, height=800, left=100, top=50');
								return;
                        } else if(lecaApproval == '반려'){
                            window.open('/professor/lecApplyForm/tempForm?lecaCd='+lecaCd, 'detailForm', 'width=1000, height=800, left=100, top=50');
								return;
                        }
				});
			}
		});
	}
	
	//count 불러오기
	function getCnt(yrNsem) {

		yrNsem = $(yrNsem).val();
		
		let dataObject = {
			"yrNsem": yrNsem
		};

		$.ajax({
			url: "/professor/lecApply/getCnt",
			type: "POST",
			data: JSON.stringify(dataObject),
			contentType: "application/json;charset=utf-8",
			dataType: "JSON",
			beforeSend: function (xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function (res) {
				$("#cntSpan").text(res);
			}
		});
	}
	
	$(document).ready(function () {
		//교수 개인정보 가져오기
		$.ajax({
			url: "/professor/lecApply/proInfo",
			type: "POST",
			dataType: "JSON",
			beforeSend: function (xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function (data) {
				$('#proNo').val(data.proNo);
				$('#empNm').val(data.empNm);
				$('#empTel').val(data.empTel);
				$('#proPos').val(data.proPos);
				$('#depNm').val(data.depNm);
				$('#empRet').val(data.empRet);
				$('#empReg').val(data.empReg);

			}
		});

		//년도 및 학기 불러오기
		$.ajax({
			url: "/professor/lecApply/getYrNSem",
			type: "POST",
			dataType: "JSON",
			beforeSend: function (xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function (res) {
				str = '';

				$.each(res, function (i, v) {
					str += '<option value="' + v.lecaYr + v.lecaSem + '">' + v.lecaYr + '/' + v.lecaSem + '</option>';
				});

				$('#cateYrNSem').append(str).trigger('change');
			}
		});

		//강의계획서 리스트 가져오기
// 		$.ajax({
// 			url: "/professor/lecApply/list",
// 			type: "POST",
// 			contentType: "application/json;charset=utf-8",
// 			dataType: "JSON",
// 			beforeSend: function (xhr) {
// 				xhr.setRequestHeader(header, token);
// 			},
// 			success: function (data) {
// 				let str ="";
// 				console.log("onload")
// 				for(var i=0;i<data.length;i++){
// 					str += `
// 						<tr class='detailForm' style='cursor:pointer;' >
// 							<td>\${data[i].lecaYs}</td>
// 							<td>\${data[i].lecaTrg }</td>
// 							<td>\${data[i].lecaNm }</td>
// 							<td>\${data[i].lecaCap }</td>
// 							<td>\${data[i].lecaCate }</td>
// 							<td>\${data[i].lecaCrd }</td>
// 							<td>\${data[i].lecaTc }</td>
// 							<td>\${data[i].lecaGrade }</td>
// 							<td class='checklecaAp'>\${data[i].lecaApproval }</td>
// 						</tr>
// 					`
// 				}
// 				$("#proList").html(str);

// 				//승인, 승인대기, 반려 글자색 변경
// 				$(function(){
// 					for(var i=0; i<data.length;i++){
// 						if($(".checklecaAp").eq(i).html() == '반려'){
// 							$(".checklecaAp").eq(i).css("color","red");
// 						}else if($(".checklecaAp").eq(i).html() == '승인'){
// 							$(".checklecaAp").eq(i).css("color","blue");
// 						}
// 					}
// 				})
				
// 				//행 클릭 시 학생 상세정보 띄우긔
// 				$(document).on('click','.detailForm',function(){
// 		        	tdValues = Array.from(this.querySelectorAll('input')).map(td => td.textContent);
// 		        	let lecaCd = $(this).val();
// 		        	console.log("여기만떠줭 lecaCd : " + lecaCd);
		        	
// 				});
//             }
//         });
    })
	//신규강의계획서 작성 버튼 클릭 이벤트
	$('#newLecApplyBtn').on('click', function() {
		window.open("/professor/lecApplyForm/requestForm", "lecApplyForm", "width=1000, height=800, left=100, top=50");
	});
</script>
</html>