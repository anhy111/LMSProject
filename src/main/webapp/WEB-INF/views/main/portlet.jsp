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
  border: none;
}
.grid-stack{
 	margin-top: 30px;
}
.grid-stack-active {
    border-right: none;
    border-top:  none;
    padding-bottom: 30px;
    min-height: 600px;
}

.grid-stack-inactive {
    border-top: none;
    background-color: rgba(199, 225, 255, 0.7);
    padding-bottom: 30px;
    min-height: 600px;
}

.portlet-header{
	height: 100%;
	margin: 0;
	align-items : center;
	text-align: center;
/* 	font-size: 1.5em; */
	background-color: #E8F5FF;
	border-radius: 5px 5px 5px 5px;
	line-height: 50px;
}
.header{
	color:navy;
	font-size: large;
}
.na-icon{
	top: 5px;
    right: 6px;
}
.ui-draggable-handle{
	border:none;
}

h1{margin:0;}

#dashboard > div.inactive-widgets > div > div > div.grid-stack-item-content.ui-draggable-handle > div.portlet-header {
  background:white;
}

#dashboard > div.inactive-widgets > div > div > div.grid-stack-item-content.ui-draggable-handle {
	border-radius: 5px 5px 5px 5px;
}

#dashboard > div.inactive-widgets > div > div > div.grid-stack-item-content.ui-draggable-handle > div.portlet-header > span.na-icon.na-icon-triangle-1-s.widget-add {
  -webkit-filter: grayscale(1);
  filter: grayscale(1);
}

</style>

<nav class="main-header navbar navbar-expand navbar-light bg-navy" style="margin-left:0px;">
	<ul class="navbar-nav mr-auto">
		<li class="row nav-item categorybar active">
			<i class="fas fa-th pl-3" style="padding-top:17px;font-size:x-large;"></i>
			<p class="pt-3 pl-3" style="font-size: larger;font-weight: bold;">포틀릿 설정</p>
		</li>
	</ul>
</nav>

<input type="hidden" id="memNo" value="<%=no%>"/>

<div><a id="showInfo" class="btn btn-primary mt-3 ml-3" href="#">저장하기</a></div>
<div id="dashboard">
	<div class="active-widgets">
		<div class="grid-stack" id="grid1">
		</div>
	</div>
	
	<div class="header-title">
	  <h1>포틀릿 목록</h1>
	</div>
	<div class="inactive-widgets">
	  <div class="grid-stack ">
	  </div>
	</div>
</div>

<div id="template" style="display: none;">
  <div class="widget">
    <div class="grid-stack-item-content">
      <div class="portlet-header" style="vertical-align: middle;">
        <span class="header"></span>
      </div>
    </div>
  </div>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/shim.min.js"></script>
<script type="text/javascript" src="http://alangunning.github.io/gridstack.js/demo/libraries/jquery-1.11.3/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="http://alangunning.github.io/gridstack.js/demo/libraries/jquery-ui-1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://alangunning.github.io/gridstack.js/demo/libraries/lodash/lodash-3.8.0-compat.min.js"></script>
<script type="text/javascript" src="/resources/js/gridstack.js"></script>
<script type="text/javascript" src="/resources/js/multiple-grids.js"></script>
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
			{ id: 1, name: "학사 일정", x: 0, y: 0, width: 2, height: 6, active: true },
			  { id: 2, name: "수강 내역", x: 2, y: 8, width: 1, height: 3, active: true },
			  { id: 3, name: "성적", x: 2, y: 4, width: 1, height: 2, active: false },
			  { id: 4, name: "시설예약", x: 0, y: 3, width: 1, height: 1, active: false },
			  { id: 5, name: "시간표", x: 1, y: 4, width: 3, height: 1, active: false },
			  { id: 6, name: "상담 내역", x: 0, y: 4, width: 1, height: 2, active: false },
			  { id: 7, name: "공지사항", x: 2, y: 0, width: 2, height: 2, active: true },
			  { id: 8, name: "문의게시판", x: 2, y: 2, width: 2, height: 2, active: true },
			  { id: 9, name: "날씨", x: 3, y: 8, width: 1, height: 3, active: true},
			  { id: 10, name: "뉴스", x: 2, y: 4, width: 1, height: 2, active: false },
			  { id: 11, name: "오늘의 학식", x: 3, y: 4, width: 1, height: 2, active: false }
			];
		
	}else{
		let portlet = '${memPortlet.poCont}';
		serialized_data = JSON.parse(portlet);
	}
	
	

	
	$("#showInfo").click(function() {
		 
        var nodes = $("#grid1").data('gridstack').grid.nodes;
        
        for(let i = 0; i < serialized_data.length; i++){
        	console.log("하이 : ", serialized_data[i]);
        	console.log("ID는?? ", serialized_data[i].id);
        	serialized_data[i].active = false;
//         	console.log("active는?? ", serialized_data[i].active);
        	
        	nodes.forEach(function(item){
        		let itm = item.el.data();
        		if(serialized_data[i].id == itm.widgetId){
        			serialized_data[i] = {id: itm.widgetId, name: serialized_data[i].name, x: itm.gsX, y: itm.gsY, width: itm.gsWidth, height: itm.gsHeight, active: true}
        			
// 	        		console.log("item은? ", itm);
// 					console.log(itm.widgetId +' + '+itm.gsX +' + '+itm.gsY +' + '+itm.gsWidth +' + '+itm.gsHeight + ' + ' + itm.gsActive);
        		}
        	});
        }
        
        console.log("바뀐데이터 : ", serialized_data)
        let poCont = JSON.stringify(serialized_data);
        let memNo = $("#memNo").val();
        
        let data = {
        	"poCont" : poCont,
        	"memNo" : memNo
        }
        
        $.ajax({
			type: 'post',
			url: '/updatePortlet',
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			beforeSend:function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success :function(data){
// 				console.log("성공이냐 " + data)
				
				Swal.fire({
		            icon: 'success',                         // Alert 타입
		            title: '저장 성공',         // Alert 제목
		            text: '성공적으로 저장되었습니다.',  // Alert 내용
		        }).then(function(){
// 		        	window.location.reload(true);	
		        	opener.parent.location.reload();
		        	window.close();
		        });
				
			},
			error:function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
         
    });
 
//     $(document).on('click', '.grid-stack-item', function() {
//         console.log('grid id : ' + $(this).parent().attr("id"));
//         console.log('widget id : ' + $(this).attr("data-gs-id"));
//     });
	
	dashboardFn.initiate();

});

</script>
