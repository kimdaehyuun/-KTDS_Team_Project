<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

input[type=number] {
	-moz-appearance: textfield;
}
</style>

<section class="py-5" style="background-color: #E7FCDE;">
	<div class="container h-100">
		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col col-xl-10 py-5">
				<div class="card text-black" style="border-radius: 1rem;">
					<div class=" ">
						<div class="row justify-content-center">
							<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

								<div class="align-items-center text-center my-3 py-3">
									<img style="width: 70%"
										src="${pageContext.request.contextPath}/resources/image/lg_grn_wide_logo.png" />
								</div>

								<form class="mx-1 mx-md-4" name="registerForm"
									action="${pageContext.request.contextPath}/member/register.do"
									method="POST">
									<div class="d-flex flex-row align-items-center">
										<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
										<div class="form-outline input-group flex-fill mb-0">
											<input type="email" id="form3Example3c"
												class="form-control ph-mycss" name="user_account"
												placeholder="이메일: 예) email@naver.com"
												aria-describedby="button-addon2" required />
											<button class="btn btn-outline-primary ph-mycss"
												name="idCheck" type="button" id="button-addon2">중복체크</button>
										</div>
									</div>

									<div class="d-flex flex-row align-items-center">
										<div class="col-1"></div>
										<label id="chkTxt"
											class="ph-mycss text-muted position-relative col-11 mb-2">중복
											체크 해주세요.</label>
									</div>

									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="password" id="form3Example4c"
												class="form-control ph-mycss" name="user_password"
												placeholder="비밀번호:" required />
										</div>
									</div>

									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-key fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="password" id="form3Example4cd"
												class="form-control ph-mycss" name="user_re_password"
												placeholder="비밀번호 재입력:" required />
										</div>
									</div>

									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-user fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="text" id="form3Example1c"
												class="form-control ph-mycss" name="user_name"
												placeholder="이름: 예) 홍길동" required />
										</div>
									</div>

									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-phone fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0 pe-1">
											<input type="number" id="form3Example1c"
												class="form-control ph-mycss" name="user_contact"
												placeholder="전화번호: '-'없이 입력해주세요. " required />
										</div>
									</div>

									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-mail-bulk fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="number" id="form3Example1c"
												class="form-control ph-mycss" name="user_zipcode"
												placeholder="우편번호: 예)14235" required />
										</div>
									</div>

									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-address-book fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="text" id="form3Example3c"
												class="form-control ph-mycss" name="user_address"
												placeholder="상세주소: 예)서울 강남구 방배동 123-45 하늘주택 123호 " required />
										</div>
									</div>

									<div class="form-check d-flex justify-content-center mb-5">
										<input class="form-check-input me-2" type="checkbox" value=""
											id="form2Example3c" name="ChkBox" required /> <label
											class="form-check-label" for="form2Example3"> <a
											href="#">이용약관</a>에 동의합니다.
										</label>
									</div>

									<div class="d-flex mx-4 mb-3 mb-lg-4 d-flex justify-content-between">
										<button type="button" name="signUp" value="1"
											class="btn btn-dark btn-lg">사업자 추가 등록</button>
										<input type="hidden" name="chkSignVal"/>
										<button type="button" name="signUp" value="2"
											class="btn btn-dark btn-lg">회원가입</button>
									</div>
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
	$(document).ready(function(e) {

		var idx = false;

		var regPhone = /^\d{3}\d{3,4}\d{4}$/;
		var regZip = /^\d{5}$/;

		var form = document.registerForm;

		$(form.signUp).click(function() {
			
			form.chkSignVal.value = this.value;
			
			var chked = form.chkSignVal.value;

			if (form.user_password.value != form.user_re_password.value) {
				alert("비밀번호가 틀립니다.");
				form.user_password.focus();
				return false;
			}

			if (regPhone.test(form.user_contact.value) == true) {
			} else {
				alert('입력된 연락처가 잘못되었습니다.');
				form.user_contact.focus();
				return false;
			}

			if (regZip.test(form.user_zipcode.value) == true) {
			} else {
				alert("입력된 우편번호가 잘못되었습니다.");
				return false;
			}

			if ($(form.ChkBox).is(":checked") == false) {
				alert("이용약관에 동의해 주세요.");
				return false;
			}

			if (idx == false) {
				alert("아이디 중복체크를 해주세요.");
				return false;
			} else {
				if (chked == 1) {
					alert("TRUE : 사업자 등록");
					//return false;
				} else {
					alert("FALSE : 회원가입");
					//return false;
				}
				$(form).submit();
			}

		});

		$(form.idCheck).click(function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/member/accIdChk.do",
				type : "GET",
				data : {
					"user_account" : $(form.user_account).val()
				},
				success : function(data) {
					if (data == 0 && $.trim($(form.user_account).val()) != '') {
						idx = true;
						$(form.user_account).attr("readonly", true);
						$('#chkTxt').text("사용 가능한 이메일입니다.");
						$('#chkTxt').attr('style', 'color: green !important');
					} else {
						$('#chkTxt').text("사용 불가능한 이메일입니다.");
						$('#chkTxt').attr('style', 'color: red !important');
					}
				},
				error : function() {
					alert("중복 체크 실패!");
				}
			});
		});
	});
</script>