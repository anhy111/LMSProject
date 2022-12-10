<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="card">
    <div class="card-body">
        <div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">
            <div class="row">
                <div class="col-sm-12">
                    <table id="example1"
                           class="table table-bordered table-striped dataTable dtr-inline"
                           aria-describedby="example1_info">
                        <thead>
                        <tr>
                            <th class="sorting" tabindex="0" aria-controls="example1"
                                rowspan="1" colspan="1"
                                aria-label="Rendering engine: activate to sort column ascending"
                                cursorshover="true">공지사항코드
                            </th>
                            <th class="sorting" tabindex="0" aria-controls="example1"
                                rowspan="1" colspan="1"
                                aria-label="Platform(s): activate to sort column ascending"
                                cursorshover="true">제목
                            </th>
                            <th class="sorting" tabindex="0" aria-controls="example1"
                                rowspan="1" colspan="1"
                                aria-label="Engine version: activate to sort column ascending"
                                cursorshover="true">내용
                            </th>
                            <th class="sorting" tabindex="0" aria-controls="example1"
                                rowspan="1" colspan="1"
                                aria-label="Engine version: activate to sort column ascending"
                                cursorshover="true">등록일
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="noticeBasic" items="${noticeBasicList}" varStatus="stat">
                        <c:if test="${stat.count%2!=0 }">
                        <tr class="odd"></c:if>
                            <c:if test="${stat.count%2==0 }">
                        <tr class="even"></c:if>
                            <td class="dtr-control sorting_1" tabindex="0"><a href="/notice/list/${noticeBasic.noticeCd}/edit">${noticeBasic.noticeCd}</a></td>
                            <td>${noticeBasic.noticeTtl}</td>
                            <td>${noticeBasic.noticeCon }</td>
                            <td><fmt:formatDate value="${noticeBasic.noticeReg }" pattern="yyyy년 MM월 dd일"/></td>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div style="text-align: right">
                    <a href="/notice/noticeForm" class="btn btn-sm btn-primary">글쓰기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
