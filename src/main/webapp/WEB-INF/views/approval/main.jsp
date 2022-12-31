<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="row">
	<table class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm text-center">
		<thead>
			<tr>
				<th width="6%">결재번호</th>
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
			<c:forEach var="approval" items="${approvalList}" varStatus="stat">
				<tr>
					<td>${approval.apprCd}</td>
					<!-- 클릭시 결재요청한 서류를 모달창으로 출력 -->
					<td>${approval.proNm}</td>
					<td>${approval.apprCate}</td>
					<td>${approval.apprYn}</td>
					<td>
						<fmt:formatDate value="${approval.apprSdt}" pattern="YYYY/MM/dd" />
					</td>
					<td>
						<fmt:formatDate value="${approval.apprDt}" pattern="YYYY/MM/dd" />
					</td>
					<td>${approval.empNm}</td>
					<td><button type="button" class="btn btn-outline-secondary btn-flat btn-sm" style="width: 100%">상세보기</button></td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<script type="text/javascript">

	var $approvalList;

	$(function(){
		
		$approvalList = $("#approvalList");
		
		approvalList();
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
					
					let apprSdt = dateFormat(approval.apprSdt);
					let apprDt = dateFormat(approval.apprDt);
					let empNm = approval.empNm == null ? "미정" : approval.empNm;
					str += `<tr>
								<td>\${approval.apprCd}</td>
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
								<td><button type="button" class="btn btn-outline-secondary btn-flat btn-sm" style="width: 100%">상세보기</button></td>
								
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
