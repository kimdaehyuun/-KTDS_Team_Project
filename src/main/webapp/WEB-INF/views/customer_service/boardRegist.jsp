<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 내용 -->
<div class="container">
	<div>
		<div id="board_write">
			<h2>게시물을 올리는 페이지입니다.</h2>
		</div>
		<p class="updateDate">작성일 / 2021-10-14</p>
		<p class="views">조회수 / 154</p>
		<div id="write_area">
			<form enctype="multipart/form-data"
				action="write_ok.php?board_id=?echo $board_id;?>" method="post">
				<div class="aaa">
					<div id="in_title">
						<input id="utitle" type="search" size="60"
							placeholder="글제목을 작성해주세요."
							style="width: 50%; height: 30px; font-size: 20px;" required />

						<div class="wi_line"></div>
						<div id="in_content">
							<textarea name="content" id="ucontent" rows="10" cols="100"
								placeholder="내용" required></textarea>
						</div>

						<input type="file" id="fileSelect" name="SelectFile" />

						<div class="bt_se">
							<button type="submit">글 작성</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>