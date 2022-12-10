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

                            <tbody>
                            <tr>
                                <th style="width:10%">[${form.noticeCd}]제목</th>
                                <td colspan="5" class="table-title">${form.noticeTtl}</td>

                            </tr>

                            <tr>
                                <th style="width:10%">작성자</th>
                                <td style="width:20%" class="table-title">***</td>
                                <th style="width:10%">날짜</th>
                                <td style="width:20%" class="table-title">${form.noticeReg}</td>
                                <th style="width:10%">날짜</th>
                                <td style="width:20%" class="table-title">${form.noticeUpd}</td>
                                <th style="width:10%">조회수</th>
                                <td style="width:10%" class="table-title">10</td>
                            </tr>
                            <tr>
                                <th style="width:10%">첨부파일</th>
                                <td colspan="5" class="table-title">
                                    학생선택에 따른 SU평가제도 안내문2022-2 학생선택에 따른 SU평가제도 안내문.xlsx</br>

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
                        <!-- 					<button class="btn btn-info" type="button" onclick="">수정</button>&nbsp; -->
                        <!-- 					<button class="btn btn-secondary" type="button" onclick="">삭제</button>&nbsp; -->
                        <!-- 					<button class="btn btn-primary" type="button" onclick="">목록</button>&nbsp; -->
                        <!-- 					<br> -->
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

    <!-- 11111끝 -->


    <!-- 222222 -->

    <div class="main-content-jsp">
        <div class="row">

            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="card">
                    <h3 class="card-header">
                        댓글
                        <c:if test="${qna.replycnt ne 0 }">
				<span class="nav-item">
					&nbsp;&nbsp;<span class="badge badge-info">2</span>
				</span>

                        </c:if>
                    </h3>
                    <!-- 버튼 -->
                    <div class="card-body">
                        <!-- <label for="qnaans">답변</label> -->
                        <div class="timeline">
                            <!-- 여기 댓글목록이 handlebars로 들어옴 -->
                            <div class="card replyDIV">
						<span class="card-header d-flex justify-content-between align-items-center">
							<span><strong>이혜림</strong>&nbsp;&nbsp;2022/10/06</span>
							<span>
							<a href="#" class="btn btn-rounded btn-outline-primary btn-sm"
                               data-toggle="modal" data-target="#modifyModal">수정</a>&nbsp;
							<a href="#" class="btn btn-rounded btn-outline-danger btn-sm"
                               onclick="f_alert();">삭제</a>
							</span>

						</span>
                                <span class="card-body">
						댓글내용 입력하세요.
						</span>
                            </div>

                            <!-- 여기 댓글목록이 handlebars로 들어옴 -->
                        </div>

                        <div class='text-center'>
                            <ul id="pagination" class="pagination justify-content-center m-0">

                            </ul>
                        </div>

                    </div>

                    <div class="card-footer">
                        <div class="col-xl-12">
                            <div class="d-flex justify-content-between align-items-center">
					<span>
					<h3 style="display:inline;">댓글 작성</h3>
					</span>
                                <span>
					<button type="button" class="btn btn-primary" id="replyAddBtn"
                            onclick="replyRegist_go();">등록</button>
					</span>
                            </div>
                        </div>
                        <div class="col-xl-12 mt-1">
                            <textarea class="form-control" type="text" placeholder="REPLY TEXT"
                                      id="newReplyText"></textarea>
                        </div>
                    </div>


                </div>
            </div>

        </div>
    </div>
    <!-- 22222끝 -->


    <!-- Modal -->
    <div id="modifyModal" class="modal modal-default fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">댓글 수정</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body" data-rno>
                    <p><input type="text" id="replytext" class="form-control"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="replyModBtn" onclick="replyModify_go();">Modify
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div><!-- Modal End -->


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
