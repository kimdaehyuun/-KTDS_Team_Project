<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.carousel-inner {
	height: 600px;
}

.slide_img, .carousel-item {
	height: 100% !important;
	width: 100% !important;
}

.carousel-item {
	position: relative;
}
</style>

<!-- body -->
<div class="container p-0">
	<div id="myCarousel" class="carousel carousel-dark slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#myCarousel"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#myCarousel"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#myCarousel"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active w-100 h-100" data-bs-interval="5000">
				<img src="${pageContext.request.contextPath}/resources/image/main1.jpg"
					class="d-block w-100 h-100" alt="...">
				<!-- <div class="carousel-caption d-none d-md-block">
					<h5>First slide label</h5>
					<p>Some representative placeholder content for the first slide.</p>
				</div> -->
			</div>
			<div class="carousel-item w-100 h-100" data-bs-interval="5000">
				<img src="${pageContext.request.contextPath}/resources/image/main2.jpg"
					class="d-block w-100 h-100" alt="...">
				<!-- <div class="carousel-caption d-none d-md-block">
					<h5>Second slide label</h5> 
					<p>Some representative placeholder content for the second
						slide.</p>
				</div> -->
			</div>
			<div class="carousel-item w-100 h-100" data-bs-interval="5000">
				<img src="${pageContext.request.contextPath}/resources/image/main3.jpg"
					class="d-block w-100 h-100" alt="...">
				<!-- <div class="carousel-caption d-none d-md-block">
					<h5>Third slide label</h5>
					<p>Some representative placeholder content for the third slide.</p>
				</div> -->
			</div>
		</div>

		<button class="carousel-control-prev" type="button"
			data-bs-target="#myCarousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#myCarousel" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
</div>
<div class="container marketing py-3 m-auto">
	<div class="row text-center justify-content-center">
		<div class="col-lg-2 p-2 m-2 ahover border">
			<a href="${pageContext.request.contextPath}/product/pdList.do?cate_id=1&mode=1&filter=&safe="><img class="w-100 h-100 ahover"
				src="${pageContext.request.contextPath}/resources/image/golf_clubs.png" /></a>
		</div>
		<div class="col-lg-2 p-2 m-2 ahover border">
			<a href="${pageContext.request.contextPath}/product/pdList.do?cate_id=2&mode=1&filter=&safe="><img class="w-100 h-100 ahover"
				src="${pageContext.request.contextPath}/resources/image/golf_goods.png" /></a>
		</div>
		<div class="col-lg-2 p-2 m-2 ahover border">
			<a href="${pageContext.request.contextPath}/product/pdList.do?cate_id=3&mode=1&filter=&&safe="><img class="w-100 h-100 ahover"
				src="${pageContext.request.contextPath}/resources/image/golf_wears.png" /></a>
		</div>
	</div>
</div>
