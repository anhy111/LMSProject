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
							<div id="recordState" class="p-0 m-0" style="width: 1200px; height: 500px;"></div>
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
			recruitmentRateChart();
		});
		
		$("#yrSt").on("change",function(){
			recordStateChart();
		});
		
		$("#yrAv").on("change",function(){
			evaluationChart();
		});
		
		$("#departmentAv").on("change",function(){
			evaluationChart();
		});
		
		$("#college").on("change", function() {
			recruitmentRateChart();
		});
		$("#collegeSt").on("change", function() {
			recordStateChart();
		});
		$("#collegeAv").on("change", function() {
			departmentByCollege.call(this, "departmentAv");
			evaluationChart();
		})
	});

	function departmentByCollege(p_id) {
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
					$.each(result,function(p_inx, p_val) {
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
	google.charts.setOnLoadCallback(recordStateChart);
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(evaluationChart);

	function recruitmentRateChart() {
		
		// 2차원배열 [[차트이름, 범례1, 범례2]
		//		,[행명, 데이터1, 데이터2]
		//		,[행명, 데이터1, 데이터2]]
		
		let colCd = $("#college").val();
		let ajaxData = {
				yr : $("#yr").val(),
				colCd : colCd
		}
		
		$.ajax({
			url : "/ketIndicators/recruitmentRateChart",
			type : "get",
			data : ajaxData,
			success : function(result){
				let data = new google.visualization.DataTable();
				data.addColumn("string","신입생 충원율");
				data.addColumn("number","입학생");
				data.addColumn("number","미달");
				let arr = [];
				$.each(result, function(p_inx, keyIndicator){
					if(colCd == 0){
						arr.push([
							  keyIndicator.colNm
							, keyIndicator.recruitmentRate
							, keyIndicator.capacity-keyIndicator.recruitmentRate == 0 ? 1 : keyIndicator.capacity-keyIndicator.recruitmentRate
						]);
						return;
					}
					arr.push([
						keyIndicator.depNm, keyIndicator.recruitmentRate, keyIndicator.capacity-keyIndicator.recruitmentRate == 0 ? 1 : keyIndicator.capacity-keyIndicator.recruitmentRate
					]);
					
				});
				data.addRows(arr);
				
				var options_fullStacked = {
		                isStacked: 'percent',
		                height: 600,
		                legend: {position: 'top', maxLines: 4},
		                hAxis: {
		                  minValue: 0,
		                  ticks: [0, .25, .5, .75, 1]
		                },
		                animation:{
		                    duration: 1500,
		                    easing: 'out',
		                    startup : "true"
		                }
		        };
				var view = new google.visualization.DataView(data);
		        view.setColumns([0, 1,
		                         { calc: "stringify",
		                           sourceColumn: 1,
		                           type: "string",
		                           role: "annotation" },
		                         2]);
				recruitChart = new google.visualization.BarChart(document
						.getElementById('recruitmentRate'));
				recruitChart.draw(data, options_fullStacked);
			}
		})
	}
	


	function recordStateChart() {
		
		let colCd = $("#collegeSt").val()
		let ajaxData = {
				yr : $("#yrSt").val(),
				colCd : colCd
		}
		
		$.ajax({
			url : "/ketIndicators/recordStateChart",
			type : "get",
			data : ajaxData,
			success : function(result){
				console.log(result);
				let data = new google.visualization.DataTable();
				data.addColumn("string","학생 학적현황");
				data.addColumn("number","총학생");
				data.addColumn("number","재학");
				data.addColumn("number","휴학");
				data.addColumn("number","제적");
				data.addColumn("number","졸업");
				let arr = [];
				let maxData = 1;	// 차트 렌더링시 max에 맞춰서 랜더링
				
				for(let i=0; i<result.length; i++){
					if(maxData < result[i].allStu){
						maxData = result[i].allStu;
					}
				}
				
				$.each(result, function(p_inx, keyIndicator){
					if(colCd == 0){
						arr.push([
							  keyIndicator.colNm
						  	, keyIndicator.allStu == 0 ? maxData * 0.02 : keyIndicator.allStu
							, keyIndicator.inSchool == 0 ? maxData * 0.02 : keyIndicator.inSchool
							, keyIndicator.leaveOfAbsence == 0 ? maxData * 0.02 : keyIndicator.leaveOfAbsence
							, keyIndicator.expelled == 0 ? maxData * 0.02 : keyIndicator.expelled
							, keyIndicator.graduate == 0 ? maxData * 0.02 : keyIndicator.graduate
						]);
						return;
					}
					arr.push([
							  keyIndicator.depNm
							, keyIndicator.allStu == 0 ? maxData * 0.02 : keyIndicator.allStu
							, keyIndicator.inSchool == 0 ? maxData * 0.02 : keyIndicator.inSchool
							, keyIndicator.leaveOfAbsence == 0 ? maxData * 0.02 : keyIndicator.leaveOfAbsence
							, keyIndicator.expelled == 0 ? maxData * 0.02 : keyIndicator.expelled
							, keyIndicator.graduate == 0 ? maxData * 0.02 : keyIndicator.graduate
					]);
					
				});
				console.log(arr);
				data.addRows(arr);
				var options = {
					vAxis: {
						viewWindow:{
							max : maxData * 1.2,
							min : 0
						}
					},
		            animation:{
		                duration: 1500,
		                easing: 'out',
		                startup : "true"
		            }
				};

				var chart = new google.charts.Bar(document
						.getElementById('recordState'));
				chart.draw(data, google.charts.Bar.convertOptions(options));
			}
		});
	}

	function evaluationChart() {
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
			animation:{
		        duration: 1000,
		        easing: 'out',
	      	}
		};
		var chart = new google.visualization.BarChart(document
				.getElementById("barchart_values"));
		chart.draw(view, options);
	}
</script>