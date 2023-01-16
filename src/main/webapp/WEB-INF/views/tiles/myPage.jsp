<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="/resources/upload/연수대icon.png">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>연수대학교</title>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="/resources/adminlte/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet" href="/resources/adminlte/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="/resources/adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="/resources/adminlte/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/resources/adminlte/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="/resources/adminlte/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet" href="/resources/adminlte/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet" href="/resources/adminlte/plugins/summernote/summernote-bs4.min.css">
<!-- datatables -->
<link rel="stylesheet" href="/resources/adminlte/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="/resources/adminlte/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="/resources/adminlte/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
<link rel="stylesheet" href="/resources/adminlte/plugins/select2/css/select2.min.css">
<link rel="stylesheet" href="/resources/adminlte/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
<!-- boardTemplate -->
<script src="/resources/adminlte/plugins/jquery/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/resources/adminlte/plugins/jquery-ui/jquery-ui.min.js"></script>
</head>
<body class="layout-navbar-fixed login-page sidebar-collapse" style="min-height: 332.781px;">
	<div class="wrapper">
		
		<tiles:insertAttribute name="header" />
		
		<tiles:insertAttribute name="body" />
		<!-- footer시작 /.content-wrapper -->
		<!-- footer끝  Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->
	<!-- jQuery -->

	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script src="/resources/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- ChartJS -->
	<script src="/resources/adminlte/plugins/chart.js/Chart.min.js"></script>
	<!-- Sparkline -->
	<script src="/resources/adminlte/plugins/sparklines/sparkline.js"></script>
	<!-- JQVMap -->
	<script src="/resources/adminlte/plugins/jqvmap/jquery.vmap.min.js"></script>
	<script src="/resources/adminlte/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
	<!-- jQuery Knob Chart -->
	<script src="/resources/adminlte/plugins/jquery-knob/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
	<script src="/resources/adminlte/plugins/moment/moment.min.js"></script>
	<script src="/resources/adminlte/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script src="/resources/adminlte/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Summernote -->
	<script src="/resources/adminlte/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- overlayScrollbars -->
	<script src="/resources/adminlte/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/resources/adminlte/dist/js/adminlte.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="/resources/adminlte/dist/js/pages/dashboard.js"></script>
	<!-- datatables -->
	<script src="/resources/adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="/resources/adminlte/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script src="/resources/adminlte/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script src="/resources/adminlte/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script src="/resources/adminlte/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script src="/resources/adminlte/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script src="/resources/adminlte/plugins/jszip/jszip.min.js"></script>
	<script src="/resources/adminlte/plugins/pdfmake/pdfmake.min.js"></script>
	<script src="/resources/adminlte/plugins/pdfmake/vfs_fonts.js"></script>
	<script src="/resources/adminlte/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script src="/resources/adminlte/plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script src="/resources/adminlte/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
	<script>
		$(function() {
			$("#example1").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ]
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false,
				"responsive" : true,
			});
		});
	</script>

</body>
</html>