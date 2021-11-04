<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Footer -->
<footer class="text-center text-lg-start bg-light text-muted">
	<!-- Section: Social media -->
	<section
		class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
		<!-- Left -->
		<div class="me-5 d-none d-lg-block">
			<span>Get connected with us on social networks:</span>
		</div>
		<!-- Left -->

		<!-- Right -->
		<div>
			<a href="" class="me-4 text-reset"> <i class="fab fa-facebook-f"></i>
			</a> <a href="" class="me-4 text-reset"> <i class="fab fa-twitter"></i>
			</a> <a href="" class="me-4 text-reset"> <i class="fab fa-google"></i>
			</a> <a href="" class="me-4 text-reset"> <i class="fab fa-instagram"></i>
			</a> <a href="" class="me-4 text-reset"> <i class="fab fa-linkedin"></i>
			</a> <a href="" class="me-4 text-reset"> <i class="fab fa-github"></i>
			</a>
		</div>
		<!-- Right -->
	</section>
	<!-- Section: Social media -->

	<!-- Section: Links  -->
	<section class="">
		<div class="container text-center text-md-start mt-5">
			<!-- Grid row -->
			<div class="row mt-3">
				<!-- Grid column -->
				<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
					<!-- Content -->
					<h6 class="text-uppercase fw-bold mb-4">
						<i class="fas fa-gem me-3"></i>ktds 나이스 샷
					</h6>
					<p>kt ds는 kt그룹의 정보시스템 구축 기술과 노하우를 기반으로 고객의 가치를 최고로 실현하는 IT서비스
						전문기업입니다. 통신분야의 IT서비스를 뿌리로 두고, 금융IT, 공간IT 등 다양한 분야로 확장해 고객 비즈니스
						경쟁력을 높이는데 기여해 왔습니다.</p> 
				</div>
				<!-- Grid column -->

				<!-- Grid column -->
				<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
					<!-- Links -->
					<h6 class="text-uppercase fw-bold mb-4">회사 상품</h6>
					<p>
						<a
							href="${pageContext.request.contextPath}/product/pdList.do?cate_id=1&mode=1&filter=&soldout=&safe="
							class="text-reset">클럽</a>
					</p>
					<p>
						<a
							href="${pageContext.request.contextPath}/product/pdList.do?cate_id=2&mode=1&filter=&soldout=&safe="
							class="text-reset">용품</a>
					</p>
					<p>
						<a
							href="${pageContext.request.contextPath}/product/pdList.do?cate_id=3&mode=1&filter=&soldout=&safe="
							class="text-reset">웨어</a>
					</p>
				</div>
				<!-- Grid column -->

				<!-- Grid column -->
				<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
					<!-- Links -->
					<h6 class="text-uppercase fw-bold mb-4">관련 링크</h6>
					<p>
						<a href="https://www.ktds.com/index.jsp" class="text-reset">ktds</a>
					</p>
					<p>
						<a href="http://localhost:8080/home.do" class="text-reset">쇼핑몰</a>
					</p>
					<p>
						<a href="http://localhost:8080/home.do" class="text-reset">중고센터</a>
					</p>
					<p>
						<a href="http://localhost:8080/board/listPage.do?num=1"
							class="text-reset">고객센터</a>
					</p>
				</div>
				<!-- Grid column -->

				<!-- Grid column -->
				<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
					<!-- Links -->
					<h6 class="text-uppercase fw-bold mb-4">연락처</h6>
					<p>
						<i class="fas fa-home me-3"></i> 서울 특별시 서초구 서초동 137-070
					</p>
					<p>
						<i class="fas fa-envelope me-3"></i> ktds18b@email.com
					</p>
					<p>
						<i class="fas fa-phone me-3"></i> 010 1243 2021
					</p>
					<p>
						<i class="fas fa-print me-3"></i> 010 4560 8041
					</p>
				</div>
				<!-- Grid column -->
			</div>
			<!-- Grid row -->
		</div>
	</section>
	<!-- Section: Links  -->

	<!-- Copyright -->
	<div class="text-center p-4"
		style="background-color: rgba(0, 0, 0, 0.05);">
		© 2021 Copyright: <a class="text-reset fw-bold">KTDS18기 교육생</a>
	</div>
	<!-- Copyright -->
</footer>