<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<div class="content">
	<div class="container-fluid">
		<div class="row pl-3">
			<div class="card col-6">
				<div class="container-fluid">
					<br>
					<h5>학과관리</h5>
					<br>
					<div class="row">
						<div class="form-group col-2">
							<label>단과대학</label> <select id="college"
								class="select2bs4 select2-hidden-accessible"
								style="width: 100%;">
								<option value="">모든단과대학</option>
								<c:forEach var="college" items="${collegeList}">
									<option value="${college.colNm}">${college.colNm}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group col-2 offset-8">
							<a class="btn btn-primary btn-flat" href="/department/register">학과등록</a>
						</div>
					</div>
					<div class="row card-body" id="list"></div>
				</div>
			</div>
			<div class="col-6">
				<div class="card col-10 offset-1">
					<div class="container-fluid">
						<br>
						<h5>학과상세정보</h5>
						<div class="card-body">
							<div class="row">
								<div class="form-group col-4">
									<label>단과대학:</label> <select id="detailCollege" name="colCd"
										class="select2bs4 select2-hidden-accessible"
										style="width: 100%;">
										<option value="">모든단과대학</option>
										<c:forEach var="college" items="${collegeList}">
											<option value="${college.colCd}">${college.colNm}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="form-group col">
									<label>학과명:</label>
									<input type="hidden" name="depCd">	<!-- 학과코드 -->
									<input type="hidden" name="proCd">	<!-- 학과장 -->
									<input type="hidden" name="empCd">	<!-- 조교 -->
									<div class="input-group date" id="reservationdate"
										data-target-input="nearest">
										<input type="text" name="depNm" class="form-control rounded-0"
											value="" readonly />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col">
									<label>학과소개:</label>
									<div class="input-group date" id="reservationdatetime"
										data-target-input="nearest">
										<textarea name="depDes" class="form-control rounded-0" rows="8"
											readonly></textarea>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col">
									<label>학과장:</label>
									<div class="input-group date" id="reservationdatetime">
										<input type="text" name="proNm"
											class="form-control rounded-0" value="" readonly />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col">
									<label>최대정원:</label>
									<div class="input-group date" id="reservationdatetime">
										<input type="number" name="depCap"
											class="form-control rounded-0" value="" readonly />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col">
									<label>연락처:</label>
									<div class="input-group date" id="reservationdatetime"
										data-target-input="nearest">
										<input type="text" name="depTel"
											class="form-control rounded-0" value="" readonly />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col">
									<label>조교:</label>
									<div class="input-group date" id="reservationdatetime"
										data-target-input="nearest">
										<input type="text" name="empNm"
											class="form-control rounded-0" value="" readonly />
									</div>
								</div>
							</div>
							<div class="row text-right" id="spn1">
								<button type=button id="edit"
									class="btn btn-primary col-2 offset-8">수정</button>
								<button type="button" id="delete"
									class="btn btn-danger col-2">삭제</button>
							</div>
							<div class="row text-right" id="spn2">
								<button type="button" id="update"
									class="btn btn-primary col-2 offset-8">확인</button>
								<button type="button" id="cancel"
									class="btn btn-warning col-2">취소</button>
							</div>
							<sec:csrfInput />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script
	src="/resources/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/adminlte/plugins/select2/js/select2.full.min.js"></script>
<script src="/resources/adminlte/dist/js/adminlte.min.js"></script>
<script src="/resources/adminlte/dist/js/demo.js"></script>
<script type="text/javascript">

	var header = "${_csrf.headerName}";
	var token = "${_csrf.token}";

	$(function() {
		
		$('.select2').select2();
		//Initialize Select2 Elements
		$('.select2bs4').select2({
			theme : 'bootstrap4'
		});
		
		$("#spn2").css("display","none");
		
		// 수정모드
		$("#edit").on("click",function(){
			editMode();
		});
		
		// 상세모드
		$("#cancel").on("click",function(){
			detailMode();
		});
		
		// 수정 확인버튼
		$("#update").on("click",updateDepartment);
		
		$("#college").on("change",loadDepartMentListByCollege);
		
		detailMode();
		loadDepartMentListByCollege();
	});
	
	
	function detailMode(){
		$("#spn1").css("display","flex");
		$("#spn2").css("display","none");
		$("#detailCollege").prop("disabled",true);
		$("input[name='depNm']").prop("readonly",true);
		$("input[name='proNm']").prop("readonly",true);
		$("textarea[name='depDes']").prop("readonly",true);
		$("input[name='empNm']").prop("readonly",true);
		$("input[name='depCap']").prop("readonly",true);
		$("input[name='depTel']").prop("readonly",true);
	}
	
	function editMode(){
		$("#spn1").css("display","none");
		$("#spn2").css("display","flex");
		$("#detailCollege").prop("disabled",false);
		$("input[name='depNm']").prop("readonly",false);
		$("input[name='proNm']").prop("readonly",false);
		$("textarea[name='depDes']").prop("readonly",false);
		$("input[name='empNm']").prop("readonly",false);
		$("input[name='depCap']").prop("readonly",false);
		$("input[name='depTel']").prop("readonly",false);
	}
	
	function updateDepartment(){
		let data = {
			colCd : $("#detailCollege").val(),
			depCd : $("input[name='depCd']").val(),
			depNm : $("input[name='depNm']").val(),
			depNm : $("input[name='proNm']").val(),
			depDes : $("textarea[name='depDes']").val(),
			depNm : $("input[name='empNm']").val(),
			depCap : $("input[name='depCap']").val(),
			depTel : $("input[name='depTel']").val()
		}
		
		console.log("data : ", data);
	}
	
	function loadDetail(p_depCd){
		detailMode();
		
		data = {
			depCd : p_depCd
		};
		
		$.ajax({
			url:"/department/departmentDetail",
			type:"get",
			data:data,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success:function(department){
				console.log(department.proNm);
				$("#detailCollege").val(department.colCd).prop("selected",true);
				$("#detailCollege").select2({ theme : 'bootstrap4' });
				$("input[name='depCd']").val(department.depCd);
				$("input[name='depNm']").val(department.depNm);
				$("input[name='proNm']").val(department.proNm == null ? "공석" : department.proNm);
				$("textarea[name='depDes']").val(department.depDes);
				$("input[name='empNm']").val(department.empNm == null ? "공석" : department.empNm);
				$("input[name='depCap']").val(department.depCap);
				$("input[name='depTel']").val(department.depTel);
				
			}
		});
	}
	
	function loadDepartMentListByCollege(){
		let college = $("#college").val();
		
		let data = {
				colNm : college
		};
		
		$.ajax({
			url:"/department/departmentListbyCollege",
			type:"get",
			data:data,
			contentType : "application/json;utf-8",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success:function(result){
				$("#list").html("");
				let str = "";
				console.log(result);
				
				$.each(result,function(p_inx, department){
					str += `<div class="col-lg-3 col-6">
								<div class="small-box bg-success">
									<div class="inner">
										<input type="hidden" value="1">
										<h4>\${department.depNm}</h4>
									</div>
									<div class="icon">
										<i class="ion ion-bag"></i>
									</div>
									<a href="javascript:loadDetail(\${department.depCd})" class="small-box-footer">홈페이지이동 <i
										class="fas fa-arrow-circle-right"></i></a>
								</div>
							</div>`;
				});
				if(!result.length){
					str = "학과가 없습니다";
				}
				$("#list").html(str);
			}
		});
	}
</script>