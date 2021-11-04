<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="<c:url value='/resources/css/style.vince.css'/>" />

<!-- 내용 -->

<div class="container">
	<form name="pdRegister" action="${pageContext.request.contextPath}/product/pdSubmit.do"
	method="POST">
		<div class="container w-75 row mt-5 mb-5 justify-content-center m-auto">
			<div class="col-6"
			style="border-style:solid; border-width:3px; border-radius:5px;
			padding:20px; margin:20px 0px; border-color: #3CB371;">
			<div id="image_container" class="container w-100"></div>
				<input type="file" id="image" name="product_img" accept="image/*"
					   onchange="setThumbnail(event);" 
					   style="cursor: pointer"/>
			
				
				<script> 
                  function setThumbnail(event) {
                	  var fullPath = $("#image").val();
                	  // 이미지 파일 이름이 filename에 값이 저장될 거임
                	  var filename = fullPath.replace(/^.*[\\\/]/, '');
                	  
                	  for (var image of event.target.files) { 
                		  var reader = new FileReader(); reader.onload = function(event) { 
                			  var img = document.createElement("img"); 
                			  img.setAttribute("src", event.target.result); 
                			  img.setAttribute("class", "w-100");
                			  img.setAttribute("height", "600px");
                			  document.querySelector("div#image_container").appendChild(img); 
                			  }; console.log(image); 
                			  reader.readAsDataURL(image); } } 
            </script>
			</div>


			<div class="col-6 mt-5 mb-5">
				<div class="gender w-100">
					<input class="btn1" type="radio" name="gen_id" value="1" checked>
					<label for="id_btn_01">남성용</label>
					<input class="btn1" type="radio" name="gen_id" value="2">
					<label for="id_btn_02">여성용</label>
					<input class="btn1" type="radio" name="gen_id" value="3">
					<label for="id_btn_03">남/여 공용</label>
				</div>

				<div class="produtcAllInfo">
					<div class="productName">
						<input class="gSearch" type="search" size="60" name="product_name"
								placeholder="상품이름(모델명)" onfocus="this.placeholder=''"
								onblur="this.placeholder='상품이름(모델명)'"
								style="width: 100%; height: 30px; 
						        background-color:ivory; 
						        font-size:15pt; border-style:solid;
						        border-width:3px 3px 3px 3px; border-radius:5px;
						        padding:20px; margin:20px 0px; border-color:#3CB371" required />
					</div>
					<div class="productPrice">
						<input class="gSearch" type="search" size="60" name="product_price"
							   placeholder="상품가격"
							   onfocus="this.placeholder=''" onblur="this.placeholder='상품가격'"
							   style="width: 100%; height: 30px; 
						        background-color:ivory; 
						        font-size:15pt; border-style:solid;
						        border-width:3px 3px 3px 3px; border-radius:5px;
						        padding:20px; margin:20px 0px; border-color:#3CB371" required />
					</div>
				</div>

				<div class="row my-3">
					<div class="col" style="margin-top : 15px;">
						<select name="cate_id" 
						style="border-width: 3px 3px 3px 3px; border-radius: 5px;
						padding:10px; margin:20px 0px; border-color:#3CB371;
						width:80%; background-color:ivory;">
							<option>카테고리를 선택해주세요</option>
							<option value="1">골프클럽</option>
							<option value="2">골프용품</option>
							<option value="3">골프웨어</option>
						</select>
					</div>
				</div>
			</div>
		</div>


		<div class="container text-center justify-content-center m-auto">

			<textarea cols="0" rows="10" name="product_detail" placeholder="내용을 입력해주세요."
				onfocus="this.placeholder=''"
				onblur="this.placeholder='내용을 입력해주세요.'" class="w-75 m-auto"
				style="border-style:solid; border-width:3px 3px 3px 27px;
				border-radius:5px; padding:20px; border-color:#3CB371;"></textarea>

		</div>





		<div class="safePay">
			<p>
				<textarea cols rows="5" readonly class="w-75 text-center" style="border: none;">
★안전결제★
※구매자가 물품 구매를 선택하고 저희 사이트에서 대금을 보관합니다. 
※저희 업체가 구매자 대금 결제 알림을 받으면 판매자는 물품 배송을 진행합니다.
※구매자가 정상적으로 물품을 배송받으면, 물품 수령 확인 사실을 알립니다. 
※물품 수령 확인이 완료되면, 사이트가 보관했던 대금을 판매자에게 입금합니다. </textarea>
			</p>
		</div>


		<div class="safePayCheck">
			안전결제선택 <input type="checkbox" name="product_safe" value="1">
		</div>


		<div class="submit">
			<input type="submit" value="등록하기" class="btn btn-success mb-5">
		</div>
	</form>
</div>
