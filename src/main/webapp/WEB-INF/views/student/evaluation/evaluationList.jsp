<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<style type="text/css">
#evaInfo {
	background-color: ivory;
	border: 1px solid black;
	border-radius: 10px;
}
</style>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="card mb-0 col-10 offset-1">
				<div class="card-body container-fluid">
					<div class="row p-3">
						<h5>수강평가</h5>
					</div>
					<div class="row">
						<div class="card col-12 container">
							<div class="card-body">
								<h5>나의 정보</h5>
								<div class="row">
									<div class="form-group col-2">
										<label>학번</label> <input type="text" class="form-control"
											readonly>
									</div>
									<div class="form-group col-2 offset-1">
										<label>성명</label> <input type="text" class="form-control"
											readonly>
									</div>
									<div class="form-group col-2 offset-1">
										<label>소속</label> <input type="text" class="form-control"
											readonly>
									</div>
									<div class="form-group col-2 offset-1">
										<label>학년</label> <input type="text" class="form-control"
											readonly>
									</div>
								</div>
								<br> <br>
								<div class="row card p-3" id="evaInfo">
									<strong>본 강의 평가 설문지는 익명으로 작성되며, 이번 학기 교과목의 수업진행에 대한
										학생들의 솔직한 의견을 파악하여, 앞으로 보다 나은 강의를 하기 위한 목적으로 실시하는 것입니다.<br>
										따라서 본 학생 여러분은 각 평가 문항에 대하여 성실하고 진지하게 답변해 주시기 바랍니다.
									</strong>
								</div>
								<div class="row">
									<div class="card-body col-5 container-fluid">
										<div class="row">
											<label>수강한 강의</label>
										</div>
										<div class="row">
											<table
												class="table text-nowrap table-striped table-bordered table-sm text-center">
												<thead>
													<tr>
														<th>gg</th>
														<th>gg</th>
														<th>gg</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>ggg</td>
														<td>ggg</td>
														<td>ggg</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="card-body col-7">
										<div class="row">
											<label>강의 평가</label>
										</div>
										<div class="row">
											<table
												class="table text-nowrap table-striped table-bordered table-sm text-center">
												<thead>
													<tr>
														<th>순번</th>
														<th>평가문항</th>
														<th>매우그렇다</th>
														<th>그렇다</th>
														<th>보통이다</th>
														<th>아니다</th>
														<th>매우아니다</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="evaluation" items="evaluationList" varStatus="status">
													<tr>
														<td>${status.count}</td>
														<td>${evaluation.evlqCon}</td>
														<td>ggg</td>
														<td>ggg</td>
														<td>ggg</td>
														<td>ggg</td>
														<td>ggg</td>
													</tr>
													</c:forEach>
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
</div>