<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="card card-solid">
	<div class="card-body pb-0">
		<div class="row">
			<c:forEach var="collegeList" items="${collegeList}">
				<div
					class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
					<div class="card bg-light d-flex flex-fill">
						<div class="card-header text-muted border-bottom-0"></div>
						<div class="card-body pt-0">
							<div class="row">
								<div class="col-7">
									<h2 class="lead">
										<!-- 단과대 코드는 히든으로 출력 -->
										<input type="hidden" name="colCd"
											value="${collegeList.colCd }">
										<!-- 단과대학명 -->
										<b>${collegeList.colNm}</b>
									</h2>
									<p class="text-muted text-sm">
										<!-- 단과대설명 -->
										<b>About: </b> ${collegeList.colDes}
									</p>
									<ul class="ml-4 mb-0 fa-ul text-muted">
										<li class="small"><span class="fa-li"><i
												class="fas fa-lg fa-building"></i></span> 위치 :
											${collegeList.colAddr}</li>
										<li class="small"><span class="fa-li"><i
												class="fas fa-lg fa-phone"></i></span> 연락처 : ${collegeList.colTel}</li>
									</ul>
								</div>
								<div class="col-5 text-center">
									<!-- 단과대 이미지URL -->
									<img src="/upload/college/${collegeList.colImgUrl }">
								</div>
							</div>
						</div>
						<div class="card-footer">
							<div class="text-right">
								<a href="#" class="btn btn-sm bg-teal"> <i
									class="fas fa-comments"></i>
								</a> 
								<a href="/college/detail?colCd=${collegeList.colCd }" class="btn btn-sm btn-primary"> 상세보기
								</a>
								<!-- 관리자만 볼 수 있는 버튼으로 구현 예정 -->
								<a id="collegeDelete"  href="/college/delete?colCd=${collegeList.colCd }" class="btn btn-sm btn-danger"> 정보삭제
								</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			
		</div>
	</div>

	<div class="card-footer">
			<div class="col-2">
				<!-- 관리자만 볼 수 있는 버튼으로 구현 예정 -->
				<a id="collegeInsert"  href="/college/regist" class="btn btn-sm btn-info"> 단과대등록</a>
			</div>
		<nav aria-label="Contacts Page Navigation">
			<ul class="pagination justify-content-center m-0">
				<!-- 				<li class="page-item active"><a class="page-link" href="#">1</a></li> -->
				<!-- 				<li class="page-item"><a class="page-link" href="#">2</a></li> -->
				<!-- 				<li class="page-item"><a class="page-link" href="#">3</a></li> -->
				<!-- 				<li class="page-item"><a class="page-link" href="#">4</a></li> -->
				<!-- 				<li class="page-item"><a class="page-link" href="#">5</a></li> -->
				<!-- 				<li class="page-item"><a class="page-link" href="#">6</a></li> -->
				<!-- 				<li class="page-item"><a class="page-link" href="#">7</a></li> -->
				<!-- 				<li class="page-item"><a class="page-link" href="#">8</a></li> -->
			</ul>
		</nav>
	</div>

</div>
