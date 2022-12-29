<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="row">
	<div class="alert alert-light col" role="alert">
		<!-- 게시판 안내사항 -->
		<p>
			<strong>&#8251;활용안내</strong><br><br>
			1. 이 안내글에서 굵은 글씨로 표기된 부분은 수강신청 시 특히 유의하여 참고하시기 바랍니다.<br>
			<strong>2. 수강신청과 관련한 변경사항 및 안내사항은 별도로 공지하지 않으니 편람을 꼼꼼히 확인하고 숙지하신 후 수강신청 하시기 바랍니다.</strong><br>
			3. 현재 배정된 강의실은 수강신청 후 수강인원에 따라 변경될 수 있으니, <strong>개강 전 강의실 관련 학사공지를 꼭 확인</strong>하시기 바랍니다.<br>
			4. 본 편람에 기재된 내용은 수강 신청 전, 후로 일부 수정될 수 있으므로, 수강신청과 관련된 학사공지를 반드시 확인하시기 바랍니다.<br>
			5. 수강편람 미숙지, 학사공지 미열람으로 인한 책은 학생 본인에게 있습니다. 
		</p>
	</div>
</div>
<div class="row mt-3">
	<div class="form-group col-2 pl-0">
		<select id="college" class="select2bs4 select2-hidden-accessible" style="width: 100%;" aria-hidden="true">
			<option value="">단과대학</option>
			<c:forEach var="college" items="${collegeList}">
				<option value="${college.colCd}">${college.colNm}</option>
			</c:forEach>
		</select>
	</div>
	<div class="form-group col-2">
		<select id="department" class="select2bs4 select2-hidden-accessible" style="width: 100%;" aria-hidden="true">
			<option value="">학과</option>
		</select>
	</div>
	<div class="form-group col-2 ">
		<select id="yr" class="select2bs4 select2-hidden-accessible" style="width: 100%;" aria-hidden="true">
			<option value="">학년</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
		</select>
	</div>
	<div class="form-group col-2">
		<select id="category" class="select2bs4 select2-hidden-accessible" style="width: 100%;" aria-hidden="true">
			<option value="">이수구분</option>
			<option value="전필">전공필수</option>
			<option value="전선">전공선택</option>
			<option value="교필">교양필수</option>
			<option value="교선">교양선택</option>
		</select>
	</div>
	<div class="form-gruop col-3">
		<input id="subject" type="text" class="form-control" placeholder="과목명" />
	</div>

	<div class="form-group col-1 text-center">
		<button id="search" type="button" class="btn btn-flat btn-primary" value="">검색</button>
	</div>
</div>
<div class="row pb-3">
	<div class="card-body table-responsive pl-0 pt-0" style="height: 600px;">
		<table class="table table-head-fixed text-nowrap table-striped table-bordered table-sm">
			<thead>
				<tr class="text-center">
					<th width="4%">순번</th>
					<th width="8%">이수구분</th>
					<th width="18%">개설학과</th>
					<th width="4%">학년</th>
					<th width="20%">과목명</th>
					<th width="4%">학점</th>
					<th width="6%">최대인원</th>
					<th>교수명</th>
					<th>강의계획서</th>
				</tr>
			</thead>
			<tbody id="lectureList">

			</tbody>
		</table>
	</div>
</div>
<script src="/resources/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/adminlte/plugins/select2/js/select2.full.min.js"></script>
<script src="/resources/adminlte/dist/js/demo.js"></script>
<script type="text/javascript">
	var header = "${_csrf.headerName}";
	var token = "${_csrf.token}";

	$(function() {
		//Initialize Select2 Elements
		$('.select2').select2();

		//Initialize Select2 Elements
		$('.select2bs4').select2({
			theme : 'bootstrap4'
		});

		$("#search").on("click",loadSearchLectureList);
		
		$("#college").on("change",function(){
			
			let data = {
					colCd : this.value
			};
			
			$.ajax({
				url:"/student/lecture/departmentByCollege",
				type:"get",
				data:data,
				contentType : "application/json;utf-8",
				success:function(result){
					let str = "";
					console.log(result);
					if(!result.length){
						str += "<option value=''>학과</option>";
						str += "<option value=''>학과가 없습니다</option>";
					} else{
						str += "<option value=''>학과</option>";
						$.each(result,function(p_inx, p_val){
							str += `<option value='\${p_val.depNm}'>\${p_val.depNm}</option>`;
						});
					}
					$("#department").html(str);
				}
			});
			
		});
		
		$(document).on('click', '.inquirydetail', function() {
			lecaCd = this.value;
			window.open("/student/lectureApply/inquiryForm?lecaCd="+lecaCd, "inquirydetail", "width=1000, height=800, left=100, top=50");
		});
		
		loadSearchLectureList();
	});
	
	function loadSearchLectureList(){
		
		let college = $("#college").val();
		let department = $("#department").val();
		let yr = $("#yr").val();
		let category = $("#category").val();
		let subject = $("#subject").val();
		
		
		let data = {
			colNm : college,
			depNm :  department,
			lecaTrg : yr,
			lecaCate : category,
			lecaNm : subject
		};


		$.ajax({
			url : "/student/lecture/searchList",
			type : "get",
			data : data,
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				$("#lectureList").html("");
				let str = "";
				if(result.length == 0){
					str = "<tr class='text-center p-0'>";
					str += "<td colspan='11'>검색된 강의가 없습니다.</td>";
					str += "</tr>";
					$("#lectureList").html(str);
					return;
				}
				$.each(result,function(p_inx, lecture){
					
					
					let percent = (lecture.lecHcnt/lecture.lecApply.lecaCap*100).toFixed(0);
					let color = "bg-primary";
					if(percent >= 100){
						color = "bg-danger";
					}
					
					
					str += `<tr class="text-center">
								<td>\${p_inx+1}</td>
								<td>\${lecture.lecApply.lecaCate}</td>
								<td>\${lecture.department.depNm}</td>
								<td>\${lecture.lecApply.lecaTrg}</td>
								<td>\${lecture.lecApply.lecaNm}</td>
								<td>\${lecture.lecApply.lecaCrd}</td>
								<td>\${lecture.lecApply.lecaCap}</td>
								<td>\${lecture.employee.empNm}</td>
								<td><button type="button"
									class="btn btn-block btn-outline-secondary btn-flat btn-sm inquirydetail"
									value="\${lecture.lecApply.lecaCd}" >강의계획서</button></td>
							</tr>`
				});
				$("#lectureList").append(str);
			}
		});
	}
</script>