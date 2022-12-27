<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<link rel="stylesheet" href="/resources/css/suwon.css">
<script type="text/javascript" src="/resources/js/spinner.js"></script>
<style>
	/* 기본 틀 잡기 (사이버캠퍼스 / 변동 가능 / suwon.css 파일에 넣었다가 주석 처리함) */
	.card {
		min-height: 780px;
		width: 100%;
		padding: 2%;
		border-top: 5px solid #112a63;
		border-radius: 10px 10px 0 0 ;
		max-width: 1400px;
		min-width: 1090px;
		margin: 0 auto;
		padding-bottom: 150px;
	}
	
	.card-body {
		width: 100%;
	}
	
/* 기본 틀 잡기 끝 */
	
	.clear {
		clear: both;
	}
	
	.topBorder {
		border-top: 2px solid #112a63;
	}
	
	.lecApplyName {
		margin-bottom: 20px;
		width: 300px;
		float: left;
	}
	
	.attenTopWrap{
		min-height: 480px;
	    box-sizing: border-box;
	    width: 100%;
	}
	
	.attenBotWrap td {
		padding: 4px;
		text-align: center;
		background: #f4f7fd;
	}
	
	.attenBotWrap input[type=text] {
		text-align: center;
	}
	
	.attenBotWrap table {
		border: 1px solid #9b9b9b;
		width: 100%;
	}
	
	#grid {
		width: 100%;
	}
	
	#grid th {
		background: #f4f7fd;
	}
	
	#grid td {
		background: #fff !important;
	}
	
	.informDetailBot {
/* 		border-bottom: 1px solid #9b9b9b; */
	}
	
	.informDetailBot table {
		border: 1px solid #9b9b9b;
		width: 100%;
/* 		border-bottom: none; */
	}
	
	.W {
		background: #fff !important;
	}
	
	.H {
		height: 30px;
	}
	
	.attendSelect::-ms-expand { 
		display: none;
	}
	
	.attendSelect {
	  -o-appearance: none;
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  appearance: none;
	  border-radius: 0.1rem !important;
	}
	
	.attendSelect {
	  width: 41px;
	  height: 27px;
 	  padding: 0 13px; 
	  border-radius: 4px;
	  outline: 0 none;
	  color: #777;
	}
	.attendSelect option {
	  background: #fff;
	  color: #333;
	  padding: 3px 0;
	}
	
	.inputCustum {
		width: 30px;
	    border: none;
	    background: transparent;
	}
	
	.f9 {
		background: #f9f9f9 !important;
		border-radius: 0.1rem;
	}
	
	.informDetailBot table {
		border-top: none;
}
	
	.fitTable {
		border-top: 1px solid #9b9b9b;
	}
</style>

<script type="text/javascript" defer="defer">
let header = "${_csrf.headerName}";
let token = "${_csrf.token}";
	$(function() {
		
		// 로딩창
		loadingWithMask();
		
		var lateCnt = 0;
		var atenEarly = 0;
		
		// 결석 일수 세기
		function absentCnt(lateCnt, earlyCnt, AbsentCnt) {
			
			cnt1 = parseInt(lateCnt/3) + parseInt(earlyCnt/3) + parseInt(AbsentCnt);
			
			$('#totalAbsent').html(cnt1);
			
		}
		
		
		var stuNo = 0;
		var lecaCd = $('#lecaCd').val();
// 		console.log("lecaCd : " + lecaCd);
		
		
		// 토스트에서 학생 선택시 상세 정보 ajax
		function detail(stuNo, lecaCd) {
			
			$.ajax({
				url : "/lectureBoard/attendDetail",
				data : { 
						"stuNo" : stuNo,
						"lecaCd"	: lecaCd,
				},
				beforeSend : function(xhr){
						xhr.setRequestHeader(header, token);
					},
				type : 'post',
				dataType : 'json',
				success : function(result) {
					console.log("성공");
					console.log(result);
					$('#stuNo').val(result.studentDetail.stuNo);
					$('#stuNm').val(result.studentDetail.stuNm);
					$('#atenAttend').val(result.attendence.atenAttend);
					$('#atenLate').val(result.attendence.atenLate);
					$('#atenAbsent').val(result.attendence.atenAbsent);
					$('#atenEarly').val(result.attendence.atenEarly);
					$('#atenOffically').val(result.attendence.atenOffically);					
					
					lateCnt = $('#atenLate').val();
					earlyCnt = $('#atenEarly').val();
					AbsentCnt = $('#atenAbsent').val();
					absentCnt(lateCnt, earlyCnt, AbsentCnt);

					str = '';
					wk = 0;
					hr = 0;
					$.each(result.attenDetail, function(i,v) {
						wk = v.atenWk;
						hr = v.atenHr;
						
						console.log("atendWk + hr : " + wk + " / " + hr);
						
// 						$('#hr_' + wk + '_' + hr).html(v.atenCate);
						$('#hr_' + wk + '_' + hr + ' option[value = ' + v.atenCate + ']').attr("selected", true);
						$('#hr_' + wk + '_' + hr + ' select').attr("disabled", false);
					})
					if(wk == 16 && hr ==3){
						return false;
					}
					
					// 아무 값도 안들어 있을 경우!!
					if(wk == 0 && hr == 0) {
						$('#hr_' + 1 + '_' + 1 + ' select').attr("disabled", false);
						console.log("new wk / hr : " + wk + " / " + hr);
						
						return false;
					}
					if(${data.lecaCrd} == 3){
						if(hr != 3){
							console.log("1change atendWk + hr : " + wk + " / " + (parseInt(hr)+1))
							$('#hr_' + wk + '_' + (parseInt(hr)+1) + ' select').attr("disabled", false);
						}else{
							console.log("2change atendWk + hr : " + (parseInt(wk)+1) + " / " + (parseInt(hr)-2))
							$('#hr_' + (parseInt(wk)+1) + '_' +( parseInt(hr)-2) + ' select').attr("disabled", false);
						}
					}
					if(${data.lecaCrd} == 2){
						if(hr != 2){
							console.log("1change atendWk + hr : " + wk + " / " + (parseInt(hr)+1))
							$('#hr_' + wk + '_' + (parseInt(hr)+1) + ' select').attr("disabled", false);
						}else{
							console.log("2change atendWk + hr : " + (parseInt(wk)+1) + " / " + (parseInt(hr)-1))
							$('#hr_' + (parseInt(wk)+1) + '_' +( parseInt(hr)-1) + ' select').attr("disabled", false);
						}
					}
					
					
				}
			})
		}
		
		// 출결 상태를 변화하면
		$(document).on('change', '.attendSelect' ,function() {
			console.log(this.value);
			console.log($(this).parent().data('wk'));
			console.log($(this).parent().data('hr'));
			
			// 선택한 출결(공통코드)
			selectCate = this.value;
			// 선택한 주차
			selectWk = $(this).parent().data('wk');
			// 선택한 차시
			selectHr = $(this).parent().data('hr');
			
			console.log("atenCate : " + selectCate + " / atenWk : " + selectWk + " / atendHr : " + selectHr + " / stuNo : " + stuNo + " / lecaCd : " + lecaCd);
			
			// 출결 확인 cnt ajax
			$.ajax({
				url : "/lectureBoard/attenChkCnt",
				type : 'post',
				data : JSON.stringify({
					lecaCd : lecaCd,
					stuNo : stuNo,
					atenWk : selectWk,
					atenHr : selectHr
				}),
				contentType:"application/json;charset=utf-8",
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				dataType : 'JSON',
				success : function(result) {
					console.log("인서트 DB 여부 확인  : " + result);
					
					if(result == 0) {
						attenInsert(lecaCd, stuNo, atenWk, atenHr);
					}else {
						attenUpdate(lecaCd, stuNo, atenWk, atenHr, selectCate);
					}
				}
				
			})
			
			
			// 출결 insert ajax
			function attenInsert(lecaCd, stuNo, atenWk, atenHr) {
				$.ajax({
					url : "/lectureBoard/attendStuInsert",
					type : 'post',
					data : {
						lecaCd : lecaCd,
						stuNo : stuNo,
						atenCate : selectCate,
						atenWk : selectWk,
						atenHr : selectHr
					},
					beforeSend : function(xhr){
						xhr.setRequestHeader(header, token);
					},
					dataType : 'JSON',
					success : function(result) {
						console.log("등록 성공");
						detail(stuNo, lecaCd);
						
						name = $('#stuNm').val();
						
// 						chk = $('#checkOrNo').val();
						if ($('#checkOrNo').is(":checked")) {
				            return false;
				        }else {
							alert(name + " 학생의 출결을 등록했습니다.");
				        }
						
					}
				})
			}
			
			// 출결 update ajax
			function attenUpdate(lecaCd, stuNo, atenWk, atenHr, selectCate) {
				$.ajax({
					url : "/lectureBoard/attendStuUpdate",
					type : 'post',
					data : {
						lecaCd : lecaCd,
						stuNo : stuNo,
						atenCate : selectCate,
						atenWk : selectWk,
						atenHr : selectHr
					},
					beforeSend : function(xhr){
						xhr.setRequestHeader(header, token);
					},
					dataType : 'JSON',
					success : function(result) {
						console.log("수정 성공");
						detail(stuNo, lecaCd);
						
						name = $('#stuNm').val();
						
						if ($('#checkOrNo').is(":checked")) {
				            return false;
				        }else {
							alert(name + " 학생의 출결을 수정했습니다.");
				        }
					}
				})
			}
			
		})
		
		
		// 학생 리스트 불러오기(최초)
		$.ajax({
			url : "/lectureBoard/studentList",
			type : 'post',
			data : {
				lecaCd : lecaCd,
			},
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			dataType : 'JSON',
			success : function(result) {
				console.log("성공");
				
				$('#grid').empty();
				
				grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : result,
					scrollX : true,
					scrollY : true,
					minBodyHeight : 400,
					bodyHeight : 250,
// 					width : 1100,
					columns : [
						{header : '단과대학', name : 'colNm', filter : 'select',   align : 'center'},     //width : ,  
						{header : '학과', name : 'depNm', filter : 'select',      align : 'center'},     //width : ,
						{header : '학년', name : 'stuYr', filter : 'select',      align : 'center'},     //width : , 
						{header : '학번', name : 'stuNo', filter : 'select',      align : 'center'},     //width : ,
						{header : '이름', name : 'stuNm', filter : 'select',      align : 'center'},     //width : ,
						{header : '연락처', name : 'stuTel', filter : 'select',    align : 'center'}     //width : ,  
					],
					rowHeaders: ['rowNum'],
					columnOptions: { resizable: true }
				});
				
				setTimeout(closeLoadingWithMask, 1000);
// 				closeLoadingWithMask();
				
				grid.on('click', function(object) {
					
					str = '<select name="atenCate" class="attendSelect" disabled>';
					str += '<option value="" selected>&nbsp;-</option>';
					str += '<option value="A001">○</option>';
					str += '<option value="A002">△</option>';
					str += '<option value="A003">⨉</option>';
					str += '<option value="A004">☆</option>';
					str += '<option value="A005">◎</option>';
					str += '</select>';
					
					$('.H').html(str);
								
								
					stuNo = grid.getRow(object.rowKey).stuNo;
					
					console.log(stuNo);
					console.log(lecaCd);
					
					detail(stuNo, lecaCd);
					
				})
				
			}
		})
		
		
		
		
	})	
</script>


<!-- 출결 -->
<div class="col-lg-12">
	<div class="card" style="min-height: 700px;padding-bottom: 15%;">
		<div class="card-body">
			<div id="bodyWrapper">
				<h4	class="lecApplyName">${data.lecaNm }&emsp;&#45;&emsp;출결 관리</h4>
				
				<div class="clear topBorder"></div>

				<div class="attenTopWrap">				
					<p style="margin-top: 30px;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;수강생 목록</p>
					<div id="grid"></div>
				</div>
				<div class="attenBotWrap">
						<p style="margin-top: 30px;display: inline-block;float: left;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;수강생 출결 정보</p>
						<p style="margin-top: 30px;display: inline-block;float: right;">
							<span style="float: right;">
								<span class="badge badge-outline-danger">총 결석일</span>
								&emsp;
								<span id="totalAbsent">-</span>&nbsp;일
							</span>
							<br>
							<span style="font-size: 0.9em;">지각/조퇴 3회는 결석 1회로 산정됨</span>
						</p>
						<!-- 학생 정보 -->
						<div class="informDetailTop">
							<table class="mb-3" border="1">
								<tr>
									<td colspan="4" style="text-align: center;">학생정보</td>
									<td colspan="10" style="text-align: center;">출결</td>
								</tr>
								<tr>
									<td>학번</td>
									<td class="W">
										<input type="text" id="stuNo" name="stuNo" class="form-control f9" disabled placeholder="학생을 선택하세요" />
									</td>
									<td>이름</td>
									<td class="W">
										<input type="text" id="stuNm" class="form-control f9" disabled placeholder="학생을 선택하세요" />
									</td>
									<td>출석</td>
									<td class="W">
										<input type="text" id="atenAttend" class="form-control f9" disabled placeholder="출석일수가 보여집니다." />
									</td>
									<td>지각</td>
									<td class="W">
										<input type="text" id="atenLate" class="form-control f9" disabled placeholder="지각일수가 보여집니다."/>
									</td>
									<td>결석</td>
									<td class="W">
										<input type="text" id="atenAbsent" class="form-control f9" disabled placeholder="결석일수가 보여집니다."/>
									</td>
									<td>조퇴</td>
									<td class="W">
										<input type="text" id="atenEarly" class="form-control f9" disabled placeholder="조퇴일수가 보여집니다."/>
									</td>
									<td>공결</td>
									<td class="W">
										<input type="text" id="atenOffically" class="form-control f9" disabled placeholder="공결일수가 보여집니다."/>
									</td>
								</tr>
							</table>
						</div>
						
						
						<!-- 출결 상세 -->
						<div class="informDetailBot">
							<p style="margin-top: 30px;display: inline-block;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;출결표</p>
							<div class="alert alert-light bg-light border-0" role="alert" style="font-size: 0.9em;padding: 15px 30px 15px; 20px;border: 1px solid #eee;">
									<p style="display: block;text-align: center; font-size: 1.1em;">&#8251; 전자출결시스템 안내</p>
									<hr>
									<p>(1) 출결 표시 방법 안내.</p>
									&emsp;-&nbsp;<strong>출석&nbsp;:&nbsp;○&emsp;|&emsp;지각&nbsp;:&nbsp;△&emsp;|&emsp;결석&nbsp;:&nbsp;⨉&emsp;|&emsp;공결&nbsp;:&nbsp;◎</strong><br><br>
									<p>(2) 출결표는 주차와 차시로 구분됩니다.</p>
									<p>(3) 변경 또는 출결을 등록하고 싶은 주차와 차시에 해당하는 <strong>선택박스&nbsp;<i class="mdi mdi-minus-box-outline" style="font-size: 1.6em;"></i>&nbsp;를 클릭</strong>하여 출결을 저장합니다.<p>
									<p>(4) 다음 차시의 출결은 <strong>이전 차시의 출결을 등록해야만</strong> 선택할 수 있습니다.<p>
							</div>
								
							<input type="hidden" id="lecaCd" name="lecaCd" value="${data.lecaCd }" />
							
							<input type="checkbox" id="checkOrNo" value="noAlert">
							<label for="checkOrNo">출결 상태 변화 알림 끄기</label>
							
							<div class="fitTable">
							<c:forEach var="j" begin="1" end="9" step="8">
								<table class="mb-0" border="1">
									<!-- 1~16주까지 보여주는 곳 -->
									<tr>
										<c:forEach var="i" begin="${j }" end="${j+7}" step="1">
											<td colspan="${data.lecaCrd }">
												<input type="text" id="atenWk" name="atenWk" class="inputCustum" value="${i }" disabled />
											</td>
										</c:forEach>
									</tr>
									<!-- 1~학점 만큼 차시를 보여주는 곳 -->
									<tr>
										<c:forEach begin="${j}" end="${j+7}" step="1">
											<c:forEach var="i" begin="1" end="${data.lecaCrd }" step="1">
												<td style="width:50px;">
													<input type="text" id="atenHr" name="atenHr" class="inputCustum" value="${i }" disabled />
												</td>
											</c:forEach>
										</c:forEach>
									</tr>
									<!-- 1~8주차 출결 현황 작성하는 곳 -->
									<tr>
										<c:forEach begin="${j}" end="${j+7}" step="1" var="k">
											<c:forEach var="i" begin="1" end="${data.lecaCrd}" step="1">
												<td class="W H" id="hr_${k}_${i}" data-wk="${k}" data-hr="${i}">
													<select name="atenCate" id="atenCate" class="attendSelect" disabled>
													<!-- ○◎△  -->
														<option value="null" selected>&nbsp;-</option>
														<option value="A001">○</option>
														<option value="A002">△</option>
														<option value="A003">⨉</option>
														<option value="A004">☆</option>
														<option value="A005">◎</option>
													</select>
												</td>
											</c:forEach>
										</c:forEach>
									</tr>
								</table>
							</c:forEach>
							</div>
						</div>
				</div>
				<!-- attenBotWrap End -->
			</div>
		</div>
	</div>
</div>