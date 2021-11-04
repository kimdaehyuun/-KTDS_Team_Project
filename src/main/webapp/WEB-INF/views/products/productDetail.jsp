<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link rel="stylesheet"
	href="<c:url value='/resources/css/productDetail.sewon.css'/>" />

<!----이미지 사진 ----->
<div class="container text-center mt-3">
	<img
		src="${pageContext.request.contextPath}/resources/image/${pdDetailList.product_img }"
		class="img-fluid" width="35%">
</div>


<div class="detail_container">
	<div class="detail_container2">
		<div class="nickname card mx-5">
			<div class="profile_image">
				<a
					href="${pageContext.request.contextPath}/member/otherPage.do?user_name=${getUserId.user_name }">
					<img alt="profile card-img-top" width="125px" height="125px"
					src="${pageContext.request.contextPath}/resources/image/${getUserId.user_profile }">
					<div class="profile_leftnickname card-body">
						<div class="smallnickname">
							<a class="link-dark card-title" style="font-weight: bold;"
								href="${pageContext.request.contextPath}/member/otherPage.do?user_name=${getUserId.user_name }">${getUserId.user_name }</a>
						</div>
					</div>
				</a>
			</div>
		</div>
		<div class="nickname_btn">
			<button type="button" class="btn btn-outline-danger btn-sm btn-lg"
				id="like">👍좋아요</button>
			<c:choose>
				<c:when test="${member.user_id == user_id}">
					<button type="button" id="MyChat"
						class="btn btn-outline-primary btn-sm">채팅하기 : 판매자</button>
				</c:when>
				<c:otherwise>
					<button type="button" id="chat"
						class="btn btn-outline-primary btn-sm">채팅하기 : 구매자</button>
				</c:otherwise>
			</c:choose>
			<button type="button" class="btn btn-outline-success btn-sm"
				id="safeBtn">안전결제하기</button>
		</div>
	</div>
	<fmt:formatDate var="ProductDate" value="${pdDetailList.product_date }"
		pattern="yyyy-MM-dd" />
	<div class="context" id="proDetailBar">
		<h1 class="sell_detail">${pdDetailList.product_name }</h1>
		<p class="sell_detail2">
			카테고리(${getCategory.cate_name }) ∙
			<time>게시물 올린시간(${ProductDate})</time>
		</p>
		<p class="sell_price">${pdDetailList.product_price }원</p>
		<div class="detail_textcontainer">
			<p class="detail_text">${pdDetailList.product_detail }</p>
		</div>
		<span>관심 : </span> <span class="detail_text2 badge bg-danger">관심0∙
			채팅0∙ 조회0</span>
	</div>
	<!------ 더보기 ---->
	<div class="text">
		<b>${getUserId.user_name } 님의 다른 판매 상품</b>
		<div class="more">
			<button type="button" class="btn btn-link"
				onClick="location.href='${pageContext.request.contextPath}/member/otherPage.do?user_name=${getUserId.user_name }'">더
				구경하기</button>
		</div>
	</div>
	<div class="item_container" id="item_bar">
		<c:forEach var="article" items="${getOtherProduct}"
			varStatus="articleNum" begin="1" end="8">
			<div class="item">
				<a class="me-3"
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

	<c:choose>
		<c:when
			test="${isLogOn == true && member != null && member.user_id == getUserId.user_id}">
			<div class="container mt-3 mb-3 d-flex">
				<button type="button" class="btn btn-success m-auto" id="deletePd">삭제하기</button>
			</div>
		</c:when>
	</c:choose>
</div>
<input type="hidden" value="${pdDetailList.product_id}" id="product_id" />

<script>
	$(document)
			.ready(
					function(e) {
						$(".detail_text2").text("${countWish}");
						// 좋아요 상태가 0이라면
						if ("${getWish}" == "0") {
							$("#like").attr("class",
									"btn btn-outline-danger btn-sm btn-lg");
							// 좋아요 상태가 1이라면
						} else if ("${getWish}" == "1") {
							$("#like").attr("class",
									"btn btn-danger btn-sm btn-lg");
							// 만약 해당 상품에 좋아요 자체를 해본 기록이 없다면 (null 이라)
						} else {
							$("#like").attr("class",
									"btn btn-outline-danger btn-sm btn-lg");
						}

						$("#chat")
								.click(
										function() {
											if ("${getLoginId.user_id}" != "") {
												$(location)
														.attr(
																'href',
																'${pageContext.request.contextPath}/chat/chatRoomCheck.do?product_id=${pdDetailList.product_id}');
											} else {
												alert("로그인해야 채팅에 참여하실 수 있습니다!");
											}
										})

						$("#MyChat")
								.click(
										function() {
											if ("${getLoginId.user_id}" != "") {
												$(location)
														.attr('href',
																'${pageContext.request.contextPath}/chat/chatRoom.do');
											} else {
												alert("로그인해야 채팅에 참여하실 수 있습니다!");
											}
										})

						/* 좋아요 버튼을 눌렀을 때 동작 설정 */
						$("#like")
								.click(
										function() {

											// 로그인이 되어있는 상태라면 ajax로 wish.do 수행
											if ("${getLoginId.user_id}" != "") {
												$
														.ajax({
															url : "${pageContext.request.contextPath}/product/wish.do",
															type : "GET",
															data : {
																"product_id" : $(
																		"#product_id")
																		.val()
															},
															success : function(
																	data) {
																//alert(data);
																var data1 = data
																		.substring(
																				0,
																				7);
																var data2 = data
																		.substring(8);
																//alert(data1 + " / " + data2);
																if (data1 == "update0") {
																	//alert("update0");
																	$("#like")
																			.attr(
																					"class",
																					"btn btn-outline-danger btn-sm btn-lg");
																	$(
																			".detail_text2")
																			.text(
																					data2);

																} else if (data1 == "update1") {
																	//alert("update1");
																	$("#like")
																			.attr(
																					"class",
																					"btn btn-danger btn-sm btn-lg");
																	$(
																			".detail_text2")
																			.text(
																					data2);

																} else if (data1 == "insert1") {
																	$("#like")
																			.attr(
																					"class",
																					"btn btn-danger btn-sm btn-lg");
																	$(
																			".detail_text2")
																			.text(
																					data2);
																}
															},
															error : function() {
																alert("에러발생!");
															}
														})
											}
											// 로그인이 되어있지 않다면 로그인을 하라고 alert창 띄움
											else {
												alert("로그인을 해야 찜을 할 수 있습니다!");
											}
										});

						/* 상품 게시물 삭제 기능 구현 */
						$("#deletePd")
								.click(
										function() {

											// 로그인이 되어있는 상태라면
											if ("${getLoginId.user_id}" != "") {
												// 로그인한 유저와 게시글을 올린 유저가 같은 사람이라면
												if ("${getLoginId.user_id}" == "${getUserId.user_id }") {
													$(location)
															.attr(
																	'href',
																	'${pageContext.request.contextPath}/product/removeProduct.do?product_id=${pdDetailList.product_id}');
													alert("${pdDetailList.product_name } 상품이 삭제되었습니다!");
												} else {
													alert("해당 상품을 올린 유저만 삭제할 수 있습니다!");
												}
											}
											// 로그인이 되어있지 않다면 로그인을 하라고 alert창 띄움
											else {
												alert("로그인을 해야 삭제를 할 수 있습니다!");
											}
										});

						/* 안전결제 버튼 로그인 안했으면 로그인 하라고 알럿창 띄우기 기능 구현 */
						$("#safeBtn")
								.click(
										function() {

											// 로그인이 되어있는 상태라면
											if ("${getLoginId.user_id}" != "") {
												// 해당 상품의 거래상태가 거래진행중이거나 거래완료면 안전결제 진행을 못하도록 진행
												if ("${dontSell}" == '1'
														|| "${dontSell}" == '2') {
													alert("이미 판매가 진행된 상품입니다!");
												} else {
													$(location)
															.attr(
																	'href',
																	'${pageContext.request.contextPath}/product/pdSafePurchase.do?product_id=${pdDetailList.product_id }');
												}
											}
											// 로그인이 되어있지 않다면 로그인을 하라고 alert창 띄움
											else {
												alert("로그인을 해야 안전결제를 할 수 있습니다!");
											}
										});

					});
</script>