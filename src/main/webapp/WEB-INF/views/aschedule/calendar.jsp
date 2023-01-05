<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>

<!-- fullcalender -->
<link href="/resources/fullcalendar-5.11.3/lib/main.css" rel="stylesheet"/>
<script src="/resources/fullcalendar-5.11.3/lib/main.js"></script>

<div class="row">
	<div class="modal fade insertModal" id="aschModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">일정 등록</h4>
					<button type="button" class="close" onclick="initModal( calendarData)">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body container-fluid">
					<label for="aschSt">시작시간:</label>
					<div class="row">
						<div class="form-group col-5">
							<input type="date" class="form-control" id="aschStDay">
						</div>
						<div class="form-group col-5">
							<select class="form-control" id="aschStTime" onchange="startChange()">
								<option value="09:00">09:00</option>
								<option value="09:30">09:30</option>
								<option value="10:00">10:00</option>
								<option value="10:30">10:30</option>
								<option value="11:00">11:00</option>
								<option value="11:30">11:30</option>
								<option value="12:00">12:00</option>
								<option value="12:30">12:30</option>
								<option value="13:00">13:00</option>
								<option value="13:30">13:30</option>
								<option value="14:00">14:00</option>
								<option value="14:30">14:30</option>
								<option value="15:00">15:00</option>
								<option value="15:30">15:30</option>
								<option value="16:00">16:00</option>
								<option value="16:30">16:30</option>
								<option value="17:00">17:00</option>
								<option value="17:30">17:30</option>
								<option value="18:00">18:00</option>
								<option value="18:30">18:30</option>
							</select>
						</div>
					</div>
					<label for="aschEn">종료시간:</label>
					<div class="row">
						<div class="col-2 text-center align-self-center">
							<h5 >~</h5>
						</div>
						<div class="form-group col-5">
							<input type="date" class="form-control" id="aschEnDay">
						</div>
						<div class="form-group col-5">
							<select class="form-control" id="aschEnTime">
								<option value="09:30">09:30</option>
								<option value="10:00">10:00</option>
								<option value="10:30">10:30</option>
								<option value="11:00">11:00</option>
								<option value="11:30">11:30</option>
								<option value="12:00">12:00</option>
								<option value="12:30">12:30</option>
								<option value="13:00">13:00</option>
								<option value="13:30">13:30</option>
								<option value="14:00">14:00</option>
								<option value="14:30">14:30</option>
								<option value="15:00">15:00</option>
								<option value="15:30">15:30</option>
								<option value="16:00">16:00</option>
								<option value="16:30">16:30</option>
								<option value="17:00">17:00</option>
								<option value="17:30">17:30</option>
								<option value="18:00">18:00</option>
								<option value="18:30">18:30</option>
								<option value="19:00">19:00</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="form-group col">
							<label for="aschTtl">제목:</label>
							<input type="text" class="form-control" id="aschTtl">
						</div>
					</div>
					<div class="row">
						<div class="form-group col">
							<label for="aschCon">내용:</label>
							<textarea id="aschCon" class="form-control" rows="7"></textarea>
						</div>
					</div>
					<input type="hidden" name="aschCd" id="aschCd" /> 
				</div>

				<!-- Modal footer -->
				<div class="modal-footer justify-content-align">
					<div id="spn1" class="container-fluid p-0" style="display: none;">
						<div class="row">
							<div class="col text-left">
								<button id="autoFillReg" class="btn btn-outline-secondary">자동채우기</button>
							</div>
							<div class="col text-right">
								<button type="button" id="register" class="btn btn-primary" >등록</button>
							</div>
						</div>
					</div>
					<div id="spn2" style="display: none;">
						<button type="button" id="edit" class="btn btn-outline-warning" >수정</button>
						<button type="button" id="delete" class="btn btn-outline-danger" >삭제</button>
					</div>
					<div id="spn3" class="container-fluid p-0" style="display: none;">
						<div class="row">
							<div class="col text-left">
								<button id="autoFillUpd" class="btn btn-outline-secondary">자동채우기</button>
							</div>
							<div class="col text-right">
								<button type="button" id="update" class="btn btn-outline-primary">확인</button>
								<button type="button" id="cancel" class="btn btn-outline-secondary">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-5">
		 <div id="calendar"></div>
	</div>
	<div class="col-md-7 pt-3">
		<br>
		<br>
		<br>
		<table class="table table-sm table-bordered mt-3">
			<thead>
				<th>기간</th>
				<th>일정명</th>
			</thead>
			<tbody>
				
			</tbody>
		</table>
	</div>
</div>

<script type="text/javascript">
	var empNo = '${empNo}';
    var header = "${_csrf.headerName}";
    var token = "${_csrf.token}";
	var today = new Date();
	var month = today.getMonth() + 1; //getMonth()는 9월이 8으로 나옴
	var date = today.getDate();
	var calendar; // 달력변수
	var todayStr = dateFormat(today,"-");
	var calendarData;

	// date객체와 구분자를 받아서 문자형식으로 변환
	function dateFormat(p_date,p_separator){
		if(p_date == "" || p_date == null){
			return "";
		} 
		let date = new Date(p_date);
		let str = date.getFullYear() + p_separator 
					+ (date.getMonth()+1 < 10 ? "0" + (date.getMonth()+1) :  date.getMonth()+1) + p_separator
							+ (date.getDate() < 10 ? "0" + date.getDate() : date.getDate());
		return str;
	}
	
	// 마지막 일자가 +1일로 나와서 -1을 해줌 연, 월이 바뀔수 있으므로 -1한값을 생성자에 넣어주면 맞춰서 연도와 월을 바꿔서 반환해준다
	function endDateFormat(p_date, p_separator){
		if(typeof p_separator == "undefined"){
			alert("구분자를 넣어주세요");
			return;
		}
		let date = new Date(p_date);
		date = new Date(date.getFullYear(),date.getMonth(),date.getDate()-1);
		
		return dateFormat(date,p_separator);
	}

	function editMode(){
		$("#spn1").hide();
		$("#spn2").hide();
		$("#spn3").show();
		$("#aschTtl").attr("readonly",false);
		$("#aschCon").attr("readonly",false);
		$("#aschSt").attr("readonly",false);
		$("#aschEn").attr("readonly",false);
	}
	
	function insertMode(){
		$("#spn1").show();
		$("#spn2").hide();
		$("#spn3").hide();
		$("#aschTtl").attr("readonly",false);
		$("#aschCon").attr("readonly",false);
		$("#aschSt").attr("readonly",false);
		$("#aschEn").attr("readonly",false);
	}
	
	function readMode(){
		$("#spn1").hide();
		$("#spn2").show();
		$("#spn3").hide();
		$("#aschTtl").attr("readonly",true);
		$("#aschCon").attr("readonly",true);
		$("#aschSt").attr("readonly",true);
		$("#aschEn").attr("readonly",true);
	}
	
	// 페이지 첫 로딩할때 처음 학사일정
	function initFullCalendar(){
		let calendarArg = document.querySelector("#calendar");

		calendar = new FullCalendar.Calendar(calendarArg, {
			height : 600,
			headerToolbar : {
				left : 'prev today',
				center : 'title',
				
				right : "next"
			},
			initialView : 'dayGridMonth',
			locale : 'ko',
			slotMinTime : '09:00',
			slotMaxTime : '19:00',
			initialDate : todayStr,
			navLinks : false, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,

			select : function(arg) {
				modalOpen(arg); //일자 클릭 시 모달 호출
			},
			eventClick : function(arg) {
				modalOpen(arg); //이벤트 클릭 시 모달 호출
			},
			eventChange : function(arg) {
				//allDay true로 바꾸면 end가 없어서 만듬
				if (arg.event.end == null) {
					var end = new Date();
					end.setDate(arg.event.start.getDate() + 1);
					arg.event.setEnd(end);
				}
			},
			eventDrop : function(arg) {
				modalOpen(arg); //이벤트 드래그드랍 시 모달 호출
			},
			eventResize : function(arg) {
				modalOpen(arg); //이벤트 사이즈 변경시(일정변경) 모달 호출
			},
			editable : true,
			dayMaxEvents : true
		});// end calendar
		
		loadEvent();
	}
	
	// 현재 뷰의 학사일정 불러오기 1~31일 데이터만 가져오기
	function loadEvent() {

        console.log("calendar.view.currentEnd : " + calendar.view.currentEnd);
        console.log("calendar.view.currentStart : " + calendar.view.currentStart);
        
        let start = calendar.view.currentStart;
        let end = endDateFormat(calendar.view.currentEnd,"-");
        
        let data = {
        		aschSt : new Date(start),
        		aschEn : new Date(end)
        };
        console.log(data);
        let arr = [];
        $.ajax({
            type: "post",
            url: "/aschedule/loadSchedule",
            data: JSON.stringify(data),
            contentType:"application/json; charset=utf-8",
            dataType: "JSON",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function (list) {
            	console.log(list);
            	if(list == null || list.length == 0){
            		calendar.render();
            		return;
            	}
                for (var i = 0; i < list.length; i++) {
                	calendar.addEvent({
                        title: list[i]['aschTtl'],
                        content: list[i]['aschCon'],
                        aschCd: list[i]['aschCd'],
                        empNo: list[i]['empNo'],
                        empNm: list[i]['empNm'],
                        start: list[i]['aschSt'],
                        end: list[i]['aschEn'],
                        backgroundColor : "#e74a3b"
                    })
                }
                
                calendar.render();
            },
            error : function(){
            	calendar.render();
            }
        });
    }
	
	// 일정등록 모달
	function modalOpen(arg) {
		console.log(arg);
		calendarData = arg;
        //값이 있는경우 세팅
        if (typeof calendarData.event != "undefined") {

            $('.insertModal #aschCd').val(calendarData.event.extendedProps.aschCd);
            $('.insertModal #aschSt').val(stringFormat(calendarData.event.start.getHours()) + ':' + stringFormat(calendarData.event.start.getMinutes()));
            $('.insertModal #aschEn').val(stringFormat(calendarData.event.end.getHours()) + ':' + stringFormat(calendarData.event.end.getMinutes()));

            //해당 이벤트가 로그인계정이 등록한 이벤트면
            if (empNo == calendarData.event.extendedProps.memNo) {
                $('.insertModal .deleteBtn').css('display', 'inline');
                $('.insertModal .insertBtn').css('display', 'inline');
                //남의 이벤트면
            } else {
                $('.insertModal .deleteBtn').css('display', 'none');
                $('.insertModal .insertBtn').css('display', 'none');
            }

            //신규 이벤트
        } else {
            $('#aschStDay').val(calendarData.startStr);
            $('#aschEnDay').val(endDateFormat(calendarData.endStr,"-"));
            $("#aschTtl").val("");
            $("#aschCon").val("");
        }
        //모달창 show
        $('.insertModal').modal('show');
    }
	

	//시작일자 변경 시 종료일자는 +30분으로 설정---------------------------------------------------------------------------
	function startChange() {
        var start = $('#aschSt').val();
        var end = $('#aschEn').val();
        if (start.substring(3, 5) == '00')
            end = start.substring(0, 2) + ':30';
        else
            end = (parseInt(start.substring(0, 2)) + 1) + ':00';

        $('#aschEn').val(end);
    }
	
	//모달초기화-------------------------------------------------------------------------------------------------
	function initModal() {
        $('#aschCd').val('');
        $('#aschStDay').val(todayStr);
        $('#aschStTime').val('09:00');
        $('#aschEnDay').val(todayStr);
        $('#aschEnTime').val('09:30');
        $('#aschModal').modal('hide');
        calendarData = null;
    }
	
	
	//일정등록-------------------------------------------------------------------------------------------------
    function insertSch(arg) {
		
		console.log(arg);
		if($("#aschTtl").val() == ""){
			alert("제목을 입력해주세요.");
			return;
		}else if( $("#aschCon").val() == ""){
			alert("내용을 입력해주세요.");
			return;
		}
		
        if (typeof arg.event != "undefined"){
        	alert("이번트 선택 안됨");
        	return;
        } 
        
//         if (!(arg.startStr.substring(0, 10) != arg.endStr.substring(0, 10))
//         		&& $('.insertModal #aschEn').val() <= $('.insertModal #aschSt').val()) {
//                 alert('종료시간을 시작시간보다 크게 선택해주세요');
//                 $('.insertModal #aschEn').focus();
//                 return;
            
//         }
        data = {
            empNo: empNo,
            aschSt: new Date($("#aschStDay").val() + " " +  $("#aschStTime").val()),
            aschEn: new Date($("#aschEnDay").val() + " " +  $("#aschEnTime").val()),
            aschTtl : $("#aschTtl").val(),
        	aschCon : $("#aschCon").val()
        }
        
        if (data.aschSt >= data.aschEn) {
            alert('종료시간을 시작시간보다 크게 선택해주세요');
            return;
        }

        //DB 삽입
        $.ajax({
            url: "/aschedule/register",
            type: "POST",
            data: JSON.stringify(data),
            contentType: 'application/json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            traditional: true,
            success: function (result, status, xhr) {
				if(result == null){
					alert("일정 등록 실패");
					return;
				}
                calendar.addEvent({
                	aschCd: $('#aschCd').val(),
                    start: $("#aschStDay") + 'T' + $('#aschStTime').val(),
                    end: $("#aschEnDay") + 'T' + $('#aschEnTime').val(),
                    empNo: empNo
                });

                initModal();
            },
            error: function (xhr, status, error) {
                alert('일정 등록 실패\n새로고침 후 재시도 해주세요');
            }
        }); // end ajax
        
    } // end function 
	
  	//일정삭제-------------------------------------------------------------------------------------------------
    function deleteSch(modal, arg) {
        if (confirm('일정을 삭제하시겠습니까?')) {
            var data = {
                empNo: empNo,
                rsvCd: $('.' + modal + ' #rsvCd').val(), //seq 컬럼 추가해서 기본키 seq로 바꾸고 title은 중복 가능하게 변경하기★★★★
                facCd: $('.' + modal + ' #facCd').val()
            }

            let header = "${_csrf.headerName}";
            let token = "${_csrf.token}";

            //DB 삭제
            $.ajax({
                url: "/aschedule/deleteSch",
                type: "POST",
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(data),
                dataType: "JSON",
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                traditional: true,
                success: function (data, status, xhr) {
                    arg.event.remove();
                    initModal(modal, arg);
                },
                error: function (xhr, status, error) {
                    alert('일정 삭제 실패<br>새로고침 후 재시도 해주세요');
                }
            });// end ajax
        }
    }// end function
  	
  	
	$(function() {
		insertMode();
		
		$("#register").on("click",function(){
			insertSch(calendarData);
		});
		
		$("#edit").on("click",function(){
			editMode();
		});
		
		$("#cancel").on("click",function(){
			readMode();
		})
		
		$("#close").on("click",function(){
			insertSch(calendarData);
		});
		

		initFullCalendar();
	});
	// end window.onload
</script>