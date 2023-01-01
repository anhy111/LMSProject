<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
<div class="modal" id="modal-lg" style="display: none;"aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">강의계획서 결재</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="col-sm-12">
					<div class="container-fluid">
						<div class="row">
							
						</div>
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
			$("#modal-lg").modal('show');
			$("#apprBtn1").show();
		});
		
		// 장학금추천 모달
		$(document).on("click",".scholarship",function(){
			
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
					if(approval.apprCate == "강의계획서"){
						detail = "강의계획서";
						b_class = "lecApply"
					}else{
						detail = "추천장학생";
						b_class = "scholarship";
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
								<td><button type="button" class="btn btn-outline-secondary btn-flat btn-sm \${b_class}"
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
		console.log("date.getFullYear()" + date.getFullYear());
		let str = date.getFullYear() + "/" 
					+ (date.getMonth() < 10 ? "0" + date.getMonth() :  date.getMonth()) + "/"
							+ (date.getDate() < 10 ? "0" + date.getDate() : date.getDate());
		return str;
	}
</script>
