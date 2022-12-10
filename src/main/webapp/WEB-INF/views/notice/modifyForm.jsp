<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>


<!-- 게시판상세 -->
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class=container-fluid style="padding-left: 0px;">
	<div class="main-content-jsp">

		<!-- 111111 -->
		<div class="row">

			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="card" style="padding-bottom: 0px;">
					<h2 class="card-header">공지사항 수정</h2>

					<div class="card-body">
						<div class="row">
							<div class="col-xl-8">
								<form role="form" method="post" name="form">
									<sec:csrfInput/>
									<div class="form-group">
										<input type="text" name="noticeCd" value="${form.noticeCd}" readonly="readonly"/>
										<label for="inputText3" class="col-form-label">제목</label> <input
											id="inputText3" type="text" name="noticeTtl" class="form-control" value="${form.noticeTtl}">
									</div>
									<div class="form-group" style="hegiht: 800px;">
											<label for="content"></label>

											<textarea class="textarea" name="noticeCon" id="content"
												rows="20" placeholder="1000자 내외로 작성하세요."
												style="display: block;"><c:out value="${form.noticeCon}"/></textarea>
									</div>
									<button type="submit">수정하기 완료</button>
								</form>
							</div>



							<div class="col-xl-4">


								<div class="form-group" style="padding-top:37px;">
									<div class="card card-outline card-success">
										<div class="card-header">
											<h5 style="display: inline; line-height: 40px;">첨부파일 :</h5>
											&nbsp;&nbsp;
											<button class="btn btn-xs btn-primary"
												onclick="addFile_go();" type="button" id="addFileBtn">Add
												File</button>
										</div>
										<div class="card-footer fileInput"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- ================================================= -->
						<!-- 버튼 시작 -->
						<!-- ================================================= -->
						<div class="row justify-content-end mt-3"
							style="padding-right: 30px; padding-bottom: 50px;">

							<!--                <button class="btn btn-info" type="button" onclick="">수정</button>&nbsp; -->
							<!--                <button class="btn btn-secondary" type="button" onclick="">삭제</button>&nbsp; -->
							<!--                <button class="btn btn-primary" type="button" onclick="">목록</button>&nbsp; -->
							<!--                <br> -->
							<button class="btn btn-outline-primary" type="button" onclick="modify_go();">수정하기</button>
							&nbsp;&nbsp;
							<button class="btn btn-outline-danger" type="button"
								onclick="history.back()">취소</button>
							&nbsp;&nbsp;
						</div>
					</div>
					<!-- ================================================= -->
					<!-- 버튼 끝 -->
					<!-- ================================================= -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal End -->


<script>
window.onload=function(){
	summernote_go($('#content'),'<%=request.getContextPath()%>');
}
</script>

<script>
function f_alert(){
   Swal.fire({
        title: '취소하시겠습니까?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#5969FF',
        cancelButtonColor: '#EF172C',
        confirmButtonText: '네',
        cancelButtonText: '아니오',
      }).then((result) => {
        if (result.isConfirmed) {
        	var modifyForm = $('#modifyForm');


          	Swal.fire(
            '취소되었습니다.'

          ),
          CloseWindow();
        }
   });

}

</script>


<script>
function regist_go(){

	var files = $('input[name="uploadFile"]');
	for(var file of files){
		console.log(file.name+" : "+file.value);
		if(file.value==""){
			alert("파일을 선택하세요.");
			file.focus();
			file.click();
			return;
		}
	}

	if($("input[name='title']").val()==""){ //form.title.value
		alert("제목은 필수입니다.");
		$("input[name='title']").focus();
		return;
	}


	$("form[role='form']").submit()
}


var dataNum=0;

function addFile_go(){
	//alert("click add btn");


	if($('input[name="uploadFile"]').length >=5){
		alert("파일추가는 5개까지만 가능합니다.");
		return;
	}

	var div=$('<div>').addClass("inputRow").attr("data-no",dataNum).css("padding-top","20px");
	var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");

	var button="<button onclick='remove_go("+dataNum+");' style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>";

	div.append(input).append(button);
	$('.fileInput').append(div);


	dataNum++;
}

function remove_go(dataNum){
	$('div[data-no="'+dataNum+'"]').remove();
}

function modify_go(){
	var form=$('form[role="form"]');
	form.submit();

}
</script>
