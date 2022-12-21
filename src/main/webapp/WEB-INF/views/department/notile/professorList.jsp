<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<div class="container-fluid p-3">
	<div class="row">
		<div class="input-group col-6">
			<input type="text" class="form-control" id="proNm" name="proNm" />
			<div class="input-group-append">
				<button type="button" class="btn btn-default" id="btnPro">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</div>
	</div>
	<br>
	<div class="card-body table-responsive col-11 p-0" style="height: 300px;">
		<table class="table table-head-fixed text-nowrap table-striped table-bordered table-sm">
			<thead>
				<tr class="text-center">
					<th width="7%" class="text-left">순번</th>
					<th>단과대학</th>
					<th>소속학과</th>
					<th>직책명</th>
					<th>이름</th>
					<th>선택</th>
				</tr>
			</thead>
			<tbody id="notApplyLecture">

			</tbody>
		</table>
	</div>
</div>
<script src="/resources/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/adminlte/plugins/select2/js/select2.full.min.js"></script>
<script src="/resources/adminlte/dist/js/adminlte.min.js"></script>
<script src="/resources/adminlte/dist/js/demo.js"></script>
<script type="text/javascript">

	let depCd = "${param.depCd}"
	
	$(function() {

		$('.select2').select2();
		//Initialize Select2 Elements
		$('.select2bs4').select2({
			theme : 'bootstrap4'
		});
		
		$("#btnPro").on("click",searchProfessor);
		
		searchProfessor();
	});
	
	function searchProfessor(){
		let data = {
			depCd : depCd,
			proNm : $("#proNm").val()
		}
		
		console.log(data);
	}
</script>