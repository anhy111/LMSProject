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
						<h5>중점지표</h5>
					</div>
					<br>
					<div class="row pl-3 pr-3">
						<label>단과대학별 중점지표</label>
					</div>
					<div class="row">
						<div class="form-group col-2">
							<select id="college" class="select2bs4 select2-hidden-accessible"
								style="width: 100%;" aria-hidden="true">
								<option value="0">단과대학</option>
								<c:forEach var="college" items="${collegeList}">
									<option value="${college.colCd}">${college.colNm}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group col-2">
							<select id="department"
								class="select2bs4 select2-hidden-accessible"
								style="width: 100%;" aria-hidden="true">
								<option value="0">학과</option>
							</select>
						</div>
						<div class="form-group col-2 ">
							<select id="yr" class="select2bs4 select2-hidden-accessible"
								style="width: 100%;" aria-hidden="true">
								<option value="">학년</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-7">
							<div id="piechart" class="p-0 m-0"
								style="width: 700px; height: 500px;"></div>
						</div>
					</div>
					<div class="row pl-3 pr-3">
						<label>재적상태현황</label>
					</div>
					<div class="row">
						<div class="form-group col-2">
							<select id="collegeSt"
								class="select2bs4 select2-hidden-accessible"
								style="width: 100%;" aria-hidden="true">
								<option value="0">단과대학</option>
								<c:forEach var="college" items="${collegeList}">
									<option value="${college.colCd}">${college.colNm}</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="form-group col-2">
							<select id="departmentSt"
								class="select2bs4 select2-hidden-accessible"
								style="width: 100%;" aria-hidden="true">
								<option value="0">학과</option>
							</select>
						</div>
						
						<div class="form-group col-2 ">
							<select id="yrSt" class="select2bs4 select2-hidden-accessible"
								style="width: 100%;" aria-hidden="true">
								<option value="">학년</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>
						</div>
						<div class="row">
							<div class="col-7">
								<div id="columnchart_material" class="p-0 m-0" style="width: 800px; height: 500px;"></div>
							</div>
						</div>
					</div>
					<div class="row pl-3 pr-3">
						<label>수강평가평균</label>
					</div>
					<div class="row">
						<div class="form-group col-2">
							<select id="collegeAv"
								class="select2bs4 select2-hidden-accessible"
								style="width: 100%;" aria-hidden="true">
								<option value="0">단과대학</option>
								<c:forEach var="college" items="${collegeList}">
									<option value="${college.colCd}">${college.colNm}</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="form-group col-2">
							<select id="departmentAv"
								class="select2bs4 select2-hidden-accessible"
								style="width: 100%;" aria-hidden="true">
								<option value="0">학과</option>
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
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	$(function() {

		$('.select2').select2();
		//Initialize Select2 Elements
		$('.select2bs4').select2({
			theme : 'bootstrap4'
		});

		$("#college").on("change",function() {
			let data = {
				colCd : this.value
			};

			$.ajax({
				url : "/ketIndicators/departmentByCollege",
				type : "get",
				data : data,
				contentType : "application/json;utf-8",
				success : function(result) {
					let str = "";
					console.log(result);
					if (!result.length) {
						str += "<option value='0'>학과</option>";
						str += "<option value='0'>학과가 없습니다</option>";
					} else {
						str += "<option value='0'>학과</option>";
						$.each(result,function(p_inx,p_val) {
							str += `<option value='\${p_val.depCd}'>\${p_val.depNm}</option>`;
						});
					}
					$("#department").html(str);
				}
			});

		});
		$("#collegeSt").on("change",function() {
			let data = {
				colCd : this.value
			};

			$.ajax({
				url : "/ketIndicators/departmentByCollege",
				type : "get",
				data : data,
				contentType : "application/json;utf-8",
				success : function(result) {
					let str = "";
					console.log(result);
					if (!result.length) {
						str += "<option value='0'>학과</option>";
						str += "<option value='0'>학과가 없습니다</option>";
					} else {
						str += "<option value='0'>학과</option>";
						$.each(result,function(p_inx,p_val) {
							str += `<option value='\${p_val.depCd}'>\${p_val.depNm}</option>`;
						});
					}
					$("#departmentSt").html(str);
				}
			});

		});
	});
	
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	google.charts.load('current', {'packages':['bar']});
	google.charts.setOnLoadCallback(drawChart2);
	function drawChart() {

		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ], [ '입학', 11 ], [ '미달', 3 ], ]);

		var options = {
			title : '신입생 충원율',
			titleTextStyle : {
				fontSize : 20
			}
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('piechart'));

		chart.draw(data, options);
		
		
	}
	
	function drawChart2() {
	  var data = google.visualization.arrayToDataTable([
		  
	    ['Year', 'Sales', 'Expenses', 'Profit'],
	    ['2014', 1000, 400, 200],
	    ['2015', 1170, 460, 250],
	    ['2016', 660, 1120, 300],
	    ['2017', 1030, 540, 350]
	  ]);
	
	  var options = {
	    chart: {
	      title: 'Company Performance',
	    }
	  };
	  
	
	  var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
	
	  chart.draw(data, google.charts.Bar.convertOptions(options));
	}
</script>