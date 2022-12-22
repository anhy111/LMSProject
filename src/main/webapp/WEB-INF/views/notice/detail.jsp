<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                    <div class="row">
                        <table class="table table-bordered">
                            <caption>New York City Marathon Results 2013</caption>
                            <tbody>
                            <tr>
                                <input type="hidden" name="noticeCd" value="${form.noticeCd}" />
                                <th style="width:10%">제목</th>
                                <td colspan="5" class="table-title">${form.noticeTtl}</td>
                            </tr>
                            <tr>
                                <th style="width:10%">공지기간</th>
                                <td style="width:20%" class="table-title">공지기간 넣기</td>
                                <th style="width:10%">작성일</th>
                                <td style="width:20%" class="table-title">${form.noticeReg}</td>
                                <th style="width:10%">조회수</th>
                                <td style="width:20%" class="table-title">조회수 넣기</td>
                            </tr>
                            <tr>
                                <th style="width:10%">첨부파일</th>
                                <td colspan="5" class="table-title">
                                    업로드된 파일넣기 .xlsx</br>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" class="table-title">
                                    <p class="m-3">
                                        ${form.noticeCon}
                                    </p>
                                </td>
                            </tr>

                            </tbody>
                        </table>
                    </div>

                    <!-- ================================================= -->
                    <!-- 버튼 시작 -->
                    <!-- ================================================= -->
                    <div class="row justify-content-end mt-3">
                        <button class="btn btn-outline-primary m-1" type="button"
                                onclick="location.href='/notice/update/${form.noticeCd}'">수정
                        </button>
                        <button class="btn btn-outline-danger m-1" type="button"
                                onclick="location.href='/notice/delete/${form.noticeCd}'">삭제
                        </button>
                        <button class="btn btn-primary m-1" type="button" onclick="location.href='/notice/list'">목록
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

</script>
