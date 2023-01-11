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
														 	<input type="text" minlength="1" class="form-control question" id="testQList0teqCon"name="testQList[0].teqCon" placeholder="문제를 입력하세요." style="width: 90%; display: inline-block;" required />
															<button type="button" id="delbtn"class="minusbtn btn btn-light">-</button>
														</span>	
													</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>
														<input type="text"   id="testQList0teqOption1" name="testQList[0].teqOption1" class="form-control firchoice zero"     placeholder="첫 번째 보기 답안을 입력하세요." style="width: 97%; margin: 10px 10px 10px 35px;"  minlength="1" required />
														<input type="text"   id="testQList0teqOption2" name="testQList[0].teqOption2" class="form-control secchoice zero"     placeholder="두 번째 보기 답안을 입력하세요."style="width: 97%; margin: 10px 10px 10px 35px;"  minlength="1" required />
														<input type="text"   id="testQList0teqOption3" name="testQList[0].teqOption3" class="form-control thichoice zero"     placeholder="세 번째 보기 답안을 입력하세요."style="width: 97%; margin: 10px 10px 10px 35px;"  minlength="1" required />
														<input type="text"   id="testQList0teqOption4" name="testQList[0].teqOption4" class="form-control forchoice zero"     placeholder="네 번째 보기 답안을 입력하세요."style="width: 97%; margin: 10px 10px 10px 35px;"  minlength="1" required />
														<input type="number" id="testQList0teqAnswer"  name="testQList[0].teqAnswer"  class="form-control questionAnswer zero"placeholder="정답을 숫자로 입력하세요.(예시: 3)"style="width: 97%; margin: 10px 10px 10px 35px;" minlength="1"  min="1" max="4" step="1" required />
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
									<button type="button" class="btn btn-outline-primary" style="float: right;" id="autoFill">자동채우기</button>
									<button type="submit" class="btn btn-outline-primary"style="float: right;">제출</button>
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
		str += '<span><input type="text" minlength="1" class="form-control" id="testQList'+count +'teqCon" name="testQList['+count +'].teqCon" placeholder="문제를 입력하세요." value="" style="width:90%;display: inline-block;"/><button type="button" class="minusbtn btn btn-light">-</button></span>';
		str += '</th></tr></thead>';
		str += '<tbody><tr><td>';
		//-----
		str += '<input type="text"   id="testQList'+count +'teqOption1" name="testQList['+count +'].teqOption1" class="form-control firchoice zero" placeholder="첫 번째 보기 답안을 입력하세요."  minlength="1" style="width:97%;margin:10px 10px 10px 35px;"/>';
		str += '<input type="text"   id="testQList'+count +'teqOption2" name="testQList['+count +'].teqOption2" class="form-control secchoice zero" placeholder="두 번째 보기 답안을 입력하세요."  minlength="1" style="width:97%;margin:10px 10px 10px 35px;"/>';
		str += '<input type="text"   id="testQList'+count +'teqOption3" name="testQList['+count +'].teqOption3" class="form-control thichoice zero" placeholder="세 번째 보기 답안을 입력하세요."  minlength="1"  style="width:97%;margin:10px 10px 10px 35px;"/>';
		str += '<input type="text"   id="testQList'+count +'teqOption4" name="testQList['+count +'].teqOption4" class="form-control forchoice zero" placeholder="네 번째 보기 답안을 입력하세요."  minlength="1" style="width:97%;margin:10px 10px 10px 35px;"/>';
		str += '<input type="number" id="testQList'+count +'teqAnswer" name="testQList['+count +'].teqAnswer"  class="form-control questionAnswer zero" placeholder="정답을 숫자로 입력하세요.(예시:&nbsp;3)"   minlength="1" min="1" max="4" stequestionAnswerp="1"style="width:97%;margin:10px 10px 10px 35px;"/>';
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
$("#autoFill").on("click", function(){
	$("#testNm").val("2023년 1학기 거시경제학 기말고사");
	$("#testCon").val("기말고사는 성적의 30%를 차지하니 잘 푸시기 바랍니다.");
	
	$("#testQList0teqCon").val("다음 중 '보이지 않는 손'에 대한 정의 중 맞는 것은?");
	$("#testQList0teqOption1").val("각자 자신의 이익만을 추구하다 보면 전체적으로 균형이 달성되지 않는다는 뜻이다.");
	$("#testQList0teqOption2").val("행동을 할 때는 다른 사람의 기분도 충분히 고려해야 한다는 뜻이다.");
	$("#testQList0teqOption3").val("각자 이기적 목표만을 추구하더라도 조화와 효율을 달성할 수 있다는 뜻이다.");
	$("#testQList0teqOption4").val("보이지 않는 곳에서 이익을 추구하는 것은 도덕적으로 정당화될 수 없다는 뜻이다.");
	$("#testQList0teqAnswer").val("3");
	
	$("#testQList1teqCon").val("보험회사에서 판매하던 보험을 이제 은행에서도 판매할 수 있게 됐다. 이처럼 은행에서 보험을 판매하는 것을 무엇이라 하는가?");
	$("#testQList1teqOption1").val("어슈어 뱅크");
	$("#testQList1teqOption2").val("방카슈랑스");
	$("#testQList1teqOption3").val("인디펜던스");
	$("#testQList1teqOption4").val("인슈어런스");
	$("#testQList1teqAnswer").val("2");
	
	$("#testQList2teqCon").val("법인세에 대한 다음 설명중 맞는 것은?");
	$("#testQList2teqOption1").val("재정적자에 직면한 각국 정부들은 경쟁적으로 법인세를 올리는 추세이다.");
	$("#testQList2teqOption2").val("최저한 세율은 각종 감면조치에 상관없이 무조건 내야하는 최소한의 세율이다.");
	$("#testQList2teqOption3").val("법인세는 주주배당을 실시한 뒤 잔여이익에서 내는 세금이다.");
	$("#testQList2teqOption4").val("법인세는 각 지방 자치단체에 낸다.");
	$("#testQList2teqAnswer").val("2");
	
	$("#testQList3teqCon").val("세계적 유통 체인인 월마트가 한국 내 영업에서 매출부진에 시달린 끝에 결국 철수하고 말았다. 이 회사가 한국에서 철수한 이유를 추정한 다음의 주장 중 적절치 않은 것은?");
			
	$("#testQList3teqOption1").val("아마도 한국 소비자들의 쇼핑 패턴 분석에 실패했을 것이다.");
	$("#testQList3teqOption2").val("미국 신선 농산물 판매를 고집하면서 다양한 상품을 판매하는데 실패했을 것이다.");
	$("#testQList3teqOption3").val("한국 내 부동산 가격이 높아 신규 점포 확장에 실패했을 수 있다.");
	$("#testQList3teqOption4").val("미국식 할인점 경영을 고집하면서 매장 관리, 상품 전시 등에서 실패했을 것이다.");
	$("#testQList3teqAnswer").val("2");
	
	$("#testQList4teqCon").val("독점기업의 가격 전략에 관한 설명으로 옳은 것은?");
	$("#testQList4teqOption1").val("소비자잉여를 유지하며 생산자의 이윤을 극대화한다");
	$("#testQList4teqOption2").val("독점가격은 한계비용과 같다.");
	$("#testQList4teqOption3").val("가격차별을 하는 경우 단일 가격을 설정하는 것에 비해 사회적 후생은 증가한다.");
	$("#testQList4teqOption4").val("가격차별을 하는 경우 수요의 가격탄력성이 더 높은 소비자들에게 더 높은 가격을 부과한다.");
	$("#testQList4teqAnswer").val("3");
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
