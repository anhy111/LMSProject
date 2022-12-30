<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" defer="defer">
</script>
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
    }

    .card-body {
        width: 100%;
    }

    /* 기본 틀 잡기 끝 */

    .quizNotice {
        background: #eee;
        width: 100%;
        height: auto;
        padding: 5%;
        margin-bottom: 10px;
    }

    .emphasisR {
        color: red;
    }

    .table-responsive-sm {
        margin-bottom: 40px;
        min-height: 500px;
    }

    .table {
        border-bottom: 1px solid #eef2f7;
    }

    .icon-reply {
        width: 20px;
    }

    .current-page {
        margin-top: 13px;
        font-size: 25px;
    }

    .current-page {
        font-family: 'Noto Serif KR', serif;
        font-weight: 600;
        line-height: 1;
        letter-spacing: 0;
        vertical-align: middle;
        color: #3364c4;
    }
</style>

<%
    Date date = new Date();
    date.setDate(date.getDate() - 6);
    SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy.MM.dd");
    String simDate = simpleDate.format(date);
%>
<c:set var="date" value="<%= simDate %>"/>

<div class="quizWrapper">
    <div class="col-lg-12">
        <div class="card" style="min-height: 700px;">
            <div class="card-body">
                <p class="current-page">문의게시판</p>
                <div class="alert alert-light" role="alert"
                     style="font-size: 0.9em;padding: 35px;border: 1px solid #eee;">
                    <p>
                        <strong>&#8251; 시험 제출자 안내 사항</strong>
                        <br><br>
                        (1) 반드시 <strong>기간을 먼저 설정</strong>한 후, 시험을 등록하는 것을 권장합니다.<br>
                        &emsp;- 시험 기간 미설정시, 등록 직후 바로 시험에 응시 가능합니다.<br>
                        &emsp;- <strong>기간을 설정하지 않고 문제를 등록하여 문제 유출이 되는 경우가 종종 발생합니다.</strong><br>
                        <br>
                        (2) 시험은 한 문항당 4지 선다 방식으로 등록할 수 있습니다.<br>
                        &emsp;- <strong>정답 란에는 1~4까지의 숫자</strong>만 입력이 가능합니다.<br>
                    </p>
                </div>
                <a href="/qna/qnaWrite" class="btn btn-sm btn-primary" style="float: right;">등록</a>
                <p style="display: inline-block;margin-top:15px;margin-left: 30px;">총&nbsp;<span
                        style="color:red;">${totalRow }</span>건의 게시물이 있습니다</p>
                <div class="tab-content">
                    <div class="tab-pane show active" id="hoverable-rows-preview">
                        <div class="table-responsive-sm">
                            <table class="table mb-0" style="border-bottom: 1px solid #eef2f7">
                                <thead class="table-light">
                                <tr style="border-top: 2px solid #112a63">
                                    <th style="width: 10%; text-align: center;">No</th>
                                    <th style="width: 60%;text-align: center;">제목</th>
                                    <th style="width: 10%;text-align: center;">학번</th>
                                    <th style="width: 10%;text-align: center;">작성일</th>
                                    <th style="width: 10%;text-align: center;">조회</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:set var="length" value="${fn:length(qnaList)}"/>
                                <c:forEach var="qnaList" items="${qnaList}" varStatus="status">
                                    <fmt:formatDate var="qnaRegDate" value="${qnaList.qnaDt}" pattern="yy/MM/dd"/>
                                    <tr>
                                        <td style="text-align: center;">${length - (status.count-1)}</td>
                                        <td>
                                            <a href="/qna/qnaDetail/${qnaList.qnaCd}/detail" style="color:#6c757d;">
                                                <c:out value="${qnaList.qnaTtl }" />
                                            <c:if test="${qnaList.qnaReplyCount == 1 }">
                                                <img src="${pageContext.request.contextPath}/resources/image/replyIcon.jpeg" alt="new"
                                                     class="icon-reply">
                                            </c:if>
                                            </a>
                                        </td>
                                        <td style="text-align: center;">${qnaList.memNo}</td>
                                        <td style="text-align: center;">${qnaRegDate}</td>
                                        <td style="text-align: center;">${qnaList.qnaHit}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="pageBarBtn" style="text-align:center;">
                    <button type="button" class="btn btn-light" disabled="" onclick="#"><i
                            class="uil-angle-double-left"></i></button>
                    <button type="button" class="btn btn-light" disabled="" onclick="#"><i
                            class="uil uil-angle-left"></i></button>


                    <button type="button" class="btn btn-primary" onclick="#">
                        1
                    </button>

                    <button type="button" class="btn btn-light" onclick="#"><i class="uil uil-angle-right"></i></button>
                    <button type="button" class="btn btn-light" disabled="" onclick="#"><i
                            class="uil-angle-double-right"></i></button>
                </div>
            </div>
        </div>
    </div>
</div>