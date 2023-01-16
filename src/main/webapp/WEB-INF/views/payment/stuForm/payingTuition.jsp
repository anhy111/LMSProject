<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background: #ccc;
}

.body {
	margin-top: 150px;
}

.right {
	text-align: right;
}

td {
	text-align: center;
}

#header {
	height: 20%;
	font-size: 30px;
	text-align: center;
}

#footer {
	height: 30%;
	font-size: 20px;
}

#tab {
	border: 1px solid black;
	border-collapse: collapse;
	width: 50%;
	height: 100%;
	float: left;
}

#tab2 {
	border: 1px solid black;
	border-collapse: collapse;
	width: 50%;
	height: 100%;
	float: right;
}

.card {
	margin-top: 100px;
	margin-left: 15%;
	height: 500px;
	width: 1000px;
}

#tabdiv1 {
	height: 500px;
	width: 1000px;
	margin: auto;
}

#btnDiv {
	position: relative;
	right: 185px;
	bottom: 60px;
}

#btnDiv #pay {
	padding: 8px;
}

#pdfSave {
	padding: 8px;
}

.headerDiv {
	font-size: 15px;
	text-align: center;
	margin-bottom: 0px;
}

#tab, #tab2 {
	background-image: url("/resources/upload/연수대학교흰로고.png");
	background-size: 300px;
	background-repeat: no-repeat;
	background-position: center center;
	font-weight: bold;
	color: black;
}

#tab .markImg {
	position: absolute;
	width: 70px;
	left: 340px;
	bottom: 55px;
}

#tab2 .markImg {
	position: absolute;
	width: 70px;
	right: 110px;
	bottom: 55px;
}
</style>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
	<c:if test="${not empty map }">
		<div id="btnDiv">
			<div style="float: right;">
				<c:if test="${map.PAY_AMT != '0'}">
					<button class="btn btn-secondary btn-sm" id="pay"
						data-paycd="${map.PAY_CD}">고지서 납부</button>
				</c:if>
				<input type="button" class="btn btn-secondary btn-sm" value="PDF저장"
					id="pdfSave" onclick="savePDF()">
			</div>
		</div>
		<div class="card">

			<div id="tabdiv1" class="card-body">
				<input type="hidden" value="${map.STU_TEL}" id="stuTel">
				<table id="tab" border='1'>
					<tr>
						<td colspan="4" id="header" style="color: inherit;">등록금 고지서
							<div class="headerDiv" id="header1"></div>
						</td>
					</tr>
					<tr>
						<td>학번</td>
						<td>${map.STU_NO}</td>
						<td>학년</td>
						<td>${map.STU_YR}</td>
					</tr>
					<tr>
						<td>성명</td>
						<td id="td1">${map.STU_NM }</td>
						<td>학과</td>
						<td>${map.DEP_NM }</td>
					</tr>
					<tr>
						<td colspan="2">구분</td>
						<td>등록금</td>
						<td>장학금</td>
					</tr>
					<tr>
						<td colspan="2">입학금</td>
						<td class="right">0</td>
						<td class="right">0</td>
					</tr>
					<tr>
						<td colspan="2">수업료</td>
						<td class="right"><fmt:formatNumber value="${map.COL_FEE}" pattern="#,###"/></td>
						<td class="right"><fmt:formatNumber value="${map.SCLH_AMT}" pattern="#,###"/></td>
					</tr>
					<tr>
						<td colspan="2">납입금액</td>
						<td colspan="2" id="td2" class="right"><fmt:formatNumber value="${map.PAY_AMT}" pattern="#,###"/></td>
					</tr>
					<tr>
						<td>납부계좌</td>
						<td colspan="3">${map.STU_BANK_CD} ${map.STU_ACT}</td>
					</tr>
					<tr>
						<td colspan="4" id="footer">
							<div class="footerDiv">연수대학교 수 입 징 수 관</div> <img class="markImg"
							alt="" src="/resources/upload/연수대도장2.png">
						</td>
					</tr>
				</table>
				<table id="tab2" border='1'>
					<tr>
						<td colspan="4" id="header" style="color: inherit;">등록금 고지서
							<div class="headerDiv" id="header2"></div>
						</td>
					</tr>
					<tr>
						<td>학번</td>
						<td id="td0">${map.STU_NO}</td>
						<td>학년</td>
						<td>${map.STU_YR}</td>
					</tr>
					<tr>
						<td>성명</td>
						<td id="td1">${map.STU_NM }</td>
						<td>학과</td>
						<td>${map.DEP_NM }</td>
					</tr>
					<tr>
						<td colspan="2">구분</td>
						<td>등록금</td>
						<td>장학금</td>
					</tr>
					<tr>
						<td colspan="2">입학금</td>
						<td class="right">0</td>
						<td class="right">0</td>
					</tr>
					<tr>
						<td colspan="2">수업료</td>
						<td class="right"><fmt:formatNumber value="${map.COL_FEE}" pattern="#,###"/></td>
						<td class="right"><fmt:formatNumber value="${map.SCLH_AMT}" pattern="#,###"/></td>
					</tr>
					<tr>
						<td colspan="2">납입금액</td>
						<td colspan="2" id="td2" class="right"><fmt:formatNumber value="${map.PAY_AMT}" pattern="#,###"/></td>
					</tr>
					<tr>
						<td>납부계좌</td>
						<td colspan="3">${map.STU_BANK_CD} ${map.STU_ACT}</td>
					</tr>
					<tr>
						<td colspan="4" id="footer">
							<div class="footerDiv">연수대학교 수 입 징 수 관</div> <img class="markImg"
							alt="" src="/resources/upload/연수대도장2.png">
						</td>
					</tr>
				</table>

				<br>
			</div>
		</div>
		<br>
	</c:if>
</body>
<script type="text/javascript">

	//스프링 시큐리티를 위한 토큰 처리(csrf) -> 불토엔 큰 코스로 픽스!
	let header = "${_csrf.headerName}";
	let token = "${_csrf.token}";

	var IMP = window.IMP;
	var code = "imp35881853"; //가맹점 식별코드
	IMP.init(code);
	
	$(function () {

		var today = new Date();
		var year = today.getFullYear() + "년 ";
		var month = today.getMonth();
		var sem = "";
		if (month > 3 && month < 8) {
			sem = "1학기 ";
		} else {
			sem = "2학기 ";
		}
		console.log(year + sem);

		$('#header1').text(year + sem + "[은행용]");
		$('#header2').text(year + sem + "[학생용]");

		var stuNo = $('#td0').text();
		var stuNm = $('#td1').text();
		var payAmt = $('#td2').text();
		var payCd = $('#pay').data('paycd');
		var stuTel = $('#stuTel').val();
		console.log(payCd, payAmt);

		$('#pay').click(function () {
			console.log("페이 버튼 클뤽");
			IMP.request_pay({
				//name과 amout만있어도 결제 진행가능
				pg: "html5_inicis",
				pay_method: 'card',
				merchant_uid: '' + stuNo + payCd,
				amount: 100,
				name: '등록금결제', // 상품명
				buyer_name: stuNm,
				buyer_tel: stuTel,
			}, function (rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다';
					var result = {
						"imp_uid": rsp.imp_uid,
						"merchant_uid": rsp.merchant_uid,
						"pay_date": new Date().getTime(),
						"amount": rsp.paid_amount,
						"card_no": rsp.apply_num,
						"refund": 'payed'
					}
					console.log(rsp.merchant_uid);
					const number = payAmt.replaceAll(",", "");
					$.ajax({
						url: '/payment/stuForm/pay',
						type: 'POST',
						data: {
							"payCd": payCd,
							"payAmt": number
						},
						dataType: 'json',
						beforeSend: function (xhr) {
							xhr.setRequestHeader(header, token);
						},
						//contentType : 'application/json', //서버에서 보내줄 데이터 타입
						success: function (res) {
							if (res > 0)
								alert("결제에 성공하였습니다.")

							window.opener.location.reload();

							setTimeout(() => {
								window.close();
							}, 1000);
						},
						error: function () {
							console.log("Insert ajax 통신 실패!!!");
						}
					}) //ajax

				} else {//결제 실패시
					var msg = '결제에 실패했습니다';
					msg += '에러 : ' + rsp.error_msg
				}
				console.log(msg);
			})
		})

	});

	function savePDF() {
		//저장 영역 div id
		html2canvas($('#tabdiv1')[0], {
			//logging : true,		// 디버그 목적 로그
			//proxy: "html2canvasproxy.php",
			allowTaint: true, // cross-origin allow 
			useCORS: true, // CORS 사용한 서버로부터 이미지 로드할 것인지 여부
			scale: 2
			// 기본 96dpi에서 해상도를 두 배로 증가

		}).then(
			function (canvas) {
				// 캔버스를 이미지로 변환
				var imgData = canvas.toDataURL('image/png');

				var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
				var pageHeight = imgWidth * 1.414; // 출력 페이지 세로 길이 계산 A4 기준
				var imgHeight = canvas.height * imgWidth / canvas.width;
				var heightLeft = imgHeight;
				var margin = 10; // 출력 페이지 여백설정
				var doc = new jsPDF('p', 'mm');
				var position = 50;

				// 첫 페이지 출력
				doc.addImage(imgData, 'PNG', margin, position, imgWidth,
					imgHeight);
				heightLeft -= pageHeight;

				// 파일 저장
				doc.save('연수대학교_등록금_고지서.pdf');
			});
	};
</script>
</html>