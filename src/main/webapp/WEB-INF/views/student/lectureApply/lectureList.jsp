<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<div class="container-fluid">
	<div class="row">
		<div class="card col-10 offset-1">
			<div class="card-header tab-regular">
				<ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link" id="card-tab-1"
						data-toggle="tab" href="#card-1" role="tab" aria-controls="card-1"
						aria-selected="false">수강신청</a></li>
					<li class="nav-item"><a class="nav-link active show"
						id="card-tab-2" data-toggle="tab" href="#card-2" role="tab"
						aria-controls="card-2" aria-selected="true">예비수강신청</a></li>
				</ul>
			</div>
			<div class="content-wrapper">
				<!-- Main content -->
				<section class="content">
					<div class="container-fluid">
						<h2 class="text-center display-4">Enhanced Search</h2>
						<form action="enhanced-results.html">
							<div class="row">
								<div class="col-md-10 offset-md-1">
									<div class="row">
										<div class="col-6">
											<div class="form-group">
												<label>Result Type:</label> <select class="select2"
													multiple="multiple" data-placeholder="Any"
													style="width: 100%;">
													<option>Text only</option>
													<option>Images</option>
													<option>Video</option>
												</select>
											</div>
										</div>
										<div class="col-3">
											<div class="form-group">
												<label>Sort Order:</label> <select class="select2"
													style="width: 100%;">
													<option selected>ASC</option>
													<option>DESC</option>
												</select>
											</div>
										</div>
										<div class="col-3">
											<div class="form-group">
												<label>Order By:</label> <select class="select2"
													style="width: 100%;">
													<option selected>Title</option>
													<option>Date</option>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="input-group input-group-lg">
											<input type="search" class="form-control form-control-lg"
												placeholder="Type your keywords here" value="Lorem ipsum">
											<div class="input-group-append">
												<button type="submit" class="btn btn-lg btn-default">
													<i class="fa fa-search"></i>
												</button>
											</div>
										</div>
									</div>
								</div> 
							</div>
						</form>
					</div>
				</section>
			</div>
			<div class="card-body table-responsive p-0" style="height: 700px;">
				<div class="container-fluid">
					<div class="row">

						<table
							class="table table-head-fixed text-nowrap mb-2 col-10 offset-1">
							<thead>
								<tr>
									<th>ID</th>
									<th>User</th>
									<th>Date</th>
									<th>Status</th>
									<th>Reason</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>183</td>
									<td>John Doe</td>
									<td>11-7-2014</td>
									<td><span class="tag tag-success">Approved</span></td>
									<td>Bacon ipsum dolor sit amet salami venison chicken
										flank fatback doner.</td>
								</tr>
								<tr>
									<td>219</td>
									<td>Alexander Pierce</td>
									<td>11-7-2014</td>
									<td><span class="tag tag-warning">Pending</span></td>
									<td>Bacon ipsum dolor sit amet salami venison chicken
										flank fatback doner.</td>
								</tr>
								<tr>
									<td>657</td>
									<td>Bob Doe</td>
									<td>11-7-2014</td>
									<td><span class="tag tag-primary">Approved</span></td>
									<td>Bacon ipsum dolor sit amet salami venison chicken
										flank fatback doner.</td>
								</tr>
								<tr>
									<td>175</td>
									<td>Mike Doe</td>
									<td>11-7-2014</td>
									<td><span class="tag tag-danger">Denied</span></td>
									<td>Bacon ipsum dolor sit amet salami venison chicken
										flank fatback doner.</td>
								</tr>
								<tr>
									<td>134</td>
									<td>Jim Doe</td>
									<td>11-7-2014</td>
									<td><span class="tag tag-success">Approved</span></td>
									<td>Bacon ipsum dolor sit amet salami venison chicken
										flank fatback doner.</td>
								</tr>
								<tr>
									<td>494</td>
									<td>Victoria Doe</td>
									<td>11-7-2014</td>
									<td><span class="tag tag-warning">Pending</span></td>
									<td>Bacon ipsum dolor sit amet salami venison chicken
										flank fatback doner.</td>
								</tr>
								<tr>
									<td>832</td>
									<td>Michael Doe</td>
									<td>11-7-2014</td>
									<td><span class="tag tag-primary">Approved</span></td>
									<td>Bacon ipsum dolor sit amet salami venison chicken
										flank fatback doner.</td>
								</tr>
								<tr>
									<td>982</td>
									<td>Rocky Doe</td>
									<td>11-7-2014</td>
									<td><span class="tag tag-danger">Denied</span></td>
									<td>Bacon ipsum dolor sit amet salami venison chicken
										flank fatback doner.</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<br>
		</div>
	</div>
</div>
<script>
	$(function() {
		$('.select2').select2()
	});
</script>