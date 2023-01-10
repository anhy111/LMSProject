<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<% String no = String.valueOf(session.getAttribute("no")); %>
<link rel="stylesheet" type="text/css" href="http://alangunning.github.io/gridstack.js/demo/libraries/jquery-ui-1.11.4/jquery-ui.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/gridstack.js/0.2.6/gridstack.min.css">
<link rel="stylesheet" type="text/css" href="http://alangunning.github.io/gridstack.js/demo/css/multiple-grids.css">

<style>
.grid-stack>.grid-stack-item>.grid-stack-item-content {
  overflow:hidden;
}

.grid-stack-active {
    border-right: none;
    border-top:  none;
    padding-bottom: 30px;
    min-height: 600px;
}

.grid-stack-inactive {
    border-top: none;
    background-color: #E2E2E2;
    padding-bottom: 30px;
    min-height: 600px;
}

.na-icon{
	top: 5px;
    right: 6px;
}

h1{margin:0;}

#dashboard > div.inactive-widgets > div > div > div.grid-stack-item-content.ui-draggable-handle > div.portlet-header {
  background:grey;
}

#dashboard > div.inactive-widgets > div > div > div.grid-stack-item-content.ui-draggable-handle {
  border: 1px solid grey;
}

#dashboard > div.inactive-widgets > div > div > div.grid-stack-item-content.ui-draggable-handle > div.portlet-header > span.na-icon.na-icon-triangle-1-s.widget-add {
  -webkit-filter: grayscale(1);
  filter: grayscale(1);
}

</style>
<input type="hidden" id="memNo" value="<%=no%>"/>

<div id="dashboard">
	<div class="active-widgets" style="width:100%;">
		<div class="header-title">
		</div>
		<div class="grid-stack" id="grid1"></div>
	</div>

	<div style="display:none;">
		<div class="header-title"></div>
		<div class="inactive-widgets">
			<div class="grid-stack "></div>
		</div>
	</div>
</div>

<div id="template" style="display: none;">
  <div class="widget">
    <div class="grid-stack-item-content">
      <div class="portlet-header" style="vertical-align: middle;">
        <span class="header"></span>
      </div>
      <c:forEach begin="1" end="11" step="1" varStatus="status">
	      <div class="content${status.count}" style="display:none;">
<%-- 	        Widget content.${status.count} --%>
	      </div>
      </c:forEach>
    </div>
  </div>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/shim.min.js"></script>
<script type="text/javascript" src="http://alangunning.github.io/gridstack.js/demo/libraries/jquery-1.11.3/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="http://alangunning.github.io/gridstack.js/demo/libraries/jquery-ui-1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://alangunning.github.io/gridstack.js/demo/libraries/lodash/lodash-3.8.0-compat.min.js"></script>
<script type="text/javascript" src="/resources/js/gridstack.js"></script>
<script type="text/javascript" src="http://alangunning.github.io/gridstack.js/demo/js/multiple-grids.js"></script>
<script type="text/javascript" src="http://alangunning.github.io/gridstack.js/demo/libraries/touch-punch-0.2.3/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript">

let header = "${_csrf.headerName}";
let token = "${_csrf.token}";

var serialized_data = [];

$(function() {
	
	let myPortlet = '${memPortlet}';
	console.log("첫 포틀릿 오나..?!", myPortlet);
	
	if(myPortlet == null || myPortlet == ''){
		serialized_data = [
			 { id: 1, name: "학사 일정", x: 0, y: 0, width: 2, height: 4, active: true },
			  { id: 2, name: "수강 내역", x: 1, y: 4, width: 1, height: 2, active: true },
			  { id: 3, name: "성적", x: 2, y: 4, width: 1, height: 2, active: true },
			  { id: 4, name: "시설예약", x: 0, y: 3, width: 1, height: 1, active: false },
			  { id: 5, name: "시간표", x: 1, y: 4, width: 3, height: 1, active: false },
			  { id: 6, name: "상담 내역", x: 0, y: 4, width: 1, height: 2, active: false },
			  { id: 7, name: "공지사항", x: 2, y: 0, width: 2, height: 2, active: true },
			  { id: 8, name: "문의게시판", x: 2, y: 2, width: 2, height: 2, active: true },
			  { id: 9, name: "날씨", x: 0, y: 4, width: 1, height: 2, active: true},
			  { id: 10, name: "뉴스", x: 2, y: 4, width: 1, height: 2, active: false },
			  { id: 11, name: "오늘의 학식", x: 3, y: 4, width: 1, height: 2, active: true }
			];
	}else{
		let portlet = '${memPortlet.poCont}';
		serialized_data = JSON.parse(portlet);
	}
	
	dashboardFn.initiate();
	
	var nodes = $("#grid1").data('gridstack').grid.nodes;
	
	$.each(nodes, function(p_inx, item){
		
		let itm = item.el.data();
		let str = "";
		switch(itm.widgetId){ //공지사항
		case 2:
			str = `
				<div class="callout callout-info m-3 pb-0">
					<h6>거시경제학</h6><hr class="m-0"/>
					<div class="row" >
						<p class="pl-3">2023년 1학기</p>
						<div style="margin-left: 40%;">
							<a href="#" style="text-decoration-line: none;color:blue">강의실로 이동 &nbsp;<i class="fas fa-arrow-right"></i></a>
						</div>
					</div>
				</div>
				<div class="callout callout-info m-3 pb-0">
					<h6>경영학개론</h6><hr class="m-0"/>
					<div class="row" >
						<p class="pl-3">2023년 1학기</p>
						<div style="margin-left: 40%;">
							<a href="#" style="text-decoration-line: none;color:blue">강의실로 이동 &nbsp;<i class="fas fa-arrow-right"></i></a>
						</div>
					</div>
				</div>
			`;
			break;
		case 3:
			str = `
				<div class="m-3">
					<table class="table table-sm" style="border-bottom: 1px solid #eef2f7">
						<tbody>
							<tr style="background-color:#EBFBFF">
								<th width="25%">강의명</th>
								<th width="15%">이수구분</th>
								<th width="5%">학점</th>
								<th width="5%">평가</th>
							</tr>
							<tr>
								<td>거시경제학</td>
								<td>전공필수</td>
								<td>3</td>
								<td>A+</td>
							</tr>
						</tbody>
					</table>
				</div>
			`;
			break;
		case 4:
			str = `
				<div class="m-3">
					<table class="table table-sm" style="border-bottom: 1px solid #eef2f7">
						<tbody>
							<tr style="background-color:#EBFBFF">
								<th width="25%">예약실</th>
								<th width="25%">위치</th>
								<th width="10%">인원</th>
								<th width="25%">이용시간</th>
							</tr>
							<tr>
								<td>스터디룸1</td>
								<td>연수관 302호</td>
								<td>6명</td>
								<td>23/01/16 11:00</td>
							</tr>
						</tbody>
					</table>
				</div>
			`;
			break;
		case 6:
			str = `
				<div class="m-3">
					<table class="table table-sm" style="border-bottom: 1px solid #eef2f7">
						<tbody>
							<tr style="background-color:#EBFBFF">
								<th width="25%">일자</th>
								<th width="25%">제목</th>
								<th width="20%">상담여부</th>
							</tr>
							<tr>
								<td>23/01/05</td>
								<td>취업관련해서...</td>
								<td>상담완료</td>
							</tr>
							<tr>
								<td>21/02/13</td>
								<td>휴학 신청합...</td>
								<td>상담완료</td>
							</tr>
						</tbody>
					</table>
				</div>
			`;
			break;
		case 7:
			str = `
				<div class="m-3">
					<table class="table table-sm" style="border-bottom: 1px solid #eef2f7">
		                <thead class="table-light">
		                    <tr style="border-top: 2px solid #112a63"></tr>
		                </thead>
		                <tbody>
		                    <c:forEach var="noticeBasic" items="${noticeBasicList}" end="4" varStatus="status">
		                        <fmt:formatDate var="noticeRegDate" value="${noticeBasic.noticeReg }" pattern="yy/MM/dd"/>
		                        <tr>
		                            <td class="col-title" style="padding-left:90px;">
		                                <a href="/notice/list/${noticeBasic.noticeCd}/detail" style="color:black">
		                                   <span class="txt">
		                                       <c:out value="${noticeBasic.noticeTtl }"/>
		                                          <c:if test="${ date <= noticeRegDate }"></c:if>
		                                   </span>
		                                </a>
		                            </td>
		                            <td style="text-align: center;">${noticeRegDate }</td>
		                        </tr>
		                    </c:forEach>
		                </tbody>
		            </table>
	            </div>
			`;
			break;
		case 8:
			str = `
				<div class="m-3">
					<table class="table table-sm" style="border-bottom: 1px solid #eef2f7">
						<thead class="table-light">
							<tr style="border-top: 2px solid #112a63"></tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${qnaList}" end="4" varStatus="status">
								<fmt:formatDate var="qnaRegDate" value="${list.qnaDt}" pattern="yy/MM/dd" />
								<tr>
									<td style="padding-left: 90px;">
										<a href="/qna/qnaDetail/${list.qnaCd}/detail" style="color:black">${list.qnaTtl}</a>
									</td>
									<td>
										<c:if test="${list.qnaYn == '2'}">비공개</c:if> 
										<c:if test="${list.qnaYn == '1'}">공개</c:if>
									</td>
									<td><fmt:formatDate value="${list.qnaDt }" pattern="yy/MM/dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			`;
			break;
		case 9:
			str = `
				<div class="m-3" style="overflow:auto;">
					<div style="text-align:center;">
						<label>대전광역시 중구 오류동</label>
					</div>
					<table class="table table-sm" style="border-bottom: 1px solid #eef2f7">
						<tbody>
							<tr>
								<td rowspan="5" id="totalInfo" class="align-self-middle"  style="width: 45%;">
									<img style="width:100%;margin-top:40px;" src="/resources/image/흐림.png">
									<br>
								</td>
							<th>현재날씨</th><td id="currentWeather">흐림</td></tr>
							<tr><th>강수확률</th><td id="precipitation">80%</td></tr>
							<tr><th>풍향</th><td id="windDirection">북북서향</td></tr>
							<tr><th>풍속</th><td id="windSpeed">2m/s</td></tr>
							<tr><th>습도</th><td id="humidity">88%</td></tr>
						</tbody>
					</table>
				</div>
			`;
			break;
		case 11:
			str = `
				<div class="m-3">
					<div style="text-align:center;">
						<label>점심</label>
					</div>
					<table class="table table-sm" style="border-bottom: 1px solid #eef2f7">
						<tbody style="text-align:center;">
							<tr><td>백미밥</td></tr>
							<tr><td>동태찌개</td></tr>
							<tr><td>찐두부/볶음김치</td></tr>
							<tr><td>순대깻잎볶음</td></tr>
							<tr><td>깍두기</td></tr>
						</tbody>
					</table>
				</div>
			`;
			break;
		}
		
		$('[data-widget-id=\"'+itm.widgetId+'\"] .content'+itm.widgetId).css("display", "block").append(str);
	});
			

});

</script>
