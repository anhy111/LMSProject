<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<style>

div{border: 1px solid orange;}
/*     .date { */
/*         margin-top: 3px; */
/*         font-size: 11px; */
/*         font-weight: 400; */
/*         line-height: 19px; */
/*         letter-spacing: 0; */
/*         color: #666; */
/*     } */

/*     .header { */
/*         padding: 12px 15px 12px; */
/*     } */

/*     .header { */
/*         position: relative; */
/*         border-top: 1px solid #333; */
/*         border-bottom: 1px solid #ebebeb; */
/*     } */

/*     .title { */
/*         max-height: 57px; */
/*         font-size: 14px; */
/*         line-height: 19px; */
/*         text-overflow: ellipsis; */
/*         display: -webkit-box; */
/*         -webkit-line-clamp: 3; */
/*         -webkit-box-orient: vertical; */
/*         word-wrap: break-word; */
/*         overflow: hidden; */
/*     } */

/*     p { */
/*         display: block; */
/*         margin-block-start: 1em; */
/*         margin-block-end: 1em; */
/*         margin-inline-start: 0px; */
/*         margin-inline-end: 0px; */
/*     } */

    /*  공지사항 시작 */
/*     .current-page { */
/*         margin-top: 13px; */
/*         font-size: 25px; */
/*     } */

/*     .current-page { */
/*         font-family: 'Noto Serif KR', serif; */
/*         font-weight: 600; */
/*         line-height: 1; */
/*         letter-spacing: 0; */
/*         vertical-align: middle; */
/*         color: #3364c4; */
/*     } */

    /*  공지사항 끝  */
    /*  다운로드 시작 */
/*     .download { */
/*         padding: 10px 8px; */
/*         margin: 20px 0; */
/*     } */

/*     .download { */
/*         border: 1px solid #ebebeb; */
/*         background: #f7f7f7; */
/*     } */

/*     /*  다운로드 끝  */ */
/*     /*  footer 시작   */ */
/*     .btn.prev { */
/*         padding: 0px 35px 0 15px; */
/*     } */

/*     .btn.prev { */
/*         border-right: 1px dashed #b3b2b2; */
/*         text-align: left; */
/*     } */

/*     .btn { */
/*         height: 52px; */
/*         padding: 0px 15px; */
/*     } */

/*     .btn { */
/*         display: inline-block; */
/*         width: 50%; */
/*         vertical-align: top; */
/*         text-decoration: none; */
/*     } */

/*     .title .clip { */
/*         max-height: 34px; */
/*         text-overflow: ellipsis; */
/*         display: -webkit-box; */
/*         -webkit-line-clamp: 2; */
/*         -webkit-box-orient: vertical; */
/*         word-wrap: break-word; */
/*         overflow: hidden; */
/*     } */

/*     .arrow.prev { */
/*         padding-left: 40px; */
/*     } */

/*     .btn .arrow { */
/*         margin-top: 11px; */
/*         font-size: 11px; */
/*         line-height: 12px; */
/*     } */

/*     .btn .arrow { */
/*         display: block; */
/*         position: relative; */
/*         font-weight: 500; */
/*         letter-spacing: 0; */
/*         color: #888; */
/*     } */

/*     .arrow.prev::after { */
/*         background: url(/resources/image/icon-view-arrow_lg.png) 0 0/auto 8px no-repeat; */
/*     } */

/*     .arrow.prev::after { */
/*         left: 0; */
/*     } */

/*     .arrow::after { */
/*         content: ''; */
/*         display: block; */
/*         position: absolute; */
/*         position: absolute; */
/*         top: 50%; */
/*         -ms-transform: translate(0, -50%); */
/*         -moz-transform: translate(0, -50%); */
/*         -o-transform: translate(0, -50%); */
/*         -webkit-transform: translate(0, -50%); */
/*         transform: translate(0, -50%); */
/*     } */

/*     ::after, *::before { */
/*         box-sizing: border-box; */
/*     } */

/*     ::after, ::before { */
/*         box-sizing: inherit; */
/*     } */

/*     .btn-list { */
/*         font-size: 11px; */
/*     } */

/*     .btn-list { */
/*         display: inline-block; */
/*         position: absolute; */
/*         z-index: 1; */
/*         padding: 15px; */
/*         font-weight: 500; */
/*         line-height: 1; */
/*         letter-spacing: -0.025em; */
/*         text-decoration: none; */
/*         color: #888; */
/*         background: #fff; */
/*         position: absolute; */
/*         left: 50%; */
/*         -ms-transform: translate(-50%, 0); */
/*         -moz-transform: translate(-50%, 0); */
/*         -o-transform: translate(-50%, 0); */
/*         -webkit-transform: translate(-50%, 0); */
/*         transform: translate(-50%, 0); */
/*     } */

/*     .p-0 { */
/*         padding: 0 !important; */
/*     } */

/*     .row { */
/*         display: -ms-flexbox; */
/*         display: flex; */
/*         -ms-flex-wrap: wrap; */
/*         flex-wrap: wrap; */
/*         margin-right: -7.5px; */
/*         margin-left: -7.5px; */
/*     } */
</style>

<!-- 게시판상세 -->
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->

    <!-- 111111 -->
    <div class="row">
            <div class="col-12">
            	<div class="mr-auto col-4">
                <h1 class="title">${form.noticeTtl}</h1>
                    <div style="border:0;" class="form-control">작성일&nbsp;&nbsp;:&nbsp;&nbsp;<fmt:formatDate value="${form.noticeReg}" pattern="yyyy/MM/dd"/></div>
                </div>
            </div>
            <input type="hidden" name="noticeCd" value="${form.noticeCd}"/>
            <div class="col-12">
                <textarea class="col-10 ml-2 form-control" rows="20rem" readonly style="background-color:white;border:0;"> ${form.noticeCon}</textarea>
            </div>
           
           <div class="col-12">
            <c:if test="${form.atchFileId != -1}">
                    <label style="margin-bottom:0;margin-top:8px;">첨부파일&nbsp;&nbsp;:&nbsp;&nbsp;</label>
                    <c:forEach var="attach" items="${form.attachList}">
                        <!-- 파일 업로드 경로 문제 해결 안됐음************************************************************************************************************** -->
                        <a href="/resources/upload${attach.streFileNm}" download
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
    <button class="btn btn-outline-primary m-1" type="button"
            onclick="location.href='/notice/update/${form.noticeCd}'">수정
    </button>
    <button class="btn btn-outline-danger m-1" type="button"
            onclick="location.href='/notice/delete/${form.noticeCd}'">삭제
    </button>
    <button class="btn btn-primary m-1" type="button" onclick="location.href='/notice/list'">목록
    </button>
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
