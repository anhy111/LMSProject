<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<div class="row">
	<div class="col text-center">
		<h1>나는 메인페이지</h1>
		<h1>포틀릿해줘</h1>
	</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
	var socket = null;

	$(document).ready(function() {
		connectWs();
	});

	function connectWs() {
		sock = new SockJS("<c:url value="/echo"/>");
		//sock = new SockJS('/replyEcho');
		socket = sock;
	
		sock.onopen = function() {
			console.log('info: connection opened.');
		};
		sock.onmessage = function(evt) {
			var data = evt.data;
			console.log("ReceivMessage : " + data + "\n");

			$.ajax({
				url : '/mentor/member/countAlarm',
				type : 'POST',
				dataType : 'text',
				success : function(data) {
					if (data == '0') {
					} else {
						$('#alarmCountSpan').addClass(
								'bell-badge-danger bell-badge')
						$('#alarmCountSpan').text(data);
					}
				},
				error : function(err) {
					alert('err');
				}
			});

			// 모달 알림
			var toastTop = app.toast.create({
				text : "알림 : " + data + "\n",
				position : 'top',
				closeButton : true,
			});
			toastTop.open();
		};

		sock.onclose = function() {
			console.log('connect close');
			/* setTimeout(function(){conntectWs();} , 1000); */
		};

		sock.onerror = function(err) {
			console.log('Errors : ', err);
		};

	}
</script>