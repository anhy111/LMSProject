<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <script src="/resources/adminlte/plugins/jquery-ui/jquery-ui.min.js"></script> -->
<!-- <script src="/resources/adminlte/plugins/jquery/jquery.min.js"></script> -->
<!-- /.content-wrapper -->
<style>
	div{
/* 		border: 2px solid red; */
	}
	.go-top {
	position: fixed;
	bottom: 2em;
	right: 2em;
	text-decoration: none;
	color: white;
	background-color: rgba(0, 0, 0, 0.3);
	font-size: 12px;
	padding: 1em;
	display: none;
}

.go-top:hover {
	background-color: rgba(0, 0, 0, 0.6);
}
</style>
  <footer class="main-footer">
	<div>
		<div style="text-align: center;">
			03722 서울특별시 서대문구 연수로 50 연수대학교 | Copyright &copy; 2014-2021 YeonSu All Rights Reserved.
		</div>
		<div style="text-align:end"><a href="#" class="go-top">Go Top</a></div>
	</div>
  </footer>

  <!-- Control Sidebar -->
  <script type="text/javascript">
  $(document).ready(function() {
		// Show or hide the sticky footer button
		$(window).scroll(function() {
			if ($(this).scrollTop() > 200) {
				$('.go-top').fadeIn(200);
			} else {
				$('.go-top').fadeOut(200);
			}
		});
		
		// Animate the scroll to top
		$('.go-top').click(function(event) {
			event.preventDefault();
			
			$('html, body').animate({scrollTop: 0}, 300);
		})
	});
</script>