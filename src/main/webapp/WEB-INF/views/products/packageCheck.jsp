<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 내용 -->
<div class="context" style="text-align: center;">
	<h1>배송조회를 확인하는 페이지입니다.</h1>
</div>

<table class="info">
	<tr>
		<th scope="row">보내시는분</th>
		<td>김성민</td>
	</tr>
	<tr>
		<th scope="row">받는분</th>
		<td>김대현</td>
	</tr>
	<tr>
		<th scope="row">상품주문날짜</th>
		<td>2021년 10월 02일</td>
	</tr>
	<tr>
		<th scope="row">예상도착날짜</th>
		<td>2021년 10월 04일</td>
	</tr>
</table>

<table class="delivery">
	<tr>
		<th scope="row">송장번호</th>
		<td>403445698</td>
	</tr>
	<tr>
		<th scope="row">배송업체</th>
		<td>롯데택배</td>
	</tr>
	<tr>
		<th scope="row">배송기사</th>
		<td>김세원</td>
	</tr>
</table>

<div class="deliveryImage" style="text-align: center;">
	<img src="택배.JPG" alt="My Image" height="170" width="850">
</div>

<table class="situation">
	<thead>
		<tr>
			<th scope="cols">단계</th>
			<th scope="cols">처리</th>
			<th scope="cols">상품상태</th>
			<th scope="cols">담당 점소</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>상품인수
			</th>
			<td>2021-10-02 14:25
			</th>
			<td>보내시는 고객님으로부터 상품을 인수받았습니다.
			</th>
			<td>인천시 남동구
			</th>
		</tr>
		<tr>
			<td>상품이동중
			</th>
			<td>2021-10-02 17:47
			</th>
			<td>배달지역으로 상품이 이동중입니다.
			</th>
			<td>남서울IC
			</th>
		</tr>
		<tr>
			<td>배달지도착
			</th>
			<td>2021-10-03 09:11
			</th>
			<td>고객님의 상품이 배달지에 도착했습니다.
			</th>
			<td>서울터미널
			</th>
		</tr>
		<tr>
			<td>상품도착예정
			</th>
			<td>2021-10-04 14:00
			</th>
			<td>상품이 곧 도착예정입니다.</td>
			<td>고양시
			</th>
		</tr>
	</tbody>
</table>