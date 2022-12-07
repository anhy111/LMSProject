<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>


<div class="col-md-6">
	<form name="frm" id="frm" method="post">
		<div class="card card-primary">
			<div class="card-body">

				<input type="hidden" name="colCd" value="${collgeDetail.colCd }" />
				<div class="form-group">
					<label>단과대학명:</label>
					<div class="input-group date" id="reservationdate"
						data-target-input="nearest">
						<input type="text" name="colNm" readonly
							class="form-control rounded-0" value="${collgeDetail.colNm }" />
					</div>
				</div>

				<div class="form-group">
					<label cursorshover="true">단과대설명:</label>
					<div class="input-group date" id="reservationdatetime"
						data-target-input="nearest">
						<textarea name="colDes" readonly class="form-control rounded-0">${collgeDetail.colDes }</textarea>
					</div>
				</div>


				<div class="form-group">
					<label cursorshover="true">단과대연락처:</label>
					<div class="input-group date" id="reservationdatetime"
						data-target-input="nearest">
						<input type="text" name="colTel" readonly
							class="form-control rounded-0" value="${collgeDetail.colTel }" />
					</div>
				</div>

				<div class="form-group">
					<label cursorshover="true">단과대위치:</label>
					<div class="input-group date" id="reservationdatetime"
						data-target-input="nearest">
						<input type="text" name="colAddr" readonly
							class="form-control rounded-0" value="${collgeDetail.colAddr }" />
					</div>
				</div>


				<div class="form-group">
					<label cursorshover="true">단과대이미지:</label>
					<div class="input-group">
						<input type="file" readOnly class="form-control rounded-1"
							name="colImgUrl" />
					</div>
				</div>


				<!-- 일반모드 시작 -->
				<div id="spn1" class="card-footer">
					<div style="text-align: right">
						<button type="button" id="edit"
							class="btn bg-gradient-success btn-sm">수정</button>
						<a href="/college/main" class="btn bg-gradient-warning btn-sm">목록</a>
					</div>
				</div>
				<!-- 일반모드 끝 -->
				<!-- 수정모드 시작 -->
				<div id="spn2" class="card-footer" style="display: none;">
					<div style="text-align: right">
						<button type="submit" class="btn bg-gradient-primary btn-sm">확인</button>
						<a href="/college/detail?colCd=${collgeDetail.colCd}"
							class="btn bg-gradient-danger btn-sm">취소</a>
					</div>
				</div>

			</div>
		</div>
		<sec:csrfInput />
	</form>
</div>

<div class="row">
	<c:forEach var="departments" items="${departments}">
	<div class="col-lg-3 col-6">
	
		<div class="small-box bg-success">
			<div class="inner">
				<input type="hidden" value="${departments.depCd }">
				<h3>${departments.depNm }</h3>
				<p>${departments.depDes }</p>
			</div>
			<div class="icon">
				<i class="ion ion-bag"></i>
			</div>
			<a href="#" class="small-box-footer">홈페이지이동 <i
				class="fas fa-arrow-circle-right"></i></a>
		</div>
	</div>

</c:forEach>	
</div>


<script type="text/javascript">
	$(function() {
		//수정버튼 클릭-> 수정모드로 전환
		$("#edit").on("click", function() {
			//일반모드
			$("#spn1").css("display", "none");
			//수정모드
			$("#spn2").css("display", "block");
			//readOnly 삭제
			$(".rounded-0").removeAttr("readonly");
			$(".rounded-1").removeAttr("readonly");
			//제목, 카테고리, 가격에 required 속성 추가
			$(".rounded-0").attr("required", true);
			//form action 추가
			$("#frm").attr("action", "/college/updatePost");
		});

		//숫자 입력 validate
		// 	$("#txtPrice").on("keyup", function(){
		// 		$(this).val($(this).val().replace(/[^0-9]/g,""));
		// 	});
	});
</script>






