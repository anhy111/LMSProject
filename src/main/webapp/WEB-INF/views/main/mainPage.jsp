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
<a href="/approval/main" style="font-size: 10em;">어사이드 어디감?</a>
<div>
	<a id="showInfo" class="btn btn-primary" href="#">저장하기</a>
</div>

<div id="dashboard">
	<div class="active-widgets">
		<div class="header-title">
		  <h1>Active</h1>
		</div>
		<div class="grid-stack" id="grid1">
		</div>
	</div>
	
	<div class="header-title">
	  <h1>Inactive</h1>
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
      <div class="content">
        Widget content.
      </div>
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
    
	serialized_data = [
		  { id: 1, name: "성적 조회", x: 0, y: 0, width: 1, height: 3, active: true },
		  { id: 2, name: "당학기 강의 조회", x: 1, y: 0, width: 2, height: 3, active: true },
		  { id: 3, name: "상담현황", x: 3, y: 0, width: 1, height: 3, active: true },
		  { id: 4, name: "학사일정", x: 0, y: 3, width: 1, height: 1, active: false },
		  { id: 5, name: "공지사항", x: 1, y: 4, width: 3, height: 1, active: false },
		  { id: 6, name: "강의시간표", x: 0, y: 4, width: 1, height: 2, active: false },
		  { id: 7, name: "Widget 7", x: 1, y: 4, width: 1, height: 2, active: false },
		  { id: 8, name: "Widget 8", x: 2, y: 5, width: 1, height: 2, active: false },
		  { id: 9, name: "Widget 9", x: 0, y: 0, width: 1, height: 3, active: false },
		  { id: 10, name: "Widget 10", x: 1, y: 0, width: 1, height: 1, active: false },
		  { id: 11, name: "Widget 11", x: 1, y: 1, width: 1, height: 1, active: false }
		];

	
	$("#showInfo").click(function() {
		 
        var nodes = $("#grid1").data('gridstack').grid.nodes;
        
        for(let i = 0; i < serialized_data.length; i++){
//         	console.log("하이 : ", serialized_data[i]);
//         	console.log("ID는?? ", serialized_data[i].id);
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
				console.log("성공이냐 " + data)
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
