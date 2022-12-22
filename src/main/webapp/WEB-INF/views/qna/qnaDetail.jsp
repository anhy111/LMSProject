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
                                <td colspan="5" class="table-title">${form.qnaTtl}</td>
                            </tr>
                            <tr>
                                <th style="width:5%">작성자</th>
                                <td style="width:5%" class="table-title">${form.memNo}</td>
                                <th style="width:5%">문의일자</th>
                                <td style="width:5%" class="table-title">${form.qnaDt}</td>
                                <th style="width:5%">답변일자</th>
                                <td style="width:5%" class="table-title">답변일자넣기</td>
                            </tr>
                            <tr>
                                <td colspan="6" class="table-title">
                                    <p class="m-3">${form.qnaCon}</p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <form action="addReply" method="post">
                        <sec:csrfInput/>
                        <input type="hidden" name="parentId" value="${form.qnaCd}"/>
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
                        <li>첫번째 댓글</li>
                        <li>두번째 댓글</li>
                        <li>세번째 댓글</li>
                    </ul>

                    <div>
                        <p>
                            <label>댓글 작성자</label> <input type="text">
                        </p>
                        <p>
                            <textarea rows="5" cols="50"></textarea>
                        </p>
                        <p>
                            <button type="button">댓글 작성</button>
                        </p>
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>
