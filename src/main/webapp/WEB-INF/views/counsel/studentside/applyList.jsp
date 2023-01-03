 <%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/inputModalTemplate.css">
<%
	int stuNo = (int) session.getAttribute("no");
	String name = String.valueOf(session.getAttribute("name"));
%>
<style>


tr.recordTr {
	opacity: 1;
	background-color: white;
	color: black;
	transition: background-color 0.5s;
	opacity
	1s;
}

tr.recordTr:hover {
	cursor: pointer;
	opacity: 1;
	background-color: blue;
	color: white;
	transition: background-color 0.5s;
	opacity
	1s;
}
tr.text-center td:hover{
opacity:0.6;
color:white;
background-color:gray;
transition: opacity 1s, color 1s, background-color 1;
cursor:pointer;
}


</style>

<div class="row">
	<div class="form-group col-12">
			<div class="card-header d-flex p-0">
<!-- 				<h3 class="card-title p-3"><b>상담내역</b></h3> -->
				<ul class="nav nav-pills ml-auto p-2">
					<li class="nav-item"><a class="nav-link active" href="#tab_1"
						data-toggle="tab">대면</a></li>
					<li class="nav-item"><a class="nav-link" href="#tab_2"
						data-toggle="tab">비대면</a></li>
				</ul>
			</div>
			<div class=" alert alert-light" role="alert"
						style="font-size: 0.9em; padding: 1em; border: 1px solid #eee;">
						<p>
							<strong><b>※ 안내사항</b></strong> <br>
							<br> (1)&nbsp;상단탭의&nbsp;<strong style="color:blue">대면/비대면</strong>을 클릭하면 구분하여 확인 할 수 있습니다.<br>
							<br> (2)&nbsp;<strong>승인대기</strong>시에는 수정, 삭제 할 수 있으며<br>&nbsp;&nbsp;&nbsp;&nbsp;<strong>승인 및 반려</strong>처리가 되면 수정, 삭제할 수 없습니다.<br> 
							<br> (3)&nbsp;하단의 <strong>신청</strong> 버튼을 눌러 신청 할 수 있습니다.<br>
							<br> (4)&nbsp;<strong>기록 및 답변</strong>이 등록되면 확인/출력 할 수 있습니다.
						</p>
					</div>
			<div class="card-body">
				<div class="tab-content">
					<div class="tab-pane active" id="tab_1">			<table
				class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
				<thead>
					<tr class="text-center">
						<th width="4%">No</th>
						<th width="4%">구분</th>
						<th width="20%">제목</th>
						<th width="6%">상담예약일</th>
						<th width="6%">상담기록</th>
						<th width="4%">담당교수</th>
					</tr>
				</thead>
				<tbody id="notSaveLecture">
					<c:forEach var="counselList" items="${counselList}" varStatus="status" end="${counselList.size()}">
						<tr class="text-center counselListTr">
							<td data-value="${counselList.cnslCd}">${status.end-status.index }</td>
							<td>${counselList.cnslCate }</td>
							<td  >${fn:substring(counselList.cnslTtl,0,8) }</td>
							<td><fmt:formatDate value="${counselList.cnslDt }" pattern="yy/MM/dd" /></td>
							<c:if test="${counselList.cnslYn eq 'AP001' }"><td class="acceptHover" style="color:blue;">승인완료</td>
							<td class="acceptHovered" style="display:none;color:blue;background-color:white;">상담기록</td>
							</c:if>
							<c:if test="${counselList.cnslYn eq 'AP002' }"><td style="color:black;">승인대기</td></c:if>
							<c:if test="${counselList.cnslYn eq 'AP003' }"><td class="rejectHover" style="color:red;">반려</td>
							<td class="rejectHovered" style="display:none; color:red; background-color:white;">반려사유</td>
							</c:if>
							<td>${counselList.empNm }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table></div>
					<div class="tab-pane" id="tab_2"><table
				class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
				<thead>
					<tr class="text-center" >
						<th width="4%">No</th>
						<th width="4%">구분</th>
						<th width="20%">제목</th>
						<th width="6%">답변상태</th>
						<th width="4%">담당교수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="nonFaceCounselList" items="${nonFaceCounselList}" varStatus="status" end="${nonFaceCounselList.size() }">
						<tr class="text-center nonFaceCounselListTr" data-toggle="modal" data-target="#modifyCounsel">
							<td data-value="${nonFaceCounselList.cnslCd}">${status.end-status.index }</td>
							<td>${nonFaceCounselList.cnslCate }</td>
							<td  >${fn:substring(nonFaceCounselList.cnslTtl,0,8) }</td>
							<c:if test="${nonFaceCounselList.cnslYn eq 'AP001' }"><td style="color:blue;">승인완료</td></c:if>
							<c:if test="${nonFaceCounselList.cnslYn eq 'AP002' }"><td style="color:black;">승인대기</td></c:if>
							<c:if test="${nonFaceCounselList.cnslYn eq 'AP003' }"><td style="color:red;">반려</td></c:if>
							<td>${nonFaceCounselList.empNm }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			 </div>
				</div>
			</div>
	</div>
</div>
<div class="row">
<div class="col-12 pr-0	" style="text-align: end;">
	<!-- 			<button class="btn btn-sm btn-outline-primary" >신청</button> -->
	<button id="applyBtn" class="btn btn-primary"data-toggle="modal" data-target="#applyCounsel">신청</button>
</div>
</div>

<!-- 신청 모달 -->
<div class="modal fade show" id="applyCounsel"
	style="display: none; padding-right: 17px;" aria-modal="true"
	role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" style="top:50px;">
			<div class="modal-header" style="background-color: #001F3F;color:white;">
				<h5 class="modal-title">상담 신청서 작성</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"style="color:white;">×</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- 모달바디 -->
				<div class="alert alert-light" role="alert"
						style="font-size: 0.9em; padding: 1em; border: 1px solid #eee; width: 100%;">
						<p>
							<strong>※ 안내 사항</strong> <br>
							<br> (1)&nbsp;<strong>대면/비대면</strong>상담을 선택할 수 있습니다.<br>
							<br> (2)&nbsp;<strong>학적 변동</strong> 신청 내역을 조회하여 상담을 연결할 수 있습니다.<br>
							<br> (3)&nbsp;관련된 <strong>담당 교수</strong>를 선택하여 상담을 신청 할 수 있습니다.<br>
							<br> (4) *는 필수 선택/입력 정보입니다.
						</p>
					</div>
<!-- 				<form id="form" action="/counsel/studentside/applyInsert" method="post" onsubmit="return checkInsertData()"> -->
			<input type="hidden" name="stuNo" value="<%=stuNo%>">
			<input type="hidden" id="recCd" name="recCd" value="0" />
			<div class="row">
				<div class="col-12 segmented-control2">
					<input type="radio" value="대면" id="tab-1" class="counselTypeFace"
						name="cnslType" checked /> <label for="tab-1"
						class="col-4 segmented-control__1">
						<p>대면</p>
					</label> <input type="radio" id="tab-2" class="counselTypeNonFace"
						name="cnslType" value="비대면" /> <label for="tab-2"
						class="col-4 segmented-control__2">
						<p>비대면</p>
					</label>
						<button type="button"
						class="col-4 recordList segmented-control__1" data-toggle="modal"
						data-target="#modal-lg">
						학적 조회
					</button>
					<div class="segmented-control__color"></div>
				</div>
				<div class="col-12 segmented-control2">

					<input type="radio" name="cnslCate" value="RCD001" id="tab-3" checked />
					<label for="tab-3" class="segmented-control__3">
						휴학
					</label> <input type="radio" name="cnslCate" value="RCD004" id="tab-4" /> <label
						for="tab-4" class="segmented-control__4">
						자퇴
					</label> <input type="radio" name="cnslCate" value="RCD005" id="tab-5" /> <label
						for="tab-5" class="segmented-control__5">
						졸업
					</label> <input type="radio" name="cnslCate" value="RCD006" id="tab-6" /> <label
						for="tab-6" class="segmented-control__6">
						시험
					</label> <input type="radio" name="cnslCate" value="RCD007" id="tab-7" /> <label
						for="tab-7" class="segmented-control__7">
						과제
					</label> <input type="radio" name="cnslCate" value="RCD008" id="tab-8" /> <label
						for="tab-8" class="segmented-control__8">
						출결
					</label>

					<div class="segmented-control__color2"></div>
				</div>
				<div class="form-group col-12" style="padding-top: 20px;">
					<div class="col-sm-4">
						<label>담당 교수*</label>
					</div>
						<select name="proNo" class="col-6 custom-select rounded-0">
							<c:forEach var="professorList" items="${professorList }">
								<option value="${professorList.proNo }">${professorList.empNm }</option>
							</c:forEach>
						</select>
				</div>
				<div class="form-group col-12" style="padding-top: 20px;" id="cnslTitleTextBox">
						<div class="col-sm-4">
							<label>제목*</label>
						</div>
							<input type="text"name="cnslTtl" class="col-6 form-control form-control-border-rounded-0" required />
				</div>
					 
					<div class="form-group col-12" id="cnslReservationDt"
						style="padding-left: 0px;">
						<div class="col-sm-2">
							<label>예약일*</label>
						</div>
						<div class="form-group col-12" style="display: -webkit-inline-box;">
							<div class="alert alert-info">
								<p id="target">상담 예약일</p>
							</div>
							<input style="height: 50px; border: 1px solid aliceblue;padding-left: 30px;"
								type="date" name="cnslDt" id="cnslDt" required />
						</div>
					</div>
				   
				<div class="form-group col-12" id="cnslConTextArea">
					<div>
						<div class="col-sm-4">
							<label>상담 할 내용*</label>
						</div>
					</div>
					<div class="row">
						<textarea id="cnslCon"name="cnslCon" rows="3" class="col-10 ml-2 form-control"></textarea>
					</div>
				</div>
				<div class="col-4" style="display: inherit; padding-top: 20px;">
				</div>
				 
			</div>
<%-- 			<sec:csrfInput /> --%>
<!-- 		</form> -->

				<!-- 모달바디 -->
			</div>
			<div class="modal-footer justify-content-align">
				<button onclick="checkInsertData()" type="button"  class="btn btn-outline-primary">등록</button>
				<a onclick="dataReset()" class="btn btn-outline-secondary">취소</a>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 신청 모달 -->

	<!-- 학적 조회 모달 -->
	<div class="modal fade" id="modal-lg" style="display: none;"
		aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">학적 신청 목록</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
				<div class="alert alert-light" role="alert"
						style="font-size: 0.9em; padding: 1em; border: 1px solid #eee; width: 100%;">
						<p>
							<strong>※ 상담받을 항목을 선택하세요 </strong> <br>
							<br> (1)&nbsp;<strong>신청된 학적</strong>이 잘못입력 되었다면 학적관리에서 수정후 재 신청 바랍니다.<br>
							<br> (2)&nbsp;항목을 클릭하면 <strong style="color:blue">상담 구분</strong>이 자동 선택 됩니다.
						</p>
					</div>
					<div class="card-body table-responsive col-11 p-0"
						style="height: 300px; width: 1600px;">
						<table
							class="table table-head-fixed text-nowrap table-condensed table-sm">
							<thead>
								<tr class="text-center">
									<th width="4%">순번</th>
									<th width="12%">카테고리</th>
									<th width="4%">신청연도</th>
									<th width="12%">신청학기</th>
									<th width="12%">기간</th>
									<th width="12%">신청일</th>
									<th width="4%">승인여부</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="recordList" items="${recordList}" varStatus="status" end="${recordList.size() }">
									<tr class="recordTr">
										<td class="text-center" data-value="${recordList.recCd}">${status.end-status.index }</td>
										<td class="text-center"  >${recordList.rgbCd}</td>
										<td class="text-center" >${recordList.recYr}년도</td>
										<td class="text-center" >${recordList.recSem}학기</td>
										<td class="text-center" >${recordList.recPer}년</td>
										<td class="text-center" ><fmt:formatDate value="${recordList.recDt }"
												pattern="yy/MM/dd" /></td>
										<td class="text-center" >
<%-- 										<c:if test="${recordList.recYn eq '반려'}"><span style="color: red;">${recordList.recYn }</span></c:if>  --%>
											<c:if test="${recordList.recYn eq '승인대기'}"><span style="color: black;">${recordList.recYn }</span></c:if> 
											<c:if test="${recordList.recYn eq '승인'}"><span style="color: blue;">${recordList.recYn }</span></c:if>
											</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="modalClose btn btn-default"
						data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>

<!-- 학적 조회 모달 -->
<!-- 수정삭제모달 -->
<div class="modal fade show" id="modifyCounsel"
	style="display: none; padding-right: 17px;" aria-modal="true"
	role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" style="top:50px;">
			<div class="modal-header" style="background-color: #001F3F;color:white;">
				<h5 class="modal-title">상담 상세</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"style="color:white;">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="alert alert-light" role="alert"
						style="font-size: 0.9em; padding: 1em; border: 1px solid #eee; width: 100%;">
						<p>
							<strong>※ 수정시 안내 및 주의 사항</strong> <br>
							<br> (1)&nbsp;<strong>기간/사유</strong>외에는 수정 할 수 없습니다<br>
							<br> (2)&nbsp;수정할 수 없는 값이 입력되었다면 <strong style="color:red">삭제</strong>후 재 신청 바랍니다<br>
							<br> (3)&nbsp;<strong style="color:blue">졸업</strong>&nbsp;및&nbsp;<strong style="color:blue">복학</strong>&nbsp;신청은&nbsp;수정 할 수 없습니다.<br>
						</p>
					</div>
				<!-- 모달바디 -->
					<div class="form-group col-12" >
					<input type="hidden" id="modifyCnslCd" > 
					<input type="hidden" id="modifyCnslType" > 
					</div>
					<div class="form-group col-12" >
					<div class="col-sm-4">
						<label >구분*</label> 
						</div>
						<input type="text" id="modifyCnslCate" disabled="disabled"
							class="col-6 form-control form-control-border"
							id="exampleInputBorder">
					</div>
					<div class="form-group col-12" >
					<div class="col-sm-4">
						<label >제목*</label> 
						</div>
						<input required type="text" id="modifyCnslTtl"
							class="col-6 form-control form-control-border-rounded-0"
							id="exampleInputBorder">
					</div>
					<div class="form-group col-12" >
					<div class="col-sm-4">
						<label id="modifyDtCon">사유*</label>
						</div>
						<div class="row">
						<input style="height: 50px; border: 1px solid aliceblue;padding-left: 30px;" type="date" id="modifyCnslDt" required />
						<textarea class="col-10 ml-2 form-control" rows="3" id="modifyCnslCon" required></textarea>
						</div>
					</div>
					<div class="form-group col-12" id="modifyCnslRplArea">
					<div class="col-sm-4">
						<label id="modifyDtCon">답변*</label>
						</div>
						<div class="row">
						<textarea class="col-10 ml-2 form-control" rows="3" id="modifyCnslRpl" readonly required></textarea>
						</div>
					</div>

				<!-- 모달바디 -->
			</div>
			<div class="modal-footer justify-content-align">
				<button onclick="modifyApply()" type="button" class="btn btn-outline-primary">수정하기</button>
				<button onclick="deleteApply()" type="button" class="btn btn-outline-danger">삭제</button>
				<button type="button" class="btn btn-default modifyClose" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 수정삭제모달 -->

<script type="text/javascript">
let modifyCnslCon,modifyCnslCd,applyCounsel,counselListTr,nonFaceCounselListTr,acceptHover,acceptHovered,rejectHover,rejectHovered = "";
let header = "${_csrf.headerName}";
let token = "${_csrf.token}";
let data = {cnslCd : "", cnslTtl : "" ,cnslCon : "", cnslCate : "", cnslType : "" , proNo: "" , cnslDt : "" , stuNo : "", recCd : "" };	

acceptHover = document.querySelectorAll(".acceptHover");
acceptHovered = document.querySelectorAll('.acceptHovered');
rejectHover = document.querySelectorAll('.rejectHover');
rejectHovered = document.querySelectorAll('.rejectHovered');

acceptHover.forEach((beforeHoverElement, index) => {
    beforeHoverElement.addEventListener('mouseover', () => {
      
      beforeHoverElement.style.display = 'none';
      acceptHovered[index].style.display = 'block';
      acceptHovered[index].style.backgroundColor = 'orange';
      acceptHovered[index].style.color = 'white';
      
    });
    
    acceptHovered[index].addEventListener('mouseout', () => {
    
    acceptHovered[index].style.display = 'none';
      beforeHoverElement.style.display = 'block';
    });
  });



function modifyApply(){
	data.cnslCd = $("#modifyCnslCd").val();
	data.cnslTtl = $("#modifyCnslTtl").val();
	data.cnslCon = $("#modifyCnslCon").val();
	if($("#modifyCnslType").val() == '대면'){
		if($("#modifyCnslTtl").val().length < 1){
			Swal.fire({
				  icon: 'error',
				  title: '제목을 작성해 주세요',
				})
			return;
			}
	}
	
	if($("#modifyCnslType").val() == '비대면'){
		if($("#modifyCnslTtl").val().length < 1){
			Swal.fire({
				  icon: 'error',
				  title: '제목을 작성해 주세요',
				})
			return;
			}
		
		if(!($("#modifyCnslCon").val().length >= 10)){
			Swal.fire({
				  icon: 'error',
				  title: '사유는 10글자 이상 작성해주세요',
				})
			return;
			}
	}

	$.ajax({
		url:"/counsel/studentside/applyModify",
		type:'POST',
		data: JSON.stringify(data),
		datatype:'JSON',
		contentType: 'application/json; charset=utf-8',
		beforeSend: function (xhr) {
			xhr.setRequestHeader(header, token);
		},
		success:function(result){
			  Swal.fire(
	                    '수정 완료',
	                    '정상적으로 수정 되었습니다.',
	                    'success'
	                ).then(function(){
			        	window.location.reload(true);			        	
			        });
		}
	});
}


function deleteApply(){
	data.modifyCnslCd = $("#modifyCnslCd").val();
	Swal.fire({
		  title: '등록된 신청을 삭제 하시겠습니까?',
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '삭제',
		  cancelButtonText: '취소'
		}).then((result) => {
		  if (result.isConfirmed) {
		$.ajax({
			url:"/counsel/studentside/deleteApply",
			type:'POST',
			data: JSON.stringify(data),
			datatype:'JSON',
			contentType: 'application/json; charset=utf-8',
			beforeSend: function (xhr) {
				xhr.setRequestHeader(header, token);
			},
			success:function(result){
				Swal.fire(
	                    '삭제 완료',
	                    '정상적으로 삭제 되었습니다.',
	                    'success'
	                ).then(function(){
			        	window.location.reload(true);			        	
			        });
			}
		})
    }
});
	return;
}

counselListTr = document.querySelectorAll(".counselListTr");
nonFaceCounselListTr = document.querySelectorAll(".nonFaceCounselListTr");


counselListTr.forEach(counsel => {
	counsel.addEventListener("click",function(){
		if(this.children[4].innerHTML == '승인완료' || this.children[4].innerHTML == '반려' ){
			var pwidth = 800;
			var pheight = 1200;
			var pleft = (window.screen.width/2) - (pwidth/2);
			var ptop = (window.screen.height/2) - (pheight/2);
			
			window.open("/counsel/studentside/answerNote?cnslCd="+this.children[0].dataset.value,"상담기록서",'width='+ pwidth +',height='+ pheight +',top='+ ptop +',left='+ pleft);
			return;
		} else {
			 $("#modifyCounsel").modal("show");
		}
		$("#modifyCnslRplArea").hide();
		$("#modifyCnslDt").removeAttr("disabled");
		$("#modifyCnslTtl").removeAttr("disabled");
		data.cnslCd = this.children[0].dataset.value;
		$.ajax({
			url:"/counsel/studentside/applyDetail",
			type:'POST',
			data: JSON.stringify(data),
			datatype:'JSON',
			contentType: 'application/json; charset=utf-8',
			beforeSend: function (xhr) {
				xhr.setRequestHeader(header, token);
			},
			success:function(result){
				  alert(JSON.stringify(result));
					$("#modifyDtCon").text("상담 예약일");
					$("#modifyCnslCd").val(result.cnslCd);
					$("#modifyCnslTtl").val(result.cnslTtl);
					$("#modifyCnslCon").hide();
					$("#modifyCnslType").val(result.cnslType);
// 					$("#modifyCnslCon").val(result.cnslCon);
					$("#modifyCnslDt").val(result.cnslDt);
					$("#modifyCnslDt").show();
					$("#modifyCnslCate").val(result.cnslCate);
			}
		});
	})
});

nonFaceCounselListTr.forEach(nCounsel =>{
	nCounsel.addEventListener("click",function(){
		$("#modifyCnslRplArea").hide();
		$("#modifyCnslCon").show();
		$("#modifyCnslDt").hide();
		data.cnslCd = this.children[0].dataset.value;
		if(this.children[3].innerHTML == '승인완료' || this.children[3].innerHTML == '반려'){
		$("#modifyCnslRplArea").show();
		}
		$.ajax({
			url:"/counsel/studentside/applyDetail",
			type:'POST',
			data: JSON.stringify(data),
			datatype:'JSON',
			contentType: 'application/json; charset=utf-8',
			beforeSend: function (xhr) {
				xhr.setRequestHeader(header, token);
			},
			success:function(result){
			    alert(JSON.stringify(result))
				$("#modifyDtCon").text("사유");
			    $("#modifyCnslRpl").val(result.cnslRpl);
				$("#modifyCnslCd").val(result.cnslCd);
				$("#modifyCnslTtl").val(result.cnslTtl);
				$("#modifyCnslCon").val(result.cnslCon);
				$("#modifyCnslType").val(result.cnslType);
				$("#modifyCnslCate").val(result.cnslCate);
			}
		});
	})
});
	
// 	$.fn.clearForm = function () {
// 	  return this.each(function () {
// 	    var type = this.type,
// 	      tag = this.tagName.toLowerCase();
// 	    if (tag === 'form') {
// 	      return $(':input', this).clearForm();
// 	    }
// 	    if (
// 		      type === 'text' ||
// //		      type === 'password' ||
// //		      type === 'hidden' ||
// 	     	 tag === 'textarea'
// 	    ) {
// 	      this.value = '';
// 		    } else if (type === 'checkbox' || type === 'radio') {
// 		      this.checkedIndex = 0;
// 	    } else if (tag === 'select') {
// 	      this.selectedIndex = 0;
// 	    }
// 	  });
// 	};
	
	function dataReset(){
		Swal.fire({
			  title: '작성을 취소하시겠습니까?',
			  text: "작성한 내용이 모두 지워집니다",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '삭제',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.isConfirmed) {
			    Swal.fire(
			      '삭제완료',
			      '작성 내용 모두 삭제 되었습니다',
			      'success',
			    )
			      $("#cnslCon").val("");
			    $("input[type='date']").val("");
			    $("input[name='cnslTtl']").val("");
			    $("#target").text("상담 예약일");
			      var radioButtons  = document.querySelectorAll('input[type="radio"][name="cnslCate"]');
			      for (let i = 0; i < radioButtons.length; i++) {
			    	  ableRadioButtons(radioButtons[i]);
			      }
			  }
			});
			  return;
	}
	
	var recordTrElements,tdValues,radioButtons,tdRecordValue = "";
	function checkInsertData(){ 
		data.stuNo = $("input[name='stuNo']").val();
		if(!($("input[name='recCd']").val() == "null" || $("input[name='recCd']").val() == "" || $("input[name='recCd']").val() == 0)){
			data.recCd = $("input[name='recCd']").val();
		}
		 if ($(".counselTypeNonFace").is(":checked")) {
			 	if($("input[name='cnslTtl']").val() == null || $("input[name='cnslTtl']").val() == ""){
			 		Swal.fire({
						  icon: 'error',
						  title: '제목을 입력해주세요',
						})
					return;
			 	}
				if($("#cnslCon").val() == null || $("#cnslCon").val() == ""){
					Swal.fire({
						  icon: 'error',
						  title: '내용을 입력해주세요',
						})
					return;
				} 
				$("input[type='date']").val("");
				data.cnslType = $("input[type='radio'][name='cnslType']:checked").val();
				data.cnslCate = $("input[type='radio'][name='cnslCate']:checked").val();
				data.proNo = $("select[name='proNo']").val();
				data.cnslTtl = $("input[name='cnslTtl']").val();
				data.cnslDt = $("input[type='date']").val();
				data.cnslCon = $("#cnslCon").val();
				alert(JSON.stringify(data));	
				$.ajax({
					url:"/counsel/studentside/applyInsert",
					type:'POST',
					data: JSON.stringify(data),
					datatype:'JSON',
					contentType: 'application/json; charset=utf-8',
					beforeSend: function (xhr) {
						xhr.setRequestHeader(header, token);
					},
					success:function(result){
						Swal.fire(
			                    '등록 완료',
			                    '비대면 상담 신청이 완료되었습니다.',
			                    'success'
			                ).then(function(){
					        	window.location.reload(true);			        	
					        });
					}
				})
				
		}
		if($(".counselTypeFace").is(":checked")){
			if($("input[name='cnslTtl']").val() == null || $("input[name='cnslTtl']").val() == ""){
				Swal.fire({
					  icon: 'error',
					  title: '제목을 선택해주세요',
					})
				return;
		 	}
			if($("input[type='date']").val() == "" || $("input[type='date']").val() == null){
				Swal.fire({
					  icon: 'error',
					  title: '상담 예약일을 선택해주세요',
					})
				return;
			}
			$("#cnslCon").val("");
				data.cnslType = $("input[type='radio'][name='cnslType']:checked").val();
				data.cnslCate = $("input[type='radio'][name='cnslCate']:checked").val();
				data.proNo = $("select[name='proNo']").val();
				data.cnslTtl = $("input[name='cnslTtl']").val();
				data.cnslDt = $("input[type='date']").val();
				data.cnslCon = $("#cnslCon").val();
				alert(JSON.stringify(data));	
				$.ajax({
					url:"/counsel/studentside/applyInsert",
					type:'POST',
					data: JSON.stringify(data),
					datatype:'JSON',
					contentType: 'application/json; charset=utf-8',
					beforeSend: function (xhr) {
						xhr.setRequestHeader(header, token);
					},
					success:function(result){
						Swal.fire(
			                    '등록 완료',
			                    '대면 상담 신청이 완료되었습니다.',
			                    'success'
			                ).then(function(){
					        	window.location.reload(true);			        	
					        });
					}
				})
		}
	}
	
		$("input[type='date'][name='cnslDt']").change(function() {
				var outputDate = (this.value);
				$("#target").text(outputDate);
		});
	
	function disableRadioButtons(clickedButton) {
		  radioButtons.forEach(button => {
		    if (button !== clickedButton) {
		      button.disabled = true;
		    }
		  });
		}	

	
	function ableRadioButtons(clickedButton) {
		  radioButtons.forEach(button => {
		    if (button !== clickedButton) {
		      button.disabled = false;
		    }
		  });
		}	

	
$("#applyBtn").on("click",function(){
	radioButtons  = document.querySelectorAll('input[type="radio"][name="cnslCate"]');
	recordTrElements  = document.querySelectorAll('.recordTr');
	recordTrElements.forEach(element => {
	  element.addEventListener('click', function() {
		  for (let i = 0; i < radioButtons.length; i++) {
// 			  console.log("라디오밸류:"+ radioButtons[i].value);
// 			  console.log("라됴밸류:"+radioButtons[i].innerHTML);
  			var labelElement = radioButtons[i].nextElementSibling;
  			var labelText = labelElement.innerText;
			  if(this.children[1].innerHTML == labelText){ 
				  radioButtons[i].checked = true;
				  disableRadioButtons(radioButtons[i]);
				  $("#recCd").val(this.children[0].dataset.value);
				  document.querySelector(".modalClose").click();
			} 
		  }
	  });
	});
	$("#cnslConTextArea").hide();
	$("#cnslReservationDt").show();
})

$("input:radio[name='cnslType']").change(function() {
	if ($(".counselTypeFace").is(":checked")) {
		$("#cnslConTextArea").hide();
		$("#cnslReservationDt").show();
		$("#cnslDt").attr("required", "required");
	} else if ($(".counselTypeNonFace").is(":checked")) {
		$("#cnslConTextArea").show();
		$("#cnslReservationDt").hide();
		$("#cnslDt").removeAttr("required", "required");
	}
});
</script>