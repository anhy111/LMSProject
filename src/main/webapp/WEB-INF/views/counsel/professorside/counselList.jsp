<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<div class="container">
	<h1>상담리스트</h1>
	<div class="row">
		<div class="card">
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
											cursorshover="true">상담코드</th>
										<th class="sorting sorting_desc" tabindex="0"
											aria-controls="example1" rowspan="1" colspan="1"
											aria-label="Browser: activate to sort column ascending"
											cursorshover="true" aria-sort="descending">학번</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="Platform(s): activate to sort column ascending"
											cursorshover="true">카테고리</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="Engine version: activate to sort column ascending"
											cursorshover="true">제목</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="Engine version: activate to sort column ascending"
											cursorshover="true">내용</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending"
											cursorshover="true">신청일자</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending"
											cursorshover="true">상담일자</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending"
											cursorshover="true">답변</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="counselList" items="${counselList}"
										varStatus="stat">
										<c:if test="${stat.count%2!=0 }">
											<tr class="odd">
										</c:if>
										<c:if test="${stat.count%2==0 }">
											<tr class="even">
										</c:if>
										<td class="dtr-control sorting_1" tabindex="0">${counselList.cnslCd}</td>
										<!-- 클릭시 결재요청한 서류를 모달창으로 출력 -->
										<td>${counselList.stuNo}</td>
										<td>${counselList.cnslCate }</td>
										<td>${counselList.cnslTtl }</td>
										<td>${counselList.cnslCon }</td>
										<td><fmt:formatDate value="${counselList.cnslReg }"
												pattern="yyyy년 MM월 dd일" /></td>
										<td><fmt:formatDate value="${counselList.cnslDt }"
												pattern="yyyy년 MM월 dd일" /></td>
										<td>
										<button id="answerInsert" class="btn btn-sm btn-info" value="${counselList.cnslCd}">답변작성</button>
										<button id="answerModify" class="btn btn-sm btn-success" value="${counselList.cnslCd}">답변수정</button>
										</td>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<th rowspan="1" colspan="1">상담코드</th>
										<th rowspan="1" colspan="1">학번</th>
										<th rowspan="1" colspan="1">카테고리</th>
										<th rowspan="1" colspan="1">제목</th>
										<th rowspan="1" colspan="1">내용</th>
										<th rowspan="1" colspan="1">신청일</th>
										<th rowspan="1" colspan="1">상담예약일</th>
										<th rowspan="1" colspan="1">답변</th>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).on('click','#answerInsert',function(){
	alert( this.value);
	window.open("/counsel/professorside/answer?cnslCd="+this.value,"answerInsert", "width=1000, height=800, left=100, top=50");
});        	  
</script>
