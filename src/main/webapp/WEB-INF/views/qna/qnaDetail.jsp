<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<%
    request.setCharacterEncoding("utf-8");
    String memNo = (String) (session.getAttribute("memNo"));
%>
<style>
    .p-0 {
        padding: 0 !important;
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
        padding: 0 !important;
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
    <h4 class="row p-0">문의게시판</h4>
    <div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="row">
                <table class="table table-bordered">

                    <tbody>
                    <tr>
                        <th style="width:5%; text-align:center" align="center">제목</th>
                        <td style="padding-left: 6%;" colspan="5" class="table-title"><c:out
                                value="${form.qnaTtl}"></c:out></td>
                    </tr>
                    <tr>
                        <th style="width:5%; text-align:center" align="center">작성자</th>
                        <td style="width:5%" class="table-title" align="center">${form.stuNm}</td>
                        <th style="width:5%; text-align:center" align="center">문의일자</th>
                        <td style="width:5%" align="center" class="table-title">
                            <fmt:formatDate value="${form.qnaDt}" pattern="yyyy/MM/dd HH:mm:ss"/>
                        </td>
                        <th style="width:5%; text-align:center " align="center">답변일자</th>
                        <td style="width:5%" align="center" class="table-title">
                            <fmt:formatDate value="${qnaReply.qnarDt}" pattern="yyyy/MM/dd HH:mm:ss"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" class="table-title">
                            <p class="m-3" style="height: 200px">
                                <c:out value="${form.qnaCon}"/>
                            </p>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <sec:authorize access="hasRole('ROLE_MANAGER')">
                <c:if test="${empty qnaReply.qnarCon}">
                    <form method="post" action="addReply">
                        <sec:csrfInput/>
                        <input type="hidden" name="parentId" value="${form.qnaCd}"/>
                        <p>
                            <label>관리자</label>
                        </p>
                        <p>
                            <textarea rows="5" cols="50" name="content" id="autoFillField"></textarea>
                        </p>
                        <p>
                            <button onclick="autoFill()">자동 완성</button>
                            <button type="submit">댓글 등록</button>
                        </p>
                    </form>
                </c:if>
            </sec:authorize>
            <!-- ================================================= -->
            <!-- 버튼 시작 -->
            <!-- ================================================= -->
            <div class="row justify-content-end mt-3">
                <c:if test="${empty qnaReply.qnarCon}">
                    <button class="btn btn-outline-primary m-1" type="button"
                            onclick="location.href='/qna/update/${form.qnaCd}'">수정
                    </button>
                    <button class="btn btn-outline-danger m-1" type="button"
                            onclick="location.href='/qna/delete/${form.qnaCd}'">삭제
                    </button>
                    <button class="btn btn-primary m-1" type="button" onclick="location.href='/qna/main'">목록
                    </button>
                </c:if>
            </div>

            <!-- ================================================= -->
            <!-- 댓글 시작 -->
            <!-- ================================================= -->
            <hr/>

            <ul>
                <c:set var="qnaReply" value="${qnaReply}"/>
                <c:if test="${not empty qnaReply.qnarCon}">
                    <tr>
                        <td colspan="5" rowspan="3" class="table-title">
                            <h2>Re : </h2><c:out value="${qnaReply.qnarCon}"/>
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
<script>
    function autoFill() {
        $('#autoFillField').val("중요공지사항입니다!!!");
    }
</script>
