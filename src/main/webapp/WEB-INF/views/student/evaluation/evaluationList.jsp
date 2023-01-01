<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="row">
	<table class="table table-sm text-center col p-0 myinfo">
		<tbody>
			<tr>
				<th width="25%">학번</th>
				<td width="25%">${student.stuNo}</td>
				<th width="25%">성명</th>
				<td width="25%">${student.stuNm}</td>
			</tr>
			<tr>
				<th>소속</th>
				<td>${student.depNm}</td>
				<th>재학학기</th>
				<td>${student.stuYr}학년${student.stuSem}학기</td>
			</tr>
		</tbody>
	</table>
</div>
<div class="row">
	<div class="alert alert-light col" role="alert">
		<!-- 게시판 안내사항 -->
		<p>
			<strong>
			이 설문은 보다 좋은 교육을 여러분에게 제공하고자 실시되는 것입니다.<br> 익명으로 작성된 여러분의 응답은 성적평가 후 정리되어 담당교수의 다음 학기 강의준비를 위한 <br> 참고자료 및 교육여건 개선을 위한 기초자료로 활용되오니 성실하게 답변하여 주시기 바랍니다.<br>
			<br> &#8251;각 문항별로 여러분이 동의하는 정도에 따라 매우그렇다 ~ 매우그렇지않다 중 하나를 기재하여 주십시오.
			</strong>
		</p>
	</div>
</div>
<div class="row">
	<div class="card-body col-5 container-fluid">
		<div class="row">
			<label>수강한 강의</label>
		</div>
		<div class="row">
			<table class="table text-nowrap table-striped table-bordered table-sm text-center table-hover">
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
			<input id="stuNo" type="hidden" value="${student.stuNo}"> <input id="lecaCd" type="hidden" value="0" />
			<table class="table table-striped table-bordered table-sm text-center col-12">
				<thead>
					<tr>
						<th class="align-middle">순번</th>
						<th class="align-middle">평가문항</th>
						<th width="8%" class="align-middle">매우<br>그렇다
						</th>
						<th width="8%" class="align-middle">그렇다</th>
						<th width="8%" class="align-middle">보통<br>이다
						</th>
						<th width="8%" class="align-middle">그렇지<br>않다
						</th>
						<th width="8%" class="align-middle">매우<br>그렇지<br>않다
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="evaluationQ" items="${evaluationQList}" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td class="text-left">${evaluationQ.evlqCon}</td>
							<td class="align-middle">
								<input type="radio" value="5" name="evlq${status.count}">
							</td>
							<td class="align-middle">
								<input type="radio" value="4" name="evlq${status.count}">
							</td>
							<td class="align-middle">
								<input type="radio" value="3" name="evlq${status.count}">
							</td>
							<td class="align-middle">
								<input type="radio" value="2" name="evlq${status.count}">
							</td>
							<td class="align-middle" onclick="">
								<input type="radio" value="1" name="evlq${status.count}">
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td>기타</td>
						<td class="text-left p-2 " colspan="6">
							이 강의에서 좋았던 점이나 개선할 점이 있다면 자유롭게 작성해주세요<br>
							<textarea id="cont" rows="6" style="width: 100%"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
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
			
			score = (score/ (evSize * 10 / 2) * 4.5).toFixed(1);
			
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
						alert("평가가 완료되었습니다.");
						location.reload();
					} else{
						alert("다시 시도해주세요.");
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
		
		for(let i=1; i<=evSize; i++){
			$(":radio[name='evlq" + i + "']").attr("checked",false);
		}
		
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