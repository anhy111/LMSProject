<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<div class="container-fluid p-3">
	<div class="row">
		<div class="input-group col-6">
			<input type="text" class="form-control" id="empNm" name="empNm" />
			<div class="input-group-append">
				<button type="button" class="btn btn-default" id="btnEmp">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</div>
	</div>
	<br>
	<div class="card-body table-responsive col-11 p-1" style="height: 300px;">
		<table class="table table-head-fixed text-nowrap table-striped table-bordered table-sm">
			<thead>
				<tr class="text-center">
					<th width="7%" class="text-left">순번</th>
					<th>직원번호</th>
					<th>부서</th>
					<th>직책</th>
					<th>이름</th>
					<th>선택</th>
				</tr>
			</thead>
			<tbody id="empList">

			</tbody>
		</table>
	</div>
</div>
<script src="/resources/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
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
		
		$("#btnEmp").on("click",searchEmployee);
		
		searchEmployee();
	});
	
	function searchEmployee(){
		let data = {
			empNm : $("#empNm").val()
		}
		
		$.ajax({
			url : "/department/searchEmployee",
			type:"get",
			data : data,
			success : function(result){
				console.log(result);
				$("#empList").html("");
				let str = "";
				$.each(result, function(p_inx, employee){
					str += `<tr class="text-center">
								<td>\${p_inx+1}</td>
								<td class='text-left'>\${employee.empNo}</td>
								<td class='text-left'>\${employee.empDiv}</td>
								<td>\${employee.empPos}</td>
								<td>\${employee.empNm}</td>
								<td><button type='button' class='btn btn-primary btn-flat btn-sm' onclick='selectProfessor("\${employee.empNo}","\${employee.empNm}")'>선택</button></td>
							</tr>`;
				});
				$("#empList").append(str);
			}
		});
	}
	
	function selectProfessor(p_no, p_name){
		console.log(p_no + " : " + p_name);
		opener.document.getElementById("empNo").value = p_no;
		opener.document.getElementById("empNm").value = p_name;
		window.close();
	}
</script>