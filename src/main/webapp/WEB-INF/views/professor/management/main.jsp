<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
									cursorshover="true">학년</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="Platform(s): activate to sort column ascending"
									cursorshover="true">학번</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="Platform(s): activate to sort column ascending"
									cursorshover="true">이름</th>
								<th class="sorting" tabindex="0" aria-controls="example1"
									rowspan="1" colspan="1"
									aria-label="Engine version: activate to sort column ascending"
									cursorshover="true">전화번호</th>
							
							</tr>
						</thead>
						<tbody>
							<c:forEach var="studentList" items="${studentList}"
								varStatus="stat">
								<c:if test="${stat.count%2!=0 }">
									<tr class="odd">
								</c:if>
								<c:if test="${stat.count%2==0 }">
									<tr class="even">
								</c:if>
								
								<td class="dtr-control sorting_1" tabindex="0">${studentList.stuYr}</td>
								<td> ${studentList.stuNo}</td>
								<td><a href="/professor/management/detail?stuNo=${studentList.stuNo }">${studentList.stuNm }</a></td>
								<td>${studentList.stuTel }</td>
				
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th rowspan="1" colspan="1">학년</th>
								<th rowspan="1" colspan="1">학번</th>
								<th rowspan="1" colspan="1">이름</th>
								<th rowspan="1" colspan="1">전화번호</th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
