<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="card mb-0 col-10 offset-1">
				<div class="card-body container-fluid">
					<div class="row p-3">
						<h5>중점지표</h5>
					</div>
					<div class="row p-3">
						<label>단과대학별 중점지표</label>
					</div>
					<div class="row">
						<div class="form-group col-2">
							<select id="college" class="select2bs4 select2-hidden-accessible"
								style="width: 100%;" aria-hidden="true">
								<option value="0">단과대학</option>
								<c:forEach var="college" items="${collegeList}">
									<option value="${college.colCd}">${college.colNm}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group col-2">
							<select id="department"
								class="select2bs4 select2-hidden-accessible"
								style="width: 100%;" aria-hidden="true">
								<option value="">학과</option>
							</select>
						</div>
						<div class="form-group col-2 ">
							<select id="yr" class="select2bs4 select2-hidden-accessible"
								style="width: 100%;" aria-hidden="true">
								<option value="">학년</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>
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
	$(function() {

		$('.select2').select2();
		//Initialize Select2 Elements
		$('.select2bs4').select2({
			theme : 'bootstrap4'
		});

		$("#college").on("change",function() {
		
			let data = {
				colCd : this.value
			};
		
			$.ajax({
				url : "/ketIndicators/departmentByCollege",
				type : "get",
				data : data,
				contentType : "application/json;utf-8",
				success : function(result) {
					let str = "";
					console.log(result);
					if (!result.length) {
						str += "<option value=''>학과</option>";
						str += "<option value=''>학과가 없습니다</option>";
					} else {
						str += "<option value=''>학과</option>";
						$.each(result,function(p_inx,p_val) {
							str += `<option value='\${p_val.depNm}'>\${p_val.depNm}</option>`;
						});
					}
					$("#department").html(str);
				}
			});
		
		});
	});
</script>