<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%
    request.setCharacterEncoding("utf-8");
    String memNo = (String) (session.getAttribute("memNo"));
%>

<div class="container-fluid">

    <div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="card">
                <h2 class="card-header">상세보기</h2>
                <div class="card-body m-3">
                    <div class="row">
                        <table class="table table-bordered">

                            <tbody>
                            <tr>
                                <th style="width:10%">제목</th>
                                <td colspan="5" class="table-title"><c:out value="${form.qnaTtl}"></c:out></td>
                            </tr>
                            <tr>
                                <th style="width:5%">작성자</th>
                                <td style="width:5%" class="table-title">${form.memNo}</td>
                                <th style="width:5%">문의일자</th>
                                <td style="width:5%" class="table-title">${form.qnaDt}</td>
                                <th style="width:5%">답변일자</th>
                                <td style="width:5%" class="table-title">${qnaReply.qnarDt}</td>
                            </tr>
                            <tr>
                                <td colspan="6" class="table-title">
                                    <p class="m-3"><c:out value="${form.qnaCon}"></c:out></p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <form method="post" action="addReply" >
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
                        <c:set var="qnaReply" value="${qnaReply}" />
                        <c:if test="${not empty qnaReply.qnarCon}">
                            <tr>
                                <th style="width:10%">내용</th>
                                <td colspan="5" class="table-title"><c:out value="${qnaReply.qnarCon}"></c:out></td>
                            </tr>
                            <fmt:formatDate var="replyRegDate" value="${qnaReply.qnarDt}" pattern="yyyy.MM.dd.mm"/>
                            <tr>
                                <th style="width:10%">${qnaReply.qnarDt}</th>
                            </tr>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
