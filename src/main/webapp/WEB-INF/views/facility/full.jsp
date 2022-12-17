<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    request.setCharacterEncoding("utf-8");
    String sessionId = (String) (session.getAttribute("memNo"));
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- fullcalender -->
    <link href="/resources/fullcalendar-5.11.3/lib/main.css" rel="stylesheet"/>
    <script src="/resources/fullcalendar-5.11.3/lib/main.js"></script>
    <script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
    <script>

        var regColor = '#343a40';	//일반직원등록 흑색
        var approvalColor = '#28a745'; //승인 녹색
        var rejectColor = '#dc3545'; //반려 적색
        var textWhite = '#fff'; //글씨흰색
        var textBlack = '#000'; //글씨검은색

        var today = new Date();
        var month = today.getMonth() + 1;	//getMonth()는 9월이 8으로 나옴
        var date = today.getDate();
        var g_arg;	//이벤트 글로벌 변수(모달창에서 호출하는 함수에서 참조하기 위함)
        var calendar;	//달력 변수
        var todayStr = today.getFullYear() + '-' + stringFormat(month) + '-' + stringFormat(date);
        var sch;

        function stringFormat(p_val) {
            if (p_val < 10)
                return p_val = '0' + p_val;
            else
                return p_val;
        }

        document.addEventListener("DOMContentLoaded", function () {
            var calendarEl = document.querySelector("#calendar");

            calendar = new FullCalendar.Calendar(calendarEl, {
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
                data: "{}",
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
    <title>시설 예약</title>
</head>
<body>
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <div id="calendar"></div>

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
        console.log(arg);
    }

    //일정삭제-------------------------------------------------------------------------------------------------
    function deleteSch(modal, arg) {
        if (confirm('일정을 삭제하시겠습니까?')) {
            var data = {
                memNo: '<%=sessionId%>',
                rsvCd: $('.' + modal + ' #rsvCd').val() //seq 컬럼 추가해서 기본키 seq로 바꾸고 title은 중복 가능하게 변경하기★★★★
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
                    //alert(xhr.status);
                    arg.event.remove();
                    initModal(modal, arg);
                },
                error: function (xhr, status, error) {
                    //alert(xhr.responseText);
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
                rsvSt: arg.startStr + 'T' + $('.' + modal + ' #rsvSt').val(),
                rsvEn: arg.endStr + 'T' + $('.' + modal + ' #rsvEn').val(),
                backgroundColor: $("#backgroundColor").val()
            }

            if (data.rsvSt >= data.rsvEn) {
                console.log(data.rsvSt + "  s");
                console.log(data.rsvEn + "  e");
                console.log(data);
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

<div id="d1" data-code="${memberNumber}" >
    <select class="custom-select ntcCateLeft" id="facility">
        <c:forEach var="item" items="${facility }">
            <option value="${item.facCd}">${item.facNm}</option>
        </c:forEach>
    </select>
</div>

</body>
</html>