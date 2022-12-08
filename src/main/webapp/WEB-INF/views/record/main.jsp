<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
									cursorshover="true">학적 코드</th>
								<th class="sorting sorting_desc" tabindex="0"
									aria-controls="example1" rowspan="1" colspan="1"
									aria-label="Browser: activate to sort column ascending"
									cursorshover="true" aria-sort="descending">학번</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="Platform(s): activate to sort column ascending"
									cursorshover="true">학적구분코드</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="Engine version: activate to sort column ascending"
									cursorshover="true">신청연도</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="Engine version: activate to sort column ascending"
									cursorshover="true">신청학기</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending"
									cursorshover="true">기간</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending"
									cursorshover="true">사유</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending"
									cursorshover="true">신청날짜</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending"
									cursorshover="true">승인여부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="recordsList" items="${recordsList}"
								varStatus="stat">
								<c:if test="${stat.count%2!=0 }">
									<tr class="odd">
								</c:if>
								<c:if test="${stat.count%2==0 }">
									<tr class="even">
								</c:if>
								<td class="dtr-control sorting_1" tabindex="0">${recordsList.recCd}</td>
								<td>${recordsList.stuNo}</td>
								<td>${recordsList.rgbCd}</td>
								<td>${recordsList.recYr}</td>
								<td>${recordsList.recSem}</td>
								<td>${recordsList.recPer}</td>
								<td>${fn:substring(recordsList.recRsn,0,8) }...</td>
								<td><fmt:formatDate value="${recordsList.recDt }" pattern="yyyy년 MM월 dd일" /></td>
								<td>${recordsList.recYn }</td>
										
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th rowspan="1" colspan="1">학적 코드</th>
								<th rowspan="1" colspan="1">학번</th>
								<th rowspan="1" colspan="1">학적 구분 코드</th>
								<th rowspan="1" colspan="1">신청 연도</th>
								<th rowspan="1" colspan="1">신청 학기</th>
								<th rowspan="1" colspan="1">기간</th>
								<th rowspan="1" colspan="1">사유</th>
								<th rowspan="1" colspan="1">신청 날짜</th>
								<th rowspan="1" colspan="1">승인 여부</th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
