<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<style type="text/css">
#evaInfo {
	background-color: ivory;
	border: 1px solid black;
	border-radius: 10px;
}
</style>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="card mb-0 col-10 offset-1">
				<div class="card-body container-fluid">
					<div class="row p-3">
						<h5>수강평가</h5>
					</div>
					<div class="row">
						<div class="card col-12 container">
							<div class="card-body">
								<h5>나의 정보</h5>
								<div class="row">
									<div class="form-group col-2">
										<label>학번</label> <input type="text" class="form-control" value="${student.stuNo}"
											readonly>
									</div>
									<div class="form-group col-2 offset-1">
										<label>성명</label> <input type="text" class="form-control" value="${student.stuNm}"
											readonly>
									</div>
									<div class="form-group col-2 offset-1">
										<label>소속</label> <input type="text" class="form-control" value="${student.depNm}"
											readonly>
									</div>
									<div class="form-group col-2 offset-1">
										<label>재학학기</label> <input type="text" class="form-control" value="${student.stuYr}학년 ${student.stuSem}학기"
											readonly>
									</div>
								</div>
								<br> <br>
								<div class="row card p-3" id="evaInfo">
									<strong>본 강의 평가 설문지는 익명으로 작성되며, 이번 학기 교과목의 수업진행에 대한
										학생들의 솔직한 의견을 파악하여, 앞으로 보다 나은 강의를 하기 위한 목적으로 실시하는 것입니다.<br>
										따라서 본 학생 여러분은 각 평가 문항에 대하여 성실하고 진지하게 답변해 주시기 바랍니다.
									</strong>
								</div>
								<div class="row">
									<div class="card-body col-5 container-fluid">
										<div class="row">
											<label>수강한 강의</label>
										</div>
										<div class="row">
											<table
												class="table text-nowrap table-striped table-bordered table-sm text-center table-hover">
												<thead>
													<tr>
														<th>순번</th>
														<th>과목명</th>
														<th>담당교수</th>
														<th>평가여부</th>
													</tr>
												</thead>
												<tbody id="tbodyId">
													<c:if test="${evaluationList != null and evaluationList.size() > 0}">
														<c:forEach var="evaluation" items="${evaluationList}" varStatus="stat">
														<tr onclick="highlightRow(this,${evaluation.lecaCd})">
															<td>${stat.count}</td>
															<td>${evaluation.lecaNm}</td>
															<td>${evaluation.empNm}</td>
															<td class="evyn">${evaluation.evlqYn}</td>
														</tr>
														</c:forEach>
													</c:if>
													<c:if test="${evaluationList == null or evaluationList.size() == 0}">
														<tr>
															<td colspan="4">수강 평가기간이 아니거나 강의가 없습니다.</td>
														</tr>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
									<div class="card-body col-7 container-fluid">
										<div class="row">
											<label class="col-2">강의 평가</label>
											<div class="form-group col-2 offset-6">
												<button class="btn btn-secondary btn-flat" id="autoFill">자동채우기</button>
											</div>
											<div class="form-group col-2">
												<button class="btn btn-secondary btn-flat" id="save">저장</button>
											</div>

										</div>
										<div class="row">
											<input id="stuNo" type="hidden" value="${student.stuNo}">
											<input id="lecaCd" type="hidden" value="0"/>
											<table
												class="table table-striped table-bordered table-sm text-center col-12">
												<thead>
													<tr>
														<th class="align-middle">순번</th>
														<th class="align-middle">평가문항</th>
														<th width="8%" class="align-middle">매우<br>그렇다</th>
														<th width="8%" class="align-middle">그렇다</th>
														<th width="8%" class="align-middle">보통<br>이다</th>
														<th width="8%" class="align-middle">그렇지<br>않다</th>
														<th width="8%" class="align-middle">매우<br>그렇지<br>않다</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="evaluationQ" items="${evaluationQList}" varStatus="status">
													<tr>
														<td>${status.count}</td>
														<td class="text-left">${evaluationQ.evlqCon}</td>
														<td class="align-middle" ><input type="radio" value="5" name="evlq${status.count}"></td>
														<td class="align-middle"><input type="radio" value="4" name="evlq${status.count}"></td>
														<td class="align-middle"><input type="radio" value="3" name="evlq${status.count}"></td>
														<td class="align-middle"><input type="radio" value="2" name="evlq${status.count}"></td>
														<td class="align-middle" onclick=""><input type="radio" value="1" name="evlq${status.count}"></td>
													</tr>
													</c:forEach>
													<tr>
														<td>기타</td>
														<td class="text-left p-2 " colspan="6">이 강의에서 좋았던 점이나 개선할 점이 있다면 자유롭게 작성해주세요<br>
															<textarea id="cont" rows="6" style="width: 100%"></textarea></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	let evSize = '${evaluationQList.size()}';
	let stuNo = $("#stuNo").val();
	let enabled = false;
	
	var header = "${_csrf.headerName}";
	var token = "${_csrf.token}";
	
	console.log("stuNo : ", stuNo);
	$(function(){
		$(".evyn").css("color",function(){
			if($(this).html() == '미완료'){
				return 'red';
			};		
		});
		
		$("#autoFill").on("click",function(){
			for(let i=1; i<=evSize; i++){
				$(":radio[name='evlq" + i + "']").radioSelect('5');
			}
		});
		
		$("#save").on("click",function(){
			
			let score = 0;
			let content = $("#cont").val();
			let lecaCd = $("#lecaCd").val();
			
			for(let i=1; i<=evSize; i++){
				let value = $("input[name=evlq"+ i + "]:checked").val();
				if(typeof value == 'undefined'){
					alert("선택되지 않은 항목이 존재합니다.");
					return;
				}
				
				score += value/1;
			}
			
			if(content == ""){
				alert("의견을 입력해주세요.");
				return;
			}
			
			if(lecaCd == 0){
				alert("강의를 선택해주세요");
				return;
			}
			
			if(!enabled){
				alert("평가할 강의를 선택해주세요.");
				return;
			}
			
			score = score/ (evSize * 10 / 2) * 100;
			
			let data = {
					lecaCd : $("#lecaCd").val(),
					stuNo : stuNo,
					evlScore : score,
					evlEtc : content
			};
			
			$.ajax({
				url : "/student/evaluation/register",
				type: "post",
				data : JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function(result){
					if(result > 0){
						alert("성공");
						location.reload();
					} else{
						alert("실패");
					}
				}
			})
		});
	
		
		$.fn.radioSelect = function(val) {
			  this.each(function() {
			    var $this = $(this);
			    if($this.val() == val)
			      $this.attr('checked', true);
			  });
			  return this;
		};
	});
	
	function highlightRow(obj, p_lecaCd){
		
		$("#lecaCd").val(p_lecaCd);
		var tbody = document.getElementById("tbodyId");
		var trs = tbody.getElementsByTagName("tr");
		console.log(trs);
		for(var i=0; i<trs.length; i++){
			trs[i].style.background = "white";
		}
		
		var tds = obj.getElementsByTagName("td");
		if(tds[3].innerHTML == '완료'){
			enabled = false;
			return;
		}
		enabled = true;
		
		obj.style.backgroundColor = "#FCE6E0";

	}
</script>