<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
div{
border : 1px solid black;}
</style>

<div class="container">
	<div class="col-12">
		<h1>
			<label>상담신청리스트</label>
		</h1>
	</div>
		<div class="col-sm-8" style="float: left;">
			<button onclick="counselListUp()" class="btn btn-md btn-primary">대면상담</button>
			<button onclick="nonFaceCounselListUp()"class="btn btn-md btn-success">비대면상담</button>
			<button onclick="allListUp()"class="btn btn-md btn-outline-secondary">전체리스트</button>
		</div>
	<br><br>
	<div class="row" id="counselListTable">
		<div class="card">
		<div class="card-header">
			<h3 class="card-title">대면상담리스트</h3>
			</div>
			<div class="card-body">
				<div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4">
					<table id="example2"
								class="table table-bordered table-hover dataTable dtr-inline"
								aria-describedby="example2_info">
						<thead>
							<tr>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="Rendering engine: activate to sort column ascending"
									cursorshover="true">상담코드</th>
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
									cursorshover="true">상담예약일</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending"
									cursorshover="true">담당교수</th>
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
								<td>${counselList.cnslCate }</td>
								<td>${counselList.cnslTtl }</td>
								<td>${counselList.cnslCon }</td>
								<td><fmt:formatDate value="${counselList.cnslReg }"
										pattern="yyyy/MM/dd" /></td>
								<td><fmt:formatDate value="${counselList.cnslDt }"
										pattern="yyyy/MM/dd" /></td>
								<td>${counselList.empNm }</td>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th rowspan="1" colspan="1">상담코드</th>
								<th rowspan="1" colspan="1">카테고리</th>
								<th rowspan="1" colspan="1">제목</th>
								<th rowspan="1" colspan="1">내용</th>
								<th rowspan="1" colspan="1">신청일</th>
								<th rowspan="1" colspan="1">상담예약일</th>
								<th rowspan="1" colspan="1">담당교수</th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 
	
	
	 -->
	<div class="row" id="nonFaceCounselListTable">
		<div class="card">
		<div class="card-header">
		<h3 class="card-title">비대면상담리스트</h3>
		</div>
			<div class="card-body">
				<div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4">
							<table id="example2"
								class="table table-bordered table-hover dataTable dtr-inline"
								aria-describedby="example2_info">
								<thead>
									<tr>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="Rendering engine: activate to sort column ascending"
											cursorshover="true">상담코드</th>
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
											cursorshover="true">답변</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending"
											cursorshover="true">답변등록일자</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending"
											cursorshover="true">담당교수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="nonFaceCounselList"
										items="${nonFaceCounselList}" varStatus="stat">
										<c:if test="${stat.count%2!=0 }">
											<tr class="odd">
										</c:if>
										<c:if test="${stat.count%2==0 }">
											<tr class="even">
										</c:if>
										<td class="dtr-control sorting_1" tabindex="0">${nonFaceCounselList.cnslCd}</td>
										<!-- 클릭시 결재요청한 서류를 모달창으로 출력 -->
										<td>${nonFaceCounselList.cnslCate }</td>
										<td>${nonFaceCounselList.cnslTtl }</td>
										<td>${nonFaceCounselList.cnslCon }</td>
										<td><fmt:formatDate
												value="${nonFaceCounselList.cnslReg }" pattern="yyyy/MM/dd" /></td>
										<td>${nonFaceCounselList.cnslRpl }</td>
										<td><fmt:formatDate value="${nonFaceCounselList.cnslDt }"
												pattern="yyyy/MM/dd" /></td>
										<td>${nonFaceCounselList.empNm }</td>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<th rowspan="1" colspan="1">상담코드</th>
										<th rowspan="1" colspan="1">카테고리</th>
										<th rowspan="1" colspan="1">제목</th>
										<th rowspan="1" colspan="1">내용</th>
										<th rowspan="1" colspan="1">신청일</th>
										<th rowspan="1" colspan="1">답변</th>
										<th rowspan="1" colspan="1">답변등록일자</th>
										<th rowspan="1" colspan="1">담당교수</th>
									</tr>
								</tfoot>
							</table>
						</div>
				</div>
		</div>
	</div>
	<!-- 
	 
	  -->
</div>
<script type="text/javascript">
	function counselListUp() {
		$("#nonFaceCounselListTable").css("display", 'none');
		$("#counselListTable").css("display", "block");
	}
	function nonFaceCounselListUp() {
		$("#nonFaceCounselListTable").css("display", 'block');
		$("#counselListTable").css("display", "none");
	}
	function allListUp(){
		$("#nonFaceCounselListTable").css("display", 'block');
		$("#counselListTable").css("display", "block");
	}
</script>