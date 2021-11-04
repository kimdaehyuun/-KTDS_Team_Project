<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="py-5 " style="background-color: #E7FCDE;">
	<div class="container h-75">
		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col col-xl-10 py-5">
				<div class="card" style="border-radius: 1rem;">
					<div class="row g-0">
						<div class="col-md-6 col-lg-5 d-none d-md-block">
							<img
								src="${pageContext.request.contextPath}/resources/image/swing.png"
								alt="login form" class="img-fluid p-5"
								style="border-radius: 1rem 0 0 1rem; height: 70vh" />
						</div>
						<div class="col-md-6 col-lg-7 d-flex align-items-center">
							<div class="card-body p-4 p-lg-5 text-black">

								<form name="frmLogin"
									action="${pageContext.request.contextPath}/member/loginChk.do"
									method="POST">

									<div class="align-items-center text-center mb-3 pb-3">
										<img style="width: 70%"
											src="${pageContext.request.contextPath}/resources/image/lg_grn_wide_logo.png" />
									</div>

									<div class="form-outline mb-4">
										<input type="email" id="form2Example17"
											class="form-control form-control-lg" name="user_account" />
										<label class="form-label" for="form2Example17">이메일 주소</label>
									</div>

									<div class="form-outline mb-4">
										<input type="password" id="form2Example27"
											class="form-control form-control-lg" name="user_password" />
										<label class="form-label" for="form2Example27">비밀번호</label>
									</div>

									<div class="pt-1 mb-4">
										<button class="btn btn-dark btn-lg btn-block" id="loginChk">로그인</button>
									</div>

									<p>
										<a class="small text-muted" href="#">비밀번호를 잊으셨나요?</a>
									</p>
									<p class="mb-5 pb-lg-2" style="color: #393f81;">
										회원이 아니신가요?<a href="/member/registration.do"
											style="color: #393f81;">여기서 회원가입해주세요.</a>
									</p>
									<a href="#!" class="small text-muted">이용약관</a> <a href="#!"
										class="small text-muted">개인정보보호정책</a>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	// 로그인 오류 시에 띄어줄 Alert
	$(window).on('load', function() {
		var result = '${result}';

		if (result == "loginFailed") {
			alert("이메일 혹은 비밀번호가 틀렸습니다.");
		} else if (result == "notLogin") {
			alert("로그인 후에 이용해세요.");
		} else {
			
		}
	});
</script>