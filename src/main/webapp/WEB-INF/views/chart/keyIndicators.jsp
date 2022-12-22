<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
						<div class="form-group col-2 ">
							<select id="yr" class="select2bs4 select2-hidden-accessible" style="width: 100%;" aria-hidden="true">
								<option value="0">연도</option>
								<option value="2019">2019</option>
								<option value="2020">2020</option>
								<option value="2021">2021</option>
								<option value="2022">2022</option>
							</select>
						</div>
						<div class="form-group col-2">
							<select id="college" class="select2bs4 select2-hidden-accessible" style="width: 100%;" aria-hidden="true">
								<option value="0">단과대학</option>
								<c:forEach var="college" items="${collegeList}">
									<option value="${college.colCd}">${college.colNm}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-7">
							<div id="recruitmentRate" style="width: 1000px; height: 600px;"></div>
						</div>
					</div>
					<div class="row pl-3 pr-3">
						<label>재적상태현황</label>
					</div>
					<div class="row">
						<div class="form-group col-2 ">
							<select id="yrSt" class="select2bs4 select2-hidden-accessible" style="width: 100%;" aria-hidden="true">
								<option value="0">연도</option>
								<option value="2019">2019</option>
								<option value="2020">2020</option>
								<option value="2021">2021</option>
								<option value="2022">2022</option>
							</select>
						</div>
						<div class="form-group col-2">
							<select id="collegeSt" class="select2bs4 select2-hidden-accessible" style="width: 100%;" aria-hidden="true">
								<option value="0">단과대학</option>
								<c:forEach var="college" items="${collegeList}">
									<option value="${college.colCd}">${college.colNm}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-7">
							<div id="columnchart_material" class="p-0 m-0" style="width: 800px; height: 500px;"></div>
						</div>
					</div>
					<div class="row pl-3 pr-3">
						<label>전체교원 강의평가</label>
					</div>
					<div class="row">
						<div class="form-group col-2 ">
							<select id="yrAv" class="select2bs4 select2-hidden-accessible" style="width: 100%;" aria-hidden="true">
								<option value="0">연도</option>
								<option value="2019">2019</option>
								<option value="2020">2020</option>
								<option value="2021">2021</option>
								<option value="2022">2022</option>
							</select>
						</div>
						<div class="form-group col-2">
							<select id="collegeAv" class="select2bs4 select2-hidden-accessible" style="width: 100%;" aria-hidden="true">
								<option value="0">단과대학</option>
								<c:forEach var="college" items="${collegeList}">
									<option value="${college.colCd}">${college.colNm}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group col-2">
							<select id="departmentAv" class="select2bs4 select2-hidden-accessible" style="width: 100%;" aria-hidden="true">
								<option value="0">학과</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-8">
							<div id="barchart_values" style="width: 900px; height: 400px;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="/resources/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/adminlte/plugins/select2/js/select2.full.min.js"></script>
<script src="/resources/adminlte/dist/js/adminlte.min.js"></script>
<script src="/resources/adminlte/dist/js/demo.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	var rateData;


	$(function() {

		$('.select2').select2();
		//Initialize Select2 Elements
		$('.select2bs4').select2({
			theme : 'bootstrap4'
		});

		$("#yr").on("change",function(){
			google.charts.load('current', {
				'packages' : [ 'corechart' ]
			});
			google.charts.setOnLoadCallback(recruitmentRateChart);
		})
		
		$("#college").on("change", function() {
			google.charts.load('current', {
				'packages' : [ 'corechart' ]
			});
			google.charts.setOnLoadCallback(recruitmentRateChart);
		});
		$("#collegeSt").on("change", function() {

		});
		$("#collegeAv").on("change", function() {
			departmentByCollege.call(this, "departmentAv");
		})
	});

	function departmentByCollege(p_id) {
		let data = {
			colCd : this.value
		};

		$
				.ajax({
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
							$
									.each(
											result,
											function(p_inx, p_val) {
												str += `<option value='\${p_val.depCd}'>\${p_val.depNm}</option>`;
											});
						}
						$("#" + p_id).html(str);
					}
				});
	}

	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(recruitmentRateChart);
	google.charts.load('current', {
		'packages' : [ 'bar' ]
	});
	google.charts.setOnLoadCallback(drawChart2);
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart3);

	function recruitmentRateChart() {
		
		// 2차원배열 [[차트이름, 범례1, 범례2]
		//		,[행명, 데이터1, 데이터2]
		//		,[행명, 데이터1, 데이터2]]
		let ajaxData = {
				yr : $("#yr").val(),
				colCd : $("#college").val()
		}
		let arr = [["신입생 충원율","입학생","미달"]];
		$.ajax({
			url : "/ketIndicators/recruitmentRateChart",
			type : "get",
			success : function(result){
				console.log(result);
				
				$.each(result, function(p_inx, keyIndicator){
					arr.push([
						keyIndicator.colNm, keyIndicator.recruitmentRate, keyIndicator.capacity-keyIndicator.recruitmentRate == 0 ? 1 : keyIndicator.capacity-keyIndicator.recruitmentRate
					]);
				});
				rateData.removeRow(1);
				rateData = google.visualization.arrayToDataTable(arr);

		        var options_fullStacked = {
		                isStacked: 'percent',
		                height: 600,
		                legend: {position: 'top', maxLines: 4},
		                hAxis: {
		                  minValue: 0,
		                  ticks: [0, .25, .5, .75, 1]
		                }
		              };
		        var view = new google.visualization.DataView(data);
		        view.setColumns([0, 1,
		                         { calc: "stringify",
		                           sourceColumn: 1,
		                           type: "string",
		                           role: "annotation" },
		                         2]);
				var chart = new google.visualization.BarChart(document
						.getElementById('recruitmentRate'));
				
				chart.draw(data, options_fullStacked);
			}
		})
	
		

	}

	function drawChart2() {
		var data = google.visualization.arrayToDataTable([

		[ 'Year', 'Sales', 'Expenses', 'Profit' ], [ '2014', 1000, 400, 200 ],
				[ '2015', 1170, 460, 250 ], [ '2016', 660, 1120, 300 ],
				[ '2017', 1030, 540, 350 ] ]);

		var options = {
			chart : {
				title : 'Company Performance'
			}
		};

		var chart = new google.charts.Bar(document
				.getElementById('columnchart_material'));

		chart.draw(data, google.charts.Bar.convertOptions(options));
	}

	function drawChart3() {
		var data = google.visualization.arrayToDataTable([
				[ "Element", "Density", {
					role : "style"
				} ], [ "Copper", 8.94, "#b87333" ],
				[ "Silver", 10.49, "silver" ], [ "Gold", 19.30, "gold" ],
				[ "Platinum", 21.45, "color: #e5e4e2" ] ]);

		var view = new google.visualization.DataView(data);
		view.setColumns([ 0, 1, {
			calc : "stringify",
			sourceColumn : 1,
			type : "string",
			role : "annotation"
		}, 2 ]);

		var options = {
			title : "Density of Precious Metals, in g/cm^3",
			width : 600,
			height : 400,
			bar : {
				groupWidth : "95%"
			},
			legend : {
				position : "none"
			},
		};
		var chart = new google.visualization.BarChart(document
				.getElementById("barchart_values"));
		chart.draw(view, options);
	}
</script>