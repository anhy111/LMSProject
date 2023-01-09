<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<style>
    .modal-content{
		top:100px;
	}
	
	.modal-header{
		background-color: #001F3F;
		color:white;
	}

	.close span{
		color:white;
	}
	#schList tr{
		cursor: pointer;
	}
	#schList tr:hover {
		background-color: rgb(0, 31, 63, 0.20);
	}
}

</style>
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
					<button type="button" class="close" onclick="initModal( calendarData)">
						<span aria-hidden="true">×</span>
					</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body container-fluid">
					<label for="aschSt">시작시간:</label>
					<div class="row">
						<div class="form-group col-5">
							<input type="date" class="form-control" id="aschStDay">
						</div>
						<div class="form-group col-5">
							<select class="form-control" id="aschStTime">
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
					<div id="spn3"  style="display: none;">
						<button type="button" id="update" class="btn btn-outline-primary">확인</button>
						<button type="button" id="cancel" class="btn btn-outline-secondary">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-5 pt-3">
		<br>
		<br>
		<br>
		<table class="table table-sm table-bordered mt-3 text-center">
			<thead>
				<th width="35%">기간</th>
				<th>일정명</th>
				<th width="15%">등록자</th>
			</thead>
			<tbody id="schList">
				
			</tbody>
		</table>
	</div>
	<div class="col-md-7">
		 <div id="calendar"></div>
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
	var monthSch = [];

	
	function timeFormat(p_date){
		if(p_date == "" || p_date == null){
			return "";
		} 
		let date = new Date(p_date);
		let str = (date.getHours() < 10 ? "0" + date.getHours() : date.getHours() )
				+ ":" + (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes());
		return str;
	}
	
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
			errorSwal("구분자를 넣어주세요");
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
		$("#aschStDay").attr("readonly",false);
		$("#aschStTime").attr("readonly",false);
		$("#aschEnDay").attr("readonly",false);
		$("#aschEnTime").attr("readonly",false);
	}
	
	function insertMode(){
		$("#spn1").show();
		$("#spn2").hide();
		$("#spn3").hide();
		$("#aschTtl").attr("readonly",false);
		$("#aschCon").attr("readonly",false);
		$("#aschStDay").attr("readonly",false);
		$("#aschStTime").attr("readonly",false);
		$("#aschEnDay").attr("readonly",false);
		$("#aschEnTime").attr("readonly",false);
	}
	
	function readMode(){
		$("#spn1").hide();
		$("#spn2").show();
		$("#spn3").hide();
		$("#aschTtl").attr("readonly",true);
		$("#aschCon").attr("readonly",true);
		$("#aschStDay").attr("readonly",true);
		$("#aschStTime").attr("readonly",true);
		$("#aschEnDay").attr("readonly",true);
		$("#aschEnTime").attr("readonly",true);
	}
	
	function dispTable(){
		let str = "";
		if(monthSch.length == 0){
			str += `<tr>
						<td colspan='3'>일정이 없습니다.</td>
					</tr>`;
			$("#schList").html(str);
			return;
		}
		for(let i=0; i<monthSch.length; i++){
			str += `<tr value='\${monthSch[i].aschCd}' class="read">
						<td>\${dateFormat(monthSch[i].start,"/")} ~ \${dateFormat(monthSch[i].end,"/")}</td>
						<td class='text-left'>\${monthSch[i].title}</td>
						<td>\${monthSch[i].empNm}</td>
					</tr>`;
		}
		$("#schList").html(str);
	}
	
	// 페이지 첫 로딩할때 처음 학사일정
	function initFullCalendar(){
		let calendarArg = document.querySelector("#calendar");

		calendar = new FullCalendar.Calendar(calendarArg, {
			id : "calendar",
			height : 700,
			headerToolbar : {
				left: 'prev,next today',
				center : 'title',
				right: 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			initialView : 'dayGridMonth',
			fixedWeekCount: false,
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
	
	
	// 컬러색 지정
	const color = ["#EF404A","#F2728C","#80B463","#27AAE1","#9E7EB9","#4EB8B9","#F79552","#FFCC4E","#D5E05B"];
	// 현재 뷰의 학사일정 불러오기 1~31일 데이터만 가져오기
	function loadEvent() {

        let start = calendar.view.currentStart;
        let end = endDateFormat(calendar.view.currentEnd,"-");
        
        let data = {
        		aschSt : new Date(start),
        		aschEn : new Date(end)
        };
        console.log(data);
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
            	calendar.removeAllEvents();
            	if(list == null || list.length == 0){
            		calendar.render();
            		return;
            	}
            	
            	monthSch = [];
            	
                for (var i = 0; i < list.length; i++) {
                	let data = {
                        title: list[i]['aschTtl'],
                        content: list[i]['aschCon'],
                        aschCd: list[i]['aschCd'],
                        empNo: list[i]['empNo'],
                        empNm: list[i]['empNm'],
                        start: list[i]['aschSt'],
                        end: list[i]['aschEn'],
                        backgroundColor : color[i % 9],
                        borderColor : color[i % 9]
                    }
                    
                	calendar.addEvent(data);
                    monthSch.push(data);
                }
                
                dispTable();
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
            $('#aschCd').val(calendarData.event.extendedProps.aschCd);
            $('#aschStDay').val(dateFormat(calendarData.event.start,"-"));
            $('#aschStTime').val(timeFormat(calendarData.event.start)).attr("selected","selected");
            $('#aschEnDay').val(endDateFormat(calendarData.event.end,"-"));
            $('#aschEnTime').val(timeFormat(calendarData.event.end));
			$("#aschTtl").val(calendarData.event.title);
			$("#aschCon").val(calendarData.event.extendedProps.content);
			console.log(calendarData.event.extendedProps);
            readMode();

            
        } else {	//신규 이벤트
            $('#aschStDay').val(calendarData.startStr);
            $('#aschEnDay').val(endDateFormat(calendarData.endStr,"-"));
            $("#aschTtl").val("");
            $("#aschCon").val("");
            insertMode();
        }
        //모달창 show
        $('.insertModal').modal('show');
    }
	
	function addTableEvent(p_this){
		
		let aschCd = p_this.value;
		let events = calendar.getEvents();
		for(let i=0; i<events.length; i++){
			if(events[i]._def.extendedProps.aschCd == aschCd){
				console.log(events[i]._def.extendedProps);
			}
		}
		
		$('.insertModal').modal('show');
	}

	//시작일자 변경 시 종료일자는 +30분으로 설정---------------------------------------------------------------------------
	function startChange() {
        var start = $('#aschStTime').val();
        var end = $('#aschEnTime').val();
        if (start.substring(3, 5) == '00')
            end = start.substring(0, 2) + ':30';
        else
            end = (parseInt(start.substring(0, 2)) + 1) + ':00';

        $('#aschEnTime').val(end);
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
	
	function errorSwal(p_arg){
		swal.fire({
			icon: 'error',
			text: p_arg
		});
	}
	//일정등록-------------------------------------------------------------------------------------------------
    function insertSch(arg) {
		
		if($("#aschTtl").val() == ""){
			errorSwal('제목을 입력해주세요.');
			return;
		}else if( $("#aschCon").val() == ""){
			errorSwal("내용을 입력해주세요.");
			return;
		}
		
        if (typeof arg.event != "undefined"){
        	errorSwal("이번트 선택 안됨");
        	return;
        } 
        
        data = {
            empNo: empNo,
            aschSt: new Date($("#aschStDay").val() + " " +  $("#aschStTime").val()),
            aschEn: new Date($("#aschEnDay").val() + " " +  $("#aschEnTime").val()),
            aschTtl : $("#aschTtl").val(),
        	aschCon : $("#aschCon").val()
        }
        
        if (data.aschSt >= data.aschEn) {
        	errorSwal('종료시간을 시작시간보다 크게 선택해주세요');
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
					errorSwal("일정 등록 실패");
					return;
				}
                initModal();
                loadEvent();
            },
            error: function (xhr, status, error) {
            	errorSwal('일정 등록 실패\n새로고침 후 재시도 해주세요');
            }
        }); // end ajax
        
    } // end function 
	
   	function updateSch(arg){
   		if($("#aschTtl").val() == ""){
			errorSwal('제목을 입력해주세요.');
			return;
		}else if( $("#aschCon").val() == ""){
			errorSwal("내용을 입력해주세요.");
			return;
		}
   		
   		data = {
   	            empNo: empNo,
   	            aschCd : $("#aschCd").val(),
   	            aschSt: new Date($("#aschStDay").val() + " " +  $("#aschStTime").val()),
   	            aschEn: new Date($("#aschEnDay").val() + " " +  $("#aschEnTime").val()),
   	            aschTtl : $("#aschTtl").val(),
   	        	aschCon : $("#aschCon").val()
 	    }
   		console.log(data);
   		
   		$.ajax({
            url: "/aschedule/updateSch",
            type: "POST",
            data: JSON.stringify(data),
            contentType: 'application/json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            traditional: true,
            success: function (result, status, xhr) {
				if(result == null){
					errorSwal("일정 수정 실패");
					return;
				}
                initModal();
                loadEvent();
            },
            error: function (xhr, status, error) {
            	errorSwal('일정 수정 실패\n새로고침 후 재시도 해주세요');
            }
        }); // end ajax
   		
    }
    
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
                    errorSwal('일정 삭제 실패<br>새로고침 후 재시도 해주세요');
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
			initModal(calendarData);
		});
		
		$(document).on("click",".read",function(){
			addTableEvent(this);
		})
		
		$("#aschStTime").on("change",function(){
			startChange();
		})
		
		$("#update").on("click",function(){
			updateSch(calendarData);
		})
		initFullCalendar();
		
		$(document).on("click",'.fc-prev-button',function(){
			console.log("event : " ,calendar);
	    	loadEvent();
		});
		
		$(document).on("click",'.fc-next-button',function(){
			console.log("event : " ,calendar);
		   	loadEvent();
		});
	});
	// end window.onload
</script>