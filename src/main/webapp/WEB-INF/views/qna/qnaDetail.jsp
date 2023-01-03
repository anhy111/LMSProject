<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    request.setCharacterEncoding("utf-8");
    String memNo = (String) (session.getAttribute("memNo"));
%>
<style>
    .p-0 {
        padding: 0!important;
    }

    .row {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-wrap: wrap;
        flex-wrap: wrap;
        margin-right: -7.5px;
        margin-left: -7.5px;
    }
    .p-0 {
        padding: 0!important;
    }

    .row {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-wrap: wrap;
        flex-wrap: wrap;
        margin-right: -7.5px;
        margin-left: -7.5px;
    }
</style>

<div class="container-fluid">
    <h4 class="row p-0">공사사항</h4>
    <div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="row">
                <table class="table table-bordered">

                    <tbody>
                    <tr>
                        <th style="width:5%">제목</th>
                        <td colspan="5" class="table-title"><c:out value="${form.qnaTtl}"></c:out></td>
                    </tr>
                    <tr>
                        <th style="width:5%">작성자</th>
                        <td style="width:5%" class="table-title">${form.memNo}</td>
                        <th style="width:5%">문의일자</th>
                        <td style="width:5%" class="table-title">
                            <fmt:formatDate value="${form.qnaDt}" pattern="yyyy/MM/dd HH:mm:ss"/>
                        </td>
                        <th style="width:5%">답변일자</th>
                        <td style="width:5%" class="table-title">
                            <fmt:formatDate value="${qnaReply.qnarDt}" pattern="yyyy/MM/dd HH:mm:ss"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" class="table-title">
                            <p class="m-3"><c:out value="${form.qnaCon}"></c:out></p>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <c:if test="${empty qnaReply.qnarCon}">
                <form method="post" action="addReply">
                    <sec:csrfInput/>
                    <input type="hidden" name="parentId" value="${form.qnaCd}"/>
                    <p>
                        <label>관리자</label>
                    </p>
                    <p>
                        <textarea rows="5" cols="50" name="content"></textarea>
                    </p>
                    <p>
                        <button type="submit">댓글 등록</button>
                    </p>
                </form>
            </c:if>

            <!-- ================================================= -->
            <!-- 버튼 시작 -->
            <!-- ================================================= -->
            <div class="row justify-content-end mt-3">
                <button class="btn btn-outline-primary m-1" type="button"
                        onclick="location.href='/qna/update/${form.qnaCd}'">수정
                </button>
                <button class="btn btn-outline-danger m-1" type="button"
                        onclick="location.href='/qna/delete/${form.qnaCd}'">삭제
                </button>
                <button class="btn btn-primary m-1" type="button" onclick="location.href='/qna/main'">목록
                </button>
            </div>

            <!-- ================================================= -->
            <!-- 댓글 시작 -->
            <!-- ================================================= -->
            <hr/>

            <ul>
                <c:set var="qnaReply" value="${qnaReply}"/>
                <c:if test="${not empty qnaReply.qnarCon}">
                    <tr>
                        <td colspan="5" class="table-title">
                            <c:out value="${qnaReply.qnarCon}"/>
                        </td>
                    </tr>
                    <br>
                    <tr>
                        <td>
                            <fmt:formatDate value="${qnaReply.qnarDt}" pattern="yyyy/MM/dd HH:mm:ss"/>
                        </td>
                    </tr>
                </c:if>
            </ul>
        </div>
    </div>
</div>
