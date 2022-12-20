<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    Date date = new Date();
    SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy.MM.dd");
    String simDate = simpleDate.format(date);
%>
<c:set var="date" value="<%= simDate %>" />

<div class="card">
    <div class="card-body">
        <div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">
            <div class="row">
                <div class="col-sm-12">
                    <table id="example1"
                           class="table table-bordered table-striped dataTable dtr-inline"
                           aria-describedby="example1_info">
                        <p style="display: inline-block;margin-top:15px;margin-left: 30px;">총&nbsp;<span style="color: red;"><fmt:formatNumber maxFractionDigits="3" value="${ totalRow }"></fmt:formatNumber></span>건의 게시물이 있습니다.</p>
                        <thead>
                        <tr>
                            <th class="sorting" tabindex="0" aria-controls="example1"
                                rowspan="1" colspan="1"
                                aria-label="Rendering engine: activate to sort column ascending"
                                cursorshover="true">문의코드
                            </th>
                            <th class="sorting" tabindex="0" aria-controls="example1"
                                rowspan="1" colspan="1"
                                aria-label="Platform(s): activate to sort column ascending"
                                cursorshover="true">제목
                            </th>
                            <th class="sorting" tabindex="0" aria-controls="example1"
                                rowspan="1" colspan="1"
                                aria-label="Engine version: activate to sort column ascending"
                                cursorshover="true">등록일
                            </th>
                            <th class="sorting" tabindex="0" aria-controls="example1"
                                rowspan="1" colspan="1"
                                aria-label="Engine version: activate to sort column ascending"
                                cursorshover="true">공개여부
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="list" items="${showList}" varStatus="stat">
                        <fmt:formatDate var="qnaRegDate" value="${ list.qnaDt }" pattern="yyyy.MM.dd"/>
                        <c:if test="${stat.count%2!=0 }">
                        <tr class="odd"></c:if>
                            <c:if test="${stat.count%2==0 }">
                        <tr class="even"></c:if>

                            <td class="dtr-control sorting_1" tabindex="0">${list.qnaCd}</td>

                            <td><a href="/qna/qnaDetail/${list.qnaCd}/detail">${list.qnaTtl}
                                <c:if test="${ date <= qnaRegDate }">
                                <span class="badge badge-outline-warning badge-pill" style="float: right;">NEW</span>
                                </c:if>
                            </td>

                            <td><fmt:formatDate value="${list.qnaDt }" pattern="yyyy년 MM월 dd일"/></td>
                            <td>
                                <c:if test="${list.qnaYn == '2'}">비공개</c:if>
                                <c:if test="${list.qnaYn == '1'}">공개</c:if>
                            </td>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div style="text-align: right">

                    <a href="/qna/qnaWrite" class="btn btn-sm btn-primary">글쓰기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
