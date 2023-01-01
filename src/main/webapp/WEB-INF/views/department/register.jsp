<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<div class="row">
	<div class="alert alert-light col" role="alert">
		<!-- 게시판 안내사항 -->
		<p>
			<strong> ※ 학과의 학과장 및 조교는 학과 등록 한 후에 수정페이지에서 설정할 수 있습니다. <br> ※ 학과장은 학과 소속 교수를 등록한 후 지정할 수 있습니다.
			</strong>
		</p>
	</div>
</div>
<form id="frm" action="/department/register" method="post" onsubmit="return onSubmit();">
	<div class="row">
		<div class="form-group col-3 pl-0">
			<label>단과대학:</label>
			<select id="college" name="colCd" class="select2bs4 select2-hidden-accessible" style="width: 100%;">
				<option value="">모든단과대학</option>
				<c:forEach var="college" items="${collegeList}">
					<option value="${college.colCd}">${college.colNm}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group col-3">
			<label>학과명:</label>
			<div class="input-group date" id="reservationdate" data-target-input="nearest">
				<input type="text" name="depNm" class="form-control rounded-0" value="" required />
			</div>
			<p id="validation"></p>
		</div>
		<div class="form-group col-3">
			<label>최대정원:</label>
			<div class="input-group date" id="reservationdatetime" data-target-input="nearest">
				<input type="number" name="depCap" class="form-control rounded-0" value="" required />
			</div>
		</div>
		<div class="form-group col-3">
			<label>연락처:</label>
			<div class="input-group date" id="reservationdatetime" data-target-input="nearest">
				<input type="text" name="depTel" class="form-control rounded-0" value="" required />
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-12 pl-0">
			<label>학과소개:</label>
			<div class="input-group date" id="reservationdatetime" data-target-input="nearest">
				<textarea name="depDes" rows="8" class="form-control rounded-0" required></textarea>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col text-right">
			<button type="submit" id="regist" class="btn btn-outline-primary">확인</button>
			<a href="/department/list" class="btn btn-outline-info">목록</a>
		</div>
	</div>
	<sec:csrfInput />
</form>
<script src="/resources/adminlte/plugins/select2/js/select2.full.min.js"></script>
<script src="/resources/adminlte/dist/js/demo.js"></script>
<script type="text/javascript">
	var flag = false;
	var valid_flag = false;
	$(function() {
		//Initialize Select2 Elements
		$('.select2').select2();

		//Initialize Select2 Elements
		$('.select2bs4').select2({
			theme : 'bootstrap4'
		});

		$("input[name='depNm']").on(
				"keyup",
				function() {

					data = {
						depNm : this.value
					}
					$.ajax({
						url : "/department/nameValidation",
						type : "get",
						data : data,
						success : function(result) {
							if (result > 0) {
								$("#validation").html("학과명이 존재합니다.").css(
										"color", "red");
								valid_flag = false;
							} else {
								$("#validation").html("일치하는 학과명이 없습니다.").css(
										"color", "blue");
								valid_flag = true;
							}
						}
					});
				});

	});

	function onSubmit() {
		let college = $("#college").val();

		if (!college) {
			alert("단과대학을 선택해주세요");
			return false;
		}
		if (!valid_flag) {
			alert("학과명이 중복됩니다.");
			return false;
		}
		if (!flag) {
			Swal.fire('등록완료!', '학과가 등록되었습니다.', 'success').then(function() {
				flag = true;
				$("#frm").submit();
			});
		}
		return flag;
	}
</script>