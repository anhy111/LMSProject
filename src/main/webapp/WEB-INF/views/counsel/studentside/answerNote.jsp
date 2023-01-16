<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/answerlCounsel_style.css">
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<body>
	<div class="hpa" id="answerPdf" style="width: 210mm; height: 297mm;">
		<div class="hcD" style="left: 25mm; top: 29.99mm;">
			<div class="hcI">
				<div class="hls ps12"
					style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm;  width: 0mm;"></div>
			</div>
		</div>
		<div class="htb"
			style="left: 26mm; width: 160.01mm; top: 30.99mm; height: 246.40mm;">
			<svg class="hs" viewBox="-2.50 -2.50 165 251.40"
				style="left: -2.50mm; top: -2.50mm; width: 165mm; height: 251.40mm;">
				<path d="M0,28.62 L0,38.63"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M0,43.85 L0,210.17"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M17.35,28.62 L17.35,38.63"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M59.42,28.62 L59.42,38.63"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M70.27,28.62 L70.27,38.63"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M126.92,172.31 L126.92,210.17"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M129.07,3.11 L129.07,24.10"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M138.09,3.11 L138.09,24.10"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M158.01,3.11 L158.01,24.10"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M158.01,28.62 L158.01,38.63"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M158.01,43.85 L158.01,210.17"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M129.01,3.11 L158.16,3.11"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M137.94,10.34 L158.16,10.34"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M128.92,24.10 L158.16,24.10"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M-0.06,28.62 L158.16,28.62"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M-0.15,38.62 L158.16,38.62"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M-0.06,43.85 L158.16,43.85"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M-0.15,53.85 L158.16,53.85"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
				<path d="M-0.15,102.95 L158.16,102.95"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
				<path d="M-0.15,102.95 L158.16,102.95"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M-0.15,116.29 L158.16,116.29"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
				<path d="M-0.15,116.29 L158.16,116.29"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M-0.15,172.31 L158.16,172.31"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M-0.15,185.81 L158.16,185.81"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M-0.15,210.17 L158.16,210.17"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M158.01,3.11 L158.01,24.10"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M158.01,28.62 L158.01,38.63"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M158.01,43.85 L158.01,210.17"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M0,43.85 L0,210.17"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M0,28.62 L0,38.63"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M-0.15,210.17 L158.16,210.17"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path>
				<path d="M129.01,3.11 L158.16,3.11"
					style="stroke:#000000;stroke-linecap:butt;stroke-width:0.30;"></path></svg>
			<div class="hce"
				style="left: 0mm; top: 0mm; width: 129.07mm; height: 24.10mm;">
				<div class="hcD" >
					<div class="hcI" style="top: 8.02mm;">
						<div class="hls ps13"
							style="line-height: 6.28mm; white-space: nowrap; left: 0mm; top: -0.35mm; height: 7.06mm; width: 128.07mm;">
							<span class="hrt cs11">학생 상담일지</span>
						</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 129.07mm; top: 0mm; width: 28.94mm; height: 3.11mm;">
				<div class="hcD" >
					<div class="hcI">
						<div class="hls ps12"
							style="line-height: 1.59mm; white-space: nowrap; left: 0mm; top: -0.11mm; height: 2.12mm; width: 27.94mm;"></div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 129.07mm; top: 3.11mm; width: 9.02mm; height: 20.99mm;">
				<div class="hcD" >
					<div class="hcI" style="top: 5.41mm;">
						<div class="hls ps13"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm;  width: 8.02mm;">
							<span class="hrt cs12">결</span>
						</div>
						<div class="hls ps13"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: 5.47mm;  width: 8.02mm;">
							<span class="hrt cs12">재</span>
						</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 138.09mm; top: 3.11mm; width: 19.92mm; height: 7.22mm;">
				<div class="hcD" >
					<div class="hcI" style="top: 1.35mm;">
						<div class="hls ps13"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm;  width: 18.92mm;">
							<span class="hrt cs12 text-center">담당교수</span>
						</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 138.09mm; top: 10.34mm; width: 19.92mm; height: 13.76mm;">
				<div class="hcD" >
					<div class="hcI" style="top: 4.62mm;">
						<div class="hls ps13 text-center"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm;  width: 18.92mm;">${answerDetail.empNm }</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 0mm; top: 24.10mm; width: 158.01mm; height: 4.52mm;">
				<div class="hcD" >
					<div class="hcI">
						<div class="hls ps12"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm;  width: 157.01mm;"></div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 0mm; top: 28.62mm; width: 17.35mm; height: 10mm;">
				<div class="hcD" >
					<div class="hcI" style="top: 2.74mm;">
						<div class="hls ps13"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm;  width: 16.35mm;">
							<span class="hrt cs12 text-center">학생명</span>
						</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 17.35mm; top: 28.62mm; width: 42.07mm; height: 10mm;">
				<div class="hcD" >
					<div class="hcI" style="top: 2.74mm;">
						<div class="hls ps13 text-center"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm;  width: 41.06mm;" id="stuNm">${answerDetail.stuNm }</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 59.42mm; top: 28.62mm; width: 10.85mm; height: 10mm;">
				<div class="hcD" >
					<div class="hcI" style="top: 2.74mm;">
						<div class="hls ps13"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm;  width: 9.85mm;">
							<span class="hrt cs12 text-center">일시</span>
						</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 70.27mm; top: 28.62mm; width: 87.74mm; height: 10mm;">
				<div class="hcD" >
					<div class="hcI" style="top: 2.74mm;">
						<div class="hls ps13 text-center" id="cnslDt"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm;  width: 86.74mm;">
							<fmt:formatDate value="${answerDetail.cnslDt }" pattern="yy/MM/dd" /></div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 0mm; top: 38.62mm; width: 158.01mm; height: 5.23mm;">
				<div class="hcD" >
					<div class="hcI">
						<div class="hls ps12"
							style="line-height: 3.43mm; white-space: nowrap; left: 0mm; top: -0.21mm; height: 4.23mm; width: 157.01mm;"></div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 0mm; top: 43.85mm; width: 158.01mm; height: 10mm;">
				<div class="hcD" >
					<div class="hcI" style="top: 2.74mm;">
						<div class="hls ps13"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm;  width: 157.01mm;">
							<span class="hrt cs12">상담 내용</span>
						</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 0mm; top: 53.85mm; width: 158.01mm; height: 49.10mm;">
				<div class="hcD" >
					<div class="hcI" style="top: 22.29mm;">
						<div class="hls ps14 text-center"
							style="line-height: 2.79mm; white-space: nowrap;  top: -0.18mm;  width: 149.96mm;">${answerDetail.cnslCon }</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 0mm; top: 102.95mm; width: 158.01mm; height: 13.34mm;">
				<div class="hcD" >
					<div class="hcI" style="top: 4.41mm;">
						<div class="hls ps15"
							style="line-height: 2.79mm; white-space: nowrap;  top: -0.18mm;  width: 149.96mm;">
							<span class="hrt cs12">담당자 의견</span>
						</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 0mm; top: 116.29mm; width: 158.01mm; height: 56.01mm;">
				<div class="hcD" >
					<div class="hcI" style="top: 25.75mm;">
						<div class="hls ps14 text-center"
							style="line-height: 2.79mm; white-space: nowrap;  top: -0.18mm;  width: 149.96mm;">${answerDetail.cnslRpl }</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 0mm; top: 172.31mm; width: 126.92mm; height: 13.51mm;">
				<div class="hcD" >
					<div class="hcI" style="top: 4.49mm;">
						<div class="hls ps13"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm;  width: 125.93mm;">
							<span class="hrt cs12">처리결과</span>
						</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 126.92mm; top: 172.31mm; width: 31.09mm; height: 13.51mm;">
				<div class="hcD" >
					<div class="hcI" style="top: 4.49mm;">
						<div class="hls ps13"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm;  width: 30.08mm;">
							<span class="hrt cs12">구&nbsp;분</span>
						</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 0mm; top: 185.81mm; width: 126.92mm; height: 24.36mm;">
				<div class="hcD" >
					<div class="hcI" style="top: 9.92mm;">
					<c:if test="${answerDetail.cnslYn eq '승인'}">
						<div class="hls ps14 text-center" style="line-height: 2.79mm; white-space: nowrap;  top: -0.18mm;  width: 118.87mm;"style="color:blue;">승인</div>
					</c:if>
					<c:if test="${answerDetail.cnslYn eq '반려'}">
						<div class="hls ps14 text-center" style="line-height: 2.79mm; white-space: nowrap;  top: -0.18mm;  width: 118.87mm;"style="color:red;">반려</div>
					</c:if>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 126.92mm; top: 185.81mm; width: 31.09mm; height: 24.36mm;">
				<div class="hcD" >
					<div class="hcI" style="top: 9.92mm;">
						<div class="hls ps13"
							style="line-height: 2.79mm; white-space: nowrap; left: 0mm; top: -0.18mm;  width: 30.08mm;">${answerDetail.cnslCate}</div>
					</div>
				</div>
			</div>
			<div class="hce"
				style="left: 0mm; top: 210.17mm; width: 158.01mm; height: 34.23mm;">
				<div class="hcD" >
					<div class="hcI" style="top: 6.99mm;">
					<input type="hidden" id="cnslCd" />
						<div class="hls ps16"
							style="line-height: 3.76mm; white-space: nowrap; left: 0mm; top: -0.23mm; height: 4.59mm; width: 157.01mm;"></div>
						<div class="hls ps16"
							style="line-height: 3.76mm; white-space: nowrap; left: 0mm; top: 7.11mm; height: 4.59mm; width: 157.01mm;"></div>
						<div class="hls ps16"
							style="line-height: 3.76mm; white-space: nowrap; left: 0mm; top: 14.45mm; height: 4.59mm; width: 157.01mm;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<button id="savePdfBtn" class="btn btn-lg btn-success">PDF 파일 다운</button>
	<script type="text/javascript">
	$("#savePdfBtn").on("click", function(){
		//저장 영역 div id
		html2canvas($('#answerPdf')[0], {
			//logging : true,		// 디버그 목적 로그
			//proxy: "html2canvasproxy.php",
			allowTaint : true, // cross-origin allow
			useCORS : true, // CORS 사용한 서버로부터 이미지 로드할 것인지 여부
			scale : 2
		// 기본 96dpi에서 해상도를 두 배로 증가
		}).then(
				function(canvas) {
					// 캔버스를 이미지로 변환
					var imgData = canvas.toDataURL('image/png');
					var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
					var pageHeight = imgWidth * 1.414; // 출력 페이지 세로 길이 계산 A4 기준
					var imgHeight = canvas.height * imgWidth / canvas.width;
					var heightLeft = imgHeight;
					var margin = 10; // 출력 페이지 여백설정
					var doc = new jsPDF('p', 'mm');
					var position = 10;
					// 첫 페이지 출력
					doc.addImage(imgData, 'PNG', margin, position, imgWidth,
							imgHeight);
					heightLeft -= pageHeight;
					// 파일 저장
					doc.save($("#stuNm").text()+'_상담기록서.pdf');
				});
	});
// 		let elements = "";
// 		let stuNm = "";
// 		$(function() {
// 			elements = document.querySelector('body');
// 			stuNm = document.querySelector("#stuNm");
// 			$("#close").on("click", function() {
// 				window.close();
// 			})

// 			$("#pdfDown").on("click", function() {

// 				// Get the element.
// 				$("#pdfDown").hide();
// 				$("#close").hide();
// 				// Generate the PDF.
// 				html2pdf().from(elements).set({
// 					margin : 0,
// 					filename : stuNm.dataset.value + ' 상담기록확인서_.pdf',
// 					html2canvas : {
// 						scale : 1
// 					},
// 					jsPDF : {
// 						orientation : 'portrait',
// 						unit : 'mm',
// 						format : 'a4',
// 						compressPDF : true
// 					}
// 				}).save();
// // 				setTimeout(function() {
// // 					$("#pdfDown").show();
// // 					$("#close").show();
// // 				}, 500);

// 			})
// 		})
	</script>
</body>
</html>