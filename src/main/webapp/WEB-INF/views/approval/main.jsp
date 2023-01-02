<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="/resources/css/schRcmd.css">
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>

<div class="row">
	<table class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm text-center">
		<thead>
			<tr>
				<th width="6%">결재번호</th>
				<th width="10%">기안자번호</th>
				<th>기안자</th>
				<th>구분</th>
				<th>승인 여부</th>
				<th>기안일자</th>
				<th>승인 일자</th>
				<th>결재자</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody id="approvalList">
			
		</tbody>
	</table>
</div>
<div class="modal" id="modal-lg" style="display: none; z-index: 1041" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">장학생추천 결재</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body" style="padding: 0px">
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
								<div class="hls ps20"
									style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 20.67mm; height: 4.23mm; width: 170mm;">
									<div style="position:absolute;right: 90px;">
										<span class="hrt cs9">학과 :</span><span class="hrt cs9 depNm"></span>
									</div>
									<span class="htC" style="left: 1.06mm; width: 11.99mm; height: 100%;"></span>
									<span class="htC" style="left: 1.06mm; width: 11.99mm; height: 100%;"></span>
								</div>
								<div class="hls ps20"
									style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 27.45mm; height: 4.23mm; width: 170mm;">
									<div style="position:absolute;right: 90px;">
										<span class="hrt cs9">학번 :</span><span class="hrt cs9 stuNo"></span>
									</div>
									<span class="htC" style="left: 1.06mm; width: 11.99mm; height: 100%;"></span>
									<span class="htC" style="left: 1.06mm; width: 11.99mm; height: 100%;"></span>
								</div>
								<div class="hls ps20"
									style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 34.22mm; height: 4.23mm; width: 170mm;">
									<div style="position:absolute;right: 90px;">
										<span class="hrt cs9">성명 :</span><span class="hrt cs9 stuNm"></span>
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
									<span class="hrt cs10" id="empNm"></span>
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
									<span class="hrt cs10" id="deanNm"> </span> 
									<span class="htC" style="left: 1.06mm; width: 11.99mm; height: 100%;"></span>
									<span class="htC" style="left: 1.06mm; width: 11.99mm; height: 100%;"></span>
									<img alt="" src="/resources/upload/img/교수도장ys.jpg">
									<span class="hrt cs10">(인)</span>
								</div>
								<div class="hls ps20"
									style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 168.37mm; height: 4.23mm; width: 170mm;"></div>
								<div class="hls ps20"
									style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: 175.15mm; height: 4.23mm; width: 170mm;">
									<span class="hrt cs10">관리자 : &nbsp;</span>
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
									<span class="hrt cs11 sclhDt"></span>
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
			<div class="modal-footer justify-content-align">
				<div id="apprBtn1" style="display: none">
					<button type="button" class="btn btn-outline-warning" id="approve">승인</button>
					<button type="button" id="loadReferModal" class="btn btn-outline-danger">반려</button>
				</div>
				<div id="apprBtn2" style="display: none">
					<button type="button" id="cancelApprove" class="btn btn-outline-danger">승인취소</button>
				</div>
				<div id="apprBtn3" style="display: none">
					<button type="button" class="btn btn-outline-secondary" id="cancelMsg">반려 사유</button>
					<button type="button" id="cancelRefer" class="btn btn-outline-danger">반려취소</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="referModal" style="display:none; z-index:1041" aria-hidden="true">
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
					<button type="button" id="refer" value="AP003" class="btn btn-block btn-danger">반려</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="referReason" style="display:none;z-index:1041" aria-hidden="true">
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
<script type="text/javascript">

	var $approvalList;

	$(function(){
		
		$approvalList = $("#approvalList");
		
		approvalList();
		
		// 강의계획서 모달
		$(document).on("click",".lecApply",function(){
			lecaCd = this.value;
			window.open("/approval/lecApplyApproveForm?lecaCd="+lecaCd, "inquirydetail", "width=1000, height=850, left=100, top=50");
		});
		
		// 장학금추천 모달
		$(document).on("click",".scholarship",function(){
			$("#modal-lg").modal();
		});
		
		$("#approve").on("click",function(){
			$("#apprBtn1").hide();
			$("#apprBtn2").show();
			$("#apprBtn3").hide();
		});
		
		$("#loadReferModal").on("click",function(){
			$("#referModal").modal('show');

		});
		
		$("#refer").on("click",function(){
			$("#referModal").modal('hide');
			$("#apprBtn1").hide();
			$("#apprBtn2").hide();
			$("#apprBtn3").show();
		})
		
		$("#cancelApprove").on("click",function(){
			$("#apprBtn1").show();
			$("#apprBtn2").hide();
			$("#apprBtn3").hide();
		})
		
		$("#cancelRefer").on("click",function(){
			$("#apprBtn1").show();
			$("#apprBtn2").hide();
			$("#apprBtn3").hide();
		})
	});
	
	function approvalList(){
		let data = {
			
		};
		
		$.ajax({
			url : "/approval/list",
			type : "get",
// 			data : data,
			success : function(result){
				$approvalList.html("");
				let str = "";
				
				$.each(result,function(p_inx, approval){
					
					let detail = "";
					let b_class = "";
					let btnClass = "";
					if(approval.apprCate == "강의계획서"){
						detail = "강의계획서";
						b_class = "lecApply"
						btnClass = "secondary";
					}else{
						detail = "추천장학생";
						b_class = "scholarship";
						btnClass = "info";
					}
					
					let apprSdt = dateFormat(approval.apprSdt);
					let apprDt = dateFormat(approval.apprDt);
					let empNm = approval.empNm == null ? "미정" : approval.empNm;
					str += `<tr>
								<td>\${approval.apprCd}</td>
								<td>\${approval.proNo}</td>
								<td>\${approval.proNm}</td>
								<td>\${approval.apprCate}</td>
								<td class="apprYn">\${approval.apprYn}</td>
								<td>
									\${apprSdt}
								</td>
								<td>
									\${apprDt}
								</td>
								<td>\${empNm}</td>
								<td><button type="button" class="btn btn-outline-\${btnClass} btn-flat btn-sm \${b_class}"
										style="width: 100%" value="\${approval.apprTagCd}">\${detail}</button></td>
								
							</tr>`;
				});
				$approvalList.append(str);
				
				$(".apprYn").html(function(p_inx, p_html){
					if(p_html == "승인"){
						$(this).css("color","blue")
					} else if(p_html == "반려"){
						$(this).css("color","red");
					}
					return p_html;
				});
				
			}
		})
	}
	
	function dateFormat(p_date){
		if(p_date == "" || p_date == null){
			return "";
		} 
		let date = new Date(p_date);
		let str = date.getFullYear() + "/" 
					+ (date.getMonth()+1 < 10 ? "0" + (date.getMonth()+1) :  date.getMonth()+1) + "/"
							+ (date.getDate() < 10 ? "0" + date.getDate() : date.getDate());
		return str;
	}
</script>
