<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<%
    String strReferer = request.getHeader("referer");

    if (strReferer == null) {
%>
<script language="JavaScript">
    alert("정상적인 경로로 들어와주세요");
    document.location.href="/";
</script>
<%
        return;
    }
%>

<!-- 게시판상세 -->
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">

    <!-- 111111 -->
    <div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="card">
                <h2 class="card-header">상세보기</h2>

                <div class="card-body m-3">
                    <form role="form" method="post" name="form">
                        <sec:csrfInput/>
                    <div class="row">
                        <table class="table table-bordered">

                            <tbody>
                            <tr>
                                <th style="width:10%">글 번호[ ${form.qnaCd} ]</th>
                                <input type="text" name="qnaCd" value="${form.qnaCd}" readonly="readonly"/>
                                <td colspan="5" class="table-title">글 제목<input type="text" name="qnaTtl" value="${form.qnaTtl}"></td>

                            </tr>

                            <tr>
                                <th style="width:10%">작성자</th>
                                <td style="width:20%" class="table-title">작성자 넣기</td>
                                <th style="width:10%">작성날짜</th>
                                <td style="width:20%" class="table-title">${form.qnaDt}</td>
                                <th style="width:10%">수정날짜</th>
                                <td style="width:20%" class="table-title">${form.qnaDt}</td>
                                <th style="width:10%">조회수</th>
                                <td style="width:10%" class="table-title">조회수 넣기</td>
                            </tr>
                            <tr>
                                <th style="width:10%">첨부파일</th>
                                <td colspan="5" class="table-title">
                                    업로드된 파일넣기 .xlsx</br>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" class="table-title">
                                    <label for="content"></label>

                                    <textarea class="textarea" name="qnaCon" id="content"
                                              rows="20" placeholder="1000자 내외로 작성하세요."
                                              style="display: block;"><c:out value="${form.qnaCon}"/></textarea>
                                </td>
                            </tr>

                            </tbody>
                        </table>
                    </form>
                    </div>

                    <!-- ================================================= -->
                    <!-- 버튼 시작 -->
                    <!-- ================================================= -->
                    <div class="row justify-content-end mt-3">
                        <button class="btn btn-outline-primary" type="button" onclick="modify_go();">수정하기</button>
                        <button class="btn btn-outline-danger m-1" type="button"
                                onclick="location.href='/qna/delete/${form.qnaCd}'">삭제
                        </button>
                        <button class="btn btn-primary m-1" type="button" onclick="location.href='/qna/main'">목록
                        </button>
                    </div>
                    <!-- ================================================= -->
                    <!-- 버튼 끝 -->
                    <!-- ================================================= -->
                </div>
            </div>
        </div>
    </div>
</div>

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

    function modify_go(){
        var form=$('form[role="form"]');
        form.submit();
    }
</script>
