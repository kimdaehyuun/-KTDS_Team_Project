<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap 5 JavaScript -->
<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>

<!-- Icon -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>

<!-- Jquery -->
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>

<!-- Simple-DataTables JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>

<!-- Script -->
<script src="<c:url value='/resources/js/script.daehyeon.js'/>"></script>
<script src="<c:url value='/resources/js/scripts.mingyun.js'/>"></script>
<script
	src="<c:url value='/resources/js/datatables-simple-demo.mingyun.js'/>"></script>

<!-- Bootstrap 5 CSS -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.min.css'/>" />
	
<!-- Bootstrap Icon 1.5.0 -->
<link rel="stylesheet" href="<c:url value='/resources/bootstrap-icons-1.5.0/bootstrap-icons.css'/>" />

<!-- Simple-DataTables CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" />

<!-- Style -->
<link rel="stylesheet" href="<c:url value='/resources/css/myCss.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/main.daehyeon.css'/>" />

<!-- Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&family=Noto+Serif+KR:wght@500&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">

<style>
* {
	font-family: 'Nanum Gothic', sans-serif;
}

a {
	text-decoration: none;
}
</style>

<title><tiles:insertAttribute name="title" /></title>

</head>
<body>

	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="body">
			<tiles:insertAttribute name="body" ignore="true" />
		</div>
		<div id="footer" class="container p-0">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
<script>
	$(document)
			.ready(
					function(e) {
						

						// 현재 파라미터 주소 받아와서 무슨 필터링 중인지 확인
						var here = window.location.search;
						// 골프클럽을 클릭했다면
						if (here.indexOf("cate_id=1") > -1) {
							$("#menu_club").css({
								'font-weight' : 'bold'
							});
							$("#menu_golfitem").css({
								'font-weight' : 'normal'
							});
							$("#menu_golfwear").css({
								'font-weight' : 'normal'
							});
						} else if (here.indexOf("cate_id=2") > -1) {
							$("#menu_club").css({
								'font-weight' : 'normal'
							});
							$("#menu_golfitem").css({
								'font-weight' : 'bold'
							});
							$("#menu_golfwear").css({
								'font-weight' : 'normal'
							});
						} else if (here.indexOf("cate_id=3") > -1) {
							$("#menu_club").css({
								'font-weight' : 'normal'
							});
							$("#menu_golfitem").css({
								'font-weight' : 'normal'
							});
							$("#menu_golfwear").css({
								'font-weight' : 'bold'
							});
						}
						


					});
</script>
</body>
</html>