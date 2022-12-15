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
				<div class="container-fluid">
					<br>
					<h3>학과관리</h3>
					<br>
					<h5>단과대학</h5>
					<div class="row p-3">
						<div class="form-group col-2">
							<select id="college" class="select2bs4 select2-hidden-accessible"
								style="width: 100%;">
								<option value="">모든단과대학</option>
								<c:forEach var="college" items="${collegeList}">
									<option value="${college.colNm}">${college.colNm}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script
	src="/resources/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/adminlte/plugins/select2/js/select2.full.min.js"></script>
<script src="/resources/adminlte/dist/js/adminlte.min.js"></script>
<script src="/resources/adminlte/dist/js/demo.js"></script>
<script type="text/javascript">
	$(function() {
		//Initialize Select2 Elements
		$('.select2').select2();

		//Initialize Select2 Elements
		$('.select2bs4').select2({
			theme : 'bootstrap4'
		});
	});
	
</script>