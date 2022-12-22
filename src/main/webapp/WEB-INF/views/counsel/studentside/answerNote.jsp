<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"
	integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<!DOCTYPE html>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<head>
<title>보고서</title>
<meta http_quiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="/resources/css/answerNote_style.css">
</head>
<body>
	<input type="hidden" value="${answerDetail.cnslCd }" />
	<div class="hpa" style="width: 210mm; height: 297mm;">
		<div class="hcD" style="left: 26.99mm; top: 26.99mm;">
			<div class="hcI">
				<div class="hls ps11"
					style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 156.01mm;"></div>
				<div class="hls ps11"
					style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 3.35mm; height: 3.53mm; width: 156.01mm;"></div>
				<div class="hls ps11"
					style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 6.88mm; height: 3.53mm; width: 156.01mm;"></div>
				<div class="hls ps11"
					style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 10.41mm; height: 3.53mm; width: 156.01mm;"></div>
			</div>
		</div>
		<div class="htb"
			style="left: 27.99mm; width: 155.13mm; top: 61.93mm; height: 112.64mm;">
			<svg class="hs" viewBox="-2.50 -2.50 160.13 117.64"
				style="left: -2.50mm; top: -2.50mm; width: 160.13mm; height: 117.64mm;">
				<defs>
				<pattern id="w_00" width="10" height="10"
					patternUnits="userSpaceOnUse">
				<rect width="10" height="10" fill="rgb(223,230,247)" /></pattern></defs>
				<path fill="url(#w_00)" d="M0,0L24.09,0L24.09,11.91L0,11.91L0,0Z "></path>
				<path fill="url(#w_00)"
					d="M93.58,0L122.80,0L122.80,11.91L93.58,11.91L93.58,0Z "></path>
				<path fill="url(#w_00)"
					d="M0,11.91L24.09,11.91L24.09,23.83L0,23.83L0,11.91Z "></path>
				<path fill="url(#w_00)"
					d="M93.58,11.91L122.80,11.91L122.80,23.83L93.58,23.83L93.58,11.91Z "></path>
				<path fill="url(#w_00)"
					d="M0,23.83L24.09,23.83L24.09,58.46L0,58.46L0,23.83Z "></path>
				<path fill="url(#w_00)"
					d="M0,58.46L24.09,58.46L24.09,110.65L0,110.65L0,58.46Z "></path>
				<path d="M0,0 L0,110.65"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
				<path d="M24.09,0 L24.09,110.65"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
				<path d="M52.12,0 L52.12,11.92"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
				<path d="M93.58,0 L93.58,23.83"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
				<path d="M122.80,0 L122.80,23.83"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
				<path d="M153.14,0 L153.14,110.65"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
				<path d="M-0.06,0 L153.20,0"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
				<path d="M-0.06,11.91 L153.20,11.91"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
				<path d="M-0.06,23.83 L153.20,23.83"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
				<path d="M-0.06,58.46 L153.20,58.46"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
				<path d="M-0.06,110.65 L153.20,110.65"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
				<path d="M153.14,0 L153.14,110.65"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
				<path d="M0,0 L0,110.65"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
				<path d="M-0.06,110.65 L153.20,110.65"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
				<path d="M-0.06,0 L153.20,0"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path></svg>
			<div class="hce"
				style="left: 0mm; top: 0mm; width: 24.09mm; height: 11.91mm;">
				<div class="hcD" style="left: 1.80mm; top: 0.50mm;">
					<div class="hcI" style="top: 3.69mm;">
						<div class="hls ps13"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 20.49mm;">
							<span class="hrt cs4">상담자</span>
						</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 24.09mm; top: 0mm; width: 28.02mm; height: 11.91mm;">
				<div class="hcD" style="left: 1.80mm; top: 0.50mm;">
					<div class="hcI" style="top: 3.69mm;">
						<div class="hls ps13"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 24.41mm;">
							<span id="stuNm" class="hrt cs4"
								data-value="${answerDetail.stuNm }">&nbsp;${answerDetail.stuNm }</span>
						</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 52.12mm; top: 0mm; width: 41.47mm; height: 11.91mm;">
				<div class="hcD" style="left: 1.80mm; top: 0.50mm;">
					<div class="hcI" style="top: 3.69mm;">
						<div class="hls ps14"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 37.86mm;"></div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 93.58mm; top: 0mm; width: 29.22mm; height: 11.91mm;">
				<div class="hcD" style="left: 1.80mm; top: 0.50mm;">
					<div class="hcI" style="top: 3.69mm;">
						<div class="hls ps13"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 25.61mm;">
							<span class="hrt cs4">상담 날짜</span>
						</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 122.80mm; top: 0mm; width: 30.34mm; height: 11.91mm;">
				<div class="hcD" style="left: 1.80mm; top: 0.50mm;">
					<div class="hcI" style="top: 3.69mm;">
						<div class="hls ps13"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 26.74mm;">
							<span class="hrt cs6"><fmt:formatDate
									value="${answerDetail.cnslDt}" pattern="yyyy-MM-dd" /></span>
						</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 0mm; top: 11.91mm; width: 24.09mm; height: 11.91mm;">
				<div class="hcD" style="left: 1.80mm; top: 0.50mm;">
					<div class="hcI" style="top: 3.69mm;">
						<div class="hls ps13"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 20.49mm;">
							<span class="hrt cs4">상담 제목</span>
						</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 24.09mm; top: 11.91mm; width: 69.49mm; height: 11.91mm;">
				<div class="hcD" style="left: 1.80mm; top: 0.50mm;">
					<div class="hcI" style="top: 3.69mm;">
						<div class="hls ps13"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 65.88mm;">
							<span class="hrt cs4">${answerDetail.cnslTtl }</span>
						</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 93.58mm; top: 11.91mm; width: 29.22mm; height: 11.91mm;">
				<div class="hcD" style="left: 1.80mm; top: 0.50mm;">
					<div class="hcI" style="top: 3.69mm;">
						<div class="hls ps13"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 25.61mm;">
							<span class="hrt cs4">카테고리</span>
						</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 122.80mm; top: 11.91mm; width: 30.34mm; height: 11.91mm;">
				<div class="hcD" style="left: 1.80mm; top: 0.50mm;">
					<div class="hcI" style="top: 3.69mm;">
						<div class="hls ps13"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 26.74mm;">
							<span class="hrt cs4">${answerDetail.cnslCate }</span>
						</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 0mm; top: 23.83mm; width: 24.09mm; height: 34.63mm;">
				<div class="hcD" style="left: 1.80mm; top: 0.50mm;">
					<div class="hcI" style="top: 15.05mm;">
						<div class="hls ps13"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 20.49mm;">
							<span class="hrt cs4">상담 내용</span>
						</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 24.09mm; top: 23.83mm; width: 129.04mm; height: 34.63mm;">
				<textarea class="hrt cs4" rows="9" cols="67"
					style="text-align: center; line-height: 10;">${answerDetail.cnslCon }</textarea>
			</div>
			<div class="hce"
				style="left: 0mm; top: 58.46mm; width: 24.09mm; height: 52.19mm;">
				<div class="hcD" style="left: 1.80mm; top: 0.50mm;">
					<div class="hcI" style="top: 23.83mm;">
						<div class="hls ps13"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 20.49mm;">
							<span class="hrt cs4">답변 내용</span>
						</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 24.09mm; top: 58.46mm; width: 129.04mm; height: 52.19mm;">
				<textarea class="hrt cs4" rows="13" cols="67"
					style="text-align: center; line-height: 10;">${answerDetail.cnslRpl }</textarea>
			</div>
			</div>
			<div class="hsR"
				style="top: 51.62mm; left: 80.31mm; width: 50.37mm; height: 0.99mm;">
				<svg class="hs" viewBox="-0.15 -0.15 50.66 1.29" class="hs"
					style="left: -0.15mm; top: -0.15mm; width: 50.66mm; height: 1.29mm;">
				<path d="M0,0.33 L49.37,0.33"
						style="stroke:#000000;stroke-linecap:butt;stroke-width:0.33;"></path>
				<path d="M0,-0.33 L49.37,-0.33"
						style="stroke:#000000;stroke-linecap:butt;stroke-width:0.33;"></path></svg>
			</div>
			<div class="hsR"
				style="top: 41.37mm; left: 83.06mm; width: 46.74mm; height: 8.69mm;">
				<div class="hsT"
					style="left: -0.06mm; top: -0.06mm; width: 46.74mm; height: 8.69mm;">
					<svg class="hs" viewBox="-0.30 -0.30 47.33 9.29"
						style="left: -0.15mm; top: -0.15mm; width: 47.03mm; height: 8.99mm;">
					<defs>
					<pattern id="w_01" width="10" height="10"
							patternUnits="userSpaceOnUse">
					<rect width="10" height="10" fill="rgb(255,255,255)" /></pattern></defs>
					<path fill="url(#w_01)"
							d="M0.06,0.06L46.68,0.06L46.68,8.64L0.06,8.64L0.06,0.06Z "
							style="stroke:#FFFFFF;stroke-linecap:butt;stroke-width:0.12;"></path></svg>
					<div class="hcD" style="left: 1.05mm; top: 1.05mm;">
						<div class="hcI" style="top: 1mm;">
							<div class="hls ps13"
								style="line-height: 3.76mm; white-space: nowrap; left: 0mm; top: -0.23mm; height: 4.59mm; width: 44.62mm;">
								<span class="hrt cs7">상담 기록 확인서</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="hsR"
				style="top: 175.76mm; left: 133.84mm; width: 48.11mm; height: 8.69mm;">
				<div class="hsT"
					style="left: -0.06mm; top: -0.06mm; width: 48.11mm; height: 8.69mm;">
					<svg class="hs" viewBox="-0.30 -0.30 48.70 9.29"
						style="left: -0.15mm; top: -0.15mm; width: 48.40mm; height: 8.99mm;">
					<path fill="url(#w_01)"
							d="M0.06,0.06L48.05,0.06L48.05,8.64L0.06,8.64L0.06,0.06Z "
							style="stroke:#FFFFFF;stroke-linecap:butt;stroke-width:0.12;"></path></svg>
					<div class="hcD" style="left: 1.05mm; top: 1.05mm;">
						<div class="hcI" style="top: 1.53mm;">
							<div class="hls ps13"
								style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 45.99mm;">
								<span class="hrt cs6">담당교수 :
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（인)</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="hsR"
				style="top: 176.62mm; left: 154.11mm; width: 15.35mm; height: 6.98mm;">
				<div class="hsT"
					style="left: -0.06mm; top: -0.06mm; width: 15.35mm; height: 6.98mm;">
					<svg class="hs" viewBox="-0.30 -0.30 15.95 7.57"
						style="left: -0.15mm; top: -0.15mm; width: 15.65mm; height: 7.27mm;">
					<path fill="url(#w_01)"
							d="M0.06,0.06L15.30,0.06L15.30,6.92L0.06,6.92L0.06,0.06Z "
							style="stroke:#000000;stroke-opacity:0.0;stroke-linecap:butt;stroke-width:0.12;"></path></svg>
					<div class="hcD" style="left: 1.05mm; top: 1.05mm;">
						<div class="hcI" style="top: 0.67mm;">
							<div class="hls ps12"
								style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm; height: 3.53mm; width: 13.24mm;">
								<span class="hrt cs6">&nbsp;${answerDetail.empNm }</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<a id="pdfDown" class="btn btn-sm btn-outline-primary">PDF다운</a> <a
					id="close" class="btn btn-sm btn-outline-warning">닫기</a>
			</div>
		</div>
	<script type="text/javascript">
		let elements = "";
		let stuNm = "";
		$(function() {
			elements = document.querySelector('body');
			stuNm = document.querySelector("#stuNm");
			$("#close").on("click", function() {
				window.close();
			})

			$("#pdfDown").on("click", function() {

				// Get the element.
				$("#pdfDown").hide();
				$("#close").hide();
				// Generate the PDF.
				html2pdf().from(elements).set({
					margin : 0,
					filename : stuNm.dataset.value + ' 상담기록확인서_.pdf',
					html2canvas : {
						scale : 0.79
					},
					jsPDF : {
						orientation : 'portrait',
						unit : 'mm',
						format : 'a4',
						compressPDF : true
					}
				}).save();
				setTimeout(function() {
					$("#pdfDown").show();
					$("#close").show();
				}, 500);

			})
		})
	</script>
</body>
</html>