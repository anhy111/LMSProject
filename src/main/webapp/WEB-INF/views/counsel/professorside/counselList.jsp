<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/inputModalTemplate.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/answerlCounsel_style.css">
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<%
	int stuNo = (int) session.getAttribute("no");
String name = String.valueOf(session.getAttribute("name"));
%>
<style>
tr.text-center td:hover {
	opacity: 0.6;
	color: white;
	background-color: gray;
	transition: opacity 1s, color 1s, background-color 1;
	cursor: pointer;
}
</style>
<div class="row">
	<div class="form-group col-12">
		<div class="card-header d-flex p-0">
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
				<strong><b>※ 안내사항</b></strong> <br> <br>
				(1)&nbsp;상단탭의&nbsp;<strong style="color: blue">대면/비대면</strong>을 클릭하면
				구분하여 확인 할 수 있습니다.<br> <br> (2)&nbsp;<strong
					style="color: blue;">비대면</strong>상담 에는 상담에 직접 답변 할 수 있습니다<br>
				<br> (3)&nbsp;<strong style="color: blue;">대면</strong>상담 에는
				상담기록서를 작성하여 제출 할 수 있습니다.<br> <br> (4)&nbsp;<strong>답변은
					수정 할 수 있습니다.</strong>
			</p>
		</div>
		<div class="card-body">
			<div class="tab-content">
				<div class="tab-pane active" id="tab_1">
					<table
						class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
						<thead>
							<tr class="text-center">
								<th width="4%">No</th>
								<th width="6%">학생명</th>
								<th width="6%">구분</th>
								<th width="8%">제목</th>
								<th width="12%">신청일</th>
								<th width="12%">상담예약일</th>
								<th width="6%">상담기록</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="counselList" items="${counselList}"
								varStatus="status" end="${counselList.size() }">
								<tr class="text-center counselListTr" data-toggle="modal"
									data-target="#counselListTr">
									<td data-value="${counselList.cnslCd}">${status.end-status.index }</td>
									<td>${counselList.stuNm}</td>
									<td>${counselList.cnslCate }</td>
									<td class="text-left">${counselList.cnslTtl }</td>
									<td><fmt:formatDate value="${counselList.cnslReg }"
											pattern="yy/MM/dd" /></td>
									<td><fmt:formatDate value="${counselList.cnslDt }"
											pattern="yy/MM/dd" /></td>
									<c:if test="${counselList.cnslRpl != null }">
										<td style="color: blue;">상담완료</td>
									</c:if>
									<c:if test="${counselList.cnslRpl == null }">
										<td style="color: black;">상담 전</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="tab-pane" id="tab_2">
					<table
						class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
						<thead>
							<tr class="text-center">
								<th width="4%">No</th>
								<th width="6%">학생명</th>
								<th width="6%">구분</th>
								<th width="8%">제목</th>
								<th width="12%">신청일</th>
								<th width="12%">답변일</th>
								<th width="6%">답변</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="nonFaceCounselList" items="${nonFaceCounselList}"
								varStatus="status" end="${nonFaceCounselList.size()}">
								<tr class="text-center nonFaceCounselListTr" data-toggle="modal"
									data-target="#nonFaceCounselListTr">
									<td data-value="${nonFaceCounselList.cnslCd}">${status.end-status.index }</td>
									<td>${nonFaceCounselList.stuNm}</td>
									<td>${nonFaceCounselList.cnslCate }</td>
									<td class="text-left">${nonFaceCounselList.cnslTtl }</td>
									<td><fmt:formatDate value="${nonFaceCounselList.cnslReg }"
											pattern="yy/MM/dd" /></td>
									<td><fmt:formatDate value="${nonFaceCounselList.cnslDt }"
											pattern="yy/MM/dd" /></td>
									<c:if test="${nonFaceCounselList.cnslRpl == null}"><td style="color: black;">답변하기</td></c:if>
									<c:if test="${nonFaceCounselList.cnslRpl != null}"><td style="color: blue;">답변완료</td></c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 대면 상담 답변 모달 -->
<div class="modal fade show" id="counselListTr"
	style="display: none; padding-right: 17px;" aria-modal="true"
	role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 800px;">
			<div class="modal-header"
				style="background-color: #001F3F; color: white;">
				<h5 class="modal-title">상담 신청서 작성</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">×</span>
				</button>
			</div>
			<div class="modal-body text-center">
				<div class="hpa" style="width: 210mm; height: 297mm;" id="answerPdf">
					<div class="hcD" style="left: 25mm; top: 29.99mm;">
						<div class="hcI">
							<div class="hls ps12"
								style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 0mm;"></div>
						</div>
					</div>
					<div class="htb"
						style="left: 26mm; width: 160.01mm; top: 30.99mm; height: 246.40mm;">
						<svg class="hs" viewBox="-2.50 -2.50 165 251.40"
							style="left: -2.50mm; top: -2.50mm; width: 165mm; height: 251.40mm;">
				<path d="M0,28.62 L0,38.63"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M0,43.85 L0,210.17"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M17.35,28.62 L17.35,38.63"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M59.42,28.62 L59.42,38.63"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M70.27,28.62 L70.27,38.63"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M126.92,172.31 L126.92,210.17"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M129.07,3.11 L129.07,24.10"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M138.09,3.11 L138.09,24.10"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M158.01,3.11 L158.01,24.10"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M158.01,28.62 L158.01,38.63"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M158.01,43.85 L158.01,210.17"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M129.01,3.11 L158.16,3.11"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M137.94,10.34 L158.16,10.34"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M128.92,24.10 L158.16,24.10"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M-0.06,28.62 L158.16,28.62"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M-0.15,38.62 L158.16,38.62"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M-0.06,43.85 L158.16,43.85"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M-0.15,53.85 L158.16,53.85"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
				<path d="M-0.15,102.95 L158.16,102.95"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
				<path d="M-0.15,102.95 L158.16,102.95"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M-0.15,116.29 L158.16,116.29"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
				<path d="M-0.15,116.29 L158.16,116.29"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M-0.15,172.31 L158.16,172.31"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M-0.15,185.81 L158.16,185.81"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M-0.15,210.17 L158.16,210.17"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M158.01,3.11 L158.01,24.10"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M158.01,28.62 L158.01,38.63"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M158.01,43.85 L158.01,210.17"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M0,43.85 L0,210.17"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M0,28.62 L0,38.63"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M-0.15,210.17 L158.16,210.17"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M129.01,3.11 L158.16,3.11"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path></svg>
						<div class="hce"
							style="left: 0mm; top: 0mm; width: 129.07mm; height: 24.10mm;">
							<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
								<div class="hcI" style="top: 8.02mm;">
									<div class="hls ps13"
										style="line-height: 6.28mm; white-space: nowrap; left: 0mm; top: -0.35mm; height: 7.06mm; width: 128.07mm;">
										<span class="hrt cs11">학생 상담일지</span>
									</div>
								</div>
							</div>
						</div>
						<div class="hce"
							style="left: 129.07mm; top: 0mm; width: 28.94mm; height: 3.11mm;">
							<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
								<div class="hcI">
									<div class="hls ps12"
										style="line-height: 1.59mm; white-space: nowrap; left: 0mm; top: -0.11mm; height: 2.12mm; width: 27.94mm;"></div>
								</div>
							</div>
						</div>
						<div class="hce"
							style="left: 129.07mm; top: 3.11mm; width: 9.02mm; height: 20.99mm;">
							<span class="hrt cs12">결</span> <span class="hrt cs12">재</span>
						</div>
						<div class="hce"
							style="left: 138.09mm; top: 3.11mm; width: 19.92mm; height: 7.22mm;">
							<span class="hrt cs12">담당교수</span>
						</div>
						<div class="hce"
							style="left: 138.09mm; top: 10.34mm; width: 19.92mm; height: 13.76mm;">
							<span class="hrt cs12" id="empNm"><%=name%></span>
						</div>
						<div class="hce"
							style="left: 0mm; top: 24.10mm; width: 158.01mm; height: 4.52mm;">
							<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
								<div class="hcI">
									<div class="hls ps12"
										style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 157.01mm;"></div>
								</div>
							</div>
						</div>
						<div class="hce"
							style="left: 0mm; top: 28.62mm; width: 17.35mm; height: 10mm;">
							<span class="hrt cs12">학생명</span>
						</div>
						<div class="hce"
							style="left: 17.35mm; top: 28.62mm; width: 42.07mm; height: 10mm;">
							<span class="hrt cs12" id="stuNm"></span>
						</div>
						<div class="hce"
							style="left: 59.42mm; top: 28.62mm; width: 10.85mm; height: 10mm;">
							<span class="hrt cs12">일시</span>
						</div>
						<div class="hce"
							style="left: 70.27mm; top: 28.62mm; width: 87.74mm; height: 10mm;">
							<span class="hrt cs12" id="cnslDt"></span>
						</div>
						<div class="hce"
							style="left: 0mm; top: 38.62mm; width: 158.01mm; height: 5.23mm;">
							<div class="hls ps12"
								style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: -0.21mm; height: 4.23mm; width: 157.01mm;"></div>
						</div>
						<div class="hce"
							style="left: 0mm; top: 43.85mm; width: 158.01mm; height: 10mm;">
							<span class="hrt cs12">상담 내용</span>
						</div>
						<div class="hce"
							style="left: 0mm; top: 53.85mm; width: 158.01mm; height: 49.10mm;">
							<span class="hrt cs12 mt-5" id="cnslCon"></span>
						</div>
						<div class="hce"
							style="left: 0mm; top: 102.95mm; width: 158.01mm; height: 13.34mm;">
							<span class="hrt cs12">담당자 의견</span>
						</div>
						<div class="hce"
							style="left: 0mm; top: 116.29mm; width: 158.01mm; height: 56.01mm;">
							<textarea class="form-control" rows="3" id="cnslRpl"
								style="height: 100rem; border-left: 1px solid black; border-right: 1px solid black;"></textarea>
						</div>
						<div class="hce"
							style="left: 0mm; top: 172.31mm; width: 126.92mm; height: 13.51mm;">
							<span class="hrt cs12">처리결과</span>
						</div>
						<div class="hce"
							style="left: 126.92mm; top: 172.31mm; width: 31.09mm; height: 13.51mm;">
							<span class="hrt cs12">구&nbsp;분</span>
						</div>
						<div class="hce"
							style="left: 0mm; top: 185.81mm; width: 126.92mm; height: 24.36mm; text-align: -webkit-center;">
							<input type="text" id="cnslYn" readonly
								style="background-color: white;"
								class="col-6 mt-4 text-center form-control form-control-border-rounded-0"
								value="" style="color: black; border: 0;" />
						</div>
						<div class="hce"
							style="left: 126.92mm; top: 185.81mm; width: 31.09mm; height: 24.36mm;">
							<span class="hrt cs12 mt-5" id="cnslCate"></span>
						</div>
						<div class="hce"
							style="left: 0mm; top: 210.17mm; width: 158.01mm; height: 34.23mm;">
							<div class="hcD" style="left: 0.50mm; top: 0.50mm;">
								<div class="hcI" style="top: 6.99mm;">
									<input type="hidden" id="cnslCd" />
									<div class="hls ps16"
										style="line-height: 3.76mm; white-space: nowrap; left: 0mm; top: -0.23mm; height: 4.59mm; width: 157.01mm;"></div>
									<div class="hls ps16"
										style="line-height: 3.76mm; white-space: nowrap; left: 0mm; top: 7.11mm; height: 4.59mm; width: 157.01mm;"></div>
									<div class="hls ps16"
										style="line-height: 3.76mm; white-space: nowrap; left: 0mm; top: 14.45mm; height: 4.59mm; width: 157.01mm;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 모달바디 -->
			</div>
			<div class="modal-footer justify-content-align">
				<!-- 				<button type="button" id="savePdfBtn" class="btn btn-outline-danger">PDF다운</button> -->
				<button type="button" id="counselAnswerBtn"
					class="btn btn-outline-primary">등록</button>
				<button type="button" id="counselRejectBtn"
					class="btn btn-outline-secondary">반려</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 대면 답변 모달 -->

<!-- 비대면 답변 모달 -->
<div class="modal fade show" id="nonFaceCounselListTr"
	style="display: none; padding-right: 17px;" aria-modal="true"
	role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" style="top: 20px;">
			<div class="modal-header"
				style="background-color: #001F3F; color: white;">
				<h5 class="modal-title">상담 상세</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="alert alert-light" role="alert"
					style="font-size: 0.9em; padding: 1em; border: 1px solid #eee; width: 100%;">
					<p>
						<strong>※상담 답변 작성 안내</strong> <br> <br> (1)&nbsp;<strong>상담유형</strong>을
						확인후. 그에 맞는 답변을 작성해주세요.<br> <br> (2)&nbsp;<strong
							style="color: red;">반려</strong>시에는 반려사유를 반드시 작성해주세요.<br> <br>
						(3)&nbsp;<strong>승인/반려</strong>처리를 <strong>반드시</strong>&nbsp;선택해주세요<br>
					</p>
				</div>
				<!-- 모달바디 -->
				<div class="form-group col-6">
					<input type="hidden" id="modifyCnslCd">
				</div>
				<div class="row ml-2" style="margin-right: 0px; margin-left: 0px;">
					<div class="form-group col-6">
						<label>구분*</label> <input type="text" id="modifyCnslCate" readonly
							class="col-8 form-control form-control-border"
							id="exampleInputBorder" style="background-color: white;">
					</div>
					<div class="form-group col-6">
						<label>학생명*</label> <input type="text" id="modifyStuNm" readonly
							class="col-8 form-control form-control-border"
							id="exampleInputBorder" style="background-color: white;">
					</div>
				</div>
				<div class="form-group col-12">
					<div class="col-sm-4">
						<label>제목*</label>
					</div>
					<input type="text" id="modifyCnslTtl"
						class="col-10 ml-2 form-control form-control-border-rounded-0"
						id="exampleInputBorder" readonly style="background-color: white;">
				</div>
				<div class="form-group col-12">
					<div class="col-sm-4">
						<label>사유*</label>
					</div>
					<div class="row">
						<textarea class="col-10 ml-2 form-control" rows="3"
							id="modifyCnslCon" readonly style="background-color: white;"></textarea>
					</div>
				</div>
				<div class="form-group col-12">
					<div class="col-sm-4">
						<label>답변*</label>
					</div>
					<div class="row">
						<textarea class="col-10 ml-2 form-control" rows="3"
							id="modifyCnslRpl" required></textarea>
					</div>
				</div>

				<!-- 모달바디 -->
			</div>
			<div class="modal-footer justify-content-align">
				<button onclick="nonFaceAnswer()" type="button"
					class="btn btn-outline-primary">등록</button>
				<button onclick="nonFaceReject()" type="button"
					class="btn btn-outline-danger">반려</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 비대면 답변 모달 -->
<script type="text/javascript">
let counselListTr,nonFaceCounselListTr = "";
let header = "${_csrf.headerName}";
let token = "${_csrf.token}";
let data = {cnslCd : "", cnslYn : "", cnslRpl : "", cnslDt : ""};	

$("#counselRejectBtn").on("click",function(){
	Swal.fire({
		  title: '상담을 반려 하시겠습니까?',
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '반려',
		  cancelButtonText: '취소'
		}).then((result) => {
		  if (result.isConfirmed) {
	data.cnslCd = $("#cnslCd").val();
	data.cnslYn = "AP003";
	data.cnslRpl = $("#cnslRpl").val();
	$.ajax({
		url:"/counsel/professorside/answerNoteWriteUpdate",
		type:'POST',
		data: JSON.stringify(data),
		datatype:'JSON',
		contentType: 'application/json; charset=utf-8',
		beforeSend: function (xhr) {
			xhr.setRequestHeader(header, token);
		},
		success:function(result){
// 				alert(JSON.stringify(result));
			$("#cnslCd").val(result.cnslCd);
			$("#stuNm").text(result.stuNm);
			$("#cnslDt").text(result.cnslDt);
			$("#cnslCon").text(result.cnslCon);
			$("#cnslRpl").val(result.cnslRpl);
			$("#cnslCate").text(result.cnslCate);
			switch(result.cnslYn){
			case "승인":
				$("#cnslYn").css("color","blue").val(result.cnslYn);
				break;
			case "승인대기":
				$("#cnslYn").css("color","black").val(result.cnslYn);
				break;
			case "반려":
				$("#cnslYn").css("color","red").val(result.cnslYn);
				break;
			}
				Swal.fire(
	                    '반려 완료',
	                    '반려 처리 되었습니다.',
	                    'success'
	                ).then(function(){
			        	window.location.reload(true);			        	
			        });
			}
		});
	}
});
	return;	
});
$("#counselAnswerBtn").on("click",function(){
	data.cnslCd = $("#cnslCd").val();
	if(!($("#cnslRpl").val() == null || $("#cnslRpl").val() == "")){
	data.cnslRpl = $("#cnslRpl").val();
	data.cnslYn = "AP001";
// 	alert("값이있음 승인!")
	} else {
	data.cnslRpl = $("#cnslRpl").val();
	data.cnslYn = "AP002";
// 	alert("값이없음 승인대기")
	}
	
	$.ajax({
		url:"/counsel/professorside/answerNoteWriteUpdate",
		type:'POST',
		data: JSON.stringify(data),
		datatype:'JSON',
		contentType: 'application/json; charset=utf-8',
		beforeSend: function (xhr) {
			xhr.setRequestHeader(header, token);
		},
		success:function(result){
// 				alert(JSON.stringify(result));
				$("#cnslCd").val(result.cnslCd);
				$("#stuNm").text(result.stuNm);
				$("#cnslDt").text(result.cnslDt);
				$("#cnslCon").text(result.cnslCon);
				$("#cnslRpl").val(result.cnslRpl);
				$("#cnslCate").text(result.cnslCate);
				switch(result.cnslYn){
				case "승인":
					$("#cnslYn").css("color","blue").val(result.cnslYn);
					break;
				case "승인대기":
					$("#cnslYn").css("color","black").val(result.cnslYn);
					break;
				case "반려":
					$("#cnslYn").css("color","red").val(result.cnslYn);
					break;
				}
				  Swal.fire(
		                    '수정 완료',
		                    '정상적으로 수정 되었습니다.',
		                    'success'
		                ).then(function(){
				        	window.location.reload(true);			        	
				        });
				
		}
	});
	
});
counselListTr = document.querySelectorAll(".counselListTr");
counselListTr.forEach(counsel=>{
	counsel.addEventListener("click",function(){
	data.cnslCd = this.children[0].dataset.value;
		$.ajax({
			url:"/counsel/professorside/answerNoteWrite",
			type:'POST',
			data: JSON.stringify(data),
			datatype:'JSON',
			contentType: 'application/json; charset=utf-8',
			beforeSend: function (xhr) {
				xhr.setRequestHeader(header, token);
			},
			success:function(result){
// 					alert(JSON.stringify(result));
// 					alert(result.cnslDt);
// 					kstDateConvertor(result.cnslDt);
					$("#cnslCd").val(result.cnslCd);
					$("#stuNm").text(result.stuNm);
					$("#cnslDt").text(result.cnslDt);
					$("#cnslCon").text(result.cnslCon);
					$("#cnslRpl").val(result.cnslRpl);
					$("#cnslCate").text(result.cnslCate);
					switch(result.cnslYn){
					case "승인":
						$("#cnslYn").css("color","blue").val(result.cnslYn);
						break;
					case "승인대기":
						$("#cnslYn").css("color","black").val(result.cnslYn);
						break;
					case "반려":
						$("#cnslYn").css("color","red").val(result.cnslYn);
						break;
					}
			}
		});
	})
})

nonFaceCounselListTr = document.querySelectorAll(".nonFaceCounselListTr");
nonFaceCounselListTr.forEach(counsel=>{
	counsel.addEventListener("click",function(){
	data.cnslCd = this.children[0].dataset.value;
		$.ajax({
			url:"/counsel/professorside/answerNoteWrite",
			type:'POST',
			data: JSON.stringify(data),
			datatype:'JSON',
			contentType: 'application/json; charset=utf-8',
			beforeSend: function (xhr) {
				xhr.setRequestHeader(header, token);
			},
			success:function(result){
// 					alert(JSON.stringify(result));
					$("#modifyCnslCd").val(result.cnslCd);
					$("#modifyCnslTtl").val(result.cnslTtl);
					$("#modifyStuNm").val(result.stuNm);
					$("#modifyCnslCon").val(result.cnslCon);
					$("#modifyCnslRpl").val(result.cnslRpl);
					$("#modifyCnslCate").val(result.cnslCate);
			}
		});
	})
})

function nonFaceAnswer(){
	if($("#modifyCnslRpl").val() == null || $("#modifyCnslRpl").val() == "" ){
		Swal.fire({
			  icon: 'error',
			  title: '답변을 작성해주세요',
			})
		return;
	}
	data.cnslCd = $("#modifyCnslCd").val();
	data.cnslRpl = $("#modifyCnslRpl").val();
	data.cnslYn = "AP001";
	$.ajax({
		url:"/counsel/professorside/answerNoteWriteUpdate",
		type:'POST',
		data: JSON.stringify(data),
		datatype:'JSON',
		contentType: 'application/json; charset=utf-8',
		beforeSend: function (xhr) {
			xhr.setRequestHeader(header, token);
		},
		success:function(result){
			if(result != null){
				  Swal.fire(
		                    '답변 완료',
		                    '정상적으로 등록 되었습니다.',
		                    'success'
		                ).then(function(){
				        	window.location.reload(true);			        	
				        });
			}
		}
	});
}
function nonFaceReject(){
	Swal.fire({
		  title: '상담을 반려하시겠습니까?',
		  text: "반려사유를 반드시 작성해주세요",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '반려',
		  cancelButtonText: '취소'
		}).then((result) => {
			 if (result.isConfirmed) {
			if($("#modifyCnslRpl").val() == null || $("#modifyCnslRpl").val() == "" ){
				Swal.fire({
					  icon: 'error',
					  title: '반려사유를 작성해주세요',
					})
				return;
			}
			data.cnslCd = $("#modifyCnslCd").val();
			data.cnslRpl = $("#modifyCnslRpl").val();
			data.cnslYn = "AP003";
			$.ajax({
				url:"/counsel/professorside/answerNoteWriteUpdate",
				type:'POST',
				data: JSON.stringify(data),
				datatype:'JSON',
				contentType: 'application/json; charset=utf-8',
				beforeSend: function (xhr) {
					xhr.setRequestHeader(header, token);
				},
				success:function(result){
					if(result != null){
						  Swal.fire(
				                    '답변 완료',
				                    '정상적으로 등록 되었습니다.',
				                    'success'
				                ).then(function(){
						        	window.location.reload(true);			        	
						        });
					}
				}
			});
		 }	
	})
}
// 	$("#savePdfBtn").on("click", function(){
// 		//저장 영역 div id
// 		html2canvas($('#answerPdf')[0], {
// 			//logging : true,		// 디버그 목적 로그
// 			//proxy: "html2canvasproxy.php",
// 			allowTaint : true, // cross-origin allow
// 			useCORS : true, // CORS 사용한 서버로부터 이미지 로드할 것인지 여부
// 			scale : 2
// 		// 기본 96dpi에서 해상도를 두 배로 증가
// 		}).then(
// 				function(canvas) {
// 					// 캔버스를 이미지로 변환
// 					var imgData = canvas.toDataURL('image/png');
// 					var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
// 					var pageHeight = imgWidth * 1.414; // 출력 페이지 세로 길이 계산 A4 기준
// 					var imgHeight = canvas.height * imgWidth / canvas.width;
// 					var heightLeft = imgHeight;
// 					var margin = 10; // 출력 페이지 여백설정
// 					var doc = new jsPDF('p', 'mm');
// 					var position = 10;
// 					// 첫 페이지 출력
// 					doc.addImage(imgData, 'PNG', margin, position, imgWidth,
// 							imgHeight);
// 					heightLeft -= pageHeight;
// 					// 파일 저장
// 					doc.save('장학생_추천서.pdf');
// 				});
// 	});
</script>
