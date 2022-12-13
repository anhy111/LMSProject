<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<link rel="stylesheet" href="/resources/css/qnaBoard.css"/>

<!DOCTYPE html>

<style>
    #btnRound {
        float: right;
        margin-top: 20px;
        margin-right: 70px;
    }

    .btn-primary {
        background-color: #2a5388;
        border: #2a5388;
        box-shadow: #2a5388;
    }

    .btn-primary:hover {
        background-color: #4671af;
        border: #4671af;
        box-shadow: #4671af;
    }

    #qnaMark {
        width: 30px;
        margin-left: 10px;
        margin-bottom: 10px;
    }
</style>
<script type="text/javascript" defer="defer">
    $(function () {

        $("#insertBtn").on('click', function () {

            if ($("#access").is(":checked") == true) {
                console.log('비공개');
                isShow = 0;
            }

            if ($("#access").is(":checked") == false) {
                console.log('공개');
                isShow = 1;
            }

            if ($("#title").val().trim() == '') {
                alert("제목을 입력하세요");
                $('#title').focus();
                return;
            }
            if ($("#content").val().trim() == '') {
                alert("내용이 입력되지 않았습니다.");
                $('#qnaContent').focus();
                return;
            }

            title = $("#title").val();
            content = $("#content").val();

            $.ajax({
                url: "/qna/qnaWriteAction",
                dataType: "json",
                data: {
                    title: title,
                    content: content,
                    isShow: isShow
                },
                type: "post",
                success: function (res) {
                    if (res == 1) {
                        alert("등록되었습니다.");
                        location.replace("/qna/main");
                    } else {
                        alert("등록에 실패하였습니다.");
                        location.reload();
                    }
                }

            })

        })

        $("#cancelBtn").on('click', function () {
            location.href = "/qna/main";
        })
    })
</script>

<div class="card">
    <div class="card-body">
        <div class="allRound">
            <h3>문의게시판</h3>
            <div class="pageInfo">
                <p>
                    학교 관련 궁금한 사항에 대해 질문을 남길 수 있는 페이지입니다.
                    <br>
                    등록된 질문에 대해서는 차례대로 답변을 남겨드립니다.
                    <br>
                    작성자의 정보는 관리자만 볼 수 있으며, 글은 비공개 처리여부를 선택할 수 있습니다.
                </p>
            </div>

            <form method="POST" name="form" id="questionForm">
                <sec:csrfInput/>
                <div class="titleRound">
                    <label>제목</label>
                    <input type="text" class="inputText" name="title" id="title"/>
                </div>
                <div class="textArea"><textarea name="content" id="content"></textarea></div>
                <div id="showRound"><label>비공개 여부</label><input type="checkbox" name="accessNumber" id="accessNumber"/></div>
                <div id="btnRound">
                    <input type="submit" id="insertBtn" class="btn btn-primary" value="등록">
                    <input type="button" id="cancelBtn" class="btn btn-primary" value="취소">
                </div>
            </form>

        </div>
    </div>
</div>

