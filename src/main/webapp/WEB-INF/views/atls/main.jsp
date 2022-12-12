<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="card">
		<div class="row">
			<div  style="float:right;" class="col-4">
					<select >
						<option selected>교수/강의명</option>
						<option id="empNm">교수명</option>
						<option id="lecaNm">강의명</option>
					</select>
				<input type="search" placeholder="검색어를입력하세요"/>
				<button type="button" class="btn btn-sm btn-info">검색</button>
			</div>
			<div>
				<select  id="lecYn" name="lecYn">
					<option>개강유무</option>
					<option value="Y">개강</option>
					<option value="N">개강전</option>
				</select>
			</div>
			<div>
				<select id="lecaSem" name="lecaSem">
					<option selected>학기별</option>
					<option value="1학기">1학기</option>
					<option value="2학기">2학기</option>
				</select>
			</div>
			<div>
				<select id="colNm" name="colNm">
					<option >단과대학별</option>
					<option value="공과대학">공과대학</option>
					<option >2</option>
					<option >3</option>
				</select>
			</div>
			<div>
				<select id="depNm" name="depNm">
					<option selected>학과별</option>
				</select>
			</div>
			<div>
				<select id="subNm"  name="subNm">
					<option selected>과목별</option>
				</select>
			</div>
		</div>
	<div class="card-body">
		<div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">
			<div class="row">
				<div class="col-sm-12">
					<table id="example1"
						class="table table-bordered table-striped dataTable dtr-inline"
						aria-describedby="example1_info">
						<thead>
							<tr>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="Rendering engine: activate to sort column ascending"
									cursorshover="true">년도</th>
								<th class="sorting sorting_desc" tabindex="0"
									aria-controls="example1" rowspan="1" colspan="1"
									aria-label="Browser: activate to sort column ascending"
									cursorshover="true" aria-sort="descending">학기</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="Platform(s): activate to sort column ascending"
									cursorshover="true">단과대명</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="Engine version: activate to sort column ascending"
									cursorshover="true">학과명</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="Engine version: activate to sort column ascending"
									cursorshover="true">과목명</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending"
									cursorshover="true">이수구분</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending"
									cursorshover="true">강의명</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending"
									cursorshover="true">직책+교수명</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending"
									cursorshover="true">개설학년</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending"
									cursorshover="true">배정학점</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending"
									cursorshover="true">개설여부</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending"
									cursorshover="true">수강중인인원</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="atlsList" items="${atlsList}"
								varStatus="stat">
								<c:if test="${stat.count%2!=0 }">
									<tr class="odd">
								</c:if>
								<c:if test="${stat.count%2==0 }">
									<tr class="even">
								</c:if>
								<td class="dtr-control sorting_1" tabindex="0">${atlsList.lecApply.lecaYr}</td>
								<!-- 클릭시 결재요청한 서류를 모달창으로 출력 -->
								<td>${atlsList.lecApply.lecaSem}</td>
								<td>${atlsList.college.colNm}</td>
								<td>${atlsList.department.depNm}</td>
								<td>${atlsList.subject.subNm}</td>
								<td>${atlsList.lecApply.lecaCate}</td>
								<td>${atlsList.lecApply.lecaNm}</td>
								<td>${atlsList.employee.empNm}</td>
								<td>${atlsList.lecApply.lecaTrg}</td>
								<td>${atlsList.lecApply.lecaCrd}</td>
								<td>${atlsList.lecture.lecYn}</td>
								<td>${atlsList.lecture.lecHcnt}</td>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th rowspan="1" colspan="1">년도</th>
								<th rowspan="1" colspan="1">학기</th>
								<th rowspan="1" colspan="1">단과대명</th>
								<th rowspan="1" colspan="1">학과명</th>
								<th rowspan="1" colspan="1">과목명</th>
								<th rowspan="1" colspan="1">이수구분</th>
								<th rowspan="1" colspan="1">강의명</th>
								<th rowspan="1" colspan="1">교수직책+교수명</th>
								<th rowspan="1" colspan="1">개설학년</th>
								<th rowspan="1" colspan="1">배정학점</th>
								<th rowspan="1" colspan="1">개설여부</th>
								<th rowspan="1" colspan="1">수강중인인원</th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
let header = "${_csrf.headerName}";
let token = "${_csrf.token}";
$(function(){

	$("#colNm").on("change",function(){
		
		var data1 = $("#colNm").val();
// 		console.log("파라미터 밸류 : " + data1)
// 		var colNm = {"colNm" :  + data1}
		
		$.ajax({
			url:"/atls/search",
			type:'POST',
			data:JSON.stringify({
				colNm : data1
				}),
			datatype:'JSON',
			contentType:'application/json',
			beforeSend: function (xhr) {
				xhr.setRequestHeader(header, token);
			},
			success:function(result){
				console.log("도착")
// 				console.log(result);
				  $.each(result, function (i, item) {
	                    console.log("i : "+i);
	                    console.log("item : "+item.college.colNm);
	                });
			}
		})
	})
})
</script>
