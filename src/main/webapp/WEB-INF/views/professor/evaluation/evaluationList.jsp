<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="card mb-0 col-10 offset-1">
				<div class="card-body container-fluid">
					<div class="row p-3">
						<h5>수강평가내역 조회</h5>
					</div>
					<div class="row">
						<div class="card col-12 container">
							<div class="card-body">
								<h5>나의 정보</h5>
								<div class="row">
									<div class="form-group col-2">
										<label>대학</label> <input type="text" class="form-control"
											value="${professor.colNm}" readonly>
									</div>
									<div class="form-group col-2 offset-1">
										<label>학과</label> <input type="text" class="form-control"
											value="${professor.depNm}" readonly>
									</div>
									<div class="form-group col-2 offset-1">
										<label>보직</label> <input type="text" class="form-control"
											value="${professor.empPos}" readonly>
									</div>
								</div>
								<div class="row">
									<div class="card-body col-5 container-fluid">
										<div class="row">
											<label>수강 강의</label>
										</div>
										<div class="row">
											<table
												class="table text-nowrap table-striped table-bordered table-sm text-center table-hover">
												<thead>
													<tr>
														<th>순번</th>
														<th>과목명</th>
														<th>담당교수</th>
														<th>평가여부</th>
													</tr>
												</thead>
												<tbody id="tbodyId">
													<c:if
														test="${evaluationList != null and evaluationList.size() > 0}">
														<c:forEach var="evaluation" items="${evaluationList}"
															varStatus="stat">
															<tr onclick="highlightRow(this,${evaluation.lecaCd})">
																<td>${stat.count}</td>
																<td>${evaluation.lecaNm}</td>
																<td>${evaluation.empNm}</td>
																<td class="evyn">${evaluation.evlqYn}</td>
															</tr>
														</c:forEach>
													</c:if>
													<c:if
														test="${evaluationList == null or evaluationList.size() == 0}">
														<tr>
															<td colspan="4">개설된 강의가 없습니다.</td>
														</tr>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
									<div class="card-body col-7 container-fluid">
										<div class="row">
											<label class="col-2">기타 의견</label>
										</div>
										<div class="row">
											<input id="stuNo" type="hidden" value="${student.stuNo}">
											<input id="lecaCd" type="hidden" value="0" />
											<table
												class="table table-striped table-bordered table-sm text-center col-12">
												<thead>
													<tr>
														<th class="align-middle" width="8%">순번</th>
														<th class="align-middle">기타의견</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="evaluation" items="${evaluationList}"
														varStatus="status">
														<tr>
															<td>${status.count}</td>
															<td class="text-left">${evaluation.evlqCon}</td>
														</tr>
													</c:forEach>
													<c:if test="${evaluationList == null or evaluationList.size() == 0 }">
														<tr>
															<td colspan="2">내용이 없습니다.</td>
														</tr>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>