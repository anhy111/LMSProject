<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
$(function(){
	
	$("input[type='file']").on('change',function(){
	    $(this).next('.custom-file-label').html(event.target.files[0].name);
	});
	
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";
	
	
	$("#btnZipCode").on("click",function(){
// 		alert("하이루");
		new daum.Postcode({
			oncomplete:function(data){
				$("input[name='empZip']").val(data.zonecode); // 우편번호 5자리
				$("input[name='empAddr1']").val(data.address); // 주소
				$("input[name='empAddr2']").val(data.buildingName); // 상세 주소
			}
		}).open();
	});
	
	
	$("#colCd").on("change",function(){
		
		let data = {
				colCd : this.value
		};
		
		$.ajax({
			url:"/student/lectureApply/departmentByCollege",
			type:"get",
			data:data,
			contentType : "application/json;utf-8",
			async:false,
			success:function(result){
				let str = "";
				console.log(result);
				if(!result.length){
					str += "<option value=''>학과</option>";
					str += "<option value=''>학과가 없습니다</option>";
				} else{
					str += "<option value=''>학과</option>";
					$.each(result,function(p_inx, p_val){
						str += `<option value='\${p_val.depCd}'>\${p_val.depNm}</option>`;
					});
				}
				$("#depCd").html(str);
			}
		});
		
	});
	
	$("#empPos").on("change", function(){
		
		let empPos = $("#empPos").val();
		console.log("empPos 와라 " + empPos);
		
		if(empPos == "E_POS007" || empPos =="E_POS008"){
			$("#colCd").removeAttr("disabled");
			$("#depCd").removeAttr("disabled");
			$("#proPos").removeAttr("disabled");
		}else{
			$("#colCd").attr("disabled", true);
			$("#depCd").attr("disabled", true);
			$("#proPos").attr("disabled", true);
		}
		
		
	});
	
	// 이미지 미리보기 시작!
	// 이미지 객체를 담을 배열 
// 	let sel_file = [];
	$("#empPic").on("change", handleImgFileSelect);
	
	//e: onchange 이벤트 객체
	function handleImgFileSelect(e){
		//e.target : <input type="file"
		let files = e.target.files;
		//이미지 object 배열
		let fileArr = Array.prototype.slice.call(files);
		
		//f : 각각의 이미지 파일
		fileArr.forEach(function(f){
			if(!f.type.match("image.*")){
				//이미지가 아니면
				alert("이미지 확장자만 가능합니다");
				//함수종료
				return;
			}
			
			//이미지를 배열에 넣음
// 			sel_file.push(f);
			//이미지를 읽어보쟈
			let reader = new FileReader();
			//e : 리더가 이미지 읽을 때 그 이벤트
			reader.onload = function(e){
				let img_html = e.target.result;
				
				console.log("들어올까,, " + img_html)
				//객체.append : 누적, .html : 새로고침, innerHTML : J/S
				$("#empImg").attr("src", img_html);
			}
			
			reader.readAsDataURL(f);
		});
	}
	
	
});


</script>
<div class="row" >
	<div class="col-sm-11 offset-1">
		<div class="col-md-11">
			<div class="card card-outline card-primary">
				<div class="card-header">
					<h3 class="card-title">직원 등록</h3>
				</div>
				<form action="/manage/insertEmpPost" method="post" enctype="multipart/form-data">
					<div class="card-body">
						<div class="container-fluid">
							<div class="row">
								<div class="col-2 offset-1 empImg">
									<img class="img-thumbnail" width="200px;" height="300px;" id="empImg">
								</div>
								<div class="col-9">
									<div class="container">
										<div class="row mt-1 mb-2">
											<div class="col-4 offset-1">
												<label for="empNo" class="form-label">교번</label> 
												<input type="text" class="form-control" id="empNo" name="empNo" value="${empId.memNo}" readonly/>
											</div>
											<div class="col-4 offset-1">
												<label for="empPass" class="form-label">비밀번호</label>
												 <input type="text" class="form-control stu" id="empPass" name="empPass" required />
											</div>
										</div>
										<div class="row mb-2">
											<div class="col-4 offset-1">
												<label for="empNm" class="form-label">이름</label> 
												<input type="text" class="form-control stu" id="empNm" name="empNm" required  />
											</div>
											<div class="col-4 offset-1">
												<label for="empNme" class="form-label">영문 이름</label>
												 <input type="text" class="form-control stu" id="empNme" name="empNme" required />
											</div>
										</div>
										<div class="row mb-2">
											<div class="col-4 offset-1">
												<label for="empPic" class="form-label">사진 등록</label> 
											</div>
										</div>
										<div class="row">
											<div class="custom-file col-9 offset-1">
												<input type="file" class="custom-file-input stu" id="empPic" name="file" required >
												<label class="custom-file-label" for="empPic">Choose file</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row mt-5 mb-2">
							<div class="col-4 offset-1">
								<label for="empJoin" class="form-label">입사일</label> <input
									type="date" class="form-control stu" id="empJoin" name="empJoin" required />
							</div>
						</div>
						<div class="row mt-3 mb-2">
							<div class="col-4 offset-1">
								<label>부서</label> 
								<select class="form-control stu" id="empDiv" name="empDiv">
									<c:forEach var="division" items="#{division}">
										<option value="${division.comdCd}">${division.comdNm}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-4 offset-1">
								<label>직책</label> 
								<select class="form-control stu" id="empPos" name="empPos">
									<c:forEach var="ePosition" items="#{ePosition}">
										<option value="${ePosition.comdCd}">${ePosition.comdNm}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="row mt-3 mb-2">
							<div class="col-4 offset-1">
								<label>보직</label> 
								<select class="form-control stu" id="proPos" name="proPos" disabled>
									<c:forEach var="pPosition" items="#{pPosition}">
										<option value="${pPosition.comdCd}">${pPosition.comdNm}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="row mt-3 mb-2">
							<div class="col-4 offset-1">
								<label for="colCd" class="form-label">단과대학</label> 
								<select class="form-control stu" id="colCd" name="colCd" disabled>
									<c:forEach var="college" items="#{collegeList}">
										<option value="${college.colCd}">${college.colNm}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-4 offset-1">
								<label for="depCd" class="form-label">학과</label> 
								<select id="depCd" name="depCd" class="form-control stu" disabled>
									<option value="">학과</option>
								</select>
							</div>
						</div>
						<div class="row mt-3 mb-2">
							<div class="col-10 offset-1">
								<label for="empBir" class="form-label">주민등록번호</label> 
							</div>
							<div class="col-10 offset-1">
								<input type="text" class="form-control stu col-3" id="empBir" name="empBir" placeholder="숫자만 입력" style="display:inline-block" required />
								<h3 style="display:inline-block"> - </h3>
								<input type="text" class="form-control stu col-3" id="empReg" name="empReg" placeholder="숫자만 입력" style="display:inline-block" required />
							</div>
						</div>
						<div class="row mt-3 mb-2">
							<div class="col-4 offset-1">
								<label for="empTel" class="form-label">연락처</label> <input
									type="text" class="form-control stu" id="empTel" name="empTel" placeholder="숫자만 입력" required />
							</div>
							<div class="col-4 offset-1">
								<label for="empTel2" class="form-label">비상 연락처</label> <input
									type="text" class="form-control stu" id="empTel2" name="empTel2" placeholder="숫자만 입력" />
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-4 offset-1">
								<div class="form-group">
									<label>은행</label> 
									<select class="form-control stu" id="empBankCd" name="empBankCd" >
										<c:forEach var="bank" items="#{bank}">
											<option value="${bank.comdCd}">${bank.comdNm}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="row mb-2">
							<div class="col-4 offset-1">
								<label for="empDepo" class="form-label">예금주</label> <input
									type="text" class="form-control stu" id="empDepo" name="empDepo" required/>
							</div>
							<div class="col-4 offset-1">
								<label for="empAct" class="form-label">계좌번호</label> <input
									type="text" class="form-control stu" id="empAct" name="empAct" placeholder="숫자만 입력" required />
							</div>
						</div>
						<div class="row mt-4 mb-2">
							<div class="col-3 offset-1">
								<label for="empZip" class="form-label">우편번호</label>
								<div class="input-group">
									<input type="text" class="form-control stu" id="empZip" name="empZip" required />
									<div class="input-group-append">
										<button type="button" class="btn btn-default" id="btnZipCode">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</div>
		
						</div>
						<div class="row mb-2">
							<div class="col-4 offset-1" >
								<label for="empAddr1" class="form-label">기본주소</label> <input
									type="text" class="form-control stu" id="empAddr1" name="empAddr1" required />
							</div>
							<div class="col-4 offset-1">
								<label for="empAddr2" class="form-label">상세주소</label> <input
									type="text" class="form-control stu" id="empAddr2" name="empAddr2" required />
							</div>
						</div>
						<div id="stuBtn" align="right">
							<button type="submit" id="insertStu" class="btn btn-outline-success">등록</button>
						</div>
					</div>
					<sec:csrfInput/>
				</form>
			</div>
		</div>
	</div>
</div>