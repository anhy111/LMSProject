<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%--라이브러리 sec--%>
<head>
    <style>
        .drop-zone {
            width: 500px;
            height: 250px;
            background-color: #ffffff;
            margin-top: 20px;
            position: relative;
            padding: 50px;
            border-radius: 15px;
            border: 3px dashed #71748d;
            font-size: 15px;
        }

        .drop-zone-dragenter, .drop-zone-dragover {
            background-color: #dbdbe7;
            /*     border: 3px solid pink; */
        }
    </style>
</head>

<!-- 게시판상세 -->
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">

    <!-- 111111 -->
    <div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="card">
                <h2 class="card-header">공지사항 등록하기</h2>


                <div class="card-body">
                    <form role="form" action="/notice/noticeForm" method="post" id="form" name="form">
                        <sec:csrfInput/>
                        <div class="row">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <th>제목</th>
                                    <td class="table-title"><input class="form-control"
                                                                   id="title" name="title" type="text"
                                                                   style="width:100%"/>
                                    </td>
                                    <th>중요공지여부</th>
                                    <td class="table-title">
                                        <div style="width:10%">
                                            <input type="checkbox" id="input_check" value='imp'
                                                   style=position:relative;left:50px;>
                                        </div>
                                        <div id="wrapper" style="margin-top: -1px;"></div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="form-group">
                                    <label for="content"></label>
                                    <textarea class="textarea" name="content" id="content"
                                              rows="20" placeholder="1000자 내외로 작성하세요."
                                              style="display: none;"></textarea>
                                </div>
                            </div>
                            <div class="col-xl-4">
                                <div class="drop-zone ">
                                    <br/>
                                    <%--                                    <div style="text-align: center; font-size: 50px;">--%>
                                    <%--                                        <i class="fas fa-upload"></i>--%>
                                    <%--                                    </div>--%>
                                    <%--                                    <div--%>
                                    <%--                                        style="text-align: center; font-size: 20px; font-weight: bold;">--%>
                                    <%--                                        파일 선택 클릭<br />또는 파일을 여기로 드래그하세요.--%>
                                    <%--                                    </div>--%>

                                </div>
                                <input style="padding-left:210px;" type="file" id="fileUpload" multiple> <br> <br>
                            </div>
                        </div>
                        <button type="submit">등록</button>
                    </form>

                    <div class="row justify-content-end mt-3"
                         style="padding-right: 30px; padding-bottom: 50px;">
                        <button class="btn btn-outline-primary" type="button"
                                onclick="autoFill();">자동완성
                        </button>&nbsp;&nbsp;
                        <button class="btn btn-outline-primary" form="form" type="submit" id="registBtn">등록
                        </button>
                        &nbsp;&nbsp;
                        <button class="btn btn-outline-danger" type="button"
                                onclick="f_alert();">취소
                        </button>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script>
    window.onload = function () {
        summernote_go($('#content'), '<%=request.getContextPath()%>');
    }
</script>

<script>
    function f_alert() {
        if (!confirm("작성중인 글이 있습니다. 이전화면으로 돌아가겠습니까?")) {
            alert("취소되었습니다.");
        } else {
            alert("이전화면으로 돌아갑니다.")
            history.back();
        }
    }
</script>

<script>
    function regist_go() {
        Swal.fire({
            title: '등록하시겠습니까?',
            showDenyButton: true,
            confirmButtonText: '네',
            denyButtonText: '아니오',
        }).then((result) => {
            if (result.isConfirmed) {
                if ($("input[name='title']").val() == "") {
                    Swal.fire('제목은 필수입니다.', '등록에 실패하였습니다.');
                    $("input[name='title']").focus();
                    return;
                }
                var form = $("form[role='form']");
                var markChk = document.getElementById('input_check').checked;
                var markCd = $('<input type="hidden" name="markCd">');
                if (markChk) {
                    markCd.val("mark")
                } else {
                    markCd.val("umark")
                }
                form.append(markCd);
                form.submit();
            }
        })
    }

    function autoFill() {
        $('#title').val("중요공지사항입니다!!!");
        $('#content').summernote('pasteHTML', '중요 공지 내용 입니다.');
    }

</script>


