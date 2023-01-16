<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<div class="container-fluid p-3">
	<div class="row">
		<div class="input-group col-8 offset-2">
			<input type="text" class="form-control" id="proNm" name="proNm" />
			<div class="input-group-append">
				<button type="button" class="btn btn-default" id="btnPro">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</div>
	</div>
	<br>
	<div class="card-body table-responsive col-12 p-1" style="height: 300px;">
		<table class="table table-head-fixed text-nowrap table-striped table-bordered table-sm">
			<thead>
				<tr class="text-center">
					<th width="7%" class="text-left">순번</th>
					<th>교번</th>
					<th>단과대학</th>
					<th>소속학과</th>
					<th>직책명</th>
					<th>이름</th>
					<th >선택</th>
				</tr>
			</thead>
			<tbody id="proList">

			</tbody>
		</table>
	</div>
</div>
<script type="text/javascript">

	let depCd = "${param.depCd}"
	
	$(function() {

		$("#btnPro").on("click",searchProfessor);
		
		searchProfessor();
	});
	
	function searchProfessor(){
		let data = {
			depCd : depCd,
			proNm : $("#proNm").val()
		}
		
		$.ajax({
			url : "/department/searchProfessor",
			type:"get",
			data : data,
			success : function(result){
				$("#proList").html("");
				let str = "";
				if(result == null || result.length == 0){
					str += `<tr class="text-center">
								<td colspan='7'>검색결과가 없습니다.</td>
							</tr>`;
					$("#proList").append(str);
					return;
				}
				
				$.each(result, function(p_inx, professor){
					str += `<tr class="text-center">
								<td>\${p_inx+1}</td>
								<td>\${professor.proNo}</td>
								<td class='text-left'>\${professor.colNm}</td>
								<td class='text-left'>\${professor.depNm}</td>
								<td>\${professor.proPos}</td>
								<td>\${professor.empNm}</td>
								<td><button type='button' class='btn btn-primary btn-flat btn-sm' onclick='selectProfessor("\${professor.proNo}","\${professor.empNm}")'>선택</button></td>
							</tr>`;
				});
				$("#proList").append(str);
			}
		});
	}
	
	function selectProfessor(p_no, p_name){
		console.log(p_no + " : " + p_name);
		opener.document.getElementById("proNo").value = p_no;
		opener.document.getElementById("proNm").value = p_name;
		window.close();
	}
</script>