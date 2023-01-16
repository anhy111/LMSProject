<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<div class="alert alert-light col" role="alert">
		<!-- 게시판 안내사항 -->
		<p>
			<strong>등록금은 현재 재학중인 학생에게만 부여된다. 등록금은 장학금이 자동적으로 차감된 금액이 부과되며, 만약 장학금액이 등록금액을 초과할 경우 등록금은 0원으로 처리된다.</strong>
		</p>
	</div>
</div>

<div class="row">
	<div class="align-self-end col-2 mb-2" style="text-align:end;" id="noticeCheck">
		<label class="m-0" style="float: left;">
			&ensp;등록금 납부 고지대상
		</label>
	</div>
	<div class="col-10 align-self-end mb-2" style="text-align:end;">
		<p class="m-0" style="float: right;">
			[미고지 <span style="color: red; font-weight: bold;" id="cntSpan"></span>건]
		</p>
	</div>
</div>

<div class="row">
	<div class="table-responsive" style="height: 300px;">
		<table class="table table-head-fixed text-nowrap table-striped table-bordered table-condensed table-sm">
			<thead>
				<tr class="text-center">
					<th width="5%">No</th>
					<th width="5%">선택</th>
					<th width="15%">단과대학</th>
					<th width="15%">학과</th>
					<th width="10%">학번</th>
					<th width="5%">학년</th>
					<th width="5%">학기</th>
					<th width="10%">이름</th>
					<th width="10%">고지현황</th>
				</tr>
			</thead>
			<tbody id="BillList" class="text-center">
			</tbody>
		</table>
	</div>
</div>
<div class="row mt-2">
	<div class="form-group col-12 text-right">
		<button class="btn btn-outline-secondary" id="checkboxAll">전체선택</button>
		<button type="button" id="btn1" class="btn btn-outline-primary">등록금 고지</button>
	</div>
</div>

<script type="text/javascript" defer="defer">

	//스프링 시큐리티를 위한 토큰 처리(csrf) -> 불토엔 큰 코스로 픽스!
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";

	let dataSet;

	$.ajax({
		url: "/payment/admin/adminBillList",
		contentType: "application/json;charset=utf-8",
		dataType: 'json',
		type: "POST",
		beforeSend: function (xhr) {
			xhr.setRequestHeader(header, token);
		},
		success: function (data) {
			console.log(data);
			//개수표현
			$('#cntSpan').text(data.length);
			let str = "";
			for (var i = 0; i < data.length; i++) {
				str += `
					<tr>
					<td>\${i+1}</td>
					<td><input class='checkboxAll' type='checkbox' value="\${data[i].stuNo}"></td>
					<td>\${data[i].colNm}</td>
					<td>\${data[i].depNm}</td>
					<td>\${data[i].stuNo}</td>
					<td>\${data[i].stuYr}</td>
					<td>\${data[i].stuSem}</td>
					<td>\${data[i].stuNm}</td>
					<td>\${data[i].payYn}</td>
					</tr>
				`
			}
			$("#BillList").html(str);
			
		}
	});


	$(function () {
		$("#checkboxAll").on("click", function () {
			$(".checkboxAll").prop("checked", true);
		});
	})

	function submit() {
		
		let checkedBoxes = document.querySelectorAll('.checkboxAll:checked');
		
		let stuNoValues = [];
		for (let i = 0; i < checkedBoxes.length; i++) {
		  stuNoValues.push(checkedBoxes[i].value);
		  console.log("체크값 : " + stuNoValues[i]);
		}
		
		dataSet = {
				stuList: stuNoValues
		};
		
		console.log("체크값2 : " + JSON.stringify(dataSet));
		
		$.ajax({
			url: "/payment/admin/insert",
			type: "POST",
			data: JSON.stringify(dataSet),
			contentType: 'application/json',
			beforeSend: function (xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function (res) {
				Swal.fire({
					  icon: 'success',
					  title: '등록금 요청이 완료되었습니다.',
					}).then((result) => {
		             	window.location.reload();
         			})
			}
		});
	}	
// 	$(function () {

// 		$.ajax({
// 			url: "/scholarship/admin/scholarshipCheck",
// 			method: "POST",
// 			data: JSON.stringify(dataSet),
// 			dataType: "json",
// 			beforeSend: function (xhr) {
// 				xhr.setRequestHeader(header, token);
// 			},
// 			success: function (result) {
// 				if (result == 0) {
// 					$('#btn1').remove();
// 					var str = "<span style='color:red;'>&ensp;&ensp;*성적장학금을 수여하지 않은 상태이므로 등록금을 고지할 수 없습니다.</span>";
// 					$('#noticeCheck').append(str);
// 				}
// 			}
// 		})
// 	});
	
	$('#btn1').on('click', function () {
		submit();
	})
</script>
