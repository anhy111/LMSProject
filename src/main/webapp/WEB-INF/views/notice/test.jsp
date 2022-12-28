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

    .col-title {
        padding: 10px;
    }

    .txt {
        max-height: 40px;
        padding: 0 0 0 10px;
        margin: 10px 0 5px;
        font-size: 14px;
        font-weight: 500;
        line-height: 20px;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        word-wrap: break-word;
        overflow: hidden;
    }
    .txt {
        display: inline-block;
        letter-spacing: -0.025em;
        vertical-align: top;
        color: #333;
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
    }항
</style>

<%
    Date date = new Date();
    date.setDate(date.getDate() - 6);
    SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy/MM/dd");
    String simDate = simpleDate.format(date);
%>
<c:set var="date" value="<%= simDate %>"/>

<div class="quizWrapper">
    <div class="col-lg-12">
        <div class="card" style="min-height: 700px;">
            <div class="card-body">
                <p class="current-page">공사사항</p>
                <div class="alert alert-light" role="alert"
                     style="font-size: 0.9em;padding: 35px;border: 1px solid #eee;">
                </div>
                <a href="/notice/noticeForm" class="btn btn-sm btn-primary" style="float: right;">등록</a>
                <p style="display: inline-block;margin-top:15px;margin-left: 30px;">총&nbsp;<span
                        style="color:red;">${totalRow }</span>건의 게시물이 있습니다</p>
                <div class="tab-content">
                    <div class="tab-pane show active" id="hoverable-rows-preview">
                        <div class="table-responsive-sm">
                            <table class="table mb-0" style="border-bottom: 1px solid #eef2f7">
                                <thead class="table-light">
                                <tr style="border-top: 2px solid #112a63">
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="noticeBasic" items="${noticeBasicList }" varStatus="status">
                                    <fmt:formatDate var="noticeRegDate" value="${noticeBasic.noticeReg }"
                                                    pattern="yyyy/MM/dd"/>
                                    <tr>
                                        <td class="col-title">
                                            <a href="/notice/list/${noticeBasic.noticeCd}/detail">
                                                    <span class="txt">
                                                        <c:out value="${noticeBasic.noticeTtl }"/>

                                                           <c:if test="${ date = noticeRegDate }">
                                                               <img src="../../../resources/image/new.png" alt="new"
                                                                    class="icon-new">
                                                           </c:if>

                                                            <img src="../../../resources/image/file.png" alt="file" class="icon-file">
                                                    </span>
                                            </a>
                                        </td>
                                            <%--                                        <td style="text-align: center;">${noticeBasic.noticeHit}</td>--%>
                                        <td style="text-align: center;">${noticeRegDate }</td>
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