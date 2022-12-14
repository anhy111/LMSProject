<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<h1>상담신청페이지..?</h1>
<div class="row">
	<form action="/counsel/studentside/applyInsert" method="post">
		<div class="col-sm-6">
			<label>상담카테고리선택</label>
			<div class="form-group clearfix">
				<div class="icheck-primary d-inline">
					<!---------------- 한개 이상은 체크 되어있어야 하므로 기본 체크 활성화 -------------->
					<input type="radio" id="radioPrimary1" name="cnslCate"
						checked="checked"> <label for="radioPrimary1"
						cursorshover="true">시험 </label>
				</div>
				<div class="icheck-primary d-inline">
					<input type="radio" id="radioPrimary2" name="cnslCate"> <label
						for="radioPrimary2" cursorshover="true">과제 </label>
				</div>
				<div class="icheck-primary d-inline">
					<input type="radio" id="radioPrimary3" name="cnslCate"
						cursorshover="true"> <label for="radioPrimary3">출결
					</label>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<label>담당 교수 선택</label>
			<select name="empNm">
			<c:forEach var="professorList"  items="${professorList }">
				<option value="${professorList.empNm }">${professorList.empNm }</option>
			</c:forEach>
			</select>
		</div>
		<!----------------------------- 카테고리 --------------------------->
		<!----------------------------- 글제목 --------------------------->
		<div class="col-sm-6">
			<label>글제목</label> <input type="text" name="cnslTtl" />
		</div>
		<!----------------------------- 글제목 --------------------------->
		<!----------------------------- 글내용 --------------------------->
		<div class="col-12">
			<label>글내용</label>
			<textarea name="cnslCont" rows="10" cols="100"></textarea>
		</div>
		<!----------------------------- 글내용 --------------------------->
		<button type="submit" class="btn btn-sm btn-primary">등록</button>
		<a href="#" class="btn btn-sm btn-danger">목록으로</a>
		<sec:csrfInput />
	</form>
</div>
<script type="text/javascript">
	let checkedCategory = "";
	$(function() {
		if (document.getElementsByName("checkboxSuccess1")[i].checked == true) {
			alert(document.getElementsByName("checkboxSuccess1")[i].value);
		}
		if (document.getElementsByName("checkboxSuccess2")[i].checked == true) {
			alert(document.getElementsByName("checkboxSuccess2")[i].value);
		}
		if (document.getElementsByName("checkboxSuccess3")[i].checked == true) {
			alert(document.getElementsByName("checkboxSuccess3")[i].value);
		}
	})
</script>
