<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    request.setCharacterEncoding("utf-8");
    String sessionId = (String) (session.getAttribute("memNo"));
%>
<!DOCTYPE html>

<html lang="ko">
<link rel="stylesheet" type="text/css"
	href="/resources/css/inputModalTemplate.css">
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
    <div id="d1" data-code="${memberNumber}">
    <div class="col-12 segmented-control2">
  <c:forEach var="item" items="${facility }" varStatus="status" end="${facility.size() }">
      <label class="segmented-control__${3 + status.end-status.index }" for="facility${status.end-status.index }">${item.facNm}<input class="facility btn-check" name="facility" type="radio" value="${item.facCd}" id="facility${status.end-status.index }"></label> 
       </c:forEach>
	
					<div class="segmented-control__color2"></div>
		</div>
    
    	<div class="row" id="basketballCort" style="display:none;">
			<img src="data:image/jpeg;base64,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">
		</div>
    	<div class="row" id="tenisCort" style="display:none;">
			<img style="width:300px;height:168px;"src="https://www.auc.or.kr/storage/ck/2021/01/Dcyo5PEPTX87gFEXGqZ4.jpg">
		</div>
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

    </script>
    <title>시설 예약</title>
</head>
<body>
<div class="row">
    <div class="col-md-2"></div>
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
let segcon6 = document.querySelector(".segmented-control__6");
segcon7.addEventListener('mouseover', () => {$("#basketballCort").show();});
segcon7.addEventListener('mouseout', () => {$("#basketballCort").hide();});
segcon6.addEventListener('mouseover', () => {$("#tenisCort").show();});
segcon6.addEventListener('mouseout', () => {$("#tenisCort").hide();});

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
                facCd: $('#facility').val(),
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