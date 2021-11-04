<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="<c:url value='/resources/css/main.daehyeon.css'/>" />

<%-- <script src="<c:url value='/resources/js/safePurchase.js'/>"></script> --%>


<form method="POST">

	<!-- 제일 큰 div 박스 -->
	<div class="safePurchase_container">
		<!-- 가장 상단 박스 -->
		<div class="safe_info_container p-0 mt-3">
			<div>
				<h1 id="safe_into_text" class="border-bottom w-100 pb-2">안전결제로
					거래를 진행합니다.</h1>
			</div>
			<div class="safe_item_line">
				<div>
					<img class="safe_item_image"
						src="${pageContext.request.contextPath}/resources/image/${pdSafe.product_img}">
				</div>
				<div>
					<p>
						<b>${pdSafe.product_price}원</b><br>${pdSafe.product_name}</p>
				</div>
			</div>
		</div>
		<div class="safe_address_container">
			<h3>배송지</h3>
			<div id="safe_address_box d-block">
				<div>
					<b>구매자 : ${getLoginIdSafe.user_name}</b>
				</div>
				<!--  <div>
                    <a href="#">변경</a>
                </div> -->
			</div>
			<div id="safe_address_box2 d-block">
				<p class="m-0">주소 : ${getLoginIdSafe.user_address}</p>
				<p class="m-0">연락처 : ${getLoginIdSafe.user_contact}</p>
			</div>
			<div>
				<select class="deliver_location">
					<option value='' selected="selected" disabled="disabled">배송
						요청사항</option>
					<option value=''>문앞</option>
					<option value=''>경비실</option>
					<option value=''>우편함</option>
					<option value=''>직접 수령 부재시 문 앞</option>
				</select>
			</div>
		</div>
		<div class="safe_money_container">
			<h3>결제금액</h3>
			<div>
				<div class="safe_money_line">
					<div>상품금액</div>
					<div>
						<input class="text-end" id="pt_price"
							value="${pdSafe.product_price}" disabled />원
					</div>
				</div>
				<div class="safe_money_line">
					<div>안심 수수료</div>
					<div>
						<input class="text-end" id="pt_tax" value="500" disabled />원
					</div>
				</div>
				<div class="safe_money_line">
					<div>결제금액</div>
					<div>
						<input class="text-end" id="pt_totala" value="" disabled />원
					</div>
				</div>
				<hr>
				<div class="safe_money_line">
					<div>총 결제금액</div>
					<div>
						<input class="text-end" id="pt_totalb" value="" disabled />원
					</div>
				</div>
			</div>
		</div>
		<div class="safe_purchase_way_container">
			<h3>결제수단</h3>
			<div>
				<select class="deliver_location">
					<option value=''>신용/체크카드</option>
					<option value=''>카카오페이</option>
					<option value=''>토스</option>
					<option value=''>간편계좌결제</option>
					<option value=''>휴대폰결제</option>
					<option value=''>무통장(가상계좌)</option>
				</select>
			</div>
		</div>
		<div class="safe_agree_container">
			<input type="checkbox" class="checkbox_agree_check" id="chkBox">
			<label class="checkbox_agree_label">개인정보 제 3자 제공동의와 결제대행 서비스
				이용약관에 동의합니다.</label> <a href="${pageContext.request.contextPath}/board/view.do?cs_board_id=166">자세히 보기</a>
		</div>
		<div class="safe_purchase_container">
			<button type="button" class="btn btn-danger" id="submitBtn">결제하기</button>
		</div>
	</div>

</form>

<script>
	$(document)
			.ready(
					function() {
						var price = Number($("#pt_price").val());

						var tax = Number($("#pt_tax").val());

						var total = price + tax;

						$("#pt_totala").val(total);
						$("#pt_totalb").val(total);

						$(document)
								.on(
										'click',
										'#submitBtn',
										function() {
											var chkBox = $("#chkBox").is(
													":checked");
											if (chkBox == false) {
												alert("안전결제 동의 여부에 체크하셔야 결제가 진행됩니다.");
											} else {
												alert("결제가 완료되었습니다.");
												location.href = '${pageContext.request.contextPath}/product/pdPay.do?product_id=${param.product_id}';
											}
										});
					})
</script>