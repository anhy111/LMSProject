<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="card">
		<div class="row">
			<div style="float:center;" class="col-12">
					<select id="typingKeyword">
						<option selected>교수/강의명</option>
						<option id="empNm" value="empNm">교수명</option>
						<option id="lecaNm" value="lecaNm">강의명</option>
					</select>
				<input id="typingKeywordInput" type="text" placeholder="검색어를입력하세요"/>
				<button onclick="searchRun()" class="btn btn-sm btn-info">검색</button>
			</div>
			<div>
				<select  id="lecYn" name="lecYn">
					<option selected value="개강유무">개강유무</option>
					<option value="Y">개강</option>
					<option value="N">개강전</option>
				</select>
			</div>
			<div>
				<select id="lecaSem" name="lecaSem">
					<option selected value="학기구분">학기별</option>
					<option value="1학기">1학기</option>
					<option value="2학기">2학기</option>
				</select>
			</div>
			<div>
				<select id="lecaCate" name="lecaCate">
					<option selected value="이수구분">이수구분</option>
					<option value="전선">전선</option>
					<option value="전필">전필</option>
					<option value="교선">교선</option>
					<option value="교필">교필</option>
				</select>
			</div>
			<div>
				<select id="colNm" name="colNm">
					<option selected value="단과대검색어">단과대학별</option>
					<option value="경상대학12">경상대학12</option>
					<option value="글로벌비지니스대학">글로벌비지니스대학</option>
					<option value="IT융합대학">IT융합대학</option>
					<option value="미술체육대학">미술체육대학</option>
				</select>
			</div>
			<div>
				<select id="depNm" name="depNm">
					<option selected value="학과검색어">학과별</option>
					<option value="경제학과">경제학과</option>
					<option value="생명과학과">생명과학과</option>
					<option value="신학과">신학과</option>
					<option value="컴퓨터공학과">컴퓨터공학과</option>
				</select>
			</div>
			<div>
				<select id="subNm"  name="subNm">
					<option selected value="과목검색어">과목별</option>
					<option value="신학">신학</option>
					<option value="경제학">경제학</option>
					<option value="식품영양학">식품영양학</option>
					<option value="동양철학">동양철학</option>
					<option value="컨벤션호텔경영학">컨벤션호텔경영학</option>
					<option value="컴퓨터공학">컴퓨터공학</option>
				</select>
			</div>
			<div>
				<button class="btn btn-sm btn-danger">키워드초기화</button>
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
						<tbody id="resultTable">
							<c:forEach var="atlsList" items="${atlsList}"
								varStatus="stat">
								<c:if test="${stat.count%2!=0 }">
									<tr class="odd">
								</c:if>
								<c:if test="${stat.count%2==0 }">
									<tr class="even">
								</c:if>
								<td class="dtr-control sorting_1" tabindex="0">${atlsList.lecApply.lecaYr}</td>
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
let updateInsertData = "";
let typingKeyword = "";
let typeKeywordInput = "";
let data = { colNm : "단과대검색어"
		          , depNm : "학과검색어"
	              , subNm : "과목검색어"
	              , lecaCate : "이수구분"
	              , lecaSem : "학기구분"
	              , lecYn : "개강유무"
	              , empNm : "교수/강의명"
	              , lecaNm : "교수/강의명"
	        	  };
//만들어줄예정
function resetKeyword(){
	$("#typingKeyword")
}

function setSearchData(){
	var colNmData = $("#colNm").val();data.colNm = colNmData;
	var depNmData = $("#depNm").val();data.depNm = depNmData;
	var subNmData = $("#subNm").val();data.subNm = subNmData;
	var lecaCateData = $("#lecaCate").val();data.lecaCate = lecaCateData;
	var lecaSemData = $("#lecaSem").val();data.lecaSem = lecaSemData;
	var lecYnData = $("#lecYn").val();data.lecYn = lecYnData;
}

function cumulativeSearchData(){
	console.log("제이슨데이터 : " + JSON.stringify(data));
	$.ajax({
		url:"/atls/search",
		type:'POST',
		data: JSON.stringify(data),
		datatype:'JSON',
		contentType:'application/json',
		beforeSend: function (xhr) {
			xhr.setRequestHeader(header, token);
		},
		success:function(result){
			$("#resultTable").html("");
			updateInsertData = "";
			  $.each(result, function (i, item) {
	                console.log("검색된 단과대 수 : "+i);
	                updateInsertData += `<tr><td \class='dtr-control sorting_1' tabindex='0'>\${item.lecApply.lecaYr}</td>
	                		<td>\${item.lecApply.lecaSem}</td>
	                		<td>\${item.college.colNm}</td>
	                		<td>\${item.department.depNm}</td>
	                		<td>\${item.subject.subNm}</td>
	                		<td>\${item.lecApply.lecaCate}</td>
	                		<td>\${item.lecApply.lecaNm}</td>
	                		<td>\${item.employee.empNm}</td>
	                		<td>\${item.lecApply.lecaTrg}</td>
	                		<td>\${item.lecApply.lecaCrd}</td>
	                		<td>\${item.lecture.lecYn}</td>
	                		<td>\${item.lecture.lecHcnt}</td></tr>`
	            });
					$("#resultTable").append(updateInsertData);
		}
	});
}
function searchRun(){
	if(typingKeyword == "empNm"){
		typingKeywordInput = $("#typingKeywordInput").val();
		data.empNm = typingKeywordInput;
		data.lecaNm = "교수/강의명";
		console.log(typingKeywordInput);
		cumulativeSearchData();
	}
	if(typingKeyword == "lecaNm"){
		typingKeywordInput = $("#typingKeywordInput").val();
		data.lecaNm = typingKeywordInput;
		data.empNm = "교수/강의명";
		console.log(typingKeywordInput);
		cumulativeSearchData();
	}
}

function trackingEmpNmLecaNm(){
	if(!($("#typingKeyword").val() == "교수/강의명")){
		typingKeyword = $("#typingKeyword").val();
		console.log(typingKeyword)
		}
	}

$(function(){
	$("#colNm").on("change",function(){setSearchData();cumulativeSearchData();}); //단과대
	$("#depNm").on("change",function(){setSearchData();cumulativeSearchData();}); //학과
	$("#subNm").on("change",function(){setSearchData();cumulativeSearchData();}); //과목
	$("#lecaCate").on("change",function(){setSearchData();cumulativeSearchData();}); //이수구분
	$("#lecaSem").on("change",function(){setSearchData();cumulativeSearchData();}); //학기구분
	$("#lecYn").on("change",function(){setSearchData();cumulativeSearchData();}); //개강유무
	$("#typingKeyword").on("change",function(){trackingEmpNmLecaNm()});//검색창 교수/강의명
});
</script>
