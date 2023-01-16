<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    request.setCharacterEncoding("utf-8");
    String sessionId = (String) (session.getAttribute("memNo"));
%>
<!DOCTYPE html>

<html lang="ko">
<link rel="stylesheet" type="text/css" href="/resources/css/inputModalTemplate.css">
<head> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>

    <!-- fullcalender -->
    <link href="/resources/fullcalendar-5.11.3/lib/main.css" rel="stylesheet"/>
    <script src="/resources/fullcalendar-5.11.3/lib/main.js"></script>
    <script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

    <style>
        #d1 {
            margin-left: 17%; /* add 20 pixels of space to the left side */
        }
        
    </style>
    <div class="row" >
 
<%--       <c:forEach var="item" items="${facility }" varStatus="status" end="${facility.size() }"> --%>
<%--       <label class="btn btn-default" for="facility${status.end-status.index }">${item.facNm}<input class="facility btn-check" name="facility" type="radio" value="${item.facCd}" id="facility${status.end-status.index }"></label>  --%>
<%--        </c:forEach> --%>
<!--         <select class="custom-select ntcCateLeft" id="facility" style="width: 80%;"> -->
<%--             <c:forEach var="item" items="${facility }"> --%>
<%--                 <option value="${item.facCd}">${item.facNm}</option> --%>
<%--             </c:forEach> --%>
<!--         </select> -->
    </div>

    <script>
        var today = new Date();
        var month = today.getMonth() + 1;	//getMonth()는 9월이 8으로 나옴
        var date = today.getDate();
        var g_arg;	//이벤트 글로벌 변수(모달창에서 호출하는 함수에서 참조하기 위함)
        var calendar;	//달력 변수
        var todayStr = today.getFullYear() + '-' + stringFormat(month) + '-' + stringFormat(date);

        function stringFormat(p_val) {
            if (p_val < 10)
                return p_val = '0' + p_val;
            else
                return p_val;
        }

        document.addEventListener("DOMContentLoaded", () => {
            let calendarEl = document.querySelector("#calendar");

            calendar = new FullCalendar.Calendar(calendarEl, {
                height: 680,
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                initialView: 'timeGridWeek',
                locale: 'ko',
                slotMinTime: '09:00',
                slotMaxTime: '19:00',
                initialDate: todayStr,
                navLinks: true, // can click day/week names to navigate views
                selectable: true,
                selectMirror: true,
                select: function (arg) {
                    insertModalOpen(arg);	//일자 클릭 시 모달 호출
                },
                eventClick: function (arg) {
                    insertModalOpen(arg);	//이벤트 클릭 시 모달 호출
                },
                eventChange: function (arg) {
                    //allDay true로 바꾸면 end가 없어서 만듬
                    if (arg.event.end == null) {
                        var end = new Date();
                        end.setDate(arg.event.start.getDate() + 1);
                        arg.event.setEnd(end);
                    }
                },
                eventDrop: function (arg) {
                    insertModalOpen(arg);		//이벤트 드래그드랍 시 모달 호출
                },
                eventResize: function (arg) {
                    insertModalOpen(arg);		//이벤트 사이즈 변경시(일정변경) 모달 호출
                },
                editable: true,
                dayMaxEvents: true, // allow "more" link when too many events
                events: loadEvent()
            });

            calendar.render();
        });

        function loadEvent() {

            let header = "${_csrf.headerName}";
            let token = "${_csrf.token}";

            let arr = [];
            $.ajax({
                type: "post",
                url: "/facility/full",
                data: {
                    facCd: 1
                },
                dataType: "JSON",
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                async: false,
                success: function (list) {
                    for (var i = 0; i < list.length; i++) {
                        arr.push({
                            title: list[i]['memNo'],
                            rsvCd: list[i]['rsvCd'],
                            facCd: list[i]['facCd'],
                            memNo: list[i]['memNo'],
                            start: list[i]['rsvSt'],
                            end: list[i]['rsvEn'],
                            backgroundColor: list[i]['backgroundColor']
                        })
                    }
                }
            })
            return arr;
        }
    </script>



    <!-- 시설선택 후 출력  -->
    <script>
    $(function(){
    	 const radioInputs = document.querySelectorAll('input[type="radio"]');
    	 const labels = document.querySelectorAll('.my-label');
    	 $('input[type="radio"]:first').prop('checked', true);
    	 labels[0].style.backgroundColor = 'navy';
    	 labels[0].style.color = 'white';
    	 radioInputs.forEach((radioInput, index) => {
    	   radioInput.addEventListener('change', function() {
    			 labels[0].style.backgroundColor = 'white';
    	    	 labels[0].style.color = 'navy';
    	     if (this.checked) {
    	       labels[index].style.backgroundColor = 'navy';
    	       labels[index].style.color = 'white';
    	       setTimeout(function() {
    	    	   labels[index].style.backgroundColor = 'white';
        	       labels[index].style.color = 'navy';
    	    					}, 1000);
    	     } 
    	   });
    	 });
    	 
        $('.facility').on('change', () => {
//         	alert("라디오바뀌었다")
            let facilityCode = $("input:radio[name='facility']:checked").val();
// 			alert("라디오값 : " + facilityCode);
            let header = "${_csrf.headerName}";
            let token = "${_csrf.token}";

            var arr = [];

            let request = $.ajax({
                type: "POST",
                url: "/facility/full",
                data: {
                    facCd: facilityCode
                },
                dataType: "JSON",
                beforeSend: (xhr) => {
                    xhr.setRequestHeader(header, token);
                },
                async: false,
                success: (list) => {
                        for (let i = 0; i < list.length; i++) {
                            arr.push({
                                title: list[i]['memNo'],
                                rsvCd: list[i]['rsvCd'],
                                facCd: list[i]['facCd'],
                                memNo: list[i]['memNo'],
                                start: list[i]['rsvSt'],
                                end: list[i]['rsvEn'],
                                backgroundColor: list[i]['backgroundColor']
                            })
                        }
                        return arr;
                }
            });

            request.done(function (data) {

                let facilityCode = $('.facility').val();

                    let calendarEl = document.querySelector("#calendar");

                    calendar = new FullCalendar.Calendar(calendarEl, {
                        height: 700,
                        headerToolbar: {
                            left: 'prev,next today',
                            center: 'title',
                            right: 'dayGridMonth,timeGridWeek,timeGridDay'
                        },
                        initialView: 'timeGridWeek',
                        locale: 'ko',
                        slotMinTime: '09:00',
                        slotMaxTime: '19:00',
                        initialDate: todayStr,
                        navLinks: true, // can click day/week names to navigate views
                        selectable: true,
                        selectMirror: true,

                        select: function (arg) {
                            insertModalOpen(arg);	//일자 클릭 시 모달 호출
                        },
                        eventClick: function (arg) {
                            insertModalOpen(arg);	//이벤트 클릭 시 모달 호출
                        },
                        eventChange: function (arg) {
                            //allDay true로 바꾸면 end가 없어서 만듬
                            if (arg.event.end == null) {
                                var end = new Date();
                                end.setDate(arg.event.start.getDate() + 1);
                                arg.event.setEnd(end);
                            }
                        },
                        eventDrop: function (arg) {
                            insertModalOpen(arg);		//이벤트 드래그드랍 시 모달 호출
                        },
                        eventResize: function (arg) {
                            insertModalOpen(arg);		//이벤트 사이즈 변경시(일정변경) 모달 호출
                        },
                        editable: true,
                        dayMaxEvents: true, // allow "more" link when too many events
                        events: arr
                    });
                    calendar.render();
            });
        })
    })
    </script>
    <title>시설 예약</title>
</head>
<body>
<div class="row">
    <div class="col-md-4" data-code="${memberNumber}">
    <div class="mt-3 card card-primary" style="border-top:0px;min-width:0px;">
<div class="card-header" style="background-color:#001F3F;">
<h2 class="card-title"><b>시설 정보</b></h2>
<div class="card-tools">
<button type="button" class="btn btn-tool" data-card-widget="collapse">
<i class="fas fa-minus"></i>
</button>
</div>
</div>
<div class="card-body" style="display: block;">





    	   <div class="mt-3 row segmented-control2">
  <c:forEach var="item" items="${facility }" varStatus="status" end="${facility.size() }">
      <label class="segmented-control__${3 + status.end-status.index }  my-label" for="facility${status.end-status.index }" style="width:25%;">${item.facNm}<input class="facility btn-check" name="facility" type="radio" value="${item.facCd}" id="facility${status.end-status.index }"></label> 
       </c:forEach>
	
					<div class="segmented-control__color2"></div>
		</div>
    
    
			<div class="row alert alert-light basketballCourt" role="alert"style="display:none;font-size: 0.9em; padding: 1em; border: 1px solid #eee;margin-top: 25px;">
				<p>
					<strong><b>※농구장 시설 안내</b></strong> <br>
					<br> (1)&nbsp;<strong style="color:black;"><b>위치</b></strong>&nbsp;&nbsp;:&nbsp;&nbsp;실외 - 별관 앞, 실내 - 체육관<br>
					<br> (2)&nbsp;<strong style="color:black;"><b>최대수용인원</b></strong>&nbsp;&nbsp;:&nbsp;&nbsp;10명<br> 
					<br> (3)&nbsp;<strong style="color:black;"><b>개방여부</b></strong>&nbsp;&nbsp;:&nbsp;&nbsp;방학기간 - <strong style="color:red;"><b>실내</b></strong> 이용불가, <strong style="color:blue;"><b>실외</b></strong> - 이용가능<br>
					<br> (4)&nbsp;<strong style="color:black;"><b>이용시간</b></strong>&nbsp;&nbsp;:&nbsp;&nbsp;최대&nbsp;<strong style="color:red;"><b>3</b></strong>시간
				</p>
			</div>
			<div class="row alert alert-light tenisCourt" role="alert"style="display:none;font-size: 0.9em; padding: 1em; border: 1px solid #eee;margin-top: 25px;">
				<p>
					<strong><b>※테니스장 시설 안내</b></strong> <br>
					<br> (1)&nbsp;<strong style="color:black;"><b>위치</b></strong>&nbsp;&nbsp;:&nbsp;&nbsp;상경대 본관 앞<br>
					<br> (2)&nbsp;<strong style="color:black;"><b>최대수용인원</b></strong>&nbsp;&nbsp;:&nbsp;&nbsp;4명<br> 
					<br> (3)&nbsp;<strong style="color:black;"><b>개방여부</b></strong>&nbsp;&nbsp;:&nbsp;&nbsp;<strong style="color:red;"><b>실외</b></strong> - 이용 가능<br>
					<br> (4)&nbsp;<strong style="color:black;"><b>이용시간</b></strong>&nbsp;&nbsp;:&nbsp;&nbsp;최대&nbsp;<strong style="color:red;"><b>3</b></strong>시간
				</p>
			</div>
			<div class="row alert alert-light studyRoom1" role="alert"style="display:none;font-size: 0.9em; padding: 1em; border: 1px solid #eee;margin-top: 25px;">
				<p>
					<strong><b>※스터디룸1 시설 안내</b></strong> <br>
					<br> (1)&nbsp;<strong style="color:black;"><b>위치</b></strong>&nbsp;&nbsp;:&nbsp;&nbsp;연수관 3층 복도 끝<br>
					<br> (2)&nbsp;<strong style="color:black;"><b>최대수용인원</b></strong>&nbsp;&nbsp;:&nbsp;&nbsp;6명<br> 
					<br> (3)&nbsp;<strong style="color:black;"><b>개방여부</b></strong>&nbsp;&nbsp;:&nbsp;&nbsp;항시 운영<br>
					<br> (4)&nbsp;<strong style="color:black;"><b>이용시간</b></strong>&nbsp;&nbsp;:&nbsp;&nbsp;최대&nbsp;<strong style="color:red;"><b>4</b></strong>시간
				</p>
			</div>
			<div class="row alert alert-light studyRoom2" role="alert"style="display:none;font-size: 0.9em; padding: 1em; border: 1px solid #eee;margin-top: 25px;">
				<p>
					<strong><b>※스터디룸2 시설 안내</b></strong> <br>
					<br> (1)&nbsp;<strong style="color:black;"><b>위치</b></strong>&nbsp;&nbsp;:&nbsp;&nbsp;연수관 4층 복도 끝<br>
					<br> (2)&nbsp;<strong style="color:black;"><b>최대수용인원</b></strong>&nbsp;&nbsp;:&nbsp;&nbsp;6명<br> 
					<br> (3)&nbsp;<strong style="color:black;"><b>개방여부</b></strong>&nbsp;&nbsp;:&nbsp;&nbsp;항시 운영<br>
					<br> (4)&nbsp;<strong style="color:black;"><b>이용시간</b></strong>&nbsp;&nbsp;:&nbsp;&nbsp;최대&nbsp;<strong style="color:red;"><b>4</b></strong>시간
				</p>
			</div>
		<div class="row" id="basketballCourt" style="display:none;">
			<img style="width:100%;height:220px;"src="https://media.angi.com/s3fs-public/indoor-basketball-court.jpg">
		</div>
    	<div class="row" id="tenisCourt" style="display:none;">
			<img style="width:100%;height:220px;"src="https://www.auc.or.kr/storage/ck/2021/01/Dcyo5PEPTX87gFEXGqZ4.jpg">
		</div>
    	<div class="row" id="studyRoom1" style="display:none;">
			<img style="width:100%;height:220px;"src="https://regainstudy.com/theme/basic/img/sub/sub3-1_img_01.jpg">
		</div>
    	<div class="row" id="studyRoom2" style="display:none;">
			<img style="width:100%;height:220px;"src="http://ojsfile.ohmynews.com/STD_IMG_FILE/2018/0116/IE002271776_STD.jpg">
		</div>
		</div>
	</div>
    </div>
    <div class="col-md-8">
        <div id="calendar"></div>
        <div id="calendar1"></div>

        <!-- insertModal -->
        <div class="modal fade insertModal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">일정 등록</h4>
                        <button type="button" class="close"
                                onclick="initModal('insertModal', g_arg)">&times;
                        </button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="rsvSt">시작시간:</label> <select class="form-control"
                                                                     id="rsvSt" onchange="startChange()">
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
                        <div class="form-group">
                            <label for="rsvEn">종료시간:</label> <select class="form-control"
                                                                     id="rsvEn">
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

                        <div class="form-group">
                            <label for="rsvEn">배경색</label>
                            <div class="form-check" style="padding-inline-start:0px;">
                                <ul class="fc-color-picker" id="color-chooser" style="padding-inline-start:0px;">
                                    <a class="text-primary" href="#" onclick="fn_backgroundColor(this)" value="#4e73df"><em
                                            class="fas fa-square"></em></a>
                                    <a class="text-warning" href="#" onclick="fn_backgroundColor(this)" value="#f6c23e"><em
                                            class="fas fa-square"></em></a>
                                    <a class="text-success" href="#" onclick="fn_backgroundColor(this)" value="#1cc88a"><em
                                            class="fas fa-square"></em></a>
                                    <a class="text-danger" href="#" onclick="fn_backgroundColor(this)"
                                       value="#e74a3b"><em class="fas fa-square"></em></a>
                                    <a class="text-muted" href="#" onclick="fn_backgroundColor(this)"
                                       value="#858796"><em
                                            class="fas fa-square"></em></a>
                                </ul>
                                <input type="hidden" id="backgroundColor" name="backgroundColor">
                                <input type="hidden" name="rsvCd" id="rsvCd"/>
                                <input type="hidden" name="facCd" id="facCd"/>
                            </div>
                        </div>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-dark  float-right deleteBtn"
                                onclick="deleteSch('insertModal', g_arg)">삭제
                        </button>
                        <button type="button"
                                class="btn btn-warning float-right insertBtn"
                                onclick="insertSch('insertModal', g_arg)">등록
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-2"></div>
</div>

<script type="text/javascript">
let segcon7 = document.querySelector(".segmented-control__7");
segcon7.addEventListener('mouseover', () => {changeSegcon();$("#basketballCourt").show();$(".basketballCourt").show();});
// segcon7.addEventListener('mouseout', () => {$("#basketballCourt").hide();$(".basketballCourt").hide();});
let segcon6 = document.querySelector(".segmented-control__6");
segcon6.addEventListener('mouseover', () => {changeSegcon();$("#tenisCourt").show();$(".tenisCourt").show();});
// segcon6.addEventListener('mouseout', () => {$("#tenisCourt").hide();$(".tenisCourt").hide();});
let segcon5 = document.querySelector(".segmented-control__5");
segcon5.addEventListener('mouseover', () => {changeSegcon();$("#studyRoom1").show();$(".studyRoom1").show();});
// segcon5.addEventListener('mouseout', () => {$("#studyRoom1").hide();$(".studyRoom1").hide();});
let segcon4 = document.querySelector(".segmented-control__4");
segcon4.addEventListener('mouseover', () => {changeSegcon();$("#studyRoom2").show();$(".studyRoom2").show();});
// segcon4.addEventListener('mouseout', () => {$("#studyRoom2").hide();$(".studyRoom2").hide();});

function changeSegcon(){
	$("#basketballCourt").hide();$(".basketballCourt").hide();
	$("#tenisCourt").hide();$(".tenisCourt").hide();
	$("#studyRoom1").hide();$(".studyRoom1").hide();
	$("#studyRoom2").hide();$(".studyRoom2").hide();
}
$(function(){
		$(".basketballCourt").show();
		$("#basketballCourt").show();
	})
    function fn_backgroundColor(event) {
        $("#backgroundColor").val($(event).attr('value'));
    }

    //시작일자 변경 시 종료일자 +30분 설정---------------------------------------------------------------------------
    function startChange() {
        var start = $('#rsvSt').val();
        var end = $('#rsvEn').val();
        if (start.substring(3, 5) == '00')
            end = start.substring(0, 2) + ':30';
        else
            end = (parseInt(start.substring(0, 2)) + 1) + ':00';

        $('#rsvEn').val(end);
    }

    //모달초기화-------------------------------------------------------------------------------------------------
    function initModal(modal, arg) {
        $('.' + modal + ' #rsvCd').val('');
        $('.' + modal + ' #facCd').val('');
        $('.' + modal + ' #rsvSt').val('09:00');
        $('.' + modal + ' #rsvEn').val('09:30');
        $('.' + modal).modal('hide');
        g_arg = null;
    }

    //일정등록창 모달-------------------------------------------------------------------------------------------------
    function insertModalOpen(arg) {

        g_arg = arg;
        //값이 있는경우 세팅
        if (g_arg.event != undefined) {

            $('.insertModal #rsvCd').val(g_arg.event.extendedProps.rsvCd);
            $('.insertModal #facCd').val(g_arg.event.extendedProps.facCd);
            $(".insertModal .deleteBtn").css('display', 'inline');
            $('.insertModal #rsvSt').val(stringFormat(g_arg.event.start.getHours()) + ':' + stringFormat(g_arg.event.start.getMinutes()));
            $('.insertModal #rsvEn').val(stringFormat(g_arg.event.end.getHours()) + ':' + stringFormat(g_arg.event.end.getMinutes()));

            //해당 이벤트가 로그인계정이 등록한 이벤트면
            if ('<%=sessionId%>' == g_arg.event.extendedProps.memNo) {
                $('.insertModal .deleteBtn').css('display', 'inline');
                $('.insertModal .insertBtn').css('display', 'inline');
                //남의 이벤트면
            } else {
                $('.insertModal .deleteBtn').css('display', 'none');
                $('.insertModal .insertBtn').css('display', 'none');
            }

            //신규 이벤트
        } else {
            //month 외 week, day는 시간 값까지 받아와서 값 바인딩 ex)09:00
            if (g_arg.startStr.length > 10) {
                $('.insertModal #rsvSt').val(g_arg.startStr.substr(11, 5));
                $('.insertModal #rsvEn').val(g_arg.endStr.substr(11, 5));
            }
            //등록버튼 외 숨김
            $('.insertModal .insertBtn').css('display', 'inline');
            $('.insertModal .deleteBtn').css('display', 'none');
        }
        //모달창 show
        $('.insertModal').modal({backdrop: 'static'});
    }

    //일정삭제-------------------------------------------------------------------------------------------------
    function deleteSch(modal, arg) {
        if (confirm('일정을 삭제하시겠습니까?')) {
            var data = {
                memNo: '<%=sessionId%>',
                rsvCd: $('.' + modal + ' #rsvCd').val(), //seq 컬럼 추가해서 기본키 seq로 바꾸고 title은 중복 가능하게 변경하기★★★★
                facCd: $('.' + modal + ' #facCd').val()
            }

            let header = "${_csrf.headerName}";
            let token = "${_csrf.token}";

            //DB 삭제
            $.ajax({
                url: "/facility/deleteSch",
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
            });
            //
        }
    }

    //일정등록-------------------------------------------------------------------------------------------------
    function insertSch(modal, arg) {

        // 등록
        if (arg.event === undefined) {
            if (arg.startStr.substring(0, 10) != arg.endStr.substring(0, 10)) {
            } else {
                if ($('.insertModal #rsvEn').val() <= $('.insertModal #rsvSt').val()) {
                    alert('종료시간을 시작시간보다 크게 선택해주세요');
                    $('.insertModal #rsvEn').focus();
                    return;
                }
            }

            var data;
            //구간이벤트면(종일이벤트 X)
            var m_start = new Date(arg.startStr.substr(0, 4), arg.startStr.substr(5, 2) - 1, arg.startStr.substr(8, 2));
            var m_end = new Date(arg.endStr.substr(0, 4), arg.endStr.substr(5, 2) - 1, arg.endStr.substr(8, 2));
            var m_month = m_end.getMonth() + 1;
            //week나 day에서 추가할때(시간 존재)
            if (arg.endStr.length > 10) {
                m_end.setDate(m_end.getDate());
                //month에선 2021.09.30 클릭 시 endstr이 2021.10.01로 잡히기 떄문에 일-1
            } else {
                m_end.setDate(m_end.getDate() - 1);
            }

            //말일에 대한 로직
            var m_end_com = new Date(arg.endStr.substr(0, 4), arg.endStr.substr(5, 2) - 1, arg.endStr.substr(8, 2));
            var m_first = new Date(m_end.getFullYear(), m_end.getMonth() + 1, 1);
            if (m_end_com.getFullYear() + '' + stringFormat(m_end_com.getMonth()) + '' + stringFormat(m_end_com.getDate())
                === m_first.getFullYear() + '' + stringFormat(m_first.getMonth()) + '' + stringFormat(m_first.getDate())) {
                m_month = m_end.getMonth() + 1;
            }

            var m_date = m_end.getDate();
            arg.endStr = m_end.getFullYear() + '-' + stringFormat(m_month) + '-' + stringFormat(m_date);

            if (arg.startStr.length > 10) {
                //일자만 추출
                arg.startStr = arg.startStr.substr(0, 10);
            }

            data = {
                memNo: '<%=sessionId%>',
                facCd: $("input:radio[name='facility']:checked").val(),
                rsvSt: arg.startStr + 'T' + $('.' + modal + ' #rsvSt').val(),
                rsvEn: arg.endStr + 'T' + $('.' + modal + ' #rsvEn').val(),
                backgroundColor: $("#backgroundColor").val()
            }

            if (data.rsvSt >= data.rsvEn) {
                alert('종료시간을 시작시간보다 크게 선택해주세요');
                return;
            }

            let header = "${_csrf.headerName}";
            let token = "${_csrf.token}";

            //DB 삽입
            $.ajax({
                url: "/facility/insertSch",
                type: "POST",
                data: JSON.stringify(data),
                dataType: "JSON",
                contentType: 'application/json',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                traditional: true,
                success: function (data, status, xhr) {

                    calendar.addEvent({
                        rsvCd: $('#rsvCd').val(),
                        facCd: $('#facCd').val(),
                        start: arg.startStr + 'T' + $('.' + modal + ' #rsvSt').val(),
                        end: arg.endStr + 'T' + $('.' + modal + ' #rsvEn').val(),
                        backgroundColor: $("#backgroundColor").val(),
                        borderColor: $("#backgroundColor").val(),
                        memNo: '<%=sessionId%>'
                    });

                    initModal(modal, arg);
                },
                error: function (xhr, status, error) {
                    alert('일정 등록 실패\n새로고침 후 재시도 해주세요');
                }
            });
        }
    }

</script>

</body>
</html>