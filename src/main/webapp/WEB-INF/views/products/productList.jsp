<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link rel="stylesheet"
	href="<c:url value='/resources/css/productList.sewon.css'/>" />
<style>
.item {
	display: none;
}
</style>

<div class="container row justify-content-center m-auto p-0">


	<div class="selectfilter_container">
		<ul class="w-50 row ms-auto border-bottom" id="modeBar">
			<li class="col detailselect_filter2"><a class="detail_font"
				id="recent"
				href="${pageContext.request.contextPath}/product/pdList.do?cate_id=${param.cate_id}&mode=1&filter=&safe=">최신순</a></li>
			<li class="col detailselect_filter2"><a class="detail_font"
				id="popular"
				href="${pageContext.request.contextPath}/product/pdList.do?cate_id=${param.cate_id}&mode=2&filter=&safe=">인기순</a></li>
			<li class="col detailselect_filter2"><a class="detail_font"
				id="low"
				href="${pageContext.request.contextPath}/product/pdList.do?cate_id=${param.cate_id}&mode=3&filter=&safe=">낮은
					가격순</a></li>
			<li class="col detailselect_filter2"><a class="detail_font"
				id="high"
				href="${pageContext.request.contextPath}/product/pdList.do?cate_id=${param.cate_id}&mode=4&filter=&safe=">높은
					가격순</a></li>
		</ul>
	</div>

	<div class="col-2 me-auto">
		<h5>필터</h5>
		<div class="checkarea w-100">
			<!-- <div class="minibox">
				<li class="checkbox2" id="first_checkbox"><input
					type="checkbox" name="soldout" value="soldout"> <label
					for="판매완료"><span id="soldoutf">판매완료 제외</span></label></li>
			</div> -->

			<div class="minibox">
				<li class="checkbox2"><input type="checkbox" name="safe"
					value="safe"> <label for="안전거래"> <span id="safef">안전거래</span>
				</label></li>
			</div>
		</div>

		<br>

		<h5>구분</h5>


		<div class="checkarea w-100">
			<div>
				<p class="checkbox">
					<input type="radio" name="gender" id="male" value="male"> <label
						for="남성용"> <span id="malef">남성용</span>
					</label>
				</p>
			</div>

			<div>
				<p class="checkbox">
					<input type="radio" name="gender" id="female" value="female">
					<label for="여성용"> <span id="femalef">여성용</span>
					</label>
				</p>
			</div>

			<div>
				<p class="checkbox">
					<input type="radio" name="gender" id="allgender" value="allgender">
					<label for="공용"> <span id="allgenf">공용</span>
					</label>
				</p>
			</div>

			<div>
				<p class="checkbox">
					<input type="radio" name="gender" id="defaultgender" value="">
					<label for="전체검색"> <span>전체 검색</span>
					</label>
				</p>
			</div>
		</div>
		<div class="contain row" style="float: none; margin: 100 auto;">
			<button type="button" class="btn btn-success col-md-3" name="filterBtn"
				id="filterBtn" style="float: none; margin: 0 auto; width: 30%;">검색</button>
		</div>
	</div>

	<div class="col-10">
		<!---- 거래품목  ---->
		<div class="item_container">
			<c:forEach var="article" items="${pdListgetCate}"
				varStatus="articleNum">
				<div class="item">
					<a
						href="${pageContext.request.contextPath}/product/pdDetail.do?product_id=${article.product_id }&cate_id=${article.cate_id }&user_id=${article.user_id }">
						<img
						src="${pageContext.request.contextPath}/resources/image/${article.product_img }"
						class="rounded" width="100%" height="100%">
					</a>
					<div class="item_info">
						<a class="link-dark"
							href="${pageContext.request.contextPath}/product/pdDetail.do?product_id=${article.product_id }&cate_id=${article.cate_id }&user_id=${article.user_id }">${article.product_name}</a>
						<p>${article.product_price}원</p>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>
</div>

<div class="container mt-3 mb-3 d-flex">
	<button type="button" class="btn btn-success m-auto" id="more">더보기</button>
</div>






<script>
	$(document)
			.ready(
					function(e) {
						$(".item").slice(0, 12).show();
						$("#more").click(function(e) {
							e.preventDefault();
							$(".item:hidden").slice(0, 12).show();
							if ($(".item:hidden").length == 0) {
								/* alert("No more divs"); */
							}
						})

						// 현재 파라미터 주소 받아와서 무슨 필터링 중인지 확인
						var here = window.location.search;
						// 최신순을 클릭했다면
						if (here.indexOf("mode=1") > -1) {
							$("#recent").css({
								'font-weight' : 'bold'
							});
							$("#popular").css({
								'font-weight' : 'normal'
							});
							$("#low").css({
								'font-weight' : 'normal'
							});
							$("#high").css({
								'font-weight' : 'normal'
							});
						} // 인기순을 클릭했다면
						else if (here.indexOf("mode=2") > -1) {
							$("#recent").css({
								'font-weight' : 'normal'
							});
							$("#popular").css({
								'font-weight' : 'bold'
							});
							$("#low").css({
								'font-weight' : 'normal'
							});
							$("#high").css({
								'font-weight' : 'normal'
							});
						} // 낮은 가격순을 클릭했다면
						else if (here.indexOf("mode=3") > -1) {
							$("#recent").css({
								'font-weight' : 'normal'
							});
							$("#popular").css({
								'font-weight' : 'normal'
							});
							$("#low").css({
								'font-weight' : 'bold'
							});
							$("#high").css({
								'font-weight' : 'normal'
							});
						} else if (here.indexOf("mode=4") > -1) {
							$("#recent").css({
								'font-weight' : 'normal'
							});
							$("#popular").css({
								'font-weight' : 'normal'
							});
							$("#low").css({
								'font-weight' : 'normal'
							});
							$("#high").css({
								'font-weight' : 'bold'
							});
						}

						// 남성용을 클릭했다면
						if (here.indexOf("filter=male") > -1) {
							$("#malef").css({
								'font-weight' : 'bold'
							});
							$("#femalef").css({
								'font-weight' : 'normal'
							});
							$("#allgenf").css({
								'font-weight' : 'normal'
							});
						} // 여성용을 클릭했다면
						else if (here.indexOf("filter=female") > -1) {
							$("#malef").css({
								'font-weight' : 'normal'
							});
							$("#femalef").css({
								'font-weight' : 'bold'
							});
							$("#allgenf").css({
								'font-weight' : 'normal'
							});
						} // 남녀 공용을 클릭했다면
						else if (here.indexOf("filter=allgender") > -1) {
							$("#malef").css({
								'font-weight' : 'normal'
							});
							$("#femalef").css({
								'font-weight' : 'normal'
							});
							$("#allgenf").css({
								'font-weight' : 'bold'
							});
						} else {
							$("#malef").css({
								'font-weight' : 'normal'
							});
							$("#femalef").css({
								'font-weight' : 'normal'
							});
							$("#allgenf").css({
								'font-weight' : 'normal'
							});
						}

						/* // 판매 완료 제외를 클릭했다면
						if (here.indexOf("soldout=soldout") > -1) {
							$("#soldoutf").css({
								'font-weight' : 'bold'
							});
						} else {
							$("#soldoutf").css({
								'font-weight' : 'normal'
							});
						} */

						// 안전 거래를 클릭했다면
						if (here.indexOf("safe=safe") > -1) {
							$("#safef").css({
								'font-weight' : 'bold'
							});
						} else {
							$("#safef").css({
								'font-weight' : 'normal'
							});
						}

						/* 필터 검색 버튼을 눌렀을 때 동작 설정 */
						$("#filterBtn")
								.click(
										function() {

											var checkVal = $(
													'input[name="gender"]:checked')
													.val();
											/* var soldoutVal = $(
													'input[name="soldout"]:checked')
													.val(); */
											var safeVal = $(
													'input[name="safe"]:checked')
													.val();
											$(location)
													.attr(
															'href',
															'${pageContext.request.contextPath}/product/pdList.do?cate_id=${param.cate_id}&mode=${param.mode}&filter='
																	+ checkVal
																	+ '&safe='
																	+ safeVal);

										});

					});
</script>