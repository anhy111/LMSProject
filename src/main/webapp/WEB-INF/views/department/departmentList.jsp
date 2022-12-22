<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
							<label>단과대학</label> <select id="college" class="select2bs4 select2-hidden-accessible" style="width: 100%;">
								<option value="0">모든단과대학</option>
								<c:forEach var="college" items="${collegeList}">
									<option value="${college.colCd}">${college.colNm}</option>
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
									<label>단과대학:</label> <select id="detailCollege" name="colCd" class="select2bs4 select2-hidden-accessible" style="width: 100%;">
										<option value="0">모든단과대학</option>
										<c:forEach var="college" items="${collegeList}">
											<option value="${college.colCd}">${college.colNm}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="form-group col">
									<label>학과명:</label> <input type="hidden" name="depCd">
									<!-- 학과코드 -->
									<input type="hidden" id="proNo" name="proNo">
									<!-- 학과장 -->
									<input type="hidden" id="empNo" name="empNo">
									<!-- 조교 -->
									<div class="input-group date" id="reservationdate" data-target-input="nearest">
										<input type="text" name="depNm" class="form-control rounded-0" value="" readonly />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col">
									<label>학과소개:</label>
									<div class="input-group date" id="reservationdatetime" data-target-input="nearest">
										<textarea name="depDes" class="form-control rounded-0" rows="8" readonly></textarea>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col container-fluid p-0">
									<label class="p-1">학과장:</label>
									<div class="input-group col-6">
										<input type="text" class="form-control" id="proNm" name="proNm" readonly />
										<div class="input-group-append">
											<button type="button" class="btn btn-default" id="btnPro">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col">
									<label>최대정원:</label>
									<div class="input-group date" id="reservationdatetime">
										<input type="number" name="depCap" class="form-control rounded-0" value="" readonly />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col">
									<label>연락처:</label>
									<div class="input-group date" id="reservationdatetime" data-target-input="nearest">
										<input type="text" name="depTel" class="form-control rounded-0" value="" readonly />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col container-fluid p-0">
									<label class="p-1">조교:</label>
									<div class="input-group col-6">
										<input type="text" class="form-control" id="empNm" name="empNm" readonly />
										<div class="input-group-append">
											<button type="button" class="btn btn-default" id="btnEmp">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="row text-right container-fluid p-0" id="spn1">
								<div class="col text-right">
									<button type=button id="edit" class="btn btn-primary">수정</button>
									<button type="button" id="delete" class="btn btn-danger">삭제</button>
								</div>
							</div>
							<div class="row text-right container-fluid p-0" id="spn2">
								<div class="col text-left">
									<button id="autoFill" class="btn btn-secondary">자동채우기</button>
								</div>
								<div class="col text-right">
									<button type="button" id="update" class="btn btn-primary">확인</button>
									<button type="button" id="cancel" class="btn btn-warning">취소</button>
								</div>
							</div>
							<sec:csrfInput />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="/resources/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
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
		
		// 삭제 버튼
		$("#delete").on("click",function(){
			
			Swal.fire({
				  title: '학과를 삭제하시겠습니까?',
				  text: "학과를 삭제하면 복구할 수 없습니다.",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '삭제',
				  cancelButtonText: '취소'
				}).then((result) => {
				  if (result.isConfirmed) {
					let data = { depCd : $("input[name='depCd']").val() };
						
					$.ajax({
						url : "/department/delete",
						type : "get",
						data:data,
						beforeSend : function(xhr) {
							xhr.setRequestHeader(header, token);
						},
						success:function(department){
							Swal.fire(
								      '삭제완료!',
								      '학과가 삭제되었습니다.',
								      'success'
							).then(function(){
								location.reload();
							})
						}
					})
				  }
				});
			
			
		});
		
		// 학과장 검색
		$("#btnPro").on("click",function(){
			let depCd = $("input[name='depCd']").val();
			
			var win = window.open("/department/professorList?depCd="+depCd, "학과장검색", "width=700,height=700");
		});
		// 조교 검색
		$("#btnEmp").on("click",function(){
			var win = window.open("/department/employeeList", "조교검색", "width=700,height=700");
		});
		
		$("#college").on("change",loadDepartMentListByCollege);
		
		$("#autoFill").on("click",function(){
			$("#detailCollege").val("1").prop("selected",true);
			$("#detailCollege").select2({ theme : 'bootstrap4' });
			$("input[name='depNm']").val("경제학과3");
			$("input[name='proNo']").val("1");
			$("input[name='empNo']").val("7");
			$("input[name='proNm']").val("교수최승훈");
			$("textarea[name='depDes']").val("경제학과입니다");
			$("input[name='empNm']").val("문상훈");
			$("input[name='depCap']").val("200");
			$("input[name='depTel']").val("042-555-8888");
		});
		
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
		$("#btnPro").prop("disabled",true);
		$("#btnEmp").prop("disabled",true);
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
		$("#btnPro").prop("disabled",false);
		$("#btnEmp").prop("disabled",false);
	}
	
	function updateDepartment(){
		let data = {
			depCd : $("input[name='depCd']").val(),
			colCd : $("#detailCollege").val(),
			proNo : $("input[name='proNo']").val(),
			depNm : $("input[name='depNm']").val(),
			depDes : $("textarea[name='depDes']").val(),
			depCap : $("input[name='depCap']").val(),
			depTel : $("input[name='depTel']").val(),
			empNo : $("input[name='empNo']").val()
		};
		console.log("data : " + data);
		
		$.ajax({
			url:"/department/update",
			type:"post",
			contentType:"application/json; charset=utf-8",
			data:JSON.stringify(data),
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success:function(result){
				if(result){
					Swal.fire(
						      '수정완료!',
						      '학과가 수정되었습니다.',
						      'success'
					).then(function(){
						location.reload();
					})
				}
			}
		});
		
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
				colCd : college
		};
		
		console.log(data);
		$.ajax({
			url:"/department/departmentByCollege",
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