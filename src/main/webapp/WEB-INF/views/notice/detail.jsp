<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<!-- 게시판상세 -->
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->

    <!-- 111111 -->
    <div class="row">
        <div class="col-12">
            <div class="mr-auto row">
            <h1 class="title">${form.noticeTtl}</h1>
                <div style="border:0;" class="form-control">작성일&nbsp;&nbsp;:&nbsp;&nbsp;<fmt:formatDate value="${form.noticeReg}" pattern="yyyy/MM/dd"/></div>
            </div>
        </div>
        <input type="hidden" name="noticeCd" value="${form.noticeCd}"/>
        <div class="col-12">
            <div class="col-10 ml-2" readonly style="background-color:white;border:0;"> ${form.noticeCon}</div>
        </div>

       <div class="col-12 mt-5">
            <c:if test="${form.atchFileId != -1}">
                <label style="margin-bottom:0;margin-top:8px;">첨부파일&nbsp;&nbsp;:&nbsp;&nbsp;</label>
                <c:forEach var="attach" items="${form.attachList}">
                    <!-- 파일 업로드 경로 문제 해결 안됐음************************************************************************************************************** -->
                    <a href="/upload${attach.streFileNm}" download="${attach.orignlFileNm}"
                       class="btn btn-outline-primary">${attach.orignlFileNm}
                        <svg xmlns="http://www.w3.org/2000/svg" width="5" height="5" fill="currentColor"
                             class="bi bi-download" viewBox="0 0 16 16">
                            <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
                            <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/>
                        </svg>
                    </a>
                </c:forEach>
            </c:if>
       </div>
       <div class="col-12">
            <c:set var="standardNoticeCd" value="${form.noticeCd}"/>
            <a href="/notice/list/${standardNoticeCd - 1}/detail" class="btn btn-default" style="background-color:white;border:0;">
                <c:if test="${not empty formPre.noticeTtl}">
                        이전글&nbsp;&nbsp;:&nbsp;<span class="clip">${formPre.noticeTtl}</span>
                    </c:if>
<!--                             </p> -->
                    <c:if test="${empty formPre.noticeTtl}">
                        <span class="clip">이전글 없음</span>
<!--                                 <button class="btn btn-default">이전글</button> -->
                    </c:if>
            </a>
            <a href="/notice/list" class="btn btn-default" style="background-color:white;border:0;">목록보기</a>
            <c:if test="${not empty formNext.noticeTtl}">
                    <c:if test="${not empty formNext.noticeTtl}">
                <a href="/notice/list/${standardNoticeCd + 1}/detail" class="btn next">다음글&nbsp;&nbsp;:&nbsp;<span class="clip">${formNext.noticeTtl}</span>
<!--                                 <button class="btn btn-default"style="background-color:white;border:0;"></button> -->
                </a>
                    </c:if>
            </c:if>
            <c:if test="${empty formNext.noticeTtl}">
                    <span class="btn next">
                    <span class="clip" readonly="true">없음</span>
<!--                             <span class="arrow next" readonly="true">다음글</span> -->
                    </span>
            </c:if>
        </div>
   </div>

    <sec:authorize access="hasRole('ROLE_MANAGER')">
        <div class="row">
            <button class="btn btn-outline-primary m-1" type="button"
                    onclick="location.href='/notice/update/${form.noticeCd}'">수정
            </button>
            <button class="btn btn-outline-danger m-1" type="button"
                    onclick="location.href='/notice/delete/${form.noticeCd}'">삭제
            </button>
            <button class="btn btn-primary m-1" type="button" onclick="location.href='/notice/list'">목록
            </button>
        </div>
    </sec:authorize>

    <script>
        function f_alert() {
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#5969FF',
                cancelButtonColor: '#EF172C',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire(
                        'Deleted!',
                        'Your file has been deleted.',
                        'success'
                    )
                }
            });

        }

    </script>
