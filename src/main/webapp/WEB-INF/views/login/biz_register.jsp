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

								<!-- FORM START -->
								<form class="mx-1 mx-md-4" name="registerForm"
									action="${pageContext.request.contextPath}/member/businessRegister.do"
									method="POST">
									<div class="d-flex flex-row align-items-center">
										<i class="fas fa-file-alt fa-lg me-3 fa-fw"></i>
										<div class="form-outline input-group flex-fill mb-0">
											<input type="number" id="form3Example3c"
												class="form-control ph-mycss" name="biz_num"
												placeholder="사업자 번호 '-' 없이 입력해주세요 예) 1001010000"
												aria-describedby="button-addon2" required />
											<button class="btn btn-outline-primary ph-mycss"
												name="numChk" type="button" id="button-addon2">중복체크</button>
										</div>
									</div>

									<div class="d-flex flex-row align-items-center">
										<div class="col-1"></div>
										<label id="chkTxt"
											class="ph-mycss text-muted position-relative col-11 mb-2">중복
											체크 해주세요.</label>
									</div>

									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-building fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="text" id="form3Example1c"
												class="form-control ph-mycss" name="biz_name"
												placeholder="회사명 : " required />
										</div>
									</div>

									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-address-book fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0 pe-1">
											<input type="text" id="form3Example1c"
												class="form-control ph-mycss" name="biz_address"
												placeholder="회사 주소 : " required />
										</div>
									</div>

									<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
										<button type="button" name="signUp"
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
		var form = document.registerForm;
		var regBizNum = /^(\d{3})(\d{2})(\d{5})$/;

		$(form.signUp).click(function() {

			if (idx == false) {
				alert("사업자 번호 중복체크를 해주세요.");
				return false;
			} else {
				$(form).submit();
			}
		});

		$(form.numChk).click(function() {
			
			if (regBizNum.test(form.biz_num.value) == true) {
			} else {
				alert("입력된 사업자 번호 형식이 잘못되었습니다.");
				return false;
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath}/member/bizNumChk.do",
				type : "GET",
				data : {
					"biz_num" : $(form.biz_num).val()
				},
				success : function(data) {
					if (data == 0 && $.trim($(form.biz_num).val()) != '') {
						idx = true;
						$(form.biz_num).attr("readonly", true);
						$('#chkTxt').text("사용 가능한 사업자 번호입니다.");
						$('#chkTxt').attr('style', 'color: green !important');
					} else {
						$('#chkTxt').text("사용 불가능하거나 이미 등록된 사업자 등록번호 입니다.");
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