<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<link rel="stylesheet" href="/resources/css/suwon.css">
<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<style>

    /* 기본 틀 잡기 (사이버캠퍼스 / 변동 가능 / suwon.css 파일에 넣었다가 주석 처리함) */
    .card-body {
        width: 100%;
    }

    /* 기본 틀 잡기 끝 */

    #grid {
        width: 100%;
        min-height: 400px;
    }

    #grid td, #grid2 td {
        padding: 4px;
        background: #fff;
    }

    #grid th, #grid2 th {
        background: #f4f7fd;
    }

    #grid2 {
        width: 100%;
        min-height: 491px;

        display: none;
    }

    #noData > p {
        text-align: center;
        color: #999;
        line-height: 480px;
        margin: 0;
    }

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

    .scoreMiddleWrap td {
        padding: 4px;
        text-align: center;
        background: #f4f7fd;
    }

    .informDetailTop table {
        border: 1px solid #e0e0e0;
        width: 100%;
        text-align: center;
    }

    .informDetailBot table {
        border: 1px solid #e0e0e0;
        width: 100%;
        text-align: center;
    }

    .fitTable table {
        width: 100%;
        border-top: none !important;
        border: 1px solid #e0e0e0;
    }

    .abbottom table {
        width: 95%;
        height: 67px;
        border: 1px solid #e0e0e0;
    }

    .abbottom td {
        text-align: center;
    }

    #scoreTable th {
        background: #f4f7fd;
    }

    .gradeSelect option {
        background: #fff;
        color: #333;
        padding: 3px 0;
        text-align: center;
    }
</style>
<script type="text/javascript" defer="defer">
    let header = "${_csrf.headerName}";
    let token = "${_csrf.token}";

    var stuNo = 0;

    $(function () {
        var lecCd = $('#lecCd').val();
        var lecaCd = $('#lecaCd').val();
        getGrid(lecaCd);
    })

    // 학생 성적 + 정보 리스트 불러오기
    function getGrid(lecaCd) {
        $.ajax({
            url: "/lectureBoard/lecStuTotScore",
            type: 'post',
            data: {
                "lecaCd": lecaCd
            },
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            contentType: "application/json;charset=utf-8",
            dataType: 'JSON',
            success: function (result) {
                $('#grid').empty();

                grid = new tui.Grid({
                    el: document.getElementById('grid'),
                    data: result,
                    scrollX: true,
                    scrollY: true,
                    minBodyHeight: 400,
                    bodyHeight: 400,
                    columns: [
                        {header: '단과대학', name: 'colNm', fileter: 'select', width: 240, align: 'center'},
                        {header: '학과', name: 'depNm', fileter: 'select', width: 180, align: 'center'},
                        {header: '학년', name: 'stuYrs', fileter: 'select', width: 140, align: 'center'},
                        {header: '학번', name: 'stuNo', fileter: 'select', width: 180, align: 'center'},
                        {header: '이름', name: 'stuNm', fileter: 'select', width: 180, align: 'center'}
                    ],
                    rowHeaders: ['rowNum'],
                    columnOptions: {resizable: true}
                });

                grid.on('click', function (object) {
                    stuNo = grid.getRow(object.rowKey).stuNo;
                    $('.W').empty();
                    detail(parseInt(stuNo), parseInt(lecaCd), object);
                })
            }
        })
        // 학생 리스트 ajax 끝
    }

    //학생 상세 ajax
    function detail(stuNo, lecaCd, object) {
        $.ajax({
            url: "/lectureBoard/attendDetail",
            data: {
                "stuNo": stuNo,
                "lecaCd": lecaCd,
            },
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            type: 'post',
            dataType: 'JSON',
            success: function (result) {
                $('#slScore').attr('disabled', false);
                $('#noData').css('display', 'none');
                $('#grid2').css('display', 'block');
                $('#memCd').val(result.studentDetail.stuNo);
                $('#memNm').val(result.studentDetail.stuNm);

                colNm = grid.getRow(object.rowKey).colNm;
                depNm = grid.getRow(object.rowKey).depNm;

                cd = colNm + ' ' + depNm;
                $('#colNmdepNm').val(cd);

                stuScoreandMaxScore(parseInt(lecaCd), result.studentDetail.stuNo);
                scoreDetail(result.studentDetail.stuNo, parseInt(lecaCd), object);
            }
        })
    }
</script>

<div class="col-lg-12">

    <%-- 	<input type="hidden" value="${data.lecCd }" id="lecCd"> --%>
<%--    check--%>
    <input type="hidden" value="${data.lecaCd }" id="lecaCd">

    <!-- 성적 리스트 조회 -->
    <div class="card-body">
        <div id="bodyWrapper">
            <h4 class="lecApplyName">${data.lecaNm }</h4>
            <div class="clear topBorder"></div>
            <div class="scoreTopWrap">
                <p style="margin-top: 30px;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;수강생 목록
                </p>
                <div id="grid"></div>
            </div>
        </div>
    </div>
</div>
	
