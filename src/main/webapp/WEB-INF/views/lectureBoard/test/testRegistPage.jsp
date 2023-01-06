<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<!-- js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	
<style>
	/* 기본 틀 잡기 (사이버캠퍼스 / 변동 가능 / suwon.css 파일에 넣었다가 주석 처리함) */
	.card {
		min-height: 780px;
		width: 100%;
		padding: 2%;
		border-top: 5px solid #112a63;
		border-radius: 10px 10px 0 0;
		max-width: 1400px;
		min-width: 1090px;
		margin: 0 auto;
		margin-bottom: 150px;
	}
	
	.card-body {
		width: 100%;
	}
	
	/* 기본 틀 잡기 끝 */
	
	.quizInputWrap {
		height: 300px;
		background: #f5f5f5;
		padding: 2%;
		border-radius: 5px;
		border: 1px solid #e0e0e0;
		margin-bottom: 30px;
	}
	
	.table thead th {
		border-bottom: 1px solid #eef2f7;
		border-top: 1px solid #e0e0e0; 
	}
	
	.plusBtn {
		margin: 2% auto;
	    width: 25%;
	    font-size: 1.2em;
	    text-shadow: 2px 2px rgb(0 0 0 / 40%);
	    font-weight: 700;
	    height: 45px;
	    display: block;
	}
	
	.minusbtn, #delbtncntsix {
		float: right;
	    text-shadow: 2px 2px rgb(0 0 0 / 10%);
	    font-weight: 700;
	    width: 4%;
	}
</style>
<div class="row">
				<div class="col-lg-12">
						<div class="card-body">
							<div class="quizWrapper">
								<form id="frm" method="post" action="/lectureBoard/test/testRegist">       
									<div class="row">
										<div class="form-group col-sm-4">
											<label class="modifyDisplay">제목</label> <input type="text" class="form-control" id="testNm" name="testNm" placeholder="제목을 입력하세요">
										</div>
										<div class="form-group col-sm-4">
											<label>시험 일정</label>
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text">
														<i class="far fa-clock"></i>
													</span>
												</div>
												<input type="text" class="form-control float-right" id="reservationtime"> 
												<input type="hidden" name="testSdt" id="testSdt">
												<input type="hidden" name="testEdt" id="testEdt">
												<input type="hidden" name="lecaCd" id="lecaCd" value="${param.lecaCd}">
												
											</div>
										</div>
										<div class="form-group col-sm-4">										
										<label>시험 구분</label>
										<select class="form-control" id="testPart" name="testPart" required>
											<option value="T01">중간고사</option>
											<option value="T02">기말고사</option>
										</select>
										</div>
									</div>
									<div>
										<textarea id="testCon" name="testCon" class="form-control"cols="7" rows="5"></textarea>
									</div>
									<div class="clear"></div>

									<div class="table-responsive-sm" id="plusArea" style="border-bottom: 1px solid #e0e0e0">
										<table class="table table-centered mb-0">
											<thead>
												<tr>
													<th>
														<label style="margin: 10px; float: left;" class="cnt">1.&nbsp;</label>
														 <span> 
														 	<input type="text" minlength="1" class="form-control question" name="testQList[0].teqCon" placeholder="문제를 입력하세요." style="width: 90%; display: inline-block;" required />
															<button type="button" id="delbtn"class="minusbtn btn btn-light">-</button>
														</span>	
													</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>
														<input type="text"   name="testQList[0].teqOption1" class="form-control firchoice zero"     placeholder="첫 번째 보기 답안을 입력하세요." style="width: 97%; margin: 10px 10px 10px 35px;"  minlength="1" required />
														<input type="text"   name="testQList[0].teqOption2" class="form-control secchoice zero"     placeholder="두 번째 보기 답안을 입력하세요."style="width: 97%; margin: 10px 10px 10px 35px;"  minlength="1" required />
														<input type="text"   name="testQList[0].teqOption3" class="form-control thichoice zero"     placeholder="세 번째 보기 답안을 입력하세요."style="width: 97%; margin: 10px 10px 10px 35px;"  minlength="1" required />
														<input type="text"   name="testQList[0].teqOption4" class="form-control forchoice zero"     placeholder="네 번째 보기 답안을 입력하세요."style="width: 97%; margin: 10px 10px 10px 35px;"  minlength="1" required />
														<input type="number" name="testQList[0].teqAnswer"  class="form-control questionAnswer zero"placeholder="정답을 숫자로 입력하세요.(예시: 3)"style="width: 97%; margin: 10px 10px 10px 35px;" minlength="1"  min="1" max="4" step="1" required />
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- tab-content end -->
									<div style="width: 100%;">
										<button type="button" class="plusBtn btn btn-secondary">+</button>
									</div>
									<div style="clear: both;"></div>
									<button type="submit" class="btn btn-primary"style="float: right;">제출</button>
									<sec:csrfInput />
								</form>
								<a href="/lectureBoard/test/test?lecaCd=${param.lecaCd}" class="btn btn-light">취소</a>
							</div>
						</div>
				</div>
</div>
<script type="text/javascript" defer="defer">
let count = 1;
	// 문제 생성
	$('.plusBtn').on('click', function() {
		var str = '<table class="table table-centered mb-0">';
		str += '<thead><tr><th>';
		str += '<label style="margin:10px;float:left;" class="cnt">' + (parseInt(count) + 1) + '.&nbsp;</label>';
		str += '<span><input type="text" minlength="1" class="form-control" name="testQList['+count +'].teqCon" placeholder="문제를 입력하세요." value="" style="width:90%;display: inline-block;"/><button type="button" class="minusbtn btn btn-light">-</button></span>';
		str += '</th></tr></thead>';
		str += '<tbody><tr><td>';
		//-----
		str += '<input type="text"   name="testQList['+count +'].teqOption1" class="form-control firchoice zero" placeholder="첫 번째 보기 답안을 입력하세요."  minlength="1" style="width:97%;margin:10px 10px 10px 35px;"/>';
		str += '<input type="text"   name="testQList['+count +'].teqOption2" class="form-control secchoice zero" placeholder="두 번째 보기 답안을 입력하세요."  minlength="1" style="width:97%;margin:10px 10px 10px 35px;"/>';
		str += '<input type="text"   name="testQList['+count +'].teqOption3" class="form-control thichoice zero" placeholder="세 번째 보기 답안을 입력하세요."  minlength="1"  style="width:97%;margin:10px 10px 10px 35px;"/>';
		str += '<input type="text"   name="testQList['+count +'].teqOption4" class="form-control forchoice zero" placeholder="네 번째 보기 답안을 입력하세요."  minlength="1" style="width:97%;margin:10px 10px 10px 35px;"/>';
		str += '<input type="number" name="testQList['+count +'].teqAnswer"  class="form-control questionAnswer zero" placeholder="정답을 숫자로 입력하세요.(예시:&nbsp;3)"   minlength="1" min="1" max="4" stequestionAnswerp="1"style="width:97%;margin:10px 10px 10px 35px;"/>';
		str += '</td></tr></tbody></table>';
		
			if(count == 10) {
				Swal.fire({
					  title: '생성 실패!',
					  text:"퀴즈를 생성할 수 있는 최대 문항 수는 10개 입니다.",
					  icon:'warning'
				})
				return false;
			}
			
		$('#plusArea').append(str);
		
		count += 1;
	})
	
	$(document).on('click', '#delbtncntsix', function() {
		var tb = $(this).closest("table");
		console.log(tb);
		
		tb.remove();
	})
	
	$(document).on('click','.minusbtn', function() {
		var tb = $(this).closest("table");
		console.log(tb);
		console.log(count);
		function replaceAt (input, index, character){
		     return input.substr(0, index) + character + input.substr(11);
		}
		
		if(count == 1) {
			Swal.fire({
				  title: '삭제 실패!',
				  text:"최소 한 문제 이상은 있어야 합니다.",
				  icon:'warning'
			})
			
			return false;
		}
		
		tb.remove();
		
		count--;
		if(count == 1) {
			for(var i = 0;i<6;i++){
			var nameVal = replaceAt($(".zero").eq(i).attr('name'),10,0);
				$(".zero").eq(i).attr('name',nameVal);
			}
		}		
		
		$('.cnt').each(function(i, v){
			$(this).text(i+1 + ".");
		});
		
		
	})
</script>
<script type="text/javascript" >
	$("#reservationtime").daterangepicker(
			{
				locale : {
					"separator" : " ~ ", // 시작일시와 종료일시 구분자
					"format" : 'YYYY-MM-DD HH:mm', // 일시 노출 포맷
					"applyLabel" : "확인", // 확인 버튼 텍스트
					"cancelLabel" : "취소", // 취소 버튼 텍스트
					"daysOfWeek" : [ "일", "월", "화", "수", "목", "금", "토" ],
					"monthNames" : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
							"8월", "9월", "10월", "11월", "12월" ]
				},
				timePicker : true, // 시간 노출 여부
				showDropdowns : true, // 년월 수동 설정 여부
				autoApply : true, // 확인/취소 버튼 사용여부
				timePicker24Hour : true, // 24시간 노출 여부(ex> true : 23:50, false : PM 11:50)
				timePickerSeconds : false, // 초 노출 여부
				singleDatePicker : false
			// 하나의 달력 사용 여부
			});

	$("#reservationtime").on('show.daterangepicker', function(ev, picker) {
		$(".yearselect").css("float", "left");
		$(".monthselect").css("float", "right");
		$(".cancelBtn").css("float", "right");
	});
	
		let testSdt = $("#reservationtime").val().substr(0,16);
		let testEdt = $("#reservationtime").val().substr(19,32);
		$("#testSdt").val(testSdt);
		$("#testEdt").val(testEdt);
		console.log($("#reservationtime").val().substr(0,16));
	$("#reservationtime").on("change",function(){
		let testSdt = $("#reservationtime").val().substr(0,16);
		let testEdt = $("#reservationtime").val().substr(19,32);
		$("#testSdt").val(testSdt);
		$("#testEdt").val(testEdt);
	});
	
	
</script>
